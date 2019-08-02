package com.opencloud.base.client.model.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.opencloud.common.mybatis.base.entity.AbstractEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * 系统权限-应用关联
 * @author liuyadu
 */
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@TableName("base_authority_app")
public class BaseAuthorityApp extends AbstractEntity {
    /**
     * 权限ID
     */
    private Long authorityId;

    /**
     * 应用ID
     */
    private String appId;

    /**
     * 过期时间:null表示长期
     */
    private Date expireTime;

    private static final long serialVersionUID = 1L;
}
