package com.opencloud.msg.server.service;

import com.opencloud.common.mybatis.base.service.IBaseService;
import com.opencloud.msg.client.model.entity.EmailConfig;

import java.util.List;

/**
 * 邮件发送配置 服务类
 *
 * @author liuyadu
 * @date 2019-07-17
 */
public interface EmailConfigService extends IBaseService<EmailConfig> {

    /**
     * 加载配置
     */
    void loadConfig();

    /**
     * 获取缓存的配置
     *
     * @return
     */
    List<EmailConfig> getCacheConfig();


}
