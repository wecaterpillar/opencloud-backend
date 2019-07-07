package com.opencloud.app.opensite.provider.controller;

import com.alibaba.fastjson.JSONObject;
import com.opencloud.app.opensite.provider.service.feign.BaseAppServiceClient;
import com.opencloud.app.opensite.provider.service.feign.BaseDeveloperServiceClient;
import com.opencloud.app.opensite.provider.service.impl.GiteeAuthServiceImpl;
import com.opencloud.app.opensite.provider.service.impl.QQAuthServiceImpl;
import com.opencloud.app.opensite.provider.service.impl.WechatAuthServiceImpl;
import com.opencloud.auth.client.constants.AuthConstants;
import com.opencloud.common.configuration.OpenCommonProperties;
import com.opencloud.common.security.http.OpenRestTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.oauth2.provider.AuthorizationRequest;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author: liuyadu
 * @date: 2018/10/29 15:59
 * @description:
 */
@Controller
public class IndexController {
    @Autowired
    private BaseAppServiceClient baseAppRemoteService;
    @Autowired
    private BaseDeveloperServiceClient baseDeveloperServiceClient;
    @Autowired
    private OpenRestTemplate openRestTemplate;
    @Autowired
    private QQAuthServiceImpl qqAuthService;
    @Autowired
    private GiteeAuthServiceImpl giteeAuthService;
    @Autowired
    private WechatAuthServiceImpl wechatAuthService;
    @Autowired
    private OpenCommonProperties openCommonProperties;
    /**
     * 欢迎页
     *
     * @return
     */
    @GetMapping("/")
    public String welcome() {
        return "welcome";
    }

    /**
     * 登录页
     *
     * @return
     */
    @GetMapping("/login")
    public String login(HttpServletRequest request) {
        return "login";
    }

    /**
     * 确认授权页
     * @param request
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/oauth/confirm_access")
    public String confirm_access(HttpServletRequest request, HttpSession session, Map model) {
        Map<String, String> scopes = (Map<String, String>) (model.containsKey("scopes") ? model.get("scopes") : request.getAttribute("scopes"));
        List<String> scopeList = new ArrayList<String>();
        for (String scope : scopes.keySet()) {
            scopeList.add(scope);
        }
        model.put("scopeList", scopeList);
        Object auth = session.getAttribute("authorizationRequest");
        if (auth != null) {
            try {
                AuthorizationRequest authorizationRequest = (AuthorizationRequest) auth;
                ClientDetails clientDetails = baseAppRemoteService.getAppClientInfo(authorizationRequest.getClientId()).getData();
                model.put("app", clientDetails.getAdditionalInformation());
            } catch (Exception e) {

            }
        }
        return "confirm_access";
    }

    /**
     * 自定义oauth2错误页
     * @param request
     * @return
     */
    @RequestMapping("/oauth/error")
    @ResponseBody
    public Object handleError(HttpServletRequest request) {
        Object error = request.getAttribute("error");
        return error;
    }


    /**
     * QQ第三方登录回调
     *
     * @param code code
     * @return
     */
    @GetMapping("/oauth/qq/callback")
    public String qq(@RequestParam(value = "code") String code, @RequestHeader HttpHeaders headers) {
        String accessToken = qqAuthService.getAccessToken(code);
        String token = "";
        if (accessToken != null) {
            String openId = qqAuthService.getOpenId(token);
            if (openId != null) {
                baseDeveloperServiceClient.addDeveloperThirdParty(openId, openId, AuthConstants.LOGIN_QQ,"","");
                token = getToken(openId, openId, AuthConstants.LOGIN_QQ, headers);
            }
        }
        return "redirect:" + qqAuthService.getLoginSuccessUrl() + "?token=" + token;
    }

    /**
     * 微信第三方登录回调
     *
     * @param code
     * @return
     */
    @GetMapping("/oauth/wechat/callback")
    public String wechat(@RequestParam(value = "code") String code, @RequestHeader HttpHeaders headers) {
        String accessToken = wechatAuthService.getAccessToken(code);
        String token = "";
        if (accessToken != null) {
            String openId = wechatAuthService.getOpenId(token);
            if (openId != null) {
                baseDeveloperServiceClient.addDeveloperThirdParty(openId, openId, AuthConstants.LOGIN_WECHAT,"","");
                token = getToken(openId, openId, AuthConstants.LOGIN_WECHAT, headers);
            }
        }
        return "redirect:" + wechatAuthService.getLoginSuccessUrl() + "?token=" + token;
    }


    /**
     * 码云第三方登录回调
     *
     * @param code
     * @return
     */
    @GetMapping("/oauth/gitee/callback")
    public String gitee(@RequestParam(value = "code") String code, @RequestHeader HttpHeaders headers) {
        String accessToken = giteeAuthService.getAccessToken(code);
        String token = "";
        if (accessToken != null) {
            JSONObject userInfo = giteeAuthService.getUserInfo(accessToken, null);
            String openId = userInfo.getString("id");
            String name = userInfo.getString("name");
            String avatar = userInfo.getString("avatar_url");
            if (openId != null) {
                baseDeveloperServiceClient.addDeveloperThirdParty(openId, openId, AuthConstants.LOGIN_GITEE,name,avatar);
                token = getToken(openId, openId, AuthConstants.LOGIN_GITEE, headers);
            }
        }
        return "redirect:" + giteeAuthService.getLoginSuccessUrl() + "?token=" + token;
    }


    /**
     * 第三方登录获取token
     * @param userName
     * @param password
     * @param type
     * @param headers
     * @return
     */
    private String getToken(String userName, String password, String type,HttpHeaders headers) {
        // 使用oauth2密码模式登录.
        MultiValueMap<String, Object> postParameters = new LinkedMultiValueMap<>();
        postParameters.add("username", userName);
        postParameters.add("password", password);
        postParameters.add("client_id", openCommonProperties.getClientId());
        postParameters.add("client_secret", openCommonProperties.getClientSecret());
        postParameters.add("grant_type", "password");
        // 添加请求头区分,第三方登录
        headers.add(AuthConstants.HEADER_X_THIRDPARTY_LOGIN, type);
        // 使用客户端的请求头,发起请求
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        // 强制移除 原来的请求头,防止token失效
        headers.remove(HttpHeaders.AUTHORIZATION);
        HttpEntity<MultiValueMap<String, Object>> request = new HttpEntity(postParameters, headers);
        JSONObject result = openRestTemplate.postForObject(openCommonProperties.getAccessTokenUri(), request, JSONObject.class);
        if (result.containsKey("access_token")) {
            return result.getString("access_token");
        }
        return null;
    }

}
