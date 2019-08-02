ALTER TABLE `base_authority` ADD COLUMN `create_time` datetime  DEFAULT NULL COMMENT '创建时间';
ALTER TABLE `base_authority` ADD COLUMN `update_time` datetime  DEFAULT NULL COMMENT '修改时间';

ALTER TABLE `base_authority_action` ADD COLUMN `create_time` datetime  DEFAULT NULL COMMENT '创建时间';
ALTER TABLE `base_authority_action` ADD COLUMN `update_time` datetime  DEFAULT NULL COMMENT '修改时间';

ALTER TABLE `base_authority_app` ADD COLUMN `create_time` datetime  DEFAULT NULL COMMENT '创建时间';
ALTER TABLE `base_authority_app` ADD COLUMN `update_time` datetime  DEFAULT NULL COMMENT '修改时间';

ALTER TABLE `base_authority_role` ADD COLUMN `create_time` datetime  DEFAULT NULL COMMENT '创建时间';
ALTER TABLE `base_authority_role` ADD COLUMN `update_time` datetime  DEFAULT NULL COMMENT '修改时间';

ALTER TABLE `base_authority_role` ADD COLUMN `create_time` datetime  DEFAULT NULL COMMENT '创建时间';
ALTER TABLE `base_authority_role` ADD COLUMN `update_time` datetime  DEFAULT NULL COMMENT '修改时间';

ALTER TABLE `base_authority_user` ADD COLUMN `create_time` datetime  DEFAULT NULL COMMENT '创建时间';
ALTER TABLE `base_authority_user` ADD COLUMN `update_time` datetime  DEFAULT NULL COMMENT '修改时间';

ALTER TABLE `base_role_user` ADD COLUMN `create_time` datetime  DEFAULT NULL COMMENT '创建时间';
ALTER TABLE `base_role_user` ADD COLUMN `update_time` datetime  DEFAULT NULL COMMENT '修改时间';

ALTER TABLE `gateway_ip_limit_api` ADD COLUMN `create_time` datetime  DEFAULT NULL COMMENT '创建时间';
ALTER TABLE `gateway_ip_limit_api` ADD COLUMN `update_time` datetime  DEFAULT NULL COMMENT '修改时间';

ALTER TABLE `gateway_rate_limit_api` ADD COLUMN `create_time` datetime  DEFAULT NULL COMMENT '创建时间';
ALTER TABLE `gateway_rate_limit_api` ADD COLUMN `update_time` datetime  DEFAULT NULL COMMENT '修改时间';

ALTER TABLE `gateway_route` ADD COLUMN `create_time` datetime  DEFAULT NULL COMMENT '创建时间';
ALTER TABLE `gateway_route` ADD COLUMN `update_time` datetime  DEFAULT NULL COMMENT '修改时间';
