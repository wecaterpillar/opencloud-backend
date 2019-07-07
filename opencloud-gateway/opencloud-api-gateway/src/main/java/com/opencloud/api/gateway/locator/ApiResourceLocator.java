package com.opencloud.api.gateway.locator;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.opencloud.api.gateway.service.feign.BaseAuthorityServiceClient;
import com.opencloud.api.gateway.service.feign.GatewayServiceClient;
import com.opencloud.base.client.model.AuthorityResource;
import com.opencloud.base.client.model.IpLimitApi;
import com.opencloud.common.event.RemoteRefreshRouteEvent;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.route.RouteDefinitionLocator;
import org.springframework.cloud.gateway.support.NameUtils;
import org.springframework.context.ApplicationListener;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;

import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * 资源加载器
 *
 * @author liuyadu
 */
@Slf4j
public class ApiResourceLocator implements ApplicationListener<RemoteRefreshRouteEvent> {
    /**
     * 单位时间
     */
    /**
     * 1分钟
     */
    public static final long SECONDS_IN_MINUTE = 60;
    /**
     * 一小时
     */
    public static final long SECONDS_IN_HOUR = 3600;
    /**
     * 一天
     */
    public static final long SECONDS_IN_DAY = 24 * 3600;

    /**
     * 请求总时长
     */
    public static final int PERIOD_SECOND_TTL = 10;
    public static final int PERIOD_MINUTE_TTL = 2 * 60 + 10;
    public static final int PERIOD_HOUR_TTL = 2 * 3600 + 10;
    public static final int PERIOD_DAY_TTL = 2 * 3600 * 24 + 10;


    private List<AuthorityResource> authorityResources;

    private List<IpLimitApi> ipBlacks;

    private List<IpLimitApi> ipWhites;

    /**
     * 缓存
     */
    private Map<String, List> cache = new HashMap<>();
    /**
     * 权限列表
     */
    private HashMap<String, Collection<ConfigAttribute>> allConfigAttributes;


    private BaseAuthorityServiceClient baseAuthorityServiceClient;
    private GatewayServiceClient gatewayServiceClient;

    private RouteDefinitionLocator routeDefinitionLocator;

    public ApiResourceLocator() {
        allConfigAttributes = Maps.newHashMap();
        authorityResources = cache.put("authorityResources", new ArrayList<>());
        ipBlacks = cache.put("ipBlacks", new ArrayList<>());
        ipWhites = cache.put("ipWhites", new ArrayList<>());
    }


    public ApiResourceLocator(RouteDefinitionLocator routeDefinitionLocator, BaseAuthorityServiceClient baseAuthorityServiceClient, GatewayServiceClient gatewayServiceClient) {
        this();
        this.baseAuthorityServiceClient = baseAuthorityServiceClient;
        this.gatewayServiceClient = gatewayServiceClient;
        this.routeDefinitionLocator = routeDefinitionLocator;
    }

    /**
     * 清空缓存并刷新
     */
    public void refresh() {
        this.cache.clear();
        this.allConfigAttributes.clear();
        loadAuthority();
        loadIpBlackList();
        loadIpWhiteList();
    }

    @Override
    public void onApplicationEvent(RemoteRefreshRouteEvent event) {
        refresh();
    }

    /**
     * 获取路由后的地址
     *
     * @return
     */
    protected String getFullPath(String serviceId, String path) {
        //@Todo
        return routeDefinitionLocator.getRouteDefinitions()
                .toStream()
                .filter(routeDefinition -> routeDefinition.getUri().toString().equals("lb://" + serviceId))
                .map(routeDefinition -> {
                    String fullPath = routeDefinition.getPredicates().stream().filter(predicateDefinition ->
                            ("Path").equalsIgnoreCase(predicateDefinition.getName())
                    ).findFirst().get().getArgs().get(NameUtils.GENERATED_NAME_PREFIX + "0").replace("/**", path.startsWith("/")  ? path : "/" + path);
                    return fullPath;
                }).findFirst().orElse(path);
    }

