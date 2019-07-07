/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : open-platform

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-05-26 23:05:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base_action
-- ----------------------------
DROP TABLE IF EXISTS `base_action`;
CREATE TABLE `base_action` (
  `action_id` bigint(20) NOT NULL COMMENT '资源ID',
  `action_code` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '资源编码',
  `action_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '资源名称',
  `action_desc` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '资源描述',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '资源父节点',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT '优先级 越小越靠前',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态:0-无效 1-有效',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_persist` tinyint(3) NOT NULL DEFAULT '0' COMMENT '保留数据0-否 1-是 不允许删除',
  `service_id` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '服务名称',
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `action_code` (`action_code`) USING BTREE,
  UNIQUE KEY `action_id` (`action_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='系统资源-功能操作';

-- ----------------------------
-- Records of base_action
-- ----------------------------
INSERT INTO `base_action` VALUES ('1131849293404176385', 'systemMenuView', '查看', '', '3', '0', '1', '2019-05-24 17:07:54', '2019-05-25 01:56:20', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131849510572654593', 'systemMenuEdit', '编辑', '', '3', '0', '1', '2019-05-24 17:08:46', '2019-05-24 17:08:46', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131858946338992129', 'systemRoleView', '查看', '', '8', '0', '1', '2019-05-24 17:46:16', '2019-05-24 17:46:16', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131863248310775809', 'systemRoleEdit', '编辑', '', '8', '0', '1', '2019-05-24 18:03:22', '2019-05-24 18:03:22', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131863723722551297', 'systemAppView', '查看', '', '9', '0', '1', '2019-05-24 18:05:15', '2019-05-24 18:05:15', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131863775899693057', 'systemAppEdit', '编辑', '', '9', '0', '1', '2019-05-24 18:05:27', '2019-05-24 18:05:27', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131864400507056130', 'systemUserView', '查看', '', '10', '0', '1', '2019-05-24 18:07:56', '2019-05-24 18:07:56', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131864444878598146', 'systemUserEdit', '编辑', '', '10', '0', '1', '2019-05-24 18:08:07', '2019-05-24 18:08:07', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131864827252322305', 'gatewayIpLimitView', '查看', '', '2', '0', '1', '2019-05-24 18:09:38', '2019-05-24 18:09:38', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131864864267055106', 'gatewayIpLimitEdit', '编辑', '', '2', '0', '1', '2019-05-24 18:09:47', '2019-05-24 18:09:47', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131865040289411074', 'gatewayRouteView', '查看', '', '5', '0', '1', '2019-05-24 18:10:29', '2019-05-24 18:10:29', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131865075609645057', 'gatewayRouteEdit', '编辑', '', '5', '0', '1', '2019-05-24 18:10:37', '2019-05-24 18:10:37', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131865482314526722', 'systemApiView', '查看', '', '6', '0', '1', '2019-05-24 18:12:14', '2019-05-24 18:12:14', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131865520738545666', 'systemApiEdit', '编辑', '', '6', '0', '1', '2019-05-24 18:12:23', '2019-05-24 18:12:23', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131865772929462274', 'gatewayLogsView', '查看', '', '12', '0', '1', '2019-05-24 18:13:23', '2019-05-24 18:13:23', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131865931146997761', 'gatewayRateLimitView', '查看', '', '14', '0', '1', '2019-05-24 18:14:01', '2019-05-24 18:14:01', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131865974704844802', 'gatewayRateLimitEdit', '编辑', '', '14', '0', '1', '2019-05-24 18:14:12', '2019-05-24 18:14:12', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131866278187905026', 'jobView', '查看', '', '16', '0', '1', '2019-05-24 18:15:24', '2019-05-25 03:23:15', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131866310622457857', 'jobEdit', '编辑', '', '16', '0', '1', '2019-05-24 18:15:32', '2019-05-25 03:23:21', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131866943459045377', 'schedulerLogsView', '查看', '', '19', '0', '1', '2019-05-24 18:18:03', '2019-05-24 18:18:03', '1', 'opencloud-base-provider');
INSERT INTO `base_action` VALUES ('1131867094479155202', 'notifyHttpLogsView', '查看', '', '18', '0', '1', '2019-05-24 18:18:39', '2019-05-24 18:18:39', '1', 'opencloud-base-provider');

-- ----------------------------
-- Table structure for base_api
-- ----------------------------
DROP TABLE IF EXISTS `base_api`;
CREATE TABLE `base_api` (
  `api_id` bigint(20) NOT NULL COMMENT '接口ID',
  `api_code` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '接口编码',
  `api_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '接口名称',
  `api_category` varchar(20) COLLATE utf8_bin DEFAULT 'default' COMMENT '接口分类:default-默认分类',
  `api_desc` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '资源描述',
  `request_method` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求方式',
  `content_type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '响应类型',
  `service_id` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '服务ID',
  `path` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '请求路径',
  `priority` bigint(20) NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态:0-无效 1-有效',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_persist` tinyint(3) NOT NULL DEFAULT '0' COMMENT '保留数据0-否 1-是 不允许删除',
  `is_auth` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否需要认证: 0-无认证 1-身份认证 默认:1',
  `is_open` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否公开: 0-内部的 1-公开的',
  `class_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '类名',
  `method_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '方法名',
  PRIMARY KEY (`api_id`),
  UNIQUE KEY `api_code` (`api_code`),
  UNIQUE KEY `api_id` (`api_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='系统资源-API接口';

-- ----------------------------
-- Records of base_api
-- ----------------------------
INSERT INTO `base_api` VALUES ('1', 'all', '全部', 'default', '所有请求', 'get,post', null, 'opencloud-api-gateway-zuul', '/**', '0', '1', '2019-03-07 21:52:17', '2019-03-14 21:41:28', '1', '1', '1', null, null);
INSERT INTO `base_api` VALUES ('2', 'actuator', '监控端点', 'default', '监控端点', 'post', null, 'opencloud-api-gateway-zuul', '/actuator/**', '0', '1', '2019-03-07 21:52:17', '2019-03-14 21:41:28', '1', '1', '1', null, null);
INSERT INTO `base_api` VALUES ('1131753764703858689', 'b6af926a59f609ecb77435c8fdaf6b56', '添加接口资源', 'default', '添加接口资源', 'POST', '', 'opencloud-base-provider', '/api/add', '0', '1', '2019-05-24 02:48:18', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseApiController', 'addApi');
INSERT INTO `base_api` VALUES ('1131753764963905538', 'a18f290e608900b65f36ab2ae349914b', '编辑接口资源', 'default', '编辑接口资源', 'POST', '', 'opencloud-base-provider', '/api/update', '0', '1', '2019-05-24 02:48:19', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseApiController', 'updateApi');
INSERT INTO `base_api` VALUES ('1131753765098123266', 'f831ec70dd67c92fd321770c5526255b', '获取分页接口列表', 'default', '获取分页接口列表', 'GET', '', 'opencloud-base-provider', '/api', '0', '1', '2019-05-24 02:48:19', '2019-06-10 17:29:16', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseApiController', 'getApiList');
INSERT INTO `base_api` VALUES ('1131753765249118209', 'cc1d1fa06ba1ccc9c40e785ac3abdb08', '获取接口资源', 'default', '获取接口资源', 'GET', '', 'opencloud-base-provider', '/api/{apiId}/info', '0', '1', '2019-05-24 02:48:19', '2019-06-10 17:29:16', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseApiController', 'getApi');
INSERT INTO `base_api` VALUES ('1131753765383335937', 'e71fa6b7ea273c465ba2d4e6b42342ef', '获取所有接口列表', 'default', '获取所有接口列表', 'GET', '', 'opencloud-base-provider', '/api/all', '0', '1', '2019-05-24 02:48:19', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseApiController', 'getApiAllList');
INSERT INTO `base_api` VALUES ('1131753765534330882', '288ac721bd5e1ddcc81f01b349f6f29d', '移除接口资源', 'default', '移除接口资源', 'POST', '', 'opencloud-base-provider', '/api/remove', '0', '1', '2019-05-24 02:48:19', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseApiController', 'removeApi');
INSERT INTO `base_api` VALUES ('1131753768319348737', 'aa57d68926e854e557526e6641b088a9', '移除菜单资源', 'default', '移除菜单资源', 'POST', '', 'opencloud-base-provider', '/menu/remove', '0', '1', '2019-05-24 02:48:19', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseMenuController', 'removeMenu');
INSERT INTO `base_api` VALUES ('1131753768428400641', '60a997e9c59b9f799a0229b8f06228f5', '添加菜单资源', 'default', '添加菜单资源', 'POST', '', 'opencloud-base-provider', '/menu/add', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseMenuController', 'addMenu');
INSERT INTO `base_api` VALUES ('1131753768545841153', '8949cad9c927e9a0d51154c6b242dd6e', '获取菜单资源详情', 'default', '获取菜单资源详情', 'GET', '', 'opencloud-base-provider', '/menu/{menuId}/info', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseMenuController', 'getMenu');
INSERT INTO `base_api` VALUES ('1131753768654893057', '626523fc4cfa1546371424fcd1c8fd83', '编辑菜单资源', 'default', '编辑菜单资源', 'POST', '', 'opencloud-base-provider', '/menu/update', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseMenuController', 'updateMenu');
INSERT INTO `base_api` VALUES ('1131753768763944961', '10da691808307b3fdd7edf67997002f5', '菜单所有资源列表', 'default', '菜单所有资源列表', 'GET', '', 'opencloud-base-provider', '/menu/all', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseMenuController', 'getMenuAllList');
INSERT INTO `base_api` VALUES ('1131753768864608257', '61487aeb3aea3f43d40b0874cff540da', '获取分页菜单资源列表', 'default', '获取分页菜单资源列表', 'GET', '', 'opencloud-base-provider', '/menu', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseMenuController', 'getMenuListPage');
INSERT INTO `base_api` VALUES ('1131753770076762113', 'dbc243ee2010ee024ba213e06cb26120', '获取角色详情', 'default', '获取角色详情', 'GET', '', 'opencloud-base-provider', '/role/{roleId}/info', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseRoleController', 'getRole');
INSERT INTO `base_api` VALUES ('1131753770257117185', 'e3ea922ac11e53d102ff90c2ccf0f88b', '获取分页角色列表', 'default', '获取分页角色列表', 'GET', '', 'opencloud-base-provider', '/role', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseRoleController', 'getRoleListPage');
INSERT INTO `base_api` VALUES ('1131753770391334914', 'f47b47def7e3c25973540301395703ab', '查询角色成员', 'default', '查询角色成员', 'GET', '', 'opencloud-base-provider', '/role/users', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseRoleController', 'getRoleUsers');
INSERT INTO `base_api` VALUES ('1131753770525552642', 'e1841f0d06c5edd5cc1fbe8abbd0d417', '获取所有角色列表', 'default', '获取所有角色列表', 'GET', '', 'opencloud-base-provider', '/role/all', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseRoleController', 'getRoleAllList');
INSERT INTO `base_api` VALUES ('1131753770642993154', 'c60c104888661e661949943066b7c099', '编辑角色', 'default', '编辑角色', 'POST', '', 'opencloud-base-provider', '/role/update', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseRoleController', 'updateRole');
INSERT INTO `base_api` VALUES ('1131753770739462145', 'be699d015113939cc8878fc8e6bc62c8', '添加角色', 'default', '添加角色', 'POST', '', 'opencloud-base-provider', '/role/add', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseRoleController', 'addRole');
INSERT INTO `base_api` VALUES ('1131753770974343170', '21ac6fd21a606b079e2cd2dc9fe7afbe', '删除角色', 'default', '删除角色', 'POST', '', 'opencloud-base-provider', '/role/remove', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseRoleController', 'removeRole');
INSERT INTO `base_api` VALUES ('1131753771188252673', '39f8253d29561e5359f69265eb82ffef', '角色添加成员', 'default', '角色添加成员', 'POST', '', 'opencloud-base-provider', '/role/users/add', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseRoleController', 'addUserRoles');
INSERT INTO `base_api` VALUES ('1131753771309887489', 'e82f0960b1c7df6badde9ce40233ed84', '获取用户已分配角色', 'default', '获取用户已分配角色', 'GET', '', 'opencloud-base-provider', '/user/roles', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseUserController', 'getUserRoles');
INSERT INTO `base_api` VALUES ('1131753771465076737', 'd3f26c20f7c8217ac8022ed9520edce1', '更新系统用户', 'default', '更新系统用户', 'POST', '', 'opencloud-base-provider', '/user/update', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseUserController', 'updateUser');
INSERT INTO `base_api` VALUES ('1131753771561545729', '7b1d4a6dff872477e2c39c5922f13b7a', '添加系统用户', 'default', '添加系统用户', 'POST', '', 'opencloud-base-provider', '/user/add', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseUserController', 'addUser');
INSERT INTO `base_api` VALUES ('1131753771662209025', '2834e8f27e7bf5c07635c89b013f23da', '获取所有用户列表', 'default', '获取所有用户列表', 'GET', '', 'opencloud-base-provider', '/user/all', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseUserController', 'getUserAllList');
INSERT INTO `base_api` VALUES ('1131753772186497026', '48c538d283152d356107f610b02a39b7', '修改用户密码', 'default', '修改用户密码', 'POST', '', 'opencloud-base-provider', '/user/update/password', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseUserController', 'updatePassword');
INSERT INTO `base_api` VALUES ('1131753772295548930', 'af7fd816ea3d699d9032c4195581dfb2', '用户分配角色', 'default', '用户分配角色', 'POST', '', 'opencloud-base-provider', '/user/roles/add', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseUserController', 'addUserRoles');
INSERT INTO `base_api` VALUES ('1131753772467515393', '0e63d8939ee749293301fbfc277909cc', '系统分页用户列表', 'default', '系统分页用户列表', 'GET', '', 'opencloud-base-provider', '/user', '0', '1', '2019-05-24 02:48:20', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseUserController', 'getUserList');
INSERT INTO `base_api` VALUES ('1131753772752728066', '077d004d6b5a848b918c76028fa387e5', '获取用户详细信息', 'default', '获取用户详细信息', 'POST', '', 'opencloud-base-provider', '/user/info', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:18', '1', '0', '1', 'com.opencloud.base.provider.controller.BaseUserUserAccountController', 'getUserInfo');
INSERT INTO `base_api` VALUES ('1131753773281210369', 'fa8df5ce1ec8b28f8a842c9c49d370ff', '注册第三方登录账号', 'default', '仅限系统内部调用', 'POST', '', 'opencloud-base-provider', '/account/register/thirdParty', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:18', '1', '0', '1', 'com.opencloud.base.provider.controller.BaseUserUserAccountController', 'registerThirdPartyAccount');
INSERT INTO `base_api` VALUES ('1131753773390262273', '681d209b08e76c154912c731cabafabf', '获取App用户详细信息', 'default', '获取App用户详细信息', 'POST', '', 'opencloud-base-provider', '/user/appInfo', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:18', '1', '0', '1', 'com.opencloud.base.provider.controller.BaseUserUserAccountController', 'getAppUserInfo');
INSERT INTO `base_api` VALUES ('1131753773474148353', 'fb7228edbe99276371ddaf2746f6d716', '重置密码', 'default', '重置密码', 'POST', '', 'opencloud-base-provider', '/account/reset/password', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:18', '1', '0', '1', 'com.opencloud.base.provider.controller.BaseUserUserAccountController', 'resetPassword');
INSERT INTO `base_api` VALUES ('1131753773570617346', 'd963a71e1bad2eaf485301d47e0a5215', '获取账号登录信息', 'default', '仅限系统内部调用', 'POST', '', 'opencloud-base-provider', '/account/localLogin', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:18', '1', '0', '1', 'com.opencloud.base.provider.controller.BaseUserUserAccountController', 'localLogin');
INSERT INTO `base_api` VALUES ('1131753773788721153', '3f1391d5c775d2b1718045862a931c29', 'App初始化登录', 'default', 'App初始化登录', 'POST', '', 'opencloud-base-provider', '/login/init', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseUserUserAccountController', 'loginInit');
INSERT INTO `base_api` VALUES ('1131753773889384450', 'cca3ce66883e435c0e60e44bc741e864', '获取app登录信息', 'default', '', 'POST', '', 'opencloud-base-provider', '/account/appLogin', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:18', '1', '0', '1', 'com.opencloud.base.provider.controller.BaseUserUserAccountController', 'appLogin');
INSERT INTO `base_api` VALUES ('1131753774078128129', '4971aa8994c1ed2144eb641ad1096090', '获取分页访问日志列表', 'default', '获取分页访问日志列表', 'GET', '', 'opencloud-base-provider', '/gateway/access/logs', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayAccessLogsController', 'getAccessLogListPage');
INSERT INTO `base_api` VALUES ('1131753774187180033', '9f7ad288b3ebf970ced6a71b9d85fa67', 'com.opencloud.base.provider.controller.GatewayController.getApiRateLimitList', 'default', '', 'GET', '', 'opencloud-base-provider', '/gateway/api/rateLimit', '0', '1', '2019-05-24 02:48:21', '2019-06-10 18:00:04', '1', '0', '0', 'com.opencloud.base.provider.controller.GatewayController', 'getApiRateLimitList');
INSERT INTO `base_api` VALUES ('1131753774300426242', '1cfb2e64efc00a7617801597f267eb91', 'com.opencloud.base.provider.controller.GatewayController.getApiBlackList', 'default', '', 'GET', '', 'opencloud-base-provider', '/gateway/api/blackList', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:59:55', '1', '0', '0', 'com.opencloud.base.provider.controller.GatewayController', 'getApiBlackList');
INSERT INTO `base_api` VALUES ('1131753774426255362', '8682df9dce9d7adb63ca1b77d3826dd7', 'com.opencloud.base.provider.controller.GatewayController.getApiRouteList', 'default', '', 'GET', '', 'opencloud-base-provider', '/gateway/api/route', '0', '1', '2019-05-24 02:48:21', '2019-06-10 18:00:51', '1', '0', '0', 'com.opencloud.base.provider.controller.GatewayController', 'getApiRouteList');
INSERT INTO `base_api` VALUES ('1131753774677913601', 'be28403a54c45e3905ad9c6c0916e1da', 'com.opencloud.base.provider.controller.GatewayController.getApiWhiteList', 'default', '', 'GET', '', 'opencloud-base-provider', '/gateway/api/whiteList', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:59:47', '1', '0', '0', 'com.opencloud.base.provider.controller.GatewayController', 'getApiWhiteList');
INSERT INTO `base_api` VALUES ('1131753774837297153', 'e1e7ec806d3e9c07f33edf483cdb76cb', '查询策略已绑定API列表', 'default', '获取分页接口列表', 'GET', '', 'opencloud-base-provider', '/gateway/limit/ip/api/list', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayIpLimitController', 'getIpLimitApiList');
INSERT INTO `base_api` VALUES ('1131753774916988929', '31869c7b439e7c349751b0c5ce1c4de4', '获取分页接口列表', 'default', '获取分页接口列表', 'GET', '', 'opencloud-base-provider', '/gateway/limit/ip', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayIpLimitController', 'getIpLimitListPage');
INSERT INTO `base_api` VALUES ('1131753775000875011', '2303dbde5b3c3cec8dda9f80f68fa3d7', '绑定API', 'default', '一个API只能绑定一个策略', 'POST', '', 'opencloud-base-provider', '/gateway/limit/ip/api/add', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayIpLimitController', 'addIpLimitApis');
INSERT INTO `base_api` VALUES ('1131753775181230081', 'd10140370336fef356761c81a8c7c74c', '添加IP限制', 'default', '添加IP限制', 'POST', '', 'opencloud-base-provider', '/gateway/limit/ip/add', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayIpLimitController', 'addIpLimit');
INSERT INTO `base_api` VALUES ('1131753775407722497', 'e2543401ca47d75d0358f0d6234fe57e', '获取IP限制', 'default', '获取IP限制', 'GET', '', 'opencloud-base-provider', '/gateway/limit/ip/{policyId}/info', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayIpLimitController', 'getIpLimit');
INSERT INTO `base_api` VALUES ('1131753775499997186', 'b644167ee8e7da85170a30dc9a5f09a1', '编辑IP限制', 'default', '编辑IP限制', 'POST', '', 'opencloud-base-provider', '/gateway/limit/ip/update', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayIpLimitController', 'updateIpLimit');
INSERT INTO `base_api` VALUES ('1131753775768432641', '1e130c24a36c66f9313c053009dc50dd', '移除IP限制', 'default', '移除IP限制', 'POST', '', 'opencloud-base-provider', '/gateway/limit/ip/remove', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayIpLimitController', 'removeIpLimit');
INSERT INTO `base_api` VALUES ('1131753776049451009', 'd6a688c97f7e1437bc448d3f6561b542', '查询策略已绑定API列表', 'default', '获取分页接口列表', 'GET', '', 'opencloud-base-provider', '/gateway/limit/rate/api/list', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayRateLimitController', 'getRateLimitApiList');
INSERT INTO `base_api` VALUES ('1131753776099782658', '20faad3eed3011b83dc9602bc1d3fd69', '获取分页接口列表', 'default', '获取分页接口列表', 'GET', '', 'opencloud-base-provider', '/gateway/limit/rate', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayRateLimitController', 'getRateLimitListPage');
INSERT INTO `base_api` VALUES ('1131753776254971906', '57d30595347bab9275adafa21634af94', '获取流量控制', 'default', '获取流量控制', 'GET', '', 'opencloud-base-provider', '/gateway/limit/rate/{policyId}/info', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayRateLimitController', 'getRateLimit');
INSERT INTO `base_api` VALUES ('1131753776515018753', '84feb7e54f71c73dfb113dd91b27fbb4', '编辑流量控制', 'default', '编辑流量控制', 'POST', '', 'opencloud-base-provider', '/gateway/limit/rate/update', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayRateLimitController', 'updateRateLimit');
INSERT INTO `base_api` VALUES ('1131753776619876353', '11750205d4484a03935ae2f4c7a61dd1', '移除流量控制', 'default', '移除流量控制', 'POST', '', 'opencloud-base-provider', '/gateway/limit/rate/remove', '0', '1', '2019-05-24 02:48:21', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayRateLimitController', 'removeRateLimit');
INSERT INTO `base_api` VALUES ('1131753776749899777', 'cc8005b392809ee0b6d5c5337d792e2a', '绑定API', 'default', '一个API只能绑定一个策略', 'POST', '', 'opencloud-base-provider', '/gateway/limit/rate/api/add', '0', '1', '2019-05-24 02:48:22', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayRateLimitController', 'addRateLimitApis');
INSERT INTO `base_api` VALUES ('1131753776875728897', '323b5bc3a887e81ae2c70fbc5e087b1a', '添加流量控制', 'default', '添加流量控制', 'POST', '', 'opencloud-base-provider', '/gateway/limit/rate/add', '0', '1', '2019-05-24 02:48:22', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayRateLimitController', 'addRateLimit');
INSERT INTO `base_api` VALUES ('1131753776959614978', 'bf1a32fd1d94fc9f113d9162bfcb797d', '获取分页路由列表', 'default', '获取分页路由列表', 'GET', '', 'opencloud-base-provider', '/gateway/route', '0', '1', '2019-05-24 02:48:22', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayRouteController', 'getRouteListPage');
INSERT INTO `base_api` VALUES ('1131753777085444098', '3092aa6004a9c104e6ab18c0c6f37d03', '获取路由', 'default', '获取路由', 'GET', '', 'opencloud-base-provider', '/gateway/route/{routeId}/info', '0', '1', '2019-05-24 02:48:22', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayRouteController', 'getRoute');
INSERT INTO `base_api` VALUES ('1131753777207078913', 'd59556173473fdaef038c9a77baf1e67', '添加路由', 'default', '添加路由', 'POST', '', 'opencloud-base-provider', '/gateway/route/add', '0', '1', '2019-05-24 02:48:22', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayRouteController', 'addRoute');
INSERT INTO `base_api` VALUES ('1131753777366462466', 'fe1588c310eb3ab4276dd93cd76d320b', '编辑路由', 'default', '编辑路由', 'POST', '', 'opencloud-base-provider', '/gateway/route/update', '0', '1', '2019-05-24 02:48:22', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayRouteController', 'updateRoute');
INSERT INTO `base_api` VALUES ('1131753777496485889', '7d77e48da3e33719125d2cdac5b8cdef', '移除路由', 'default', '移除路由', 'POST', '', 'opencloud-base-provider', '/gateway/route/remove', '0', '1', '2019-05-24 02:48:22', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.GatewayRouteController', 'removeRoute');
INSERT INTO `base_api` VALUES ('1131813661130821634', '792924d536b1920f337ab4b15cb10f8d', '获取功能按钮详情', 'default', '获取功能按钮详情', 'GET', '', 'opencloud-base-provider', '/action/{actionId}/info', '0', '1', '2019-05-24 06:46:19', '2019-06-10 17:29:16', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseActionController', 'getAction');
INSERT INTO `base_api` VALUES ('1131813661302788097', 'fae2afb6eaa1f2da257f867044fb61bc', '移除功能按钮', 'default', '移除功能按钮', 'POST', '', 'opencloud-base-provider', '/action/remove', '0', '1', '2019-05-24 06:46:19', '2019-06-10 17:29:16', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseActionController', 'removeAction');
INSERT INTO `base_api` VALUES ('1131813661407645698', '9ba9763bce60e01aaa132f87c852882a', '添加功能按钮', 'default', '添加功能按钮', 'POST', '', 'opencloud-base-provider', '/action/add', '0', '1', '2019-05-24 06:46:19', '2019-06-10 17:29:16', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseActionController', 'addAction');
INSERT INTO `base_api` VALUES ('1131813661546057730', '05a259a8e811e6d55617173478fbbfa6', '编辑功能按钮', 'default', '添加功能按钮', 'POST', '', 'opencloud-base-provider', '/action/update', '0', '1', '2019-05-24 06:46:19', '2019-06-10 17:29:16', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseActionController', 'updateAction');
INSERT INTO `base_api` VALUES ('1131813661793521666', '64f88e1bc15903ff6d4c981e9b74bcef', '获取分页功能按钮列表', 'default', '获取分页功能按钮列表', 'GET', '', 'opencloud-base-provider', '/action', '0', '1', '2019-05-24 06:46:19', '2019-06-10 17:29:16', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseActionController', 'findActionListPage');
INSERT INTO `base_api` VALUES ('1131813663357997057', '67344cb11ead8a6f825eeb6de25e8bf0', '获取应用已分配接口权限', 'default', '获取应用已分配接口权限', 'GET', '', 'opencloud-base-provider', '/authority/app', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:17', '1', '0', '1', 'com.opencloud.base.provider.controller.BaseAuthorityController', 'findAuthorityApp');
INSERT INTO `base_api` VALUES ('1131813663458660353', 'cf52045db3a8577e707d024ce7405965', '获取接口权限列表', 'default', '获取接口权限列表', 'GET', '', 'opencloud-base-provider', '/authority/api', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAuthorityController', 'findAuthorityApi');
INSERT INTO `base_api` VALUES ('1131813663546740737', 'cd98162c79dc076d63bf5abd41d53143', '获取用户已分配权限', 'default', '获取用户已分配权限', 'GET', '', 'opencloud-base-provider', '/authority/user', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAuthorityController', 'findAuthorityUser');
INSERT INTO `base_api` VALUES ('1131813663634821121', '790f832683b99e0747a1ede767ab4c45', '获取菜单权限列表', 'default', '获取菜单权限列表', 'GET', '', 'opencloud-base-provider', '/authority/menu', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAuthorityController', 'findAuthorityMenu');
INSERT INTO `base_api` VALUES ('1131813663714512897', '7e3e5133cbac4d7c383487296bed0f25', '获取角色已分配权限', 'default', '获取角色已分配权限', 'GET', '', 'opencloud-base-provider', '/authority/role', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAuthorityController', 'findAuthorityRole');
INSERT INTO `base_api` VALUES ('1131813663785816066', '14adcfada9fbf4ab67246074bdd4ef4a', '分配用户权限', 'default', '分配用户权限', 'POST', '', 'opencloud-base-provider', '/authority/user/grant', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAuthorityController', 'grantAuthorityUser');
INSERT INTO `base_api` VALUES ('1131813663861313538', '3a3db1f15d5c5dfa510ce8cf7c87b3a0', '获取功能权限列表', 'default', '获取功能权限列表', 'GET', '', 'opencloud-base-provider', '/authority/action', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAuthorityController', 'findAuthorityAction');
INSERT INTO `base_api` VALUES ('1131813663928422402', '6d3a403da1e1abd2faa7e84c59cd581a', '分配应用权限', 'default', '分配应用权限', 'POST', '', 'opencloud-base-provider', '/authority/app/grant', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAuthorityController', 'grantAuthorityApp');
INSERT INTO `base_api` VALUES ('1131813663999725570', '8ab60f4decd466c3d3bb998cdd204d1c', '功能按钮授权', 'default', '功能按钮授权', 'POST', '', 'opencloud-base-provider', '/authority/action/grant', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAuthorityController', 'grantAuthorityAction');
INSERT INTO `base_api` VALUES ('1131813664087805954', '1de783a470807e679754c7981e42a93a', '获取所有访问权限列表', 'default', '获取所有访问权限列表', 'GET', '', 'opencloud-base-provider', '/authority/access', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:17', '1', '0', '1', 'com.opencloud.base.provider.controller.BaseAuthorityController', 'findAuthorityResource');
INSERT INTO `base_api` VALUES ('1131813664167497729', 'd1010a1c6d7c4bf1cccd5dd138bf168d', '分配角色权限', 'default', '分配角色权限', 'POST', '', 'opencloud-base-provider', '/authority/role/grant', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAuthorityController', 'grantAuthorityRole');
INSERT INTO `base_api` VALUES ('1131813666604388354', '49bc37ec940d91e006216661364b734c', '修改当前登录用户密码', 'default', '修改当前登录用户密码', 'GET', '', 'opencloud-base-provider', '/current/user/rest/password', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.CurrentUserController', 'restPassword');
INSERT INTO `base_api` VALUES ('1131813666734411777', 'a1e524e366ef7a807cca87b6539f9559', '修改当前登录用户基本信息', 'default', '修改当前登录用户基本信息', 'POST', '', 'opencloud-base-provider', '/current/user/update', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.CurrentUserController', 'updateUserInfo');
INSERT INTO `base_api` VALUES ('1131813666805714945', 'b1c2096ba1c9a726555c37625765e609', '获取当前登录用户已分配菜单权限', 'default', '获取当前登录用户已分配菜单权限', 'GET', '', 'opencloud-base-provider', '/current/user/menu', '0', '1', '2019-05-24 06:46:20', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.base.provider.controller.CurrentUserController', 'findAuthorityMenu');
INSERT INTO `base_api` VALUES ('1131814106985336834', '138a345ec34756b953c7f588c6a7895e', '获取用户基础信息', 'default', '', 'GET', '', 'opencloud-auth-provider', '/current/user', '0', '1', '2019-05-24 06:48:05', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.auth.provider.controller.ApiController', 'getUserProfile');
INSERT INTO `base_api` VALUES ('1131814107073417217', '80dd74b15d7bac80aab0e156a20dda5a', '获取第三方登录配置', 'default', '任何人都可访问', 'GET', '', 'opencloud-auth-provider', '/login/config', '0', '1', '2019-05-24 06:48:05', '2019-06-10 17:29:20', '1', '0', '1', 'com.opencloud.auth.provider.controller.ApiController', 'getLoginOtherConfig');
INSERT INTO `base_api` VALUES ('1131814508283760641', '6e5c24c1a8ff0a9b9207b0916cff40cc', '发送邮件', 'default', '发送邮件', 'POST', '', 'opencloud-msg-provider', '/email', '0', '1', '2019-05-24 06:49:41', '2019-05-25 03:24:07', '1', '1', '1', 'com.opencloud.msg.provider.controller.EmailController', 'sendEmail');
INSERT INTO `base_api` VALUES ('1131814508367646722', '2e5b51a23c9521b3bfdc9751f60dfac9', '获取分页异步通知列表', 'default', '获取分页异步通知列表', 'GET', '', 'opencloud-msg-provider', '/http/notify/logs', '0', '1', '2019-05-24 06:49:41', '2019-05-25 03:24:07', '1', '1', '1', 'com.opencloud.msg.provider.controller.HttpNotifyController', 'getNotifyHttpLogListPage');
INSERT INTO `base_api` VALUES ('1131814508434755586', 'af0b92b06c954d0f98e4caa5d054a7e9', '发送HTTP异步通知', 'default', '发送HTTP异步通知', 'POST', 'application/json;charset=UTF-8', 'opencloud-msg-provider', '/http/notify', '0', '1', '2019-05-24 06:49:41', '2019-05-25 03:24:07', '1', '1', '1', 'com.opencloud.msg.provider.controller.HttpNotifyController', 'sendHttpNotify');
INSERT INTO `base_api` VALUES ('1131814508514447361', '5dbda0d2929072965f60ec359ded3e08', '发送短信', 'default', '发送短信', 'POST', '', 'opencloud-msg-provider', '/sms', '0', '1', '2019-05-24 06:49:41', '2019-05-25 03:24:07', '1', '1', '1', 'com.opencloud.msg.provider.controller.SmsController', 'sendSms');
INSERT INTO `base_api` VALUES ('1131814634179989506', '6716535c15e704f5fcde30593ae2d6ab', '暂停任务', 'default', '暂停任务', 'POST', '', 'opencloud-scheduler-provider', '/job/pause', '0', '1', '2019-05-24 06:50:11', '2019-05-25 03:24:10', '1', '1', '1', 'com.opencloud.task.provider.controller.SchedulerController', 'pauseJob');
INSERT INTO `base_api` VALUES ('1131814634255486978', 'dc699b32f06f4b75bce208ed216b2a8f', '恢复任务', 'default', '恢复任务', 'POST', '', 'opencloud-scheduler-provider', '/job/resume', '0', '1', '2019-05-24 06:50:11', '2019-05-25 03:24:10', '1', '1', '1', 'com.opencloud.task.provider.controller.SchedulerController', 'resumeJob');
INSERT INTO `base_api` VALUES ('1131814634339373058', 'e129e91ce3352883eef91e100e3bca2e', '删除任务', 'default', '删除任务', 'POST', '', 'opencloud-scheduler-provider', '/job/delete', '0', '1', '2019-05-24 06:50:11', '2019-05-25 03:24:10', '1', '1', '1', 'com.opencloud.task.provider.controller.SchedulerController', 'deleteJob');
INSERT INTO `base_api` VALUES ('1131814634431647745', '1c7e9c2b0cfe35bffec6d50f32433203', '添加远程调度任务', 'default', '添加远程调度任务', 'POST', '', 'opencloud-scheduler-provider', '/job/add/http', '0', '1', '2019-05-24 06:50:11', '2019-05-25 03:24:10', '1', '1', '1', 'com.opencloud.task.provider.controller.SchedulerController', 'addHttpJob');
INSERT INTO `base_api` VALUES ('1131814634519728130', '87ac0c6c2ac6efa1aac05c6b42360ec7', '获取任务执行日志列表', 'default', '获取任务执行日志列表', 'GET', '', 'opencloud-scheduler-provider', '/job/logs', '0', '1', '2019-05-24 06:50:11', '2019-05-25 03:24:10', '1', '1', '1', 'com.opencloud.task.provider.controller.SchedulerController', 'getJobLogList');
INSERT INTO `base_api` VALUES ('1131814634612002818', 'ed5eba3360498a68991b5db7055269ac', '修改远程调度任务', 'default', '修改远程调度任务', 'POST', '', 'opencloud-scheduler-provider', '/job/update/http', '0', '1', '2019-05-24 06:50:11', '2019-05-25 03:24:10', '1', '1', '1', 'com.opencloud.task.provider.controller.SchedulerController', 'updateHttpJob');
INSERT INTO `base_api` VALUES ('1131814634674917378', 'c33e7d8263643b094764d47b62cc3b69', '获取任务列表', 'default', '获取任务列表', 'GET', '', 'opencloud-scheduler-provider', '/job', '0', '1', '2019-05-24 06:50:11', '2019-05-25 03:24:10', '1', '1', '1', 'com.opencloud.task.provider.controller.SchedulerController', 'getJobList');
INSERT INTO `base_api` VALUES ('1131844868564504578', '6b065c01450f93bfd3612e24bc23e529', '获取菜单下所有操作', 'default', '获取菜单下所有操作', 'GET', '', 'opencloud-base-provider', '/menu/action', '0', '1', '2019-05-24 08:50:19', '2019-06-10 17:29:18', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseMenuController', 'getMenuAction');
INSERT INTO `base_api` VALUES ('1131995510647877634', '14a804e4b6f9ba7073e79805707eecd4', '获取服务列表', 'default', '获取服务列表', 'GET', '', 'opencloud-api-gateway-zuul', '/service/list', '0', '1', '2019-05-25 02:48:55', '2019-06-10 17:39:39', '1', '1', '1', 'com.opencloud.zuul.controller.ServiceController', 'getServiceList');
INSERT INTO `base_api` VALUES ('1132203893132922881', 'ca06d0facc77097870ac1132a1392692', '完善应用开发信息', 'default', '完善应用开发信息', 'POST', '', 'opencloud-base-provider', '/app/client/update', '0', '1', '2019-05-25 16:36:57', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAppController', 'updateAppClientInfo');
INSERT INTO `base_api` VALUES ('1132203893351026690', '5254c25e4c552b9f902cee830713f1a6', '获取应用详情', 'default', '仅限系统内部调用', 'GET', '', 'opencloud-base-provider', '/app/{appId}/info', '0', '1', '2019-05-25 16:36:58', '2019-06-10 17:29:17', '1', '0', '1', 'com.opencloud.base.provider.controller.BaseAppController', 'getApp');
INSERT INTO `base_api` VALUES ('1132203893539770370', 'b45f0f0e70958257b9cd70d4ec65f1b9', '获取分页应用列表', 'default', '获取分页应用列表', 'GET', '', 'opencloud-base-provider', '/app', '0', '1', '2019-05-25 16:36:58', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAppController', 'getAppListPage');
INSERT INTO `base_api` VALUES ('1132203893732708354', '70ce59edc96d0aff695a627c5476c05a', '添加应用信息', 'default', '添加应用信息', 'POST', '', 'opencloud-base-provider', '/app/add', '0', '1', '2019-05-25 16:36:58', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAppController', 'addApp');
INSERT INTO `base_api` VALUES ('1132203893929840641', '7a5f06bafc903c1beaee9d4969c0ccfb', '获取应用开发配置信息', 'default', '获取应用开发配置信息', 'GET', '', 'opencloud-base-provider', '/app/client/{appId}/info', '0', '1', '2019-05-25 16:36:58', '2019-06-10 17:29:17', '1', '0', '1', 'com.opencloud.base.provider.controller.BaseAppController', 'getAppClientInfo');
INSERT INTO `base_api` VALUES ('1132203894231830530', '6efe9bc25c0b1070631be04c9b748741', '重置应用秘钥', 'default', '重置应用秘钥', 'POST', '', 'opencloud-base-provider', '/app/reset', '0', '1', '2019-05-25 16:36:58', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAppController', 'resetAppSecret');
INSERT INTO `base_api` VALUES ('1132203894433157122', 'a83953d1867e8e5c123f3d1efd52c578', '删除应用信息', 'default', '删除应用信息', 'POST', '', 'opencloud-base-provider', '/app/remove', '0', '1', '2019-05-25 16:36:58', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAppController', 'removeApp');
INSERT INTO `base_api` VALUES ('1132203894621900802', '3e748de8b6a3aacbfcc3079a7d02e199', '编辑应用信息', 'default', '编辑应用信息', 'POST', '', 'opencloud-base-provider', '/app/update', '0', '1', '2019-05-25 16:36:58', '2019-06-10 17:29:17', '1', '1', '1', 'com.opencloud.base.provider.controller.BaseAppController', 'updateApp');
INSERT INTO `base_api` VALUES ('1133316877458767874', 'ee0ea78d16119d8703c0d10536bd4925', '内部应用请求签名', 'default', '仅限系统内部调用', 'POST', '', 'opencloud-auth-provider', '/sign', '0', '1', '2019-05-28 18:19:34', '2019-06-10 17:29:19', '1', '1', '1', 'com.opencloud.auth.provider.controller.ApiController', 'sign');
INSERT INTO `base_api` VALUES ('1133316877681065986', '8318625438f4dc55efa5931822e3c124', '获取用户访问令牌', 'default', '基于oauth2密码模式登录,无需签名,返回access_token', 'POST', '', 'opencloud-auth-provider', '/login/token', '0', '1', '2019-05-28 18:19:34', '2019-06-10 17:29:19', '1', '0', '1', 'com.opencloud.auth.provider.controller.ApiController', 'getLoginToken');
INSERT INTO `base_api` VALUES ('1133326693677826050', '71d7020720054dd3b325731338c1262c', '退出移除令牌', 'default', '退出移除令牌', 'POST', '', 'opencloud-auth-provider', '/logout/token', '0', '1', '2019-05-28 18:58:34', '2019-06-10 17:56:54', '1', '1', '1', 'com.opencloud.auth.provider.controller.ApiController', 'removeToken');

-- ----------------------------
-- Table structure for base_app
-- ----------------------------
DROP TABLE IF EXISTS `base_app`;
CREATE TABLE `base_app` (
  `app_id` varchar(50) NOT NULL COMMENT '客户端ID',
  `app_secret` varchar(255) NOT NULL COMMENT '客户端秘钥',
  `app_name` varchar(255) NOT NULL COMMENT 'app名称',
  `app_name_en` varchar(255) NOT NULL COMMENT 'app英文名称',
  `app_icon` varchar(255) NOT NULL COMMENT '应用图标',
  `app_type` varchar(50) NOT NULL COMMENT 'app类型:server-服务应用 app-手机应用 pc-PC网页应用 wap-手机网页应用',
  `app_desc` varchar(255) DEFAULT NULL COMMENT 'app描述',
  `app_os` varchar(25) DEFAULT NULL COMMENT '移动应用操作系统:ios-苹果 android-安卓',
  `website` varchar(255) NOT NULL COMMENT '官网地址',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID:默认为0',
  `user_type` varchar(20) NOT NULL DEFAULT 'platform' COMMENT '用户类型:platform-平台 isp-服务提供商 dev-自研开发者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态:0-无效 1-有效',
  `is_persist` tinyint(3) NOT NULL DEFAULT '0' COMMENT '保留数据0-否 1-是 不允许删除',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统应用-基础信息';

-- ----------------------------
-- Records of base_app
-- ----------------------------
INSERT INTO `base_app` VALUES ('1552274783265', '2cde1eaa60fe4af1987f94caa13f29a2', '资源服务器', 'ResourceServer', '', 'server', '资源服务器', '', 'http://www.baidu.com', '521677655146233856', 'platform', '2018-11-12 17:48:45', '2019-05-25 03:08:36', '1', '1');
INSERT INTO `base_app` VALUES ('1552294656514', '74a02bade18a42388c3127751b96e1f7', '运营后台', 'Admin', '', 'pc', '运营后台', '', 'http://www.baidu.com', '521677655146233856', 'platform', '2018-11-12 17:48:45', '2019-03-20 10:44:04', '1', '1');
INSERT INTO `base_app` VALUES ('1558768969811', '4578361d3efb4f949c617dad1fadc1cb', '测试权限应用', 'testApp', 'https://o5wwk8baw.qnssl.com/7eb99afb9d5f317c912f08b5212fd69a/avatar', 'server', '', '', 'http://www.baidu.com', '521677655146233856', 'platform', '2019-05-25 15:22:49', '2019-05-25 15:22:49', '1', '0');

-- ----------------------------
-- Table structure for base_authority
-- ----------------------------
DROP TABLE IF EXISTS `base_authority`;
CREATE TABLE `base_authority` (
  `authority_id` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL COMMENT '权限标识',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单资源ID',
  `api_id` bigint(20) DEFAULT NULL COMMENT 'API资源ID',
  `action_id` bigint(20) DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`authority_id`),
  KEY `menu_id` (`menu_id`),
  KEY `api_id` (`api_id`),
  KEY `action_id` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统权限-菜单权限、操作权限、API权限';

-- ----------------------------
-- Records of base_authority
-- ----------------------------
INSERT INTO `base_authority` VALUES ('1', 'MENU_system', '1', null, null, '1');
INSERT INTO `base_authority` VALUES ('2', 'MENU_gatewayIpLimit', '2', null, null, '1');
INSERT INTO `base_authority` VALUES ('3', 'MENU_systemMenu', '3', null, null, '1');
INSERT INTO `base_authority` VALUES ('5', 'MENU_gatewayRoute', '5', null, null, '1');
INSERT INTO `base_authority` VALUES ('6', 'MENU_systemApi', '6', null, null, '1');
INSERT INTO `base_authority` VALUES ('7', 'MENU_gatewayTrace', '7', null, null, '1');
INSERT INTO `base_authority` VALUES ('8', 'MENU_systemRole', '8', null, null, '1');
INSERT INTO `base_authority` VALUES ('9', 'MENU_systemApp', '9', null, null, '1');
INSERT INTO `base_authority` VALUES ('10', 'MENU_systemUser', '10', null, null, '1');
INSERT INTO `base_authority` VALUES ('11', 'MENU_apiDebug', '11', null, null, '1');
INSERT INTO `base_authority` VALUES ('12', 'MENU_gatewayLogs', '12', null, null, '1');
INSERT INTO `base_authority` VALUES ('13', 'MENU_gateway', '13', null, null, '1');
INSERT INTO `base_authority` VALUES ('14', 'MENU_gatewayRateLimit', '14', null, null, '1');
INSERT INTO `base_authority` VALUES ('15', 'MENU_scheduler', '15', null, null, '1');
INSERT INTO `base_authority` VALUES ('16', 'MENU_job', '16', null, null, '1');
INSERT INTO `base_authority` VALUES ('17', 'MENU_message', '17', null, null, '1');
INSERT INTO `base_authority` VALUES ('18', 'MENU_notifyHttpLogs', '18', null, null, '1');
INSERT INTO `base_authority` VALUES ('19', 'MENU_schedulerLogs', '19', null, null, '1');
INSERT INTO `base_authority` VALUES ('99', 'API_all', null, '1', null, '1');
INSERT INTO `base_authority` VALUES ('100', 'API_actuator', null, '2', null, '1');
INSERT INTO `base_authority` VALUES ('1131753764884213761', 'API_b6af926a59f609ecb77435c8fdaf6b56', null, '1131753764703858689', null, '1');
INSERT INTO `base_authority` VALUES ('1131753765026820098', 'API_a18f290e608900b65f36ab2ae349914b', null, '1131753764963905538', null, '1');
INSERT INTO `base_authority` VALUES ('1131753765182009346', 'API_f831ec70dd67c92fd321770c5526255b', null, '1131753765098123266', null, '1');
INSERT INTO `base_authority` VALUES ('1131753765324615681', 'API_cc1d1fa06ba1ccc9c40e785ac3abdb08', null, '1131753765249118209', null, '1');
INSERT INTO `base_authority` VALUES ('1131753765458833410', 'API_e71fa6b7ea273c465ba2d4e6b42342ef', null, '1131753765383335937', null, '1');
INSERT INTO `base_authority` VALUES ('1131753765614022657', 'API_288ac721bd5e1ddcc81f01b349f6f29d', null, '1131753765534330882', null, '1');
INSERT INTO `base_authority` VALUES ('1131753768357097474', 'API_aa57d68926e854e557526e6641b088a9', null, '1131753768319348737', null, '1');
INSERT INTO `base_authority` VALUES ('1131753768474537986', 'API_60a997e9c59b9f799a0229b8f06228f5', null, '1131753768428400641', null, '1');
INSERT INTO `base_authority` VALUES ('1131753768596172802', 'API_8949cad9c927e9a0d51154c6b242dd6e', null, '1131753768545841153', null, '1');
INSERT INTO `base_authority` VALUES ('1131753768705224706', 'API_626523fc4cfa1546371424fcd1c8fd83', null, '1131753768654893057', null, '1');
INSERT INTO `base_authority` VALUES ('1131753768814276610', 'API_10da691808307b3fdd7edf67997002f5', null, '1131753768763944961', null, '1');
INSERT INTO `base_authority` VALUES ('1131753768902356993', 'API_61487aeb3aea3f43d40b0874cff540da', null, '1131753768864608257', null, '1');
INSERT INTO `base_authority` VALUES ('1131753770185814018', 'API_dbc243ee2010ee024ba213e06cb26120', null, '1131753770076762113', null, '1');
INSERT INTO `base_authority` VALUES ('1131753770320031746', 'API_e3ea922ac11e53d102ff90c2ccf0f88b', null, '1131753770257117185', null, '1');
INSERT INTO `base_authority` VALUES ('1131753770445860866', 'API_f47b47def7e3c25973540301395703ab', null, '1131753770391334914', null, '1');
INSERT INTO `base_authority` VALUES ('1131753770596855809', 'API_e1841f0d06c5edd5cc1fbe8abbd0d417', null, '1131753770525552642', null, '1');
INSERT INTO `base_authority` VALUES ('1131753770705907714', 'API_c60c104888661e661949943066b7c099', null, '1131753770642993154', null, '1');
INSERT INTO `base_authority` VALUES ('1131753770823348225', 'API_be699d015113939cc8878fc8e6bc62c8', null, '1131753770739462145', null, '1');
INSERT INTO `base_authority` VALUES ('1131753771100172289', 'API_21ac6fd21a606b079e2cd2dc9fe7afbe', null, '1131753770974343170', null, '1');
INSERT INTO `base_authority` VALUES ('1131753771226001410', 'API_39f8253d29561e5359f69265eb82ffef', null, '1131753771188252673', null, '1');
INSERT INTO `base_authority` VALUES ('1131753771397967873', 'API_e82f0960b1c7df6badde9ce40233ed84', null, '1131753771309887489', null, '1');
INSERT INTO `base_authority` VALUES ('1131753771507019778', 'API_d3f26c20f7c8217ac8022ed9520edce1', null, '1131753771465076737', null, '1');
INSERT INTO `base_authority` VALUES ('1131753771607683074', 'API_7b1d4a6dff872477e2c39c5922f13b7a', null, '1131753771561545729', null, '1');
INSERT INTO `base_authority` VALUES ('1131753771712540674', 'API_2834e8f27e7bf5c07635c89b013f23da', null, '1131753771662209025', null, '1');
INSERT INTO `base_authority` VALUES ('1131753772249411585', 'API_48c538d283152d356107f610b02a39b7', null, '1131753772186497026', null, '1');
INSERT INTO `base_authority` VALUES ('1131753772400406529', 'API_af7fd816ea3d699d9032c4195581dfb2', null, '1131753772295548930', null, '1');
INSERT INTO `base_authority` VALUES ('1131753772526235650', 'API_0e63d8939ee749293301fbfc277909cc', null, '1131753772467515393', null, '1');
INSERT INTO `base_authority` VALUES ('1131753772865974274', 'API_077d004d6b5a848b918c76028fa387e5', null, '1131753772752728066', null, '1');
INSERT INTO `base_authority` VALUES ('1131753773331542017', 'API_fa8df5ce1ec8b28f8a842c9c49d370ff', null, '1131753773281210369', null, '1');
INSERT INTO `base_authority` VALUES ('1131753773436399618', 'API_681d209b08e76c154912c731cabafabf', null, '1131753773390262273', null, '1');
INSERT INTO `base_authority` VALUES ('1131753773570617345', 'API_fb7228edbe99276371ddaf2746f6d716', null, '1131753773474148353', null, '1');
INSERT INTO `base_authority` VALUES ('1131753773730000898', 'API_d963a71e1bad2eaf485301d47e0a5215', null, '1131753773570617346', null, '1');
INSERT INTO `base_authority` VALUES ('1131753773834858497', 'API_3f1391d5c775d2b1718045862a931c29', null, '1131753773788721153', null, '1');
INSERT INTO `base_authority` VALUES ('1131753774052962305', 'API_cca3ce66883e435c0e60e44bc741e864', null, '1131753773889384450', null, '1');
INSERT INTO `base_authority` VALUES ('1131753774162014210', 'API_4971aa8994c1ed2144eb641ad1096090', null, '1131753774078128129', null, '1');
INSERT INTO `base_authority` VALUES ('1131753774187180034', 'API_9f7ad288b3ebf970ced6a71b9d85fa67', null, '1131753774187180033', null, '1');
INSERT INTO `base_authority` VALUES ('1131753774426255361', 'API_1cfb2e64efc00a7617801597f267eb91', null, '1131753774300426242', null, '1');
INSERT INTO `base_authority` VALUES ('1131753774552084481', 'API_8682df9dce9d7adb63ca1b77d3826dd7', null, '1131753774426255362', null, '1');
INSERT INTO `base_authority` VALUES ('1131753774770188289', 'API_be28403a54c45e3905ad9c6c0916e1da', null, '1131753774677913601', null, '1');
INSERT INTO `base_authority` VALUES ('1131753774891823105', 'API_e1e7ec806d3e9c07f33edf483cdb76cb', null, '1131753774837297153', null, '1');
INSERT INTO `base_authority` VALUES ('1131753775000875010', 'API_31869c7b439e7c349751b0c5ce1c4de4', null, '1131753774916988929', null, '1');
INSERT INTO `base_authority` VALUES ('1131753775000875012', 'API_2303dbde5b3c3cec8dda9f80f68fa3d7', null, '1131753775000875011', null, '1');
INSERT INTO `base_authority` VALUES ('1131753775181230082', 'API_d10140370336fef356761c81a8c7c74c', null, '1131753775181230081', null, '1');
INSERT INTO `base_authority` VALUES ('1131753775453859842', 'API_e2543401ca47d75d0358f0d6234fe57e', null, '1131753775407722497', null, '1');
INSERT INTO `base_authority` VALUES ('1131753775642603522', 'API_b644167ee8e7da85170a30dc9a5f09a1', null, '1131753775499997186', null, '1');
INSERT INTO `base_authority` VALUES ('1131753775768432642', 'API_1e130c24a36c66f9313c053009dc50dd', null, '1131753775768432641', null, '1');
INSERT INTO `base_authority` VALUES ('1131753776095588354', 'API_d6a688c97f7e1437bc448d3f6561b542', null, '1131753776049451009', null, '1');
INSERT INTO `base_authority` VALUES ('1131753776204640257', 'API_20faad3eed3011b83dc9602bc1d3fd69', null, '1131753776099782658', null, '1');
INSERT INTO `base_authority` VALUES ('1131753776292720641', 'API_57d30595347bab9275adafa21634af94', null, '1131753776254971906', null, '1');
INSERT INTO `base_authority` VALUES ('1131753776527601665', 'API_84feb7e54f71c73dfb113dd91b27fbb4', null, '1131753776515018753', null, '1');
INSERT INTO `base_authority` VALUES ('1131753776657625090', 'API_11750205d4484a03935ae2f4c7a61dd1', null, '1131753776619876353', null, '1');
INSERT INTO `base_authority` VALUES ('1131753776808620034', 'API_cc8005b392809ee0b6d5c5337d792e2a', null, '1131753776749899777', null, '1');
INSERT INTO `base_authority` VALUES ('1131753776917671938', 'API_323b5bc3a887e81ae2c70fbc5e087b1a', null, '1131753776875728897', null, '1');
INSERT INTO `base_authority` VALUES ('1131753777026723841', 'API_bf1a32fd1d94fc9f113d9162bfcb797d', null, '1131753776959614978', null, '1');
INSERT INTO `base_authority` VALUES ('1131753777139970050', 'API_3092aa6004a9c104e6ab18c0c6f37d03', null, '1131753777085444098', null, '1');
INSERT INTO `base_authority` VALUES ('1131753777211273218', 'API_d59556173473fdaef038c9a77baf1e67', null, '1131753777207078913', null, '1');
INSERT INTO `base_authority` VALUES ('1131753777416794113', 'API_fe1588c310eb3ab4276dd93cd76d320b', null, '1131753777366462466', null, '1');
INSERT INTO `base_authority` VALUES ('1131753777517457410', 'API_7d77e48da3e33719125d2cdac5b8cdef', null, '1131753777496485889', null, '1');
INSERT INTO `base_authority` VALUES ('1131813661235679233', 'API_792924d536b1920f337ab4b15cb10f8d', null, '1131813661130821634', null, '1');
INSERT INTO `base_authority` VALUES ('1131813661348925441', 'API_fae2afb6eaa1f2da257f867044fb61bc', null, '1131813661302788097', null, '1');
INSERT INTO `base_authority` VALUES ('1131813661483143169', 'API_9ba9763bce60e01aaa132f87c852882a', null, '1131813661407645698', null, '1');
INSERT INTO `base_authority` VALUES ('1131813661613166594', 'API_05a259a8e811e6d55617173478fbbfa6', null, '1131813661546057730', null, '1');
INSERT INTO `base_authority` VALUES ('1131813661852241922', 'API_64f88e1bc15903ff6d4c981e9b74bcef', null, '1131813661793521666', null, '1');
INSERT INTO `base_authority` VALUES ('1131813663404134402', 'API_67344cb11ead8a6f825eeb6de25e8bf0', null, '1131813663357997057', null, '1');
INSERT INTO `base_authority` VALUES ('1131813663500603394', 'API_cf52045db3a8577e707d024ce7405965', null, '1131813663458660353', null, '1');
INSERT INTO `base_authority` VALUES ('1131813663584489473', 'API_cd98162c79dc076d63bf5abd41d53143', null, '1131813663546740737', null, '1');
INSERT INTO `base_authority` VALUES ('1131813663672569857', 'API_790f832683b99e0747a1ede767ab4c45', null, '1131813663634821121', null, '1');
INSERT INTO `base_authority` VALUES ('1131813663743873026', 'API_7e3e5133cbac4d7c383487296bed0f25', null, '1131813663714512897', null, '1');
INSERT INTO `base_authority` VALUES ('1131813663827759105', 'API_14adcfada9fbf4ab67246074bdd4ef4a', null, '1131813663785816066', null, '1');
INSERT INTO `base_authority` VALUES ('1131813663894867969', 'API_3a3db1f15d5c5dfa510ce8cf7c87b3a0', null, '1131813663861313538', null, '1');
INSERT INTO `base_authority` VALUES ('1131813663953588225', 'API_6d3a403da1e1abd2faa7e84c59cd581a', null, '1131813663928422402', null, '1');
INSERT INTO `base_authority` VALUES ('1131813664033280001', 'API_8ab60f4decd466c3d3bb998cdd204d1c', null, '1131813663999725570', null, '1');
INSERT INTO `base_authority` VALUES ('1131813664125554689', 'API_1de783a470807e679754c7981e42a93a', null, '1131813664087805954', null, '1');
INSERT INTO `base_authority` VALUES ('1131813664213635074', 'API_d1010a1c6d7c4bf1cccd5dd138bf168d', null, '1131813664167497729', null, '1');
INSERT INTO `base_authority` VALUES ('1131813666650525697', 'API_49bc37ec940d91e006216661364b734c', null, '1131813666604388354', null, '1');
INSERT INTO `base_authority` VALUES ('1131813666767966209', 'API_a1e524e366ef7a807cca87b6539f9559', null, '1131813666734411777', null, '1');
INSERT INTO `base_authority` VALUES ('1131813666839269377', 'API_b1c2096ba1c9a726555c37625765e609', null, '1131813666805714945', null, '1');
INSERT INTO `base_authority` VALUES ('1131814107018891265', 'API_138a345ec34756b953c7f588c6a7895e', null, '1131814106985336834', null, '1');
INSERT INTO `base_authority` VALUES ('1131814107111165953', 'API_80dd74b15d7bac80aab0e156a20dda5a', null, '1131814107073417217', null, '1');
INSERT INTO `base_authority` VALUES ('1131814322786471937', 'API_1fc653393797edb57e318e31b50fe059', null, '1131814322761306113', null, '1');
INSERT INTO `base_authority` VALUES ('1131814322866163713', 'API_a219453ae1e1b9799285ccad2588738a', null, '1131814322832609281', null, '1');
INSERT INTO `base_authority` VALUES ('1131814508296343553', 'API_6e5c24c1a8ff0a9b9207b0916cff40cc', null, '1131814508283760641', null, '1');
INSERT INTO `base_authority` VALUES ('1131814508397006849', 'API_2e5b51a23c9521b3bfdc9751f60dfac9', null, '1131814508367646722', null, '1');
INSERT INTO `base_authority` VALUES ('1131814508464115713', 'API_af0b92b06c954d0f98e4caa5d054a7e9', null, '1131814508434755586', null, '1');
INSERT INTO `base_authority` VALUES ('1131814508543807490', 'API_5dbda0d2929072965f60ec359ded3e08', null, '1131814508514447361', null, '1');
INSERT INTO `base_authority` VALUES ('1131814634217738242', 'API_6716535c15e704f5fcde30593ae2d6ab', null, '1131814634179989506', null, '1');
INSERT INTO `base_authority` VALUES ('1131814634293235714', 'API_dc699b32f06f4b75bce208ed216b2a8f', null, '1131814634255486978', null, '1');
INSERT INTO `base_authority` VALUES ('1131814634381316097', 'API_e129e91ce3352883eef91e100e3bca2e', null, '1131814634339373058', null, '1');
INSERT INTO `base_authority` VALUES ('1131814634469396481', 'API_1c7e9c2b0cfe35bffec6d50f32433203', null, '1131814634431647745', null, '1');
INSERT INTO `base_authority` VALUES ('1131814634553282561', 'API_87ac0c6c2ac6efa1aac05c6b42360ec7', null, '1131814634519728130', null, '1');
INSERT INTO `base_authority` VALUES ('1131814634645557249', 'API_ed5eba3360498a68991b5db7055269ac', null, '1131814634612002818', null, '1');
INSERT INTO `base_authority` VALUES ('1131814634746220545', 'API_c33e7d8263643b094764d47b62cc3b69', null, '1131814634674917378', null, '1');
INSERT INTO `base_authority` VALUES ('1131844868619030529', 'API_6b065c01450f93bfd3612e24bc23e529', null, '1131844868564504578', null, '1');
INSERT INTO `base_authority` VALUES ('1131849293509033986', 'ACTION_systemMenuView', null, null, '1131849293404176385', '1');
INSERT INTO `base_authority` VALUES ('1131849510677512193', 'ACTION_systemMenuEdit', null, null, '1131849510572654593', '1');
INSERT INTO `base_authority` VALUES ('1131858946414489602', 'ACTION_systemRoleView', null, null, '1131858946338992129', '1');
INSERT INTO `base_authority` VALUES ('1131863248373690369', 'ACTION_systemRoleEdit', null, null, '1131863248310775809', '1');
INSERT INTO `base_authority` VALUES ('1131863723806437377', 'ACTION_systemAppView', null, null, '1131863723722551297', '1');
INSERT INTO `base_authority` VALUES ('1131863775966801921', 'ACTION_systemAppEdit', null, null, '1131863775899693057', '1');
INSERT INTO `base_authority` VALUES ('1131864400590942210', 'ACTION_systemUserView', null, null, '1131864400507056130', '1');
INSERT INTO `base_authority` VALUES ('1131864444954095617', 'ACTION_systemUserEdit', null, null, '1131864444878598146', '1');
INSERT INTO `base_authority` VALUES ('1131864827327819778', 'ACTION_gatewayIpLimitView', null, null, '1131864827252322305', '1');
INSERT INTO `base_authority` VALUES ('1131864864325775361', 'ACTION_gatewayIpLimitEdit', null, null, '1131864864267055106', '1');
INSERT INTO `base_authority` VALUES ('1131865040381685761', 'ACTION_gatewayRouteView', null, null, '1131865040289411074', '1');
INSERT INTO `base_authority` VALUES ('1131865075697725442', 'ACTION_gatewayRouteEdit', null, null, '1131865075609645057', '1');
INSERT INTO `base_authority` VALUES ('1131865482390024193', 'ACTION_systemApiView', null, null, '1131865482314526722', '1');
INSERT INTO `base_authority` VALUES ('1131865520809848834', 'ACTION_systemApiEdit', null, null, '1131865520738545666', '1');
INSERT INTO `base_authority` VALUES ('1131865773000765441', 'ACTION_gatewayLogsView', null, null, '1131865772929462274', '1');
INSERT INTO `base_authority` VALUES ('1131865931214106626', 'ACTION_gatewayRateLimitView', null, null, '1131865931146997761', '1');
INSERT INTO `base_authority` VALUES ('1131865974771953666', 'ACTION_gatewayRateLimitEdit', null, null, '1131865974704844802', '1');
INSERT INTO `base_authority` VALUES ('1131866278280179714', 'ACTION_jobView', null, null, '1131866278187905026', '1');
INSERT INTO `base_authority` VALUES ('1131866310676983810', 'ACTION_jobEdit', null, null, '1131866310622457857', '1');
INSERT INTO `base_authority` VALUES ('1131866943534542850', 'ACTION_schedulerLogsView', null, null, '1131866943459045377', '1');
INSERT INTO `base_authority` VALUES ('1131867094550458369', 'ACTION_notifyHttpLogsView', null, null, '1131867094479155202', '1');
INSERT INTO `base_authority` VALUES ('1131995510689820674', 'API_14a804e4b6f9ba7073e79805707eecd4', null, '1131995510647877634', null, '1');
INSERT INTO `base_authority` VALUES ('1131995510920507393', 'API_ff70d549a014d5b621c1549f50167878', null, '1131995510891147265', null, '1');
INSERT INTO `base_authority` VALUES ('1131995511218302977', 'API_6438ad073246a84eab34973c7fcda5e8', null, '1131995511193137154', null, '1');
INSERT INTO `base_authority` VALUES ('1131995511415435265', 'API_a4ddc86cd00924d6760a03dd7f92efd9', null, '1131995511398658049', null, '1');
INSERT INTO `base_authority` VALUES ('1132203893170671617', 'API_ca06d0facc77097870ac1132a1392692', null, '1132203893132922881', null, '1');
INSERT INTO `base_authority` VALUES ('1132203893384581121', 'API_5254c25e4c552b9f902cee830713f1a6', null, '1132203893351026690', null, '1');
INSERT INTO `base_authority` VALUES ('1132203893577519106', 'API_b45f0f0e70958257b9cd70d4ec65f1b9', null, '1132203893539770370', null, '1');
INSERT INTO `base_authority` VALUES ('1132203893766262786', 'API_70ce59edc96d0aff695a627c5476c05a', null, '1132203893732708354', null, '1');
INSERT INTO `base_authority` VALUES ('1132203893955006465', 'API_7a5f06bafc903c1beaee9d4969c0ccfb', null, '1132203893929840641', null, '1');
INSERT INTO `base_authority` VALUES ('1132203894261190657', 'API_6efe9bc25c0b1070631be04c9b748741', null, '1132203894231830530', null, '1');
INSERT INTO `base_authority` VALUES ('1132203894466711553', 'API_a83953d1867e8e5c123f3d1efd52c578', null, '1132203894433157122', null, '1');
INSERT INTO `base_authority` VALUES ('1132203894659649538', 'API_3e748de8b6a3aacbfcc3079a7d02e199', null, '1132203894621900802', null, '1');

-- ----------------------------
-- Table structure for base_authority_action
-- ----------------------------
DROP TABLE IF EXISTS `base_authority_action`;
CREATE TABLE `base_authority_action` (
  `action_id` bigint(20) NOT NULL COMMENT '操作ID',
  `authority_id` bigint(20) NOT NULL COMMENT 'API',
  KEY `action_id` (`action_id`) USING BTREE,
  KEY `authority_id` (`authority_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统权限-功能操作关联表';

-- ----------------------------
-- Records of base_authority_action
-- ----------------------------
INSERT INTO `base_authority_action` VALUES ('1131863248310775809', '1131753770705907714');
INSERT INTO `base_authority_action` VALUES ('1131863248310775809', '1131753770823348225');
INSERT INTO `base_authority_action` VALUES ('1131863248310775809', '1131753771100172289');
INSERT INTO `base_authority_action` VALUES ('1131863248310775809', '1131753771226001410');
INSERT INTO `base_authority_action` VALUES ('1131863248310775809', '1131813664213635074');
INSERT INTO `base_authority_action` VALUES ('1131863723722551297', '1131813663404134402');
INSERT INTO `base_authority_action` VALUES ('1131863775899693057', '1131813663953588225');
INSERT INTO `base_authority_action` VALUES ('1131864444878598146', '1131813663827759105');
INSERT INTO `base_authority_action` VALUES ('1131864444878598146', '1131753772400406529');
INSERT INTO `base_authority_action` VALUES ('1131864444878598146', '1131753772249411585');
INSERT INTO `base_authority_action` VALUES ('1131864444878598146', '1131753771507019778');
INSERT INTO `base_authority_action` VALUES ('1131864444878598146', '1131753771607683074');
INSERT INTO `base_authority_action` VALUES ('1131864827252322305', '1131753775453859842');
INSERT INTO `base_authority_action` VALUES ('1131864827252322305', '1131753774891823105');
INSERT INTO `base_authority_action` VALUES ('1131864827252322305', '1131753775000875010');
INSERT INTO `base_authority_action` VALUES ('1131864864267055106', '1131753775768432642');
INSERT INTO `base_authority_action` VALUES ('1131864864267055106', '1131753775642603522');
INSERT INTO `base_authority_action` VALUES ('1131864864267055106', '1131753775181230082');
INSERT INTO `base_authority_action` VALUES ('1131864864267055106', '1131753775000875012');
INSERT INTO `base_authority_action` VALUES ('1131865040289411074', '1131753777139970050');
INSERT INTO `base_authority_action` VALUES ('1131865040289411074', '1131753777026723841');
INSERT INTO `base_authority_action` VALUES ('1131865040289411074', '1131753774552084481');
INSERT INTO `base_authority_action` VALUES ('1131865075609645057', '1131753777211273218');
INSERT INTO `base_authority_action` VALUES ('1131865075609645057', '1131753777416794113');
INSERT INTO `base_authority_action` VALUES ('1131865075609645057', '1131753777517457410');
INSERT INTO `base_authority_action` VALUES ('1131865520738545666', '1131753764884213761');
INSERT INTO `base_authority_action` VALUES ('1131865520738545666', '1131753765026820098');
INSERT INTO `base_authority_action` VALUES ('1131865520738545666', '1131753765614022657');
INSERT INTO `base_authority_action` VALUES ('1131865772929462274', '1131753774162014210');
INSERT INTO `base_authority_action` VALUES ('1131865931146997761', '1131753774187180034');
INSERT INTO `base_authority_action` VALUES ('1131865931146997761', '1131753776095588354');
INSERT INTO `base_authority_action` VALUES ('1131865931146997761', '1131753776204640257');
INSERT INTO `base_authority_action` VALUES ('1131865931146997761', '1131753776292720641');
INSERT INTO `base_authority_action` VALUES ('1131865974704844802', '1131753776527601665');
INSERT INTO `base_authority_action` VALUES ('1131865974704844802', '1131753776657625090');
INSERT INTO `base_authority_action` VALUES ('1131865974704844802', '1131753776808620034');
INSERT INTO `base_authority_action` VALUES ('1131865974704844802', '1131753776917671938');
INSERT INTO `base_authority_action` VALUES ('1131866278187905026', '1131814634553282561');
INSERT INTO `base_authority_action` VALUES ('1131866278187905026', '1131814634746220545');
INSERT INTO `base_authority_action` VALUES ('1131866310622457857', '1131814634217738242');
INSERT INTO `base_authority_action` VALUES ('1131866310622457857', '1131814634293235714');
INSERT INTO `base_authority_action` VALUES ('1131866310622457857', '1131814634381316097');
INSERT INTO `base_authority_action` VALUES ('1131866310622457857', '1131814634469396481');
INSERT INTO `base_authority_action` VALUES ('1131866310622457857', '1131814634645557249');
INSERT INTO `base_authority_action` VALUES ('1131866943459045377', '1131814634553282561');
INSERT INTO `base_authority_action` VALUES ('1131867094479155202', '1131814508397006849');
INSERT INTO `base_authority_action` VALUES ('1131849510572654593', '1131813661348925441');
INSERT INTO `base_authority_action` VALUES ('1131849510572654593', '1131813661483143169');
INSERT INTO `base_authority_action` VALUES ('1131849510572654593', '1131813661613166594');
INSERT INTO `base_authority_action` VALUES ('1131849510572654593', '1131813663500603394');
INSERT INTO `base_authority_action` VALUES ('1131849510572654593', '1131813663894867969');
INSERT INTO `base_authority_action` VALUES ('1131849510572654593', '1131813664033280001');
INSERT INTO `base_authority_action` VALUES ('1131849510572654593', '1131753768357097474');
INSERT INTO `base_authority_action` VALUES ('1131849510572654593', '1131753768474537986');
INSERT INTO `base_authority_action` VALUES ('1131849510572654593', '1131753768705224706');
INSERT INTO `base_authority_action` VALUES ('1131849293404176385', '1131813661852241922');
INSERT INTO `base_authority_action` VALUES ('1131849293404176385', '1131813663894867969');
INSERT INTO `base_authority_action` VALUES ('1131849293404176385', '1131813661235679233');
INSERT INTO `base_authority_action` VALUES ('1131849293404176385', '1131753768596172802');
INSERT INTO `base_authority_action` VALUES ('1131849293404176385', '1131753768814276610');
INSERT INTO `base_authority_action` VALUES ('1131849293404176385', '1131844868619030529');
INSERT INTO `base_authority_action` VALUES ('1131865482314526722', '1131995510689820674');
INSERT INTO `base_authority_action` VALUES ('1131865482314526722', '1131753765458833410');
INSERT INTO `base_authority_action` VALUES ('1131865482314526722', '1131753765324615681');
INSERT INTO `base_authority_action` VALUES ('1131865482314526722', '1131753765182009346');
INSERT INTO `base_authority_action` VALUES ('1131858946338992129', '1131813663743873026');
INSERT INTO `base_authority_action` VALUES ('1131858946338992129', '1131813663672569857');
INSERT INTO `base_authority_action` VALUES ('1131858946338992129', '1131753770320031746');
INSERT INTO `base_authority_action` VALUES ('1131858946338992129', '1131753770445860866');
INSERT INTO `base_authority_action` VALUES ('1131858946338992129', '1131753770185814018');
INSERT INTO `base_authority_action` VALUES ('1131858946338992129', '1131753770596855809');
INSERT INTO `base_authority_action` VALUES ('1131864400507056130', '1131813663584489473');
INSERT INTO `base_authority_action` VALUES ('1131864400507056130', '1131753771397967873');
INSERT INTO `base_authority_action` VALUES ('1131864400507056130', '1131753771712540674');
INSERT INTO `base_authority_action` VALUES ('1131864400507056130', '1131753772865974274');
INSERT INTO `base_authority_action` VALUES ('1131864400507056130', '1131753772526235650');
INSERT INTO `base_authority_action` VALUES ('1131863723722551297', '1132203893955006465');
INSERT INTO `base_authority_action` VALUES ('1131863723722551297', '1132203893384581121');
INSERT INTO `base_authority_action` VALUES ('1131863723722551297', '1132203893577519106');
INSERT INTO `base_authority_action` VALUES ('1131863723722551297', '1131813663404134402');

-- ----------------------------
-- Table structure for base_authority_app
-- ----------------------------
DROP TABLE IF EXISTS `base_authority_app`;
CREATE TABLE `base_authority_app` (
  `authority_id` bigint(50) NOT NULL COMMENT '权限ID',
  `app_id` varchar(100) NOT NULL COMMENT '应用ID',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间:null表示长期',
  KEY `authority_id` (`authority_id`) USING BTREE,
  KEY `app_id` (`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统权限-应用关联';

-- ----------------------------
-- Records of base_authority_app
-- ----------------------------
INSERT INTO `base_authority_app` VALUES ('1131814107018891265', '1553588629729', null);
INSERT INTO `base_authority_app` VALUES ('1553588629729', '1553588629729', null);
INSERT INTO `base_authority_app` VALUES ('1558768969811', '1558768969811', null);

-- ----------------------------
-- Table structure for base_authority_role
-- ----------------------------
DROP TABLE IF EXISTS `base_authority_role`;
CREATE TABLE `base_authority_role` (
  `authority_id` bigint(20) NOT NULL COMMENT '权限ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间:null表示长期',
  KEY `authority_id` (`authority_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统权限-角色关联';

-- ----------------------------
-- Records of base_authority_role
-- ----------------------------
INSERT INTO `base_authority_role` VALUES ('3', '3', null);
INSERT INTO `base_authority_role` VALUES ('5', '3', null);
INSERT INTO `base_authority_role` VALUES ('10', '3', null);
INSERT INTO `base_authority_role` VALUES ('11', '3', null);
INSERT INTO `base_authority_role` VALUES ('12', '3', null);
INSERT INTO `base_authority_role` VALUES ('1', '1', null);
INSERT INTO `base_authority_role` VALUES ('3', '1', null);
INSERT INTO `base_authority_role` VALUES ('8', '1', null);
INSERT INTO `base_authority_role` VALUES ('9', '1', null);
INSERT INTO `base_authority_role` VALUES ('10', '1', null);
INSERT INTO `base_authority_role` VALUES ('13', '1', null);
INSERT INTO `base_authority_role` VALUES ('2', '1', null);
INSERT INTO `base_authority_role` VALUES ('5', '1', null);
INSERT INTO `base_authority_role` VALUES ('6', '1', null);
INSERT INTO `base_authority_role` VALUES ('11', '1', null);
INSERT INTO `base_authority_role` VALUES ('12', '1', null);
INSERT INTO `base_authority_role` VALUES ('14', '1', null);
INSERT INTO `base_authority_role` VALUES ('15', '1', null);
INSERT INTO `base_authority_role` VALUES ('16', '1', null);
INSERT INTO `base_authority_role` VALUES ('19', '1', null);
INSERT INTO `base_authority_role` VALUES ('17', '1', null);
INSERT INTO `base_authority_role` VALUES ('18', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131865482390024193', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131865040381685761', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131865075697725442', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131865520809848834', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131864827327819778', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131864864325775361', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131863723806437377', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131864444954095617', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131863775966801921', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131864400590942210', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131858946414489602', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131863248373690369', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131865773000765441', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131865931214106626', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131865974771953666', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131866278280179714', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131866310676983810', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131866943534542850', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131867094550458369', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131849293509033986', '1', null);
INSERT INTO `base_authority_role` VALUES ('1131849510677512193', '1', null);
INSERT INTO `base_authority_role` VALUES ('1', '2', null);
INSERT INTO `base_authority_role` VALUES ('3', '2', null);
INSERT INTO `base_authority_role` VALUES ('8', '2', null);
INSERT INTO `base_authority_role` VALUES ('9', '2', null);
INSERT INTO `base_authority_role` VALUES ('10', '2', null);
INSERT INTO `base_authority_role` VALUES ('1131849293509033986', '2', null);
INSERT INTO `base_authority_role` VALUES ('1131858946414489602', '2', null);
INSERT INTO `base_authority_role` VALUES ('1131863723806437377', '2', null);
INSERT INTO `base_authority_role` VALUES ('1131864400590942210', '2', null);

-- ----------------------------
-- Table structure for base_authority_user
-- ----------------------------
DROP TABLE IF EXISTS `base_authority_user`;
CREATE TABLE `base_authority_user` (
  `authority_id` bigint(20) NOT NULL COMMENT '权限ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  KEY `authority_id` (`authority_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统权限-用户关联';

-- ----------------------------
-- Records of base_authority_user
-- ----------------------------

-- ----------------------------
-- Table structure for base_menu
-- ----------------------------
DROP TABLE IF EXISTS `base_menu`;
CREATE TABLE `base_menu` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单Id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级菜单',
  `menu_code` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '菜单编码',
  `menu_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `menu_desc` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `scheme` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '路径前缀',
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求路径',
  `icon` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '菜单标题',
  `target` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '_self' COMMENT '打开方式:_self窗口内,_blank新窗口',
  `priority` bigint(20) NOT NULL DEFAULT '0' COMMENT '优先级 越小越靠前',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态:0-无效 1-有效',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_persist` tinyint(3) NOT NULL DEFAULT '0' COMMENT '保留数据0-否 1-是 不允许删除',
  `service_id` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '服务名',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_code` (`menu_code`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='系统资源-菜单信息';

-- ----------------------------
-- Records of base_menu
-- ----------------------------
INSERT INTO `base_menu` VALUES ('1', '0', 'system', '系统管理', '系统管理', '/', '', 'md-folder', '_self', '1', '1', '2018-07-29 21:20:10', '2019-05-25 01:49:23', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('2', '13', 'gatewayIpLimit', 'IP/域名控制', 'IP、域名来源访问控制,白名单、黑名单', '/', 'gateway/ip-limit/index', 'md-document', '_self', '1', '1', '2018-07-29 21:20:13', '2019-03-13 21:48:21', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('3', '1', 'systemMenu', '菜单资源', '菜单资源', '/', 'system/menus/index', 'md-list', '_self', '3', '1', '2018-07-29 21:20:13', '2019-05-25 02:24:36', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('5', '13', 'gatewayRoute', '智能路由', '动态路由', '/', 'gateway/route/index', 'md-document', '_self', '5', '1', '2018-07-29 21:20:13', '2019-02-25 00:15:23', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('6', '13', 'systemApi', 'API列表', 'API接口资源', '/', 'system/api/index', 'md-document', '_self', '0', '1', '2018-07-29 21:20:13', '2019-03-13 21:48:12', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('8', '1', 'systemRole', '角色信息', '角色信息', '/', 'system/role/index', 'md-people', '_self', '8', '1', '2018-12-27 15:26:54', '2019-05-25 02:23:16', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('9', '1', 'systemApp', '应用信息', '应用信息', '/', 'system/app/index', 'md-apps', '_self', '0', '1', '2018-12-27 15:41:52', '2019-05-25 15:19:14', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('10', '1', 'systemUser', '系统用户', '系统用户', '/', 'system/user/index', 'md-person', '_self', '0', '1', '2018-12-27 15:46:29', '2019-03-18 04:40:07', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('11', '13', 'apiDebug', '接口调试', 'swagger接口调试', 'http://', 'localhost:8888', 'md-document', '_blank', '0', '1', '2019-01-10 20:47:19', '2019-05-25 03:26:47', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('12', '13', 'gatewayLogs', '访问日志', '', '/', 'gateway/logs/index', 'md-document', '_self', '0', '1', '2019-01-28 02:37:42', '2019-02-25 00:16:40', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('13', '0', 'gateway', 'API网关', 'API网关', '/', '', 'md-folder', '_self', '0', '1', '2019-02-25 00:15:09', '2019-03-18 04:44:20', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('14', '13', 'gatewayRateLimit', '流量控制', 'API限流', '/', 'gateway/rate-limit/index', 'md-document', '_self', '666', '1', '2019-03-13 21:47:20', '2019-03-13 22:13:10', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('15', '0', 'scheduler', '任务调度', '任务调度', '/', '', 'md-document', '_self', '0', '1', '2019-04-01 16:30:27', '2019-04-01 16:30:27', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('16', '15', 'job', '定时任务', '定时任务列表', '/', 'scheduler/job/index', 'md-document', '_self', '0', '1', '2019-04-01 16:31:15', '2019-05-25 03:23:09', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('17', '0', 'message', '消息管理', '消息管理', '/', '', 'md-document', '_self', '0', '1', '2019-04-04 16:37:23', '2019-04-04 16:37:23', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('18', '17', 'notifyHttpLogs', '通知日志', '通知日志', '/', 'msg/http-logs/index', 'md-document', '_self', '0', '1', '2019-04-04 16:38:21', '2019-04-04 16:39:32', '1', 'opencloud-base-provider');
INSERT INTO `base_menu` VALUES ('19', '15', 'schedulerLogs', '调度日志', '调度日志', '/', 'scheduler/logs/index', 'md-document', '_self', '0', '1', '2019-05-24 18:17:49', '2019-05-24 18:17:49', '1', 'opencloud-base-provider');

-- ----------------------------
-- Table structure for base_role
-- ----------------------------
DROP TABLE IF EXISTS `base_role`;
CREATE TABLE `base_role` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `role_code` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色编码',
  `role_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '角色名称',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态:0-无效 1-有效',
  `role_desc` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '角色描述',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_persist` tinyint(3) NOT NULL DEFAULT '0' COMMENT '保留数据0-否 1-是 不允许删除',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='系统角色-基础信息';

-- ----------------------------
-- Records of base_role
-- ----------------------------
INSERT INTO `base_role` VALUES ('1', 'admin', '系统管理员', '1', '系统管理员', '2018-07-29 21:14:54', '2019-05-25 03:06:57', '1');
INSERT INTO `base_role` VALUES ('2', 'operator', '运营人员', '1', '运营人员', '2018-07-29 21:14:54', '2019-05-25 15:14:56', '1');
INSERT INTO `base_role` VALUES ('3', 'support', '客服', '1', '客服', '2018-07-29 21:14:54', '2019-05-25 15:17:07', '1');

-- ----------------------------
-- Table structure for base_role_user
-- ----------------------------
DROP TABLE IF EXISTS `base_role_user`;
CREATE TABLE `base_role_user` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  KEY `fk_user` (`user_id`) USING BTREE,
  KEY `fk_role` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='系统角色-用户关联';

-- ----------------------------
-- Records of base_role_user
-- ----------------------------
INSERT INTO `base_role_user` VALUES ('521677655146233856', '1');
INSERT INTO `base_role_user` VALUES ('557063237640650752', '2');

-- ----------------------------
-- Table structure for base_tentant
-- ----------------------------
DROP TABLE IF EXISTS `base_tentant`;
CREATE TABLE `base_tentant` (
  `tentant_id` bigint(20) NOT NULL COMMENT '租户ID',
  `tentant_name` varchar(100) NOT NULL COMMENT '租户名称',
  `tentant_desc` varchar(255) NOT NULL COMMENT '租户描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`tentant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租户信息表';

-- ----------------------------
-- Records of base_tentant
-- ----------------------------

-- ----------------------------
-- Table structure for base_tentant_modules
-- ----------------------------
DROP TABLE IF EXISTS `base_tentant_modules`;
CREATE TABLE `base_tentant_modules` (
  `module_id` bigint(20) NOT NULL COMMENT '模块ID',
  `tentant_id` bigint(20) NOT NULL COMMENT '租户ID',
  `service_id` varchar(100) NOT NULL COMMENT '服务名称',
  `module_desc` varchar(255) NOT NULL COMMENT '模块描述',
  `is_persist` tinyint(3) NOT NULL DEFAULT '0' COMMENT '保留数据0-否 1-是 不允许删除',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租户模块';

-- ----------------------------
-- Records of base_tentant_modules
-- ----------------------------

-- ----------------------------
-- Table structure for base_user
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '登陆账号',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号',
  `user_type` varchar(20) DEFAULT 'platform' COMMENT '用户类型:platform-平台 isp-服务提供商 dev-自研开发者',
  `company_id` bigint(20) DEFAULT NULL COMMENT '企业ID',
  `register_ip` varchar(100) DEFAULT NULL COMMENT '注册IP',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态:0-禁用 1-启用 2-锁定',
  `user_desc` varchar(255) DEFAULT '' COMMENT '描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户-基础信息';

-- ----------------------------
-- Records of base_user
-- ----------------------------
INSERT INTO `base_user` VALUES ('521677655146233856', 'admin', '超级管理员', '', '515608851@qq.com', '18518226890', 'platform', null, null, '2018-12-10 13:20:45', '1', '2222222222', '2018-12-10 13:20:45', '2018-12-10 13:20:45');
INSERT INTO `base_user` VALUES ('557063237640650752', 'test', '测试用户', '', '', '', 'platform', null, null, '2019-03-18 04:50:25', '1', '', '2019-03-18 04:50:25', '2019-03-18 04:50:25');

-- ----------------------------
-- Table structure for base_user_account
-- ----------------------------
DROP TABLE IF EXISTS `base_user_account`;
CREATE TABLE `base_user_account` (
  `account_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户Id',
  `account` varchar(255) DEFAULT NULL COMMENT '标识：手机号、邮箱、 用户名、或第三方应用的唯一标识',
  `password` varchar(255) DEFAULT NULL COMMENT '密码凭证：站内的保存密码、站外的不保存或保存token）',
  `account_type` varchar(255) DEFAULT NULL COMMENT '登录类型:password-密码、mobile-手机号、email-邮箱、weixin-微信、weibo-微博、qq-等等',
  `nick_name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户-登录账号';

-- ----------------------------
-- Records of base_user_account
-- ----------------------------
INSERT INTO `base_user_account` VALUES ('521677655368531968', '521677655146233856', 'admin', '$2a$10$A7EHximvrsa4ESX1uSlkJupbg2PLO2StzDzy67NX4YV25MxmbGvXu', 'username', null, null);
INSERT INTO `base_user_account` VALUES ('557063237787451392', '557063237640650752', 'test', '$2a$10$SdqHS7Y8VcrR0WfCf9FI3uhcUfYKu58per0fVJLW.iPOBt.bFYp0y', 'username', null, null);

-- ----------------------------
-- Table structure for base_user_account_logs
-- ----------------------------
DROP TABLE IF EXISTS `base_user_account_logs`;
CREATE TABLE `base_user_account_logs` (
  `id` bigint(20) NOT NULL,
  `login_time` datetime NOT NULL,
  `login_ip` varchar(255) NOT NULL COMMENT '登录Ip',
  `login_agent` varchar(500) NOT NULL COMMENT '登录设备',
  `login_nums` int(11) NOT NULL COMMENT '登录次数',
  `user_id` bigint(20) NOT NULL,
  `account` varchar(100) NOT NULL,
  `account_type` varchar(50) NOT NULL,
  `account_id` bigint(20) NOT NULL COMMENT '账号ID',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户-登录日志';

-- ----------------------------
-- Records of base_user_account_logs
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
