package com.opencloud.msg.client.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.opencloud.common.mybatis.base.entity.AbstractEntity;
import org.apache.ibatis.type.Alias;

/**
 * 邮件发送配置
 *
 * @author liuyadu
 * @date 2019-07-17
 */
@Alias("email_config")
@TableName("msg_email_config")
public class EmailConfig extends AbstractEntity {

    private static final long serialVersionUID = 1L;

    @TableId(value = "config_id", type = IdType.ID_WORKER)
    private Long configId;

    /**
     * 配置名称
     */
    private String name;

    /**
     * 发件服务器域名
     */
    private String smtpHost;

    /**
     * 发件服务器账户
     */
    private String smtpUsername;

    /**
     * 发件服务器密码
     */
    private String smtpPassword;

    /**
     * 保留数据0-否 1-是 不允许删除
     */
    private Boolean isPersist;

    /**
     * 是否为默认 0-否 1-是
     */
    private Boolean isDefault;

    public Long getConfigId() {
        return configId;
    }

    public void setConfigId(Long configId) {
        this.configId = configId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSmtpHost() {
        return smtpHost;
    }

    public void setSmtpHost(String smtpHost) {
        this.smtpHost = smtpHost;
    }

    public String getSmtpUsername() {
        return smtpUsername;
    }

    public void setSmtpUsername(String smtpUsername) {
        this.smtpUsername = smtpUsername;
    }

    public String getSmtpPassword() {
        return smtpPassword;
    }

    public void setSmtpPassword(String smtpPassword) {
        this.smtpPassword = smtpPassword;
    }

    public Boolean getIsPersist() {
        return isPersist;
    }

    public void setIsPersist(Boolean persist) {
        isPersist = persist;
    }

    public Boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Boolean aDefault) {
        isDefault = aDefault;
    }
}
