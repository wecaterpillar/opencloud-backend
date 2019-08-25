package com.opencloud.gateway.zuul.server.configuration;

import com.opencloud.common.utils.StringUtils;
import com.opencloud.gateway.zuul.server.locator.JdbcRouteLocator;
import com.opencloud.base.client.model.entity.GatewayRoute;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;
import springfox.documentation.swagger.web.SwaggerResource;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;

import java.util.ArrayList;
import java.util.List;

/**
 * Swagger在线文档配置
 * 聚合网关服务代理的所有微服务
 *
 * @author admin
 */
@Component
@Primary
@Slf4j
public class SwaggerProvider implements SwaggerResourcesProvider {

    private JdbcRouteLocator jdbcRouteLocator;

    public SwaggerProvider() {
    }

    @Autowired
    public SwaggerProvider(JdbcRouteLocator jdbcRouteLocator) {
        this.jdbcRouteLocator = jdbcRouteLocator;
    }

    @Override
    public List<SwaggerResource> get() {
        List<SwaggerResource> resources = new ArrayList<>();
        List<GatewayRoute> routes = jdbcRouteLocator.getRouteList();
        routes.forEach(route -> {
            if(StringUtils.isNotBlank(route.getServiceId()) && StringUtils.isBlank(route.getUrl())){
                resources.add(swaggerResource(route.getRouteName(), route.getPath().replace("**", "v2/api-docs"), "2.0"));
            }
        });
        return resources;
    }

    private SwaggerResource swaggerResource(String name, String location, String version) {
        SwaggerResource swaggerResource = new SwaggerResource();
        swaggerResource.setName(name);
        swaggerResource.setLocation(location);
        swaggerResource.setSwaggerVersion(version);
        return swaggerResource;
    }
}
