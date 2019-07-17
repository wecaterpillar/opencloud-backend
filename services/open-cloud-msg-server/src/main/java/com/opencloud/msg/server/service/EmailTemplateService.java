package com.opencloud.msg.server.service;

import com.opencloud.common.mybatis.base.service.IBaseService;
import com.opencloud.msg.client.model.entity.EmailTemplate;

/**
 * 邮件模板配置 服务类
 *
 * @author liuyadu
 * @date 2019-07-17
 */
public interface EmailTemplateService extends IBaseService<EmailTemplate> {

    /**
     * 根据模板编号获取模板
     *
     * @param code
     * @return
     */
    EmailTemplate getByCode(String code);
}
