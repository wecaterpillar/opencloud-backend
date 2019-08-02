package com.opencloud.base.client.model.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.opencloud.common.mybatis.base.entity.AbstractEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * 系统权限-功能操作关联表
 *
 * @author: liuyadu
 * @date: 2018/10/24 16:21
 * @description:
 */
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@TableName("base_authority_action")
public class BaseAuthorityAction extends AbstractEntity {
    private static final long serialVersionUID = 1471599074044557390L;
    /**
     * 操作资源ID
     */
    private Long actionId;

    /**
     * 权限ID
     */
    private Long authorityId;
}
