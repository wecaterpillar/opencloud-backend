<p align="center">
  <a target="_blank" href="https://nacos.io/en-us/"><img src="https://img.shields.io/badge/Nacos-blue.svg" alt="Nacos"></a>
  <a><img src="https://img.shields.io/badge/Spring%20Cloud-%20Greenwich.SR2-brightgreen.svg" alt="SpringCloud"></a>
  <a><img src="https://img.shields.io/badge/Spring%20Boot-2.1.6-brightgreen.svg" alt="SpringBoot"></a>
  <a><img src="https://img.shields.io/badge/Redis-orange.svg"></a>
  <a><img src="https://img.shields.io/badge/RabbitMq-orange.svg"></a>
  <a target="_blank" href="https://www.iviewui.com/docs/guide/install"><img src="https://img.shields.io/badge/iview-brightgreen.svg?style=flat-square" alt="iview"></a>
  <a><img src="https://img.shields.io/badge/vue-brightgreen.svg?style=flat-square" alt="vue"></a>
  <a><img src="https://img.shields.io/npm/l/express.svg" alt="License"></a>
</p>  

## SpringCloud微服务平台 3.0.0 

#### 专业版开源了,抢先体验！<a target="_blank" href="https://gitee.com/liuyadu/open-cloud-pro">专业版</a>

#### 简介
搭建基于OAuth2的开放平台、为APP端、应用服务提供统一接口管控平台、为第三方合作伙伴的业务对接提供授信可控的技术对接平台
+ 分布式架构，Nacos(服务注册+配置中心)统一管理
+ 统一API网关（参数验签、身份认证、接口鉴权、接口调试、接口限流、接口状态、接口外网访问）
+ 统一oauth2认证协议

<a target="_blank" href="http://www.openc.top">官网预览</a> 

<a target="_blank" href="http://admin.openc.top">管理后台</a>

<a target="_blank" href="http://pro.openc.top">管理后台-专业版</a>

+ 后台默认账号:admin 123456  
+ 后台测试账号:test 123456
+ SpringBootAdmin账号:sba 123456

#### 源码
+ <a target="_blank" href="https://gitee.com/liuyadu">gitee服务端源码</a>  
+ <a target="_blank" href="https://github.com/liuyadu/">github服务端源码</a>  
+ <a target="_blank" href="https://gitee.com/liuyadu/open-admin-ui">open-admin-ui源码</a>
+ <a target="_blank" href="https://gitee.com/liuyadu_open/open-admin-pro">open-admin-pro-ui源码</a>
+ <a target="_blank" href="https://gitee.com/liuyadu_open/open-portal-ui.git">官网UI源码</a>

#### 使用手册
<a target="_blank" href="https://gitee.com/liuyadu/open-cloud/wikis/pages">使用手册</a>  

#### 交流群 
学习交流(千人群):760809808 <a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=3c1017efeda485820c9eddee13a125d99261f7504746aa4824bc5c7c2b9a4234"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="open-cloud交流群" title="open-cloud交流群"></a>  

#### 功能介绍
![功能介绍](/docs/功能介绍.png)  

#### 代码结构
``` lua
open-cloud
├── docs                               -- 文档及脚本
    ├── bin                            -- 执行脚本  
    ├── config                         -- 公共配置,用于导入到nacos配置中心   
    ├── sql                            -- sql文件
      ├── data                         -- 增量数据
     
├── components                         -- 公共组件
    ├── open-cloud-common-core         -- 提供微服务相关依赖包、工具类、全局异常解析等
    ├── open-cloud-common-starter      -- SpringBoot自动配置扫描
    ├── open-cloud-tenant-starter      -- 多租户模块,多数据源自动切换(完善中...)
    ├── open-cloud-java-sdk            -- 开放平台api集成SDK(完善中...)
       
├── platform                           -- 平台服务
    ├── open-cloud-api-spring-server   -- API开放网关-基于SpringCloudGateway[port = 8888](推荐）  
    ├── open-cloud-api-zuul-server     -- API开放网关-基于Zuul[port = 8888](功能完善）
    ├── open-cloud-base-client         -- 平台基础服务接口
    ├── open-cloud-base-server         -- 平台基础服务器[port=8233]
    ├── open-cloud-uaa-admin-server    -- 平台用户认证服务器[port = 8211]
    ├── open-cloud-uaa-portal-server   -- 门户开发者认证服务器[port = 7211]
    ├── open-cloud-generator-server    -- 在线代码生成服务器[port = 5555]
    
├── services                           -- 通用微服务
    ├── open-cloud-msg-client          -- 消息服务接口
    ├── open-cloud-msg-server          -- 消息服务器[port = 8266]
    ├── open-cloud-task-client         -- 任务调度接口
    ├── open-cloud-task-server         -- 调度服务器[port = 8501]
    ├── open-cloud-bpm-client          -- 工作流接口
    ├── open-cloud-bpm-server          -- 工作流服务器[port = 8255]
    ├── open-cloud-sba-server          -- SpringBootAdmin监控服务[port = 8849]
    ├── open-cloud-sso-ui-demo         -- SSO单点登录演示demo[port = 8849]
```

