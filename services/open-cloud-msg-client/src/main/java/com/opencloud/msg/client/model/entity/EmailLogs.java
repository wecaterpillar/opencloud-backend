package com.opencloud.msg.client.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.opencloud.common.mybatis.base.entity.AbstractEntity;
import org.apache.ibatis.type.Alias;

/**
 * 邮件发送日志
 *
 * @author liuyadu
 * @date 2019-07-17
 */
@Alias("email_logs")
@TableName("msg_email_logs")
public class EmailLogs extends AbstractEntity {

private static final long serialVersionUID=1L;

    @TableId(value = "log_id", type = IdType.ID_WORKER)
    private Long logId;

    private String subject;

    @TableField(value = "send_to")
    private String sendTo;

    @TableField(value = "send_cc")
    private String sendCc;

    private String content;

    /**
     * 附件路径
     */
    private String attachments;

    /**
     * 发送次数
     */
    private Integer sendNums;

    /**
     * 错误信息
     */
    private String error;

    /**
     * 0-失败 1-成功
     */
    private Boolean result;

    /**
     * 发送配置
     */
    private String config;

    /**
     * 模板编号
     */
    private String tplCode;

    public Long getLogId() {
        return logId;
    }

    public void setLogId(Long logId) {
        this.logId = logId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getSendTo() {
        return sendTo;
    }

    public void setSendTo(String sendTo) {
        this.sendTo = sendTo;
    }

    public String getSendCc() {
        return sendCc;
    }

    public void setSendCc(String sendCc) {
        this.sendCc = sendCc;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAttachments() {
        return attachments;
    }

    public void setAttachments(String attachments) {
        this.attachments = attachments;
    }

    public Integer getSendNums() {
        return sendNums;
    }

    public void setSendNums(Integer sendNums) {
        this.sendNums = sendNums;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public Boolean getResult() {
        return result;
    }

    public void setResult(Boolean result) {
        this.result = result;
    }

    public String getConfig() {
        return config;
    }

    public void setConfig(String config) {
        this.config = config;
    }

    public String getTplCode() {
        return tplCode;
    }

    public void setTplCode(String tplCode) {
        this.tplCode = tplCode;
    }
}
