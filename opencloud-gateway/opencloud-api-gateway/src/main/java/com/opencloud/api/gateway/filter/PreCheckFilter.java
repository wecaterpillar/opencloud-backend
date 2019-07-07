package com.opencloud.api.gateway.filter;

import com.opencloud.api.gateway.exception.JsonAccessDeniedHandler;
import com.opencloud.api.gateway.util.ReactiveWebUtils;
import com.opencloud.base.client.model.AuthorityResource;
import com.opencloud.common.constants.ResultEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.server.ServerWebExchange;
import org.springframework.web.server.WebFilter;
import org.springframework.web.server.WebFilterChain;
import reactor.core.publisher.Mono;

/**
 * 访问验证前置过滤器
 *
 * @author liuyadu
 */
@Slf4j
public class PreCheckFilter implements WebFilter {

    private JsonAccessDeniedHandler accessDeniedHandler;

    private AccessAuthorizationManager apiAccessManager;

    public PreCheckFilter(AccessAuthorizationManager apiAccessManager, JsonAccessDeniedHandler accessDeniedHandler) {
        this.apiAccessManager = apiAccessManager;
        this.accessDeniedHandler = accessDeniedHandler;
    }

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, WebFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        ServerHttpResponse response = exchange.getResponse();
        String requestPath = request.getURI().getPath();
        String remoteIpAddress = ReactiveWebUtils.getRemoteAddress(exchange);
        String origin = request.getHeaders().getOrigin();
        AuthorityResource resource = apiAccessManager.getResource(requestPath);
        if (resource != null) {
            if ("0".equals(resource.getIsOpen().toString())) {
                // 未公开
                return accessDeniedHandler.handle(exchange, new AccessDeniedException(ResultEnum.ACCESS_DENIED_NOT_OPEN.getMessage()));
            }
            if ("0".equals(resource.getStatus().toString())) {
                // 禁用
                return accessDeniedHandler.handle(exchange, new AccessDeniedException(ResultEnum.ACCESS_DENIED_DISABLED.getMessage()));
            } else if ("2".equals(resource.getStatus().toString())) {
                // 维护中
                return accessDeniedHandler.handle(exchange, new AccessDeniedException(ResultEnum.ACCESS_DENIED_UPDATING.getMessage()));
            }
        }
        // 1.ip黑名单检测
        boolean deny = apiAccessManager.matchIpOrOriginBlacklist(requestPath, remoteIpAddress,origin);
        if (deny) {
            // 拒绝
            return accessDeniedHandler.handle(exchange, new AccessDeniedException(ResultEnum.ACCESS_DENIED_BLACK_LIMITED.getMessage()));
        }

        // 3.ip白名单检测
        boolean[] matchIpWhiteListResult = apiAccessManager.matchIpOrOriginWhiteList(requestPath, remoteIpAddress,origin);
        boolean hasWhiteList = matchIpWhiteListResult[0];
        boolean allow = matchIpWhiteListResult[1];
        if (hasWhiteList) {
            // 接口存在白名单限制
            if (!allow) {
                // IP白名单检测通过,拒绝
                return accessDeniedHandler.handle(exchange, new AccessDeniedException(ResultEnum.ACCESS_DENIED_WHITE_LIMITED.getMessage()));
            }
        }
        return chain.filter(exchange);
    }
}