#### 快速开始
本项目基于springCloud打造的分布式快速开发框架. 需要了解SpringCloud,SpringBoot,SpringSecurity,分布式原理。

1. 准备环境
    + Java1.8  (v1.8.0_131+)
    + Nacos服务注册和配置中心(v1.0.0+) <a href="https://nacos.io/zh-cn/">阿里巴巴nacos.io</a>
    + Redis (v3.2.00+)
    + RabbitMq (v3.7+)（需安装rabbitmq_delayed_message_exchange插件 <a href="https://www.rabbitmq.com/community-plugins.html" target="_blank">下载地址</a>）
    + Mysql (v5.5.28+)
    + Maven (v3+)
    + Nodejs (v10.14.2+)
   
2. 执行创建数据库open-platform并执行sql脚本
    + docs/sql/oauth2.sql
    + docs/sql/base.sql
    + docs/sql/gateway.sql
    + docs/sql/msg.sql
    + docs/sql/quartz.sql && task.sql
      ...
    
3.  启动nacos服务发现&配置中心,新建公共配置文件 
    + 访问 http://localhost:8848/nacos/index.html 
    + 导入配置 /docs/config/DEFAULT_GROUP.zip（nacos1.0.3以上版本支持一键导入）
    + 新建配置文件  （nacos1.0.3以下版本）
        + 项目目录/docs/config/db.properties >  db.properties
        + 项目目录/docs/config/rabbitmq.properties > rabbitmq.properties
        + 项目目录/docs/config/redis.properties > redis.properties
        + 项目目录/docs/config/common.properties  > common.properties
          
     如图:
     ![nacos](https://gitee.com/uploads/images/2019/0425/231436_fce24434_791541.png "nacos.png")
4. 修改主pom.xml  

    初始化maven项目
    ``` bush
        maven clean install
    ```
    本地启动,默认不用修改
    ``` xml
        <!--Nacos配置中心地址-->
        <config.server-addr>127.0.0.1:8848</config.server-addr>
        <!--Nacos配置中心命名空间,用于支持多环境.这里必须使用ID，不能使用名称,默认为空-->
        <config.namespace></config.namespace>
        <!--Nacos服务发现地址-->
        <discovery.server-addr>127.0.0.1:8848</discovery.server-addr>
    ```
    
5. 本地启动(按顺序启动)
     1. [必需]BaseApplication(平台基础服务)
     2. [必需]UaaAdminApplication(平台用户认证服务器)
     3. [必需]GatewaySpringApplication(推荐)或GatewayZuulApplication
     ```
        访问 http://localhost:8888
     ```
     4.[非必需]SpringBootAdmin(监控服务器)(非必需)
      ```
          访问 http://localhost:8849
      ```
      
6. 前端启动
    ```bush
        npm install 
        npm run dev
    ``` 
    访问 http://localhost:8080
    
    
7. 项目打包部署  
    +  maven多环境打包,替换变量
   ```bush
     mvn clean install package -P {dev|test|online}
   ```
    + 项目启动
    ```bush
    ./docs/bin/startup.sh {start|stop|restart|status} open-cloud-base-server.jar
    ./docs/bin/startup.sh {start|stop|restart|status} open-cloud-uaa-admin-server.jar
    ./docs/bin/startup.sh {start|stop|restart|status} open-cloud-api-spring-server.jar
    ```
    
8.docker部署   
 +  配置DOCKER私服仓库
 +  maven多环境打包,替换变量.并构建docker镜像
   
       ```bush
          clean install package -P {dev|test|online} dockerfile:build 
       ```  
 + 启动docker镜像   
  
      ```bush
        docker run -d -e JAVA_OPTS="-Xms128m -Xmx256m" -p 8233:8233 --name base-server open.cloud/open-cloud-base-server:3.0.0
        docker run -d -e JAVA_OPTS="-Xms128m -Xmx256m" -p 8211:8211 --name uaa-admin-server open.cloud/open-cloud-uaa-admin-server:3.0.0
        docker run -d -e JAVA_OPTS="-Xms128m -Xmx256m" -p 8888:8888 --name api-spring-server open.cloud/open-cloud-api-spring-server:3.0.0
      ```  
    
#### 集成开发 
<a target="_blank" href="https://gitee.com/liuyadu/open-cloud/wikis/pages?sort_id=1396933&doc_id=256893">集成开发</a>

#### OAuth2使用说明
<a target="_blank" href="https://gitee.com/liuyadu/open-cloud/wikis/pages?sort_id=1396294&doc_id=256893">OAuth2</a>
