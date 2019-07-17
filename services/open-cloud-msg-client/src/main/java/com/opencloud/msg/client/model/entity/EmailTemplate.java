package com.opencloud.msg.client.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.opencloud.common.mybatis.base.entity.AbstractEntity;
import org.apache.ibatis.type.Alias;

/**
 * 邮件模板配置
 *
 * @author liuyadu
 * @date 2019-07-17
 */
@Alias("email_template")
@TableName("msg_email_template")
public class EmailTemplate extends AbstractEntity {

private static final long serialVersionUID=1L;

    @TableId(value = "tpl_id", type = IdType.ID_WORKER)
    private Long tplId;

    /**
     * 模板编码
     */
    private String code;

    /**
     * 发送服务器配置
     */
    private Long configId;

    /**
     * 模板
     */
    private String template;

    /**
     * 模板参数
     */
    private String params;

    public Long getTplId() {
        return tplId;
    }

    public void setTplId(Long tplId) {
        this.tplId = tplId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Long getConfigId() {
        return configId;
    }

    public void setConfigId(Long configId) {
        this.configId = configId;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }
}
