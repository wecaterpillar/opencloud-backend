INSERT INTO `gateway_route` (`route_id`, `route_name`, `path`, `service_id`, `url`, `strip_prefix`, `retryable`, `status`, `is_persist`, `route_desc`) VALUES ('1152136796736503810', 'open-cloud-generator-server', '/code/**', 'open-cloud-generator-server', '', '0', '0', '1', '0', '在线代码生成服务器');

INSERT INTO `base_menu` (`menu_id`, `parent_id`, `menu_code`, `menu_name`, `menu_desc`, `scheme`, `path`, `icon`, `target`, `priority`, `status`, `create_time`, `update_time`, `is_persist`, `service_id`) VALUES ('1152141296369057794', '1', 'Generate', '在线代码生成', '在线代码生成', '/', 'system/generate/index', 'md-document', '_self', '0', '1', '2019-07-19 17:01:05', '2019-07-19 17:02:00', '0', 'open-cloud-base-server');
INSERT INTO `base_action` (`action_id`, `action_code`, `action_name`, `action_desc`, `menu_id`, `priority`, `status`, `create_time`, `update_time`, `is_persist`, `service_id`) VALUES ('1152234326254051329', 'GenerateCode', '生成代码', '', '1152141296369057794', '0', '1', '2019-07-19 23:10:46', '2019-07-19 23:10:54', '0', 'open-cloud-base-server');

INSERT INTO `base_authority` (`authority_id`, `authority`, `menu_id`, `api_id`, `action_id`, `status`) VALUES ('1152234326304382978', 'ACTION_GenerateCode', NULL, NULL, '1152234326254051329', '1');
INSERT INTO `base_authority` (`authority_id`, `authority`, `menu_id`, `api_id`, `action_id`, `status`) VALUES ('1152178600261345283', 'API_3aa841faf9555511bc13343604a1650e', NULL, '1152178600261345282', NULL, '1');
INSERT INTO `base_authority` (`authority_id`, `authority`, `menu_id`, `api_id`, `action_id`, `status`) VALUES ('1152178600135516161', 'API_5ac410fe41d6c2724d8e3699cedc5910', NULL, '1152178600114544642', NULL, '1');
INSERT INTO `base_authority` (`authority_id`, `authority`, `menu_id`, `api_id`, `action_id`, `status`) VALUES ('1152178600009687041', 'API_5c31730e77da418ca94ff86db501082f', NULL, '1152178599980326914', NULL, '1');
INSERT INTO `base_authority` (`authority_id`, `authority`, `menu_id`, `api_id`, `action_id`, `status`) VALUES ('1152178599909023745', 'API_427dc304c3d55a3c57dc339c71fd4882', NULL, '1152178599858692098', NULL, '1');
INSERT INTO `base_authority` (`authority_id`, `authority`, `menu_id`, `api_id`, `action_id`, `status`) VALUES ('1152178599447650305', 'API_95bd5bd6f5f9ed45b6b599789c9fb26a', NULL, '1152178599376347137', NULL, '1');
INSERT INTO `base_authority` (`authority_id`, `authority`, `menu_id`, `api_id`, `action_id`, `status`) VALUES ('1152170970088366081', 'API_28dad1ff11fd48f710632425c8d59bd1', NULL, '1152170970012868611', NULL, '1');
INSERT INTO `base_authority` (`authority_id`, `authority`, `menu_id`, `api_id`, `action_id`, `status`) VALUES ('1152141296406806529', 'MENU_Generate', '1152141296369057794', NULL, NULL, '1');

INSERT INTO `base_authority_action` (`action_id`, `authority_id`) VALUES ('1152234326254051329', '1152178599447650305');
INSERT INTO `base_authority_action` (`action_id`, `authority_id`) VALUES ('1152234326254051329', '1152170970088366081');
INSERT INTO `base_authority_action` (`action_id`, `authority_id`) VALUES ('1152234326254051329', '1152138203942273026');
INSERT INTO `base_authority_action` (`action_id`, `authority_id`) VALUES ('1131864444878598146', '1131753771607683074');
