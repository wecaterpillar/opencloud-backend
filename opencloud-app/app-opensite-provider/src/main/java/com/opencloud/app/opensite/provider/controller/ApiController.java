package com.opencloud.app.opensite.provider.controller;

import com.google.common.collect.Maps;
import com.opencloud.common.model.ResultBody;
import com.opencloud.common.security.OpenHelper;
import com.opencloud.common.security.http.OpenRestTemplate;
import com.opencloud.common.utils.DateUtils;
import com.opencloud.common.utils.RandomValueUtils;
import com.opencloud.common.utils.SignatureUtils;
import com.opencloud.common.utils.WebUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author: liuyadu
 * @date: 2018/11/9 15:43
 * @description:
 */
@Api(tags = "移动应用用户中心")
@RestController
public class ApiController {

    @Autowired
    private OAuth2ProtectedResourceDetails resourceDetails;
    @Autowired
    private OpenRestTemplate openRestTemplate;

    @Autowired
    private TokenStore tokenStore;
    /**
     * 获取用户基础信息
     *
     * @return
     */
    @ApiOperation(value = "获取用户基础信息")
    @GetMapping("/current/user")
    public ResultBody getUserProfile() {
        return ResultBody.ok().data(OpenHelper.getUser());
    }

    /**
     * 获取用户访问令牌
     * 基于oauth2密码模式登录
     *
     * @param username
     * @param password
     * @return access_token
     */
    @ApiOperation(value = "获取用户访问令牌", notes = "基于oauth2密码模式登录,无需签名,返回access_token")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username", required = true, value = "登录名", paramType = "form"),
            @ApiImplicitParam(name = "password", required = true, value = "登录密码", paramType = "form")
    })
    @PostMapping("/login/token")
    public Object getLoginToken(@RequestParam String username, @RequestParam String password, @RequestHeader HttpHeaders headers) {
        // 使用oauth2密码模式登录.
        MultiValueMap<String, Object> postParameters = new LinkedMultiValueMap<>();
        postParameters.add("username", username);
        postParameters.add("password", password);
        postParameters.add("client_id", resourceDetails.getClientId());
        postParameters.add("client_secret", resourceDetails.getClientSecret());
        postParameters.add("grant_type", "password");
        // 使用客户端的请求头,发起请求
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        // 强制移除 原来的请求头,防止token失效
        headers.remove(HttpHeaders.AUTHORIZATION);
        HttpEntity<MultiValueMap<String, Object>> request = new HttpEntity(postParameters, headers);
        Map result = openRestTemplate.postForObject(resourceDetails.getAccessTokenUri(), request, Map.class);
        if (result.containsKey("access_token")) {
            return ResultBody.ok().data(result);
        } else {
            return result;
        }
    }


    /**
     * 退出移除令牌
     * @param token
     */
    @ApiOperation(value = "退出移除令牌", notes = "退出移除令牌")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "token", required = true, value = "访问令牌", paramType = "form")
    })
    @PostMapping("/logout/token")
    public ResultBody removeToken(@RequestParam String token) {
        tokenStore.removeAccessToken(tokenStore.readAccessToken(token));
       return ResultBody.ok();
    }

    /**
     * 参数签名
     *
     * @param
     * @return
     */
    @ApiOperation(value = "内部应用请求签名", notes = "仅限系统内部调用")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "params1", value = "参数1", paramType = "form"),
            @ApiImplicitParam(name = "params2", value = "参数2", paramType = "form"),
            @ApiImplicitParam(name = "paramsN", value = "参数...", paramType = "form"),
    })
    @PostMapping(value = "/sign")
    public ResultBody sign(HttpServletRequest request) {
        Map params = WebUtils.getParameterMap(request);
        Map appMap = Maps.newHashMap();
        appMap.put("clientId", resourceDetails.getClientId());
        appMap.put("nonce", RandomValueUtils.uuid().substring(0, 16));
        appMap.put("timestamp", DateUtils.getCurrentTimestampStr());
        appMap.put("signType", "SHA256");
        params.putAll(appMap);
        String sign = SignatureUtils.getSign(params, resourceDetails.getClientSecret());
        appMap.put("sign", sign);
        return ResultBody.ok().data(appMap);
    }



}
