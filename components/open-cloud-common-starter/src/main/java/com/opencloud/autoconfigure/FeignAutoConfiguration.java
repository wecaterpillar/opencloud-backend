package com.opencloud.autoconfigure;

import com.opencloud.common.interceptor.FeignRequestInterceptor;
import feign.Request;
import feign.RequestInterceptor;
import feign.Retryer;
import feign.codec.Encoder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

/**
 * Feign OAuth2 request interceptor.
 * @author  liuyadu
 */
@Slf4j
@Configuration
public class FeignAutoConfiguration {
    public static int connectTimeOutMillis = 12000;
    public static int readTimeOutMillis = 12000;

    @Bean
    @Primary
    public Encoder multipartFormEncoder() {
        Encoder encoder =  new FeignSpringFormEncoder();
        log.info("multipartFormEncoder:[{}]",encoder);
        return new FeignSpringFormEncoder();
    }

    @Bean
    @ConditionalOnMissingBean(FeignRequestInterceptor.class)
    public RequestInterceptor feignRequestInterceptor() {
       FeignRequestInterceptor interceptor = new FeignRequestInterceptor();
        log.info("bean [{}]", interceptor);
        return  interceptor;
    }

    @Bean
    public Request.Options options() {
        return new Request.Options(connectTimeOutMillis, readTimeOutMillis);
    }

    @Bean
    public Retryer feignRetryer() {
        return new Retryer.Default();
    }

}
