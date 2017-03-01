
DROP TABLE IF EXISTS `op_demo_error_log`;
CREATE TABLE `op_demo_error_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NULL,
  `created_at` timestamp NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='demo 错误日志表';



SHOW CREATE TABLE op_component;


DROP TABLE IF EXISTS `op_component`;
CREATE TABLE `op_component` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `component_name` varchar(80) NOT NULL COMMENT '组件名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='组件表';

DROP TABLE IF EXISTS `op_component_attrs`;
CREATE TABLE `op_component_attrs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `component_id` int(11) NOT NULL COMMENT '组件ID',
  `attr_name` varchar(80) NOT NULL COMMENT '属性名字',
  `attr_type` varchar(80) NOT NULL COMMENT '属性类别',
  `default_value` varchar(80) NULL COMMENT '属性默认值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='组件属性表';

DROP TABLE IF EXISTS `op_component_instance`;
CREATE TABLE `op_component_instance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `component_id` int(11) NOT NULL COMMENT '组件ID',
  `attr_id` varchar(80) NOT NULL COMMENT '属性ID',
  `attr_value` varchar(80) NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='组件实例表';



















SHOW CREATE TABLE op_developer_device_blind;


CREATE TABLE `op_developer_device_blind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `developer_id` int(11) NOT NULL COMMENT '开发者ID',
  `unique_token` varchar(100) DEFAULT NULL COMMENT '安装 APP 的设备的唯一标识',
  `device_access_key` varchar(100) NOT NULL COMMENT '设备access_key',
  `bind_at` timestamp NULL DEFAULT NULL COMMENT '绑定时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='开发者和设备绑定表'

SELECT * from op_developer_device_blind

ALTER TABLE op_developer_device_blind ADD COLUMN `unique_token` VARCHAR(100) NULL COMMENT '安装 APP 的设备的唯一标识' AFTER `developer_id`;





SELECT * FROM op_developer_device_blind where id in (10,10,18)

select `device_access_key` from `op_developer_device_blind` where (`developer_id` = '333' and `unique_token` = 'unique_token')

DROP TABLE IF EXISTS `op_validator`;
CREATE TABLE `op_validator` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_zh` varchar(100) NOT NULL COMMENT '验证规则名称-中，查看用',
  `name_en` varchar(100) NOT NULL COMMENT '验证规则名称-英，写入代码',
  `message` varchar(100) DEFAULT NULL COMMENT '错误提示，带占位符',
  `usage` varchar(255) DEFAULT NULL COMMENT '用法',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='验证器';

DROP TABLE IF EXISTS `op_validate_instance`;
CREATE TABLE `op_validate_instance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `validator_id` int(11) NOT NULL COMMENT '验证器 ID',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='验证实例';


DROP TABLE IF EXISTS `op_module`;
CREATE TABLE `op_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_zh` varchar(100) NOT NULL COMMENT '字段名称-中，查看用',
  `name_en` varchar(100) NOT NULL COMMENT '字段名称-英，写入代码，考虑自动生成',
  `type` varchar(100) NOT NULL COMMENT 'input select',
  `validate` varchar(100) NOT NULL COMMENT 'validate',
  `messages` varchar(100) NOT NULL COMMENT 'validate',
  `message` varchar(100) DEFAULT NULL COMMENT '错误提示，带占位符',
  `usage` varchar(255) DEFAULT NULL COMMENT '用法',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='组件表';

DROP TABLE IF EXISTS `op_form`;
CREATE TABLE `op_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_zh` varchar(100) NOT NULL COMMENT '字段名称-中，查看用',
  `name_en` varchar(100) NOT NULL COMMENT '字段名称-英，写入代码，考虑自动生成',

  `type` varchar(100) NOT NULL COMMENT 'input select',
  `validate` varchar(100) NOT NULL COMMENT 'validate',
  `messages` varchar(100) NOT NULL COMMENT 'validate',


  `message` varchar(100) DEFAULT NULL COMMENT '错误提示，带占位符',
  `usage` varchar(255) DEFAULT NULL COMMENT '用法',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='表单表';


表单组件，时间空间，文件上传
select 需要数据，数据源 可为 写死数据，可以从接口获取
复杂的 级联下拉 分类 、地址
验证错误 多种类型，多种验证失败的提示语
用 vue 组件化 
验证规则 分前端验证 和 后端验证，以及一同验证









SHOW CREATE TABLE op_request_log;


ALTER TABLE op_request_log ADD COLUMN `http_status` TINYINT(5) DEFAULT NULL COMMENT 'HTTP 状态码' AFTER params;
ALTER TABLE op_request_log MODIFY COLUMN `http_status` SMALLINT(5) DEFAULT NULL COMMENT 'HTTP 状态码' AFTER params;




CREATE TABLE `op_request_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `uri` varchar(100) DEFAULT NULL COMMENT '路由',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `return` varchar(500) DEFAULT NULL COMMENT '返回',
  `sha1` varchar(100) DEFAULT NULL COMMENT 'SHA1 of uri & params & return ',
  `time_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '时间使用量S',
  `memory_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '内存使用量MB',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8 COMMENT='请求日志'


CREATE TABLE `op_request_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `uri` varchar(100) DEFAULT NULL COMMENT '路由',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `http_status` tinyint(5) DEFAULT NULL COMMENT 'HTTP 状态码',
  `return` varchar(500) DEFAULT NULL COMMENT '返回',
  `sha1` varchar(100) DEFAULT NULL COMMENT 'SHA1 of uri & params & return ',
  `time_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '时间使用量S',
  `memory_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '内存使用量MB',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8 COMMENT='请求日志'



