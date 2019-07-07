/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : open-platform

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-03-18 04:59:40
*/



-- ----------------------------
-- Table structure for gateway_access_logs
-- ----------------------------
-- Create table
create sequence gateway_access_logs_seq;
create table gateway_access_logs
(
  access_id      number(20) not null,
  path           varchar2(255),
  params         clob,
  headers        clob,
  ip             varchar2(500),
  http_status    varchar2(100),
  method         varchar2(50),
  request_time   timestamp,
  response_time  timestamp,
  use_time       number(20),
  user_agent     varchar2(255),
  region         varchar2(255),
  authentication clob,
  server_ip      varchar2(255),
  service_id     varchar2(100),
  error          varchar2(255)
)
;
-- Add comments to the table
comment on table gateway_access_logs
  is '开放网关-访问日志';
-- Add comments to the columns
comment on column gateway_access_logs.access_id
  is '访问ID';
comment on column gateway_access_logs.path
  is '访问路径';
comment on column gateway_access_logs.params
  is '请求数据';
comment on column gateway_access_logs.headers
  is '请求头';
comment on column gateway_access_logs.ip
  is '请求IP';
comment on column gateway_access_logs.http_status
  is '响应状态';
comment on column gateway_access_logs.request_time
  is '访问时间';
comment on column gateway_access_logs.region
  is '区域';
comment on column gateway_access_logs.authentication
  is '认证信息';
comment on column gateway_access_logs.server_ip
  is '服务器IP';
comment on column gateway_access_logs.service_id
  is '服务名';
comment on column gateway_access_logs.error
  is '错误信息';
-- Create/Recreate primary, unique and foreign key constraints
alter table gateway_access_logs
  add constraint pk_gateway_access_logs_id primary key (ACCESS_ID);



-- ----------------------------
-- Records of gateway_access_logs
-- ----------------------------

-- ----------------------------
-- Table structure for gateway_ip_limit
-- ----------------------------
-- Create table
create sequence gateway_ip_limit_seq;
create table gateway_ip_limit
(
  policy_id   number(18) not null,
  policy_name varchar2(100) not null,
  policy_type number(3) default 1 not null,
  create_time timestamp not null,
  update_time timestamp not null,
  ip_address  varchar2(255) not null
);
-- Add comments to the table
comment on table gateway_ip_limit
  is '开放网关-IP/域名控制-策略';
comment on column gateway_ip_limit.policy_id
  is '策略ID';
comment on column gateway_ip_limit.policy_name
  is '策略名称';
comment on column gateway_ip_limit.policy_type
  is '策略类型';
comment on column gateway_ip_limit.create_time
  is '创建时间';
comment on column gateway_ip_limit.update_time
  is '最近一次修改时间';
comment on column gateway_ip_limit.ip_address
  is 'ip地址/IP段:多个用隔开;最多10个;';

-- Create/Recreate primary, unique and foreign key constraints
alter table gateway_ip_limit
  add constraint pk_gateway_ip_limit_pid primary key (POLICY_ID);

-- ----------------------------
-- Records of gateway_ip_limit
-- ----------------------------

-- ----------------------------
-- Table structure for gateway_ip_limit_api
-- ----------------------------
-- Create table
create table gateway_ip_limit_api
(
  policy_id number(20),
  api_id    number(20)
)
;
-- Add comments to the table
comment on table gateway_ip_limit_api
  is '开放网关-IP/域名控制-API接口';
-- Add comments to the columns
comment on column gateway_ip_limit_api.policy_id
  is '策略ID';
comment on column gateway_ip_limit_api.api_id
  is '接口资源ID';
-- Create/Recreate indexes
create index idx_ip_limit_policy_id on gateway_ip_limit_api (policy_id);
create index idx_ip_limit_api_id on gateway_ip_limit_api (api_id);

-- ----------------------------
-- Records of gateway_ip_limit_api
-- ----------------------------

-- ----------------------------
-- Table structure for gateway_rate_limit
-- ----------------------------
-- Create table
create sequence gateway_rate_limit_seq;
create table gateway_rate_limit
(
  policy_id     number(18) not null,
  policy_name   varchar2(255),
  limit_quota   number(20) not null,
  interval_unit varchar2(10) default 'seconds',
  policy_type    varchar2(255),
  create_time   timestamp not null,
  update_time   timestamp not null
)
;
-- Add comments to the table
comment on table gateway_rate_limit
  is '开放网关-流量控制-策略';
