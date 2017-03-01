 
ALTER TABLE `xb_salary_pay` ADD COLUMN `uid`  int(11) NOT NULL COMMENT '员工编号' AFTER `order_id`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `seperate_tag` int(11) NOT NULL DEFAULT 0 COMMENT '超5w分割标记' AFTER `salary`;
ALTER TABLE `xb_salary_order` ADD COLUMN `order_type` TINYINT(1) DEFAULT 2 COMMENT '订单类型1无账户订单，2自主账户订单,参照company.type' AFTER `company_id`;
ALTER TABLE `xb_salary_order` MODIFY   `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计,2已计福豆';
ALTER TABLE `xb_company` MODIFY COLUMN `regtime` date NOT NULL COMMENT '企业成立时间';

DROP TABLE IF EXISTS `xb_department`;
CREATE TABLE `xb_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL COMMENT '所属公司',
  `department_name` varchar(20) DEFAULT NULL COMMENT '名称',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='企业部门表';

DROP TABLE IF EXISTS `xb_employee_quit`;
CREATE TABLE `xb_employee_quit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `join_at` date NULL DEFAULT NULL COMMENT '入职时间',
  `quit_at` date NULL DEFAULT NULL COMMENT '离职时间',
  `user_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `truename` varchar(30) DEFAULT NULL COMMENT '用户姓名',
  `identity` varchar(20) DEFAULT NULL COMMENT '身份证',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `department_name` varchar(20) DEFAULT NULL COMMENT '名称',
  `card_no` varchar(40) DEFAULT NULL COMMENT '打款账户',
  `bank_name` varchar(40) DEFAULT NULL COMMENT '银行名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='员工离职日志';


DROP TABLE IF EXISTS `xb_employee_change_log`;
CREATE TABLE `xb_employee_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `change_at` timestamp NULL DEFAULT NULL COMMENT '变更时间',
  `property` varchar(60) DEFAULT NULL COMMENT '变更属性',
  `before` varchar(60) DEFAULT NULL COMMENT '变更前',
  `after` varchar(60) DEFAULT NULL COMMENT '变更后',
	`type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '属性变更类别，1编辑,2批量上传',
	`operator` int(11) NOT NULL COMMENT '操作人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='员工信息变更日志';

DROP TABLE IF EXISTS `xb_employee`;
CREATE TABLE `xb_employee` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account` varchar(30) DEFAULT NULL COMMENT '用户登录账户名',
  `password` varchar(30) DEFAULT NULL COMMENT '用户密码',
  `truename` varchar(60) DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(11) DEFAULT '0' COMMENT '电话',
  `identity` varchar(20) DEFAULT NULL COMMENT '身份证',
  `account_status` tinyint(2) unsigned DEFAULT '0' COMMENT '账户状态 1 启用 ，2 停用 ， 3 删除',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `identity` (`identity`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='员工表';


DROP TABLE IF EXISTS `xb_employee_company`;
CREATE TABLE `xb_employee_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `quit_id` int(11) DEFAULT NULL COMMENT '最后一次离职的ID',
  `card_no` varchar(40) DEFAULT '0' COMMENT '打款账户',
  `bank_name` varchar(40) DEFAULT '0' COMMENT '银行名称',
  `user_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `join_at` date NULL DEFAULT NULL COMMENT '入职时间',
  `quit_at` date NULL DEFAULT NULL COMMENT '离职时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '在职状态状态1在职0离职',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='员工企业关系信息表';

DROP TABLE IF EXISTS `xb_operator`;
CREATE TABLE `xb_operator` (
  `oid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `loginname` varchar(30) DEFAULT NULL COMMENT '管理员账号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `truename` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `roleid` tinyint(1) NOT NULL COMMENT '所属角色',
  `authority` varchar(100) NOT NULL COMMENT '权限',
  `remember_token` varchar(62) DEFAULT NULL,
  `single_token` varchar(62) DEFAULT NULL COMMENT '单人登录令牌',
  `lastlogin` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `prevlogin` timestamp NULL DEFAULT NULL COMMENT '上一次登录时间',
  `initial_pwd_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否为初始密码，1是，2不是',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '使用状态:1使用 2:停用 ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='管理员表';

ALTER TABLE `xb_salary_order` MODIFY COLUMN `created_at`  timestamp NULL DEFAULT NULL COMMENT '创建时间' AFTER `lastedit_at`;
ALTER TABLE `xb_salary_order` MODIFY COLUMN `updated_at`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' AFTER `created_at`;

DROP TABLE IF EXISTS `xb_config`;
CREATE TABLE `xb_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '备注',
	`fid` int(10) DEFAULT 0 COMMENT '上级ID',
  `key` varchar(50) DEFAULT NULL COMMENT '键',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='配置表';


DROP TABLE IF EXISTS `xb_order_monitoring`;
CREATE TABLE `xb_order_monitoring` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `type` smallint(5) DEFAULT '0' COMMENT '类别，1上传时间，2打款时间',
  `count` int(11) DEFAULT '0' COMMENT '数量',
  `time_usage` int(11) DEFAULT '0' COMMENT '用时，单位秒',
  `context` text NULL COMMENT '上下文',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='订单监测'

