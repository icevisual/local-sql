




DELETE FROM op_developer_device_blind WHERE device_access_key is NULL 

DROP TABLE IF EXISTS `op_developer_device_blind`;
CREATE TABLE `op_developer_device_blind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `developer_id` int(11) NOT NULL COMMENT '开发者ID',
  `device_access_key` varchar(100) NOT NULL COMMENT '设备access_key',
  `bind_at` timestamp NULL DEFAULT NULL COMMENT '绑定时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='开发者和设备绑定表';



SELECT
	b.alias,
  b.access_key
FROM
	smell_open.op_developer_device_blind AS a
JOIN renern_smell.sm_smell_device AS b ON a.device_access_key = b.access_key
WHERE 
	a.developer_id = 333
  


create database open_smell

    show procedure status;
select * FROM op_request_log order by id desc limit 100;




ALTER TABLE op_account ADD COLUMN `prevlogin_at` timestamp NULL  COMMENT '上次登录时间' AFTER lastlogin_at

ALTER TABLE op_account ADD COLUMN `apply_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:未申请 2:已申请 3:申请通过 4:申请未通过'  AFTER status

ALTER TABLE op_account ADD COLUMN `last_fail_reason` varchar(255) NULL DEFAULT '' COMMENT '最后的申请失败原因'  AFTER apply_status


SHOW CREATE TABLE op_account  ;
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
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8 COMMENT='企业账号表'


SHOW CREATE TABLE op_developer_apply  ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请开发者审核表'




CREATE TABLE `op_developer_access_key` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT '账号',
  `access` varchar(100) DEFAULT NULL COMMENT 'access key',
  `secret` varchar(100) DEFAULT NULL COMMENT 'secret key',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:使用中 2:停用',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开发者accessKey'




## enterprise infomation

## accessToken

## 面向的用户、对接模式、





 `remember_token` varchar(62) DEFAULT NULL,

SHOW CREATE TABLE op_account


ALTER TABLE op_account ADD COLUMN  `remember_token` varchar(62) DEFAULT NULL AFTER `phone_activation`


DROP TABLE IF EXISTS `op_request_log`;
CREATE TABLE `op_request_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `uri` varchar(100) DEFAULT NULL COMMENT '路由',
  `params` varchar(255) COMMENT '参数',
  `return` varchar(255) COMMENT '返回',
  `time_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '时间使用量S',
  `memory_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '内存使用量MB',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='请求日志';







