package com.opencloud.zuul.filter;

import com.google.common.collect.Lists;
import com.opencloud.base.client.model.entity.BaseApp;
import com.opencloud.common.constants.CommonConstants;
import com.opencloud.common.exception.OpenSignatureDeniedHandler;
import com.opencloud.common.exception.OpenSignatureException;
import com.opencloud.common.exception.SignatureDeniedHandler;
import com.opencloud.common.model.ResultBody;
import com.opencloud.common.utils.SignatureUtils;
import com.opencloud.common.utils.WebUtils;
import com.opencloud.zuul.configuration.ApiProperties;
import com.opencloud.zuul.service.feign.BaseAppServiceClient;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 数字验签前置过滤器
 *
 * @author: liuyadu
 * @date: 2018/11/28 18:26
 * @description:
 */
public class PreSignatureFilter extends OncePerRequestFilter {
    private SignatureDeniedHandler signatureDeniedHandler;
    private BaseAppServiceClient baseAppServiceClient;
    private ApiProperties apiGatewayProperties;
    /**
     * 忽略签名
     */
    private final static List<RequestMatcher> NOT_SIGN = getIgnoreMatchers(
            "/**/login/**",
            "/**/logout/**"
    );

    public PreSignatureFilter(BaseAppServiceClient baseAppServiceClient, ApiProperties apiGatewayProperties) {
        this.baseAppServiceClient = baseAppServiceClient;
        this.apiGatewayProperties = apiGatewayProperties;
        this.signatureDeniedHandler = new OpenSignatureDeniedHandler();
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        if (apiGatewayProperties.getCheckSign() && !notSign(request)) {
            try {
                Map params = WebUtils.getParameterMap(request);
                // 验证请求参数
                SignatureUtils.validateParams(params);
                //开始验证签名
                if (baseAppServiceClient != null) {
                    String appId = params.get("clientId").toString();
                    // 获取客户端信息
                    ResultBody<BaseApp> result = baseAppServiceClient.getApp(appId);
                    BaseApp app = result.getData();
                    if (app == null) {
                        throw new OpenSignatureException("clientId无效");
                    }
                    // 强制覆盖请求参数clientId
                    params.put(CommonConstants.SIGN_CLIENT_ID_KEY, app.getAppId());
                    // 服务器验证签名结果
                    if (!SignatureUtils.validateSign(params, app.getAppSecret())) {
                        throw new OpenSignatureException("签名验证失败!");
                    }
                }
            } catch (Exception ex) {
                signatureDeniedHandler.handle(request, response, ex);
                return;
            }
        }
        filterChain.doFilter(request, response);
    }

    protected static List<RequestMatcher> getIgnoreMatchers(String... antPatterns) {
        List<RequestMatcher> matchers = Lists.newArrayList();
        for (String path : antPatterns) {
            matchers.add(new AntPathRequestMatcher(path));
        }
        return matchers;
    }

    protected boolean notSign(HttpServletRequest request) {
        for (RequestMatcher match : NOT_SIGN) {
            if (match.matches(request)) {
                return true;
            }
        }
        return false;
    }
}