    /**
     * 加载授权列表
     */
    public void loadAuthority() {
        allConfigAttributes = Maps.newHashMap();
        authorityResources = Lists.newArrayList();
        Collection<ConfigAttribute> array;
        ConfigAttribute cfg;
        try {
            // 查询所有接口
            authorityResources = baseAuthorityServiceClient.findAuthorityResource().getData();
            if (authorityResources != null) {
                for (AuthorityResource item : authorityResources) {
                    String path = item.getPath();
                    if (path == null) {
                        continue;
                    }
                    String fullPath = getFullPath(item.getServiceId(), path);
                    item.setPath(fullPath);
                    array = allConfigAttributes.get(fullPath);
                    if (array == null) {
                        array = new ArrayList<>();
                    }
                    if (!array.contains(item.getAuthority())) {
                        cfg = new SecurityConfig(item.getAuthority());
                        array.add(cfg);
                    }
                    allConfigAttributes.put(fullPath, array);
                }
                log.info("=============加载动态权限:{}==============", authorityResources.size());
            }
        } catch (Exception e) {
            log.error("加载动态权限错误:{}", e.getMessage());
        }
    }

    /**
     * 加载IP黑名单
     */
    public void loadIpBlackList() {
        ipBlacks = Lists.newArrayList();
        try {
            ipBlacks = gatewayServiceClient.getApiBlackList().getData();
            if (ipBlacks != null) {
                for (IpLimitApi item : ipBlacks) {
                    item.setPath(getFullPath(item.getServiceId(), item.getPath()));
                }
                log.info("=============加载IP黑名单:{}==============", ipBlacks.size());
            }
        } catch (Exception e) {
            log.error("加载IP黑名单错误:{}", e.getMessage());
        }
    }

    /**
     * 加载IP白名单
     */
    public void loadIpWhiteList() {
        ipWhites = Lists.newArrayList();
        try {
            ipWhites = gatewayServiceClient.getApiWhiteList().getData();
            if (ipWhites != null) {
                for (IpLimitApi item : ipWhites) {
                    item.setPath(getFullPath(item.getServiceId(), item.getPath()));
                }
                log.info("=============加载IP白名单:{}==============", ipWhites.size());
            }
        } catch (Exception e) {
            log.error("加载IP白名单错误:{}", e.getMessage());
        }
    }


    /**
     * 获取单位时间内刷新时长和请求总时长
     *
     * @param timeUnit
     * @return
     */
    private long[] getIntervalAndQuota(String timeUnit) {
        if (timeUnit.equalsIgnoreCase(TimeUnit.SECONDS.name())) {
            return new long[]{SECONDS_IN_MINUTE, PERIOD_SECOND_TTL};
        } else if (timeUnit.equalsIgnoreCase(TimeUnit.MINUTES.name())) {
            return new long[]{SECONDS_IN_MINUTE, PERIOD_MINUTE_TTL};
        } else if (timeUnit.equalsIgnoreCase(TimeUnit.HOURS.name())) {
            return new long[]{SECONDS_IN_HOUR, PERIOD_HOUR_TTL};
        } else if (timeUnit.equalsIgnoreCase(TimeUnit.DAYS.name())) {
            return new long[]{SECONDS_IN_DAY, PERIOD_DAY_TTL};
        } else {
            throw new IllegalArgumentException("Don't support this TimeUnit: " + timeUnit);
        }
    }


    public List<AuthorityResource> getAuthorityResources() {
        return authorityResources;
    }

    public void setAuthorityResources(List<AuthorityResource> authorityResources) {
        this.authorityResources = authorityResources;
    }

    public List<IpLimitApi> getIpBlacks() {
        return ipBlacks;
    }

    public void setIpBlacks(List<IpLimitApi> ipBlacks) {
        this.ipBlacks = ipBlacks;
    }

    public List<IpLimitApi> getIpWhites() {
        return ipWhites;
    }

    public void setIpWhites(List<IpLimitApi> ipWhites) {
        this.ipWhites = ipWhites;
    }

    public Map<String, List> getCache() {
        return cache;
    }

    public void setCache(Map<String, List> cache) {
        this.cache = cache;
    }

    public HashMap<String, Collection<ConfigAttribute>> getAllConfigAttributes() {
        return allConfigAttributes;
    }

    public void setAllConfigAttributes(HashMap<String, Collection<ConfigAttribute>> allConfigAttributes) {
        this.allConfigAttributes = allConfigAttributes;
    }
}