DROP TABLE IF EXISTS `op_developer_device_blind`;
CREATE TABLE `op_developer_device_blind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `developer_id` int(11) NOT NULL COMMENT '开发者ID',
  `device_access_key` TINYINT(2) NOT NULL COMMENT '设备access_key',
  `bind_at` timestamp NULL DEFAULT NULL COMMENT '绑定时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='开发者和设备绑定表';



show create table op_developer_access_key

CREATE TABLE `op_developer_access_key` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT '账号',
  `access` varchar(100) DEFAULT NULL COMMENT 'access key',
  `secret` varchar(100) DEFAULT NULL COMMENT 'secret key',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:使用中 2:停用',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='开发者accessKey'

CREATE TABLE `op_developer_access_key` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT '账号',
  `access` varchar(100) DEFAULT NULL COMMENT 'access key',
  `secret` varchar(100) DEFAULT NULL COMMENT 'secret key',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:使用中 2:停用',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='开发者accessKey';








## Design A Simple Device Mange System 
### AIM 




CREATE TABLE `op_access_key` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `relation_id` int(11) NOT NULL COMMENT '关联ID',
  `key_type` TINYINT(2) NOT NULL COMMENT 'KEY 类别，1开发者access，2设备access',
  `access` varchar(100) DEFAULT NULL COMMENT 'access key',
  `secret` varchar(100) DEFAULT NULL COMMENT 'secret key',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:使用中 2:停用',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='EMQ 接入秘钥表';

CREATE TABLE `op_device_model` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `model_name` varchar(100) NOT NULL COMMENT '设备型号名称',
  `model_wifi` TINYINT(2) DEFAULT NULL COMMENT '设备是否有wifi',
  `model_bluetooth` varchar(100) DEFAULT NULL COMMENT '设备是否有蓝牙',
  `model_system` varchar(100) DEFAULT NULL COMMENT '设备系统',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='设备型号信息表';

CREATE TABLE `op_device` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) NOT NULL COMMENT '设备ID',
  `device_owner_group` TINYINT(2) NOT NULL COMMENT '设备所属用户组，体验间、用户设备、',
  `device_model` int(11) NOT NULL COMMENT '设备型号',
  `device_name` varchar(100) DEFAULT NULL COMMENT '设备名字',
  `device_mac` varchar(50) DEFAULT NULL COMMENT '设备MAC地址',
  `product_at` timestamp DEFAULT NULL COMMENT '生产日期',
  `product_batch_no` varchar(100) DEFAULT NULL COMMENT '生产批次号',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:正常 2:异常 3:测试虚拟设备',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='设备基础信息表';


create database renern_smell







DROP TABLE IF EXISTS `op_topic_msg`;
CREATE TABLE `op_topic_msg` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL COMMENT 'message',
  `topic` varchar(255) DEFAULT NULL COMMENT 'topic',
  `sign` varchar(255) DEFAULT NULL COMMENT 'sign= md5_32(productKey+(message)+productSecret)',
  `messageId` varchar(255) DEFAULT NULL COMMENT 'messageId',
  `appKey` varchar(255) DEFAULT NULL COMMENT 'appKey',
  `deviceId` varchar(255) DEFAULT NULL COMMENT 'deviceId',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Topic消息';





SHOW CREATE TABLE op_account;

SHOW CREATE TABLE op_developer_access_key;

SHOW CREATE TABLE op_developer_apply;


DROP TABLE IF EXISTS `op_account`;
CREATE TABLE `op_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(80) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `truename` varchar(80) DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `province_id` smallint(6) DEFAULT NULL COMMENT '所在省份ID',
  `city_id` smallint(6) DEFAULT NULL COMMENT '所在市ID',
  `district_id` smallint(6) DEFAULT NULL COMMENT '区域ID',
  `address` varchar(50) DEFAULT NULL COMMENT '企业详细地址 ',
  `company` varchar(100) DEFAULT NULL COMMENT '公司',
  `email_activation` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否邮箱验证，1:未 2:已验证',
  `phone_activation` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否手机验证，1:未 2:已验证',
  `remember_token` varchar(62) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:正常 2:冻结',
  `apply_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:未申请 2:已申请 3:申请通过 4:申请未通过',
  `last_fail_reason` varchar(255) DEFAULT '' COMMENT '最后的申请失败原因',
  `lastlogin_at` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `prevlogin_at` timestamp NULL DEFAULT NULL COMMENT '上次登录时间',
  `secret` char(16) DEFAULT NULL COMMENT '登录密钥',
  `expired_at` timestamp NULL DEFAULT NULL COMMENT '登录过期时间',
  `registered_at` timestamp NULL DEFAULT NULL COMMENT '注册时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='企业账号表';

DROP TABLE IF EXISTS `op_developer_access_key`;
CREATE TABLE `op_developer_access_key` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT '账号',
  `access` varchar(100) DEFAULT NULL COMMENT 'access key',
  `secret` varchar(100) DEFAULT NULL COMMENT 'secret key',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:使用中 2:停用',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='开发者accessKey';


DROP TABLE IF EXISTS `op_developer_apply`;
CREATE TABLE `op_developer_apply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT '账号',
  `truename` varchar(80) DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `province_id` smallint(6) DEFAULT NULL COMMENT '所在省份ID',
  `city_id` smallint(6) DEFAULT NULL COMMENT '所在市ID',
  `district_id` smallint(6) DEFAULT NULL COMMENT '区域ID',
  `address` varchar(50) DEFAULT NULL COMMENT '企业详细地址 ',
  `company` varchar(100) DEFAULT NULL COMMENT '公司',
  `reason` varchar(100) DEFAULT NULL COMMENT '失败理由',
  `note` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未处理 2:通过 3:未通过',
  `operator` varchar(100) NOT NULL DEFAULT '1' COMMENT '审核操作人',
  `reviewed_at` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请开发者审核表';