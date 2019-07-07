package com.opencloud.zuul.configuration;

import com.google.common.collect.Lists;
import com.marcosbarbero.cloud.autoconfigure.zuul.ratelimit.config.properties.RateLimitProperties;
import com.netflix.zuul.ZuulFilter;
import com.opencloud.zuul.actuator.OpenApiEndpoint;
import com.opencloud.zuul.filter.ZuulErrorFilter;
import com.opencloud.zuul.filter.ZuulResponseFilter;
import com.opencloud.zuul.locator.ApiResourceLocator;
import com.opencloud.zuul.locator.JdbcRouteLocator;
import com.opencloud.zuul.service.AccessLogService;
import com.opencloud.zuul.service.feign.BaseAuthorityServiceClient;
import com.opencloud.zuul.service.feign.GatewayServiceClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.autoconfigure.endpoint.condition.ConditionalOnEnabledEndpoint;
import org.springframework.boot.actuate.endpoint.annotation.Endpoint;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.cloud.bus.BusProperties;
import org.springframework.cloud.netflix.zuul.filters.ZuulProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

/**
 * 网关配置类
 *
 * @author: liuyadu
 * @date: 2018/10/23 10:31
 * @description:
 */
@Slf4j
@Configuration
@EnableConfigurationProperties({ApiProperties.class})
public class ApiConfiguration {
    private static final String ALLOWED_HEADERS = "*";
    private static final String ALLOWED_METHODS = "*";
    private static final String ALLOWED_ORIGIN = "*";
    private static final String ALLOWED_EXPOSE = "Authorization";
    private static final Long MAX_AGE = 18000L;

    @Autowired
    private JdbcRouteLocator zuulRoutesLocator;
    @Autowired
    private RateLimitProperties rateLimitProperties;
    @Autowired
    private BaseAuthorityServiceClient baseAuthorityServiceClient;
    @Autowired
    private AccessLogService accessLogService;

    /**
     * 响应过滤器
     *
     * @return
     */
    @Bean
    public ZuulFilter zuulResponseFilter() {
        return new ZuulResponseFilter(accessLogService);
    }

    /**
     * 错误过滤器
     *
     * @return
     */
    @Bean
    public ZuulFilter zuulErrorFilter() {
        return new ZuulErrorFilter(accessLogService);
    }


    /**
     * 资源加载器
     *
     * @return
     */
    @Bean
    public ApiResourceLocator apiResourceLocator(GatewayServiceClient gatewayServiceClient) {
        return new ApiResourceLocator(zuulRoutesLocator, rateLimitProperties, baseAuthorityServiceClient, gatewayServiceClient);
    }

    /**
     * 路由加载器
     *
     * @return
     */
    @Bean
    public JdbcRouteLocator zuulRouteLocator(ZuulProperties zuulProperties, ServerProperties serverProperties, JdbcTemplate jdbcTemplate, ApplicationEventPublisher publisher) {
        zuulRoutesLocator = new JdbcRouteLocator(serverProperties.getServlet().getContextPath(), zuulProperties, jdbcTemplate, publisher);
        log.info("ZuulRoutesLocator:{}", zuulRoutesLocator);
        return zuulRoutesLocator;
    }

    /**
     * 自定义网关监控端点
     *
     * @param context
     * @param bus
     * @return
     */
    @Bean
    @ConditionalOnEnabledEndpoint
    @ConditionalOnClass({Endpoint.class})
    public OpenApiEndpoint openApiEndpoint(ApplicationContext context, BusProperties bus) {
        OpenApiEndpoint endpoint = new OpenApiEndpoint(context, bus.getId());
        log.info("bean [{}]", endpoint);
        return endpoint;
    }


    /**
     * 跨域配置
     *
     * @return
     */
    @Bean
    public FilterRegistrationBean corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);
        config.setAllowedHeaders(Lists.newArrayList(ALLOWED_HEADERS.split(",")));
        config.setAllowedOrigins(Lists.newArrayList(ALLOWED_ORIGIN.split(",")));
        config.setAllowedMethods(Lists.newArrayList(ALLOWED_METHODS.split(",")));
        config.setMaxAge(MAX_AGE);
        config.addExposedHeader(ALLOWED_EXPOSE);

        source.registerCorsConfiguration("/**", config);
        FilterRegistrationBean bean = new FilterRegistrationBean(new CorsFilter(source));
        //最大优先级,设置0不好使
        bean.setOrder(Ordered.HIGHEST_PRECEDENCE);
        return bean;
    }
}
