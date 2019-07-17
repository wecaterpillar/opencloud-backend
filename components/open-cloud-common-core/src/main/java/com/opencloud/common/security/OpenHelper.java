package com.opencloud.common.security;

import com.opencloud.common.configuration.OpenCommonProperties;
import com.opencloud.common.utils.BeanConvertUtils;
import com.opencloud.common.utils.ReflectionUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.OAuth2Request;
import org.springframework.security.oauth2.provider.token.DefaultAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.RemoteTokenServices;
import org.springframework.security.oauth2.provider.token.ResourceServerTokenServices;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;
import org.springframework.security.oauth2.provider.token.store.redis.RedisTokenStore;

import java.util.Collection;
import java.util.Map;

/**
 * 认证信息帮助类
 *
 * @author liuyadu
 */
@Slf4j
public class OpenHelper {

    /**
     * 获取认证用户信息
     *
     * @return
     */
    public static OpenUserDetails getUser() {
        OpenUserDetails openUser = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated() && authentication instanceof OAuth2Authentication) {
            OAuth2Authentication oAuth2Authentication = (OAuth2Authentication) authentication;
            OAuth2Request clientToken = oAuth2Authentication.getOAuth2Request();
            if (!oAuth2Authentication.isClientOnly()) {
                if (authentication.getPrincipal() instanceof OpenUserDetails) {
                    openUser =  (OpenUserDetails) authentication.getPrincipal();
                }
                if (authentication.getPrincipal() instanceof Map) {
                    openUser =  BeanConvertUtils.mapToObject((Map) authentication.getPrincipal(), OpenUserDetails.class);
                }
                if(openUser!=null && openUser.getClientId()==null && clientToken.getClientId()!=null){
                    openUser.setClientId(clientToken.getClientId());
                }
            } else {
                openUser = new OpenUserDetails();
                openUser.setClientId(clientToken.getClientId());
                openUser.setAuthorities(clientToken.getAuthorities());
                return openUser;
            }
        }
        return openUser;
    }


    /**
     * 更新OpenUser
     *
     * @param openUser
     */
    public void updateOpenUser(TokenStore tokenStore,OpenUserDetails openUser) {
        // 动态更新客户端生成的token
        Collection<OAuth2AccessToken> accessTokens = tokenStore.findTokensByClientIdAndUserName(openUser.getClientId(), openUser.getUsername());
        for (OAuth2AccessToken accessToken : accessTokens) {
            // 由于没有set方法,使用反射机制强制赋值
            OAuth2Authentication oAuth2Authentication = tokenStore.readAuthentication(accessToken);
            Authentication authentication = oAuth2Authentication.getUserAuthentication();
            ReflectionUtils.setFieldValue(authentication, "principal", openUser);
            // 重新保存
            tokenStore.storeAccessToken(accessToken, oAuth2Authentication);
        }
    }

    /**
     * 获取认证用户Id
     *
     * @return
     */
    public static Long getUserId() {
        return getUser().getUserId();
    }
    /**
     * 是否拥有权限
     *
     * @param authority
     * @return
     */
    public static Boolean hasAuthority(String authority) {
        OpenUserDetails auth = getUser();
        if (auth == null) {
            return false;
        }
        if (AuthorityUtils.authorityListToSet(auth.getAuthorities()).contains(authority)) {
            return true;
        }
        return false;
    }

    /**
     * 构建token转换器
     *
     * @return
     */
    public static DefaultAccessTokenConverter buildAccessTokenConverter() {
        OpenUserConverter userAuthenticationConverter = new OpenUserConverter();
        DefaultAccessTokenConverter accessTokenConverter = new DefaultAccessTokenConverter();
        accessTokenConverter.setUserTokenConverter(userAuthenticationConverter);
        return accessTokenConverter;
    }

    /**
     * 构建jwtToken转换器
     *
     * @param properties
     * @return
     */
    public static JwtAccessTokenConverter buildJwtTokenEnhancer(OpenCommonProperties properties) throws Exception {
        JwtAccessTokenConverter converter = new OpenJwtAccessTokenEnhancer();
        converter.setSigningKey(properties.getJwtSigningKey());
        converter.afterPropertiesSet();
        return converter;
    }

    /**
     * 构建自定义远程Token服务类
     *
     * @param properties
     * @return
     */
    public static RemoteTokenServices buildRemoteTokenServices(OpenCommonProperties properties) {
        // 使用自定义系统用户凭证转换器
        DefaultAccessTokenConverter accessTokenConverter = buildAccessTokenConverter();
        RemoteTokenServices tokenServices = new RemoteTokenServices();
        tokenServices.setCheckTokenEndpointUrl(properties.getTokenInfoUri());
        tokenServices.setClientId(properties.getClientId());
        tokenServices.setClientSecret(properties.getClientSecret());
        tokenServices.setAccessTokenConverter(accessTokenConverter);
        log.info("buildRemoteTokenServices[{}]", tokenServices);
        return tokenServices;
    }

    /**
     * 构建资源服务器JwtToken服务类
     *
     * @param properties
     * @return
     */
    public static ResourceServerTokenServices buildJwtTokenServices(OpenCommonProperties properties) throws Exception {
        // 使用自定义系统用户凭证转换器
        DefaultAccessTokenConverter accessTokenConverter = buildAccessTokenConverter();
        OpenJwtTokenService tokenServices = new OpenJwtTokenService();
        // 这里的签名key 保持和认证中心一致
        JwtAccessTokenConverter converter = buildJwtTokenEnhancer(properties);
        JwtTokenStore jwtTokenStore = new JwtTokenStore(converter);
        tokenServices.setTokenStore(jwtTokenStore);
        tokenServices.setJwtAccessTokenConverter(converter);
        tokenServices.setDefaultAccessTokenConverter(accessTokenConverter);
        log.info("buildJwtTokenServices[{}]", tokenServices);
        return tokenServices;
    }

    /**
     * 构建资源服务器RedisToken服务类
     *
     * @return
     */
    public static ResourceServerTokenServices buildRedisTokenServices(RedisConnectionFactory redisConnectionFactory) throws Exception {
        OpenRedisTokenService tokenServices = new OpenRedisTokenService();
        // 这里的签名key 保持和认证中心一致
        RedisTokenStore redisTokenStore = new RedisTokenStore(redisConnectionFactory);
        tokenServices.setTokenStore(redisTokenStore);
        log.info("buildRedisTokenServices[{}]", tokenServices);
        return tokenServices;
    }
}
