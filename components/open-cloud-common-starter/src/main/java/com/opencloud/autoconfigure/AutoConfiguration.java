package com.opencloud.autoconfigure;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.opencloud.common.annotation.AnnotationScan;
import com.opencloud.common.configuration.OpenCommonProperties;
import com.opencloud.common.configuration.OpenIdGenProperties;
import com.opencloud.common.exception.OpenGlobalExceptionHandler;
import com.opencloud.common.exception.OpenRestResponseErrorHandler;
import com.opencloud.common.filter.XssFilter;
import com.opencloud.common.gen.SnowflakeIdGenerator;
import com.opencloud.common.health.DbHealthIndicator;
import com.opencloud.common.mybatis.ModelMetaObjectHandler;
import com.opencloud.common.security.http.OpenRestTemplate;
import com.opencloud.common.security.oauth2.client.OpenOAuth2ClientProperties;
import com.opencloud.common.utils.RedisUtils;
import com.opencloud.common.utils.SpringContextHolder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.cloud.bus.BusProperties;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.client.RestTemplate;

/**
 * 默认配置类
 *
 * @author liuyadu
 */
@Slf4j
@Configuration
@EnableConfigurationProperties({OpenCommonProperties.class, OpenIdGenProperties.class, OpenOAuth2ClientProperties.class})
public class AutoConfiguration {


    @Bean
    public FilterRegistrationBean xxsFilter() {
        FilterRegistrationBean bean = new FilterRegistrationBean(new XssFilter());
        log.info("bean [{}]", bean);
        return bean;
    }

    /**
     * 分页插件
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }

    /**
     * 默认加密配置
     *
     * @return
     */
    @Bean
    @ConditionalOnMissingBean(BCryptPasswordEncoder.class)
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        log.info("bean [{}]", encoder);
        return encoder;
    }


    /**
     * Spring上下文工具配置
     *
     * @return
     */
    @Bean
    @ConditionalOnMissingBean(SpringContextHolder.class)
    public SpringContextHolder springContextHolder() {
        SpringContextHolder holder = new SpringContextHolder();
        log.info("bean [{}]", holder);
        return holder;
    }

    /**
     * 统一异常处理配置
     *
     * @return
     */
    @Bean
    @ConditionalOnMissingBean(OpenGlobalExceptionHandler.class)
    public OpenGlobalExceptionHandler exceptionHandler() {
        OpenGlobalExceptionHandler exceptionHandler = new OpenGlobalExceptionHandler();
        log.info("bean [{}]", exceptionHandler);
        return exceptionHandler;
    }

    /**
     * ID生成器配置
     *
     * @param properties
     * @return
     */
    @Bean
    @ConditionalOnMissingBean(OpenIdGenProperties.class)
    public SnowflakeIdGenerator snowflakeIdWorker(OpenIdGenProperties properties) {
        SnowflakeIdGenerator snowflakeIdGenerator = new SnowflakeIdGenerator(properties.getWorkId(), properties.getCenterId());
        log.info("bean [{}] properties [{}]", snowflakeIdGenerator, properties);
        return snowflakeIdGenerator;
    }


    /**
     * 自定义注解扫描
     *
     * @return
     */
    @Bean
    @ConditionalOnMissingBean(AnnotationScan.class)
    public AnnotationScan annotationScan(AmqpTemplate amqpTemplate) {
        AnnotationScan scan = new AnnotationScan(amqpTemplate);
        log.info("bean [{}]", scan);
        return scan;
    }

    /**
     * 自定义Oauth2请求类
     *
     * @param openCommonProperties
     * @return
     */
    @Bean
    @ConditionalOnMissingBean(OpenRestTemplate.class)
    public OpenRestTemplate openRestTemplate(OpenCommonProperties openCommonProperties, BusProperties busProperties, ApplicationEventPublisher publisher) {
        OpenRestTemplate restTemplate = new OpenRestTemplate(openCommonProperties, busProperties, publisher);
        //设置自定义ErrorHandler
        restTemplate.setErrorHandler(new OpenRestResponseErrorHandler());
        log.info("bean [{}]", restTemplate);
        return restTemplate;
    }

    @Bean
    public RestTemplate restTemplate() {
        RestTemplate restTemplate = new RestTemplate();
        //设置自定义ErrorHandler
        restTemplate.setErrorHandler(new OpenRestResponseErrorHandler());
        return restTemplate;
    }

    @Bean
    @ConditionalOnMissingBean(DbHealthIndicator.class)
    public DbHealthIndicator dbHealthIndicator() {
        DbHealthIndicator dbHealthIndicator = new DbHealthIndicator();
        return dbHealthIndicator;
    }

    @Bean
    @ConditionalOnMissingBean(RedisUtils.class)
    public RedisUtils redisUtils() {
        return new RedisUtils();
    }

    /**
     * 自动填充模型数据
     *
     * @return
     */
    @Bean
    public ModelMetaObjectHandler modelMetaObjectHandler() {
        return new ModelMetaObjectHandler();
    }
}