comment on column gateway_rate_limit.limit_quota
  is '流量限制';
comment on column gateway_rate_limit.interval_unit
  is '单位时间:seconds-秒,minutes-分钟,hours-小时,days-天';
comment on column gateway_rate_limit.policy_type
  is '限流规则类型';
-- Create/Recreate primary, unique and foreign key constraints
alter table gateway_rate_limit
  add constraint PK_RATE_LIMIT_POLICY_ID primary key (POLICY_ID);


-- Create table
create table gateway_rate_limit_api
(
  policy_id number(11) default 0 not null,
  api_id    number(11) not null
)
;
-- Add comments to the table
comment on table gateway_rate_limit_api
  is '开放网关-流量控制-API接口';
-- Add comments to the columns
comment on column gateway_rate_limit_api.policy_id
  is '限制数量';
comment on column gateway_rate_limit_api.api_id
  is '时间间隔(秒)';
-- Create/Recreate indexes
create index idx_rate_limit_api_policy on gateway_rate_limit_api (policy_id);
create index idx_rate_limit_api_id on gateway_rate_limit_api (api_id);
-- Create/Recreate primary, unique and foreign key constraints
alter table gateway_rate_limit_api
  add constraint gateway_rate_limit_api_ibfk_1 foreign key (POLICY_ID)
  references gateway_rate_limit (POLICY_ID);
alter table gateway_rate_limit_api
  add constraint gateway_rate_limit_api_ibfk_2 foreign key (API_ID)
  references base_resource_api (API_ID);

-- ----------------------------
-- Table structure for gateway_route
-- ----------------------------
create sequence gateway_route_seq;
create table gateway_route
(
  route_id     number(18) not null,
  route_name   varchar2(255) NOT NULL,
  path         varchar2(255),
  service_id   varchar2(255),
  url          varchar2(255),
  strip_prefix number(3) default 1 not null,
  retryable    number(3) default 0 not null,
  status       number(3) default 1 not null,
  --route_desc   varchar2(255),
  is_persist   number(3) default 0 not null
)
;
-- Add comments to the table
comment on table gateway_route
  is '开放网关-路由';
-- Add comments to the columns
comment on column gateway_route.route_id
  is '路由ID';
comment on column gateway_route.route_name
  is '路由名称';
comment on column gateway_route.path
  is '路径';
comment on column gateway_route.service_id
  is '服务ID';
comment on column gateway_route.url
  is '完整地址';
comment on column gateway_route.strip_prefix
  is '忽略前缀';
comment on column gateway_route.retryable
  is '0-不重试 1-重试';
comment on column gateway_route.status
  is '状态:0-无效 1-有效';
comment on column gateway_route.is_persist
  is '是否为保留数据:0-否 1-是';
-- Create/Recreate primary, unique and foreign key constraints
alter table gateway_route
  add constraint pk_gateway_route_id primary key (ROUTE_ID);

-- ----------------------------
-- Records of gateway_route
-- ----------------------------

INSERT INTO gateway_route VALUES ('556587504019439616', 'opencloud-base-provider', '/base/**', 'opencloud-base-provider', '', '0', '0', '1', '1');
INSERT INTO gateway_route VALUES ('556595619813130240', 'opencloud-auth-provider', '/auth/**', 'opencloud-auth-provider', '', '0', '0', '1', '1');
INSERT INTO gateway_route VALUES ('556595914240688128', 'opencloud-msg-provider', '/msg/**', 'opencloud-msg-provider', '', '0', '0', '1', '1');
INSERT INTO gateway_route VALUES ('556595914240688139', 'opencloud-scheduler-provider', '/scheduler/**', 'opencloud-scheduler-provider', '', '0', '0', '1', '1');
INSERT INTO gateway_route VALUES ('556595914240688145', 'opencloud-bpm-provider', '/bpm/**', 'opencloud-bpm-provider', '', '0', '0', '1', '1');
commit;
