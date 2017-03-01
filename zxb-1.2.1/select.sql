


SHOW CREATE TABLE xb_request_log

SHOW CREATE TABLE xb_ant_log

ALTER TABLE xb_ant_log add COLUMN `time_usage` decimal(12,8) NOT NULL DEFAULT '0.00000000' COMMENT '时间使用量S' AFTER send_status;
ALTER TABLE xb_ant_log add COLUMN `memory_usage` decimal(12,8) NOT NULL DEFAULT '0.00000000' COMMENT '内存使用量MB' AFTER time_usage;

ALTER TABLE xb_ant_log MODIFY COLUMN  `send_status` smallint(2) DEFAULT '0' COMMENT '发送状态1成功,2失败'

ALTER TABLE xb_ant_log add COLUMN `verify_error` varchar(100) DEFAULT NULL COMMENT '验证错误信息' AFTER verify_status;


ALTER TABLE xb_ant_log CHANGE req_time req_time varchar(50) DEFAULT NULL COMMENT '时间' ;
ALTER TABLE xb_ant_log CHANGE reqMsgId req_msg_id varchar(50) DEFAULT NULL COMMENT 'UUID';
ALTER TABLE xb_ant_log CHANGE signString sign_string varchar(255) DEFAULT NULL COMMENT '发送的XML' ;


       "resultStatus" => "S"
          "resultCode" => "0000"
          "resultMsg" => "成功"
ALTER TABLE xb_ant_log add COLUMN `result_status`  VARCHAR(20)  NULL DEFAULT '' COMMENT 'resultStatus' AFTER verify_error;
ALTER TABLE xb_ant_log add COLUMN `result_code`  VARCHAR(20)   NULL DEFAULT '' COMMENT 'resultCode' AFTER result_status;
ALTER TABLE xb_ant_log add COLUMN `result_msg` VARCHAR(100) NULL DEFAULT '' COMMENT 'resultMsg' AFTER result_code;


CREATE TABLE `xb_ant_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `req_time` varchar(50) DEFAULT NULL COMMENT '时间',
  `req_msg_id` varchar(50) DEFAULT NULL COMMENT 'UUID',
  `function` varchar(50) DEFAULT NULL COMMENT '接口',
  `sign_string` varchar(255) DEFAULT NULL COMMENT '发送的XML',
  `send_xml` text COMMENT '发送的XML',
  `received_xml` text COMMENT '接收到的XML',
  `send_status` smallint(2) DEFAULT '0' COMMENT '发送状态1成功,2失败',
  `send_error` varchar(100) DEFAULT NULL COMMENT '错误信息',
  `time_usage` decimal(12,8) NOT NULL DEFAULT '0.00000000' COMMENT '时间使用量S',
  `memory_usage` decimal(12,8) NOT NULL DEFAULT '0.00000000' COMMENT '内存使用量MB',
  `verify_status` tinyint(4) DEFAULT '1' COMMENT '验签状态，1未验签，2成功，3失败',
  `verify_error` varchar(100) DEFAULT NULL COMMENT '验证错误信息',
  `result_status` varchar(20) DEFAULT '' COMMENT 'resultStatus',
  `result_code` varchar(20) DEFAULT '' COMMENT 'resultCode',
  `result_msg` varchar(100) DEFAULT '' COMMENT 'resultMsg',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COMMENT='网商银行报文日志';


CREATE TABLE `xb_request_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `uri` varchar(100) DEFAULT NULL COMMENT '路由',
  `params` text COMMENT '参数',
  `time_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '时间使用量S',
  `memory_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '内存使用量MB',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8033 DEFAULT CHARSET=utf8 COMMENT='请求日志'





DROP TABLE IF EXISTS `xb_ant_log`;
CREATE TABLE `xb_ant_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reqTime` varchar(50) DEFAULT NULL COMMENT '时间',
  `reqMsgId` varchar(50) DEFAULT NULL COMMENT 'UUID',
  `function` varchar(50) DEFAULT NULL COMMENT '接口',
  `signString` varchar(255) COMMENT '发送的XML',
  `send_xml` text COMMENT '发送的XML',
  `received_xml` text COMMENT '接收到的XML',
  `send_status` smallint(2) DEFAULT '0' COMMENT '发送状态0失败，1成功',
  `send_error` varchar(100) DEFAULT NULL COMMENT '错误信息',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='网商银行报文日志'


ALTER TABLE xb_ant_log ADD COLUMN verify_status TINYINT DEFAULT 1 COMMENT '验签状态，1未验签，2成功，3失败';

42590

SELECT 42590/365

SELECT TO_DAYS('2016/8/8')

DROP DATABASE `xb-str-0717`;

CREATE DATABASE `xb-str-0717`;



ALTER TABLE xb_employee_company ADD COLUMN delete_status  tinyint(4) DEFAULT '1' COMMENT '删除状态1未删除，2已删除' AFTER `status`;

ALTER TABLE xb_employee_company DROP COLUMN delete_status  ;



SHOW CREATE TABLE xb_fbsdk_log

DROP TABLE IF EXISTS `xb_backup_data`;
CREATE TABLE `xb_backup_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT 'API名字',
  `data` text DEFAULT NULL COMMENT '数据',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='备份'






SELECT
	`xb_salary_pay`.`company_id`,
	`xb_salary_pay`.`order_id`,
	GROUP_CONCAT(
		'#E#',
		xb_salary_payroll_value.payroll_id,
		'#E#'
	) AS property_id
FROM
	`xb_salary_pay`
LEFT JOIN `xb_salary_payroll_value` ON `xb_salary_pay`.`id` = `xb_salary_payroll_value`.`pay_id`
GROUP BY
	`xb_salary_pay`.`id`
LIMIT 10000 

DROP DATABASE `xb-str-0717`;

CREATE DATABASE `xb-str-0717`;

DESC xb_company


SELECT name,account_id,fudou_avaliable FROM xb_company GROUP BY `name`

SHOW VARIABLES LIKE 'only_full_group_by';

STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION,ONLY_FULL_GROUP_BY

CREATE DATABASE `xb-str`


SELECT @sql_mode 


SELECT @@sql_mode ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION

STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION

SET @@sql_mode='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION,ONLY_FULL_GROUP_BY'

SET @@sql_mode='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION'

select `name`, `specification`, `supplier_id` from `sm_material` where (`sm_material`.`is_del` = '0') group by `name`
ANY_VALUE

-- ----------------------------
-- Table structure for `sm_material`
-- ----------------------------
DROP TABLE IF EXISTS `sm_material`;
CREATE TABLE `sm_material` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `category_id` smallint(5) unsigned DEFAULT NULL COMMENT '分类id',
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'URL地址',
  `specification` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '规格',
  `amount` mediumint(8) unsigned DEFAULT NULL COMMENT '数量',
  `is_del` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `create_at` int(11) DEFAULT NULL,
  `update_at` int(11) DEFAULT NULL,
  `project_id` smallint(5) unsigned DEFAULT NULL COMMENT '项目id',
  `supplier_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商id',
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单位',
  `freeze` smallint(5) unsigned DEFAULT '0' COMMENT '冻结',
  `borrow` smallint(5) unsigned DEFAULT NULL COMMENT '借用',
  PRIMARY KEY (`m_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sm_material
-- ----------------------------
INSERT INTO `sm_material` VALUES ('5', 'gt860显卡', '1', null, 'BAM1.05-30-1W', '4', '0', '1466596002', null, '3', '7', '个', '0', null);
INSERT INTO `sm_material` VALUES ('6', 'gt860显卡', '1', null, 'BAM1.05-30-1W', '2', '0', '1466598458', null, '3', '2', '个', '0', null);
INSERT INTO `sm_material` VALUES ('7', 'gt860', '1', 'http://baidu.com', 'BAM1.05-30-1W', '5', '0', '1466598794', null, '3', '2', '个', '0', null);



SELECT
	xb_salary_order.order_id,
	xb_salary_order.company_id,
	xb_salary_order.payment_at,
	xb_salary_order.pay_at,
  xb_salary_order.created_at,
	COUNT(xb_salary_pay.id) AS pay_count,
	SUM(xb_salary_pay.salary - xb_salary_pay.tax) AS amount
FROM
	xb_salary_order
JOIN xb_salary_pay ON xb_salary_order.order_id = xb_salary_pay.order_id
WHERE
	xb_salary_order.`status` = 3 
GROUP BY xb_salary_order.order_id
ORDER BY xb_salary_order.payment_at,xb_salary_order.created_at


SELECT * FROM xb_company_pay_conf WHERE company_id = 154




select reason ,api_type FROM xb_salary_pay GROUP BY reason


SELECT
	SUM(
		xb_salary_pay.salary - xb_salary_pay.tax
	) AS amount
FROM
	`xb_salary_pay`
INNER JOIN `xb_salary_order` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
WHERE
	`xb_salary_pay`.`company_id` = '155'
AND `xb_salary_order`.`payment_at` >= '2016-06-30 00:00:00'
AND `xb_salary_order`.`payment_at` <= '2016-06-30 23:59:59'
AND `xb_salary_order`.`status` != '0'
AND `xb_salary_order`.`status` != '2'
AND (
	`xb_salary_pay`.`process_status` != '0'
	OR `xb_salary_pay`.`result_status` = '0'
)
LIMIT 1 

SHOW CREATE TABLE zxb.xb_salary_order;

CREATE TABLE `xb_salary_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `title` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '工资发放日',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款状态，1未打款，2打款中，3完成打款，结果查询中，4完成结果查询',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0未提交，1已提交,未确认，2被拒绝，3待发放，4已发放，5发放中',
  `should_pay_num` int(10) DEFAULT '0' COMMENT '需打款人数',
  `should_pay_tax` decimal(20,2) DEFAULT '0.00' COMMENT '需付个税总金额',
  `should_pay_salary` decimal(20,2) DEFAULT '0.00' COMMENT '需付薪资总金额',
  `payed_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税总额',
  `payed_salary_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税前金额',
  `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计',
  `payed_success_count` smallint(5) DEFAULT '0' COMMENT '打款成功数量',
  `submit_at` timestamp NULL DEFAULT NULL COMMENT '提交时间',
  `confirm_at` timestamp NULL DEFAULT NULL COMMENT '确认时间',
  `refuse_at` timestamp NULL DEFAULT NULL COMMENT '拒绝时间',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',
  `refuse_reason` varchar(225) DEFAULT NULL COMMENT '拒绝理由',
  `operator_id` varchar(11) DEFAULT NULL COMMENT '最后操作人ID',
  `lastedit_at` timestamp NULL DEFAULT NULL COMMENT '最后操作时间',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  KEY `company_id` (`company_id`),
  KEY `payed_statistics_status` (`payed_statistics_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发放工资订单主表'



SHOW CREATE TABLE zxb.xb_company;

SHOW CREATE TABLE xb_company;

 
ALTER TABLE xb_company ADD COLUMN `is_limited` TINYINT(2) NOT NULL DEFAULT 2 COMMENT '每日打款是否限额，1限额，2不限额' AFTER `type`;
 
ALTER TABLE xb_company ADD COLUMN `daily_limit` DECIMAL(11,2) NOT NULL DEFAULT 0 COMMENT '每日打款金额上限' AFTER `type`;
 
ALTER TABLE xb_company MODIFY COLUMN `daily_limit` DECIMAL(11,2) NOT NULL DEFAULT 0 COMMENT '每日打款金额上限' AFTER `type`;
 
ALTER TABLE xb_company DROP COLUMN `daily_limit` ;
 ALTER TABLE xb_company DROP COLUMN `is_limited` ;

CREATE TABLE `xb_company` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '企业全称',
  `account_id` int(11) unsigned NOT NULL COMMENT '企业账号',
  `account_balance` decimal(30,2) DEFAULT '0.00' COMMENT '账户余额，记录打款失败金额',
  `legal_person` varchar(50) NOT NULL COMMENT '企业法人',
  `phone` varchar(15) NOT NULL COMMENT '公司联系电话',
  `province_id` smallint(6) NOT NULL COMMENT '所在省份ID',
  `city_id` smallint(6) NOT NULL COMMENT '所在市ID',
  `district_id` smallint(6) NOT NULL COMMENT '区域ID',
  `address` varchar(50) NOT NULL COMMENT '企业详细地址 ',
  `regtime` datetime NOT NULL COMMENT '企业成立时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:合作中 2:结束合作',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:无银行账户，2有独立账户',
  `join_at` timestamp NULL DEFAULT NULL COMMENT '开始合作时间',
  `quit_at` timestamp NULL DEFAULT NULL COMMENT '结束合作时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `account_id` (`account_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='企业表'

CREATE TABLE `xb_company_account` (
  `account_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '企业账号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `remember_token` varchar(62) DEFAULT NULL,
  `single_token` varchar(62) DEFAULT NULL COMMENT '单人登录令牌',
  `lastlogin` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `prevlogin` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'lastlogin',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '使用状态:使用 1:停用 ',
  `initial_pwd_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否为初始密码，1是，2不是',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='企业账号表'


SHOW CREATE TABLE `xb_request_log`;


CREATE TABLE `xb_request_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `uri` varchar(100) DEFAULT NULL COMMENT '路由',
  `params` text COMMENT '参数',
  `time_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '时间使用量S',
  `memory_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '内存使用量MB',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4757 DEFAULT CHARSET=utf8 COMMENT='请求日志'


// a table to record time usage


CALL cal_time_usage();

// Excel Upload time
// Salary Order Pay Time


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



SHOW CREATE TABLE xb_fudou_bill


CREATE TABLE `xb_fudou_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL COMMENT '操作者',
  `operator_type` int(11) NOT NULL COMMENT '操作者类型，1后台管理员，2企业账户，3企业操作员',
  `company_id` int(11) NOT NULL COMMENT '企业账户ID',
  `amount` int(11) DEFAULT '0' COMMENT '金额',
  `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出1：收入，2.支出，3内转',
  `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，1返还福豆解冻，2商城消费，3后台扣除，4分配给员工',
  `event_name` varchar(100) DEFAULT NULL COMMENT '事件名称',
  `after_rest_amt` decimal(30,2) DEFAULT '0.00' COMMENT '之后余额',
  `relation_id` bigint(26) DEFAULT NULL COMMENT '事件关联ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  `comments` varchar(200) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='企业可用福豆变动表'

CREATE TABLE `xb_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '备注',
  `fid` int(10) DEFAULT '0' COMMENT '上级ID',
  `key` varchar(50) DEFAULT NULL COMMENT '键',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='配置表'

SHOW CREATE TABLE xb_config;


ALTER TABLE xb_config DROP COLUMN updated_at





SELECT
	`xb_config`.*
FROM
	`xb_config`
INNER JOIN `xb_config` AS `xb_c2` ON `xb_config`.`fid` = `xb_c2`.`id`
WHERE
	`xb_c2`.`key` = '_BANK_CODE_MAP' 


SELECT
	c.company_id,
	c. NAME,
	thawable_at,
	c.fudou_avaliable,
	IFNULL(SUM(unthawable), 0) AS unthawable,
	IFNULL(SUM(thawable), 0) AS thawable
FROM
	xb_company AS c
LEFT JOIN (
	(
		SELECT
			`xb_tax_return`.`company_id`,
			`xb_tax_return`.`thawable_at`,
			0 AS unthawable,
			SUM(xb_tax_return.fudou) AS thawable
		FROM
			`xb_tax_return`
		WHERE
			`xb_tax_return`.`status` = '2'
		GROUP BY
			`xb_tax_return`.`company_id`
	)
	UNION
		(
			SELECT
				`xb_tax_return`.`company_id`,
				`xb_tax_return`.`thawable_at`,
				SUM(xb_tax_return.fudou) AS unthawable,
				0 AS thawable
			FROM
				`xb_tax_return`
			WHERE
				`xb_tax_return`.`status` = '1'
			GROUP BY
				`xb_tax_return`.`company_id`
		)
) AS a ON a.company_id = c.company_id
AND c.has_tax_return = '1'
WHERE c.has_tax_return = '1'
GROUP BY
	c.company_id
LIMIT 0,
 50 


SELECT
	c.company_id,
	c.NAME,
	thawable_at,
	c.fudou_avaliable,
	IFNULL(SUM(unthawable),0) AS unthawable,
	IFNULL(SUM(thawable),0) AS thawable
FROM

 xb_company AS c 

LEFT JOIN 
	(
		(
			SELECT
				`xb_tax_return`.`company_id`,
				`xb_tax_return`.`thawable_at`,
				0 AS unthawable,
				SUM(xb_tax_return.fudou) AS thawable
			FROM
				`xb_tax_return`
			WHERE
				`xb_tax_return`.`status` = '2'
			GROUP BY
				`xb_tax_return`.`company_id`
		)
		UNION
			(
				SELECT
					`xb_tax_return`.`company_id`,
					`xb_tax_return`.`thawable_at`,
					SUM(xb_tax_return.fudou) AS unthawable,
					0 AS thawable
				FROM
					`xb_tax_return`
				WHERE
					`xb_tax_return`.`status` = '1'
				GROUP BY
					`xb_tax_return`.`company_id`
			)
	) AS a
ON a.company_id = c.company_id and c.has_tax_return = 1
GROUP BY
	a.company_id
LIMIT 0,
 50 

SELECT
	a.company_id,
	NAME,
	thawable_at,
	c.fudou_avaliable,
	SUM(unthawable) AS unthawable,
	SUM(thawable) AS thawable
FROM
	(
		(
			SELECT
				`xb_tax_return`.`company_id`,
				`xb_tax_return`.`thawable_at`,
				0 AS unthawable,
				SUM(xb_tax_return.fudou) AS thawable
			FROM
				`xb_tax_return`
			WHERE
				`xb_tax_return`.`status` = '2'
			GROUP BY
				`xb_tax_return`.`company_id`
		)
		UNION
			(
				SELECT
					`xb_tax_return`.`company_id`,
					`xb_tax_return`.`thawable_at`,
					SUM(xb_tax_return.fudou) AS unthawable,
					0 AS thawable
				FROM
					`xb_tax_return`
				WHERE
					`xb_tax_return`.`status` = '1'
				GROUP BY
					`xb_tax_return`.`company_id`
			)
	) AS a
JOIN xb_company AS c ON a.company_id = c.company_id
GROUP BY
	a.company_id
LIMIT 0,
 50 [] []


SHOW create TABLE `xb_employee`;

CREATE TABLE `xb_employee` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account` varchar(30) DEFAULT NULL COMMENT '用户登录账户名',
  `password` varchar(30) DEFAULT NULL COMMENT '用户密码',
  `truename` varchar(30) DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(11) DEFAULT '0' COMMENT '电话',
  `identity` varchar(20) DEFAULT NULL COMMENT '身份证',
  `account_status` tinyint(2) unsigned DEFAULT '0' COMMENT '账户状态 1 启用 ，2 停用 ， 3 删除',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `identity` (`identity`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='员工表'




ALTER TABLE `xb_employee` ADD COLUMN `fudou_avaliable` int DEFAULT 0 COMMENT '可用福豆数量' AFTER identity;




CREATE TABLE `xb_fudou_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL COMMENT '操作者',
  `operator_type` int(11) NOT NULL COMMENT '操作者类型，1后台管理员，2企业账户，3企业操作员',
  `company_id` int(11) NOT NULL COMMENT '企业账户ID',
  `amount` decimal(30,2) DEFAULT '0.00' COMMENT '金额',
  `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出1：收入，2.支出，3内转',
  `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，1返还福豆解冻，2商城消费，3后台扣除，4分配给员工',
  `event_name` varchar(100) DEFAULT NULL COMMENT '事件名称',
  `after_rest_amt` decimal(30,2) DEFAULT '0.00' COMMENT '之后余额',
  `relation_id` bigint(26) DEFAULT NULL COMMENT '事件关联ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  `comments` varchar(200) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='企业可用福豆变动表'

DROP TABLE IF EXISTS `xb_fudou_user_bill`;
CREATE TABLE `xb_fudou_user_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `amount` decimal(30,2) DEFAULT '0.00' COMMENT '金额',
  `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出1：收入，2.支出，3内转',
  `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，1分配获得福豆，2商城消费',
  `event_name` varchar(100) DEFAULT NULL COMMENT '事件名称',
  `after_rest_amt` decimal(30,2) DEFAULT '0.00' COMMENT '之后余额',
  `relation_id` bigint(26) DEFAULT NULL COMMENT '事件关联ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户福豆变动表';

CREATE database `zxb-test-upgrade`

SELECT
	`xb_employee`.`uid`,
	`xb_employee`.`truename`,
	`xb_employee`.`fudou_avaliable`
FROM
	`xb_employee_company`
INNER JOIN `xb_company` ON `xb_company`.`company_id` = `xb_employee_company`.`company_id`
INNER JOIN `xb_employee` ON `xb_employee`.`uid` = `xb_employee_company`.`uid`
WHERE
	`xb_employee_company`.`status` = '1' [] []

SHOW CREATE TABLE xb_company;

INSERT INTO `zxb-1.2.1`.`xb_tax_return` ( `company_id`, `order_id`, `tax`, `tax_return_rate`, `fudou_rate`, `fudou`, `operator`, `thawable_at`, `thaw_at`, `status`, `created_at`) VALUES ( '155', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26');
INSERT INTO `zxb-1.2.1`.`xb_tax_return` ( `company_id`, `order_id`, `tax`, `tax_return_rate`, `fudou_rate`, `fudou`, `operator`, `thawable_at`, `thaw_at`, `status`, `created_at`) VALUES ( '155', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26');
INSERT INTO `zxb-1.2.1`.`xb_tax_return` ( `company_id`, `order_id`, `tax`, `tax_return_rate`, `fudou_rate`, `fudou`, `operator`, `thawable_at`, `thaw_at`, `status`, `created_at`) VALUES ( '155', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26');
INSERT INTO `zxb-1.2.1`.`xb_tax_return` ( `company_id`, `order_id`, `tax`, `tax_return_rate`, `fudou_rate`, `fudou`, `operator`, `thawable_at`, `thaw_at`, `status`, `created_at`) VALUES ( '155', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26');
INSERT INTO `zxb-1.2.1`.`xb_tax_return` ( `company_id`, `order_id`, `tax`, `tax_return_rate`, `fudou_rate`, `fudou`, `operator`, `thawable_at`, `thaw_at`, `status`, `created_at`) VALUES ( '155', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26');
INSERT INTO `zxb-1.2.1`.`xb_tax_return` ( `company_id`, `order_id`, `tax`, `tax_return_rate`, `fudou_rate`, `fudou`, `operator`, `thawable_at`, `thaw_at`, `status`, `created_at`) VALUES ( '155', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26');
INSERT INTO `zxb-1.2.1`.`xb_tax_return` ( `company_id`, `order_id`, `tax`, `tax_return_rate`, `fudou_rate`, `fudou`, `operator`, `thawable_at`, `thaw_at`, `status`, `created_at`) VALUES ( '155', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26');
INSERT INTO `zxb-1.2.1`.`xb_tax_return` ( `company_id`, `order_id`, `tax`, `tax_return_rate`, `fudou_rate`, `fudou`, `operator`, `thawable_at`, `thaw_at`, `status`, `created_at`) VALUES ( '155', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26');
INSERT INTO `zxb-1.2.1`.`xb_tax_return` ( `company_id`, `order_id`, `tax`, `tax_return_rate`, `fudou_rate`, `fudou`, `operator`, `thawable_at`, `thaw_at`, `status`, `created_at`) VALUES ( '155', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26');
INSERT INTO `zxb-1.2.1`.`xb_tax_return` ( `company_id`, `order_id`, `tax`, `tax_return_rate`, `fudou_rate`, `fudou`, `operator`, `thawable_at`, `thaw_at`, `status`, `created_at`) VALUES ( '155', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26');


comments 

ALTER TABLE xb_fudou_bill ADD COLUMN `comments` VARCHAR(200) NULL COMMENT '备注信息';


DROP TABLE IF EXISTS `xb_rate_adjustment`;
CREATE TABLE `xb_rate_adjustment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL COMMENT '操作者',
  `company_id` int(11) NOT NULL COMMENT '企业账户ID',
	`before` decimal(30,2) DEFAULT '0.00' COMMENT '改动前',
  `after` decimal(30,2) DEFAULT '0.00' COMMENT '改动后',
  `effected_at` timestamp NULL DEFAULT NULL COMMENT '生效时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未生效，2已生效，3已取消',
  `updated_at`timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='企业返税比调整';


ALTER TABLE xb_salary_order MODIFY `order_type` tinyint(1) DEFAULT '2' COMMENT '订单类型1无账户订单，2自主账户订单,参照company.type'


DROP TABLE IF EXISTS `xb_fudou_bill`;
CREATE TABLE `xb_fudou_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL COMMENT '操作者',
  `operator_type` int(11) NOT NULL COMMENT '操作者类型，1后台管理员，2企业账户，3企业操作员',
  `company_id` int(11) NOT NULL COMMENT '企业账户ID',
  `amount` decimal(30,2) DEFAULT '0.00' COMMENT '金额',
  `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出1：收入，2.支出，3内转',
  `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，1返还福豆解冻，2商城消费，3后台扣除，4分配给员工',
  `event_name` varchar(100) DEFAULT NULL COMMENT '事件名称',
  `after_rest_amt` decimal(30,2) DEFAULT '0.00' COMMENT '之后余额',
  `relation_id` bigint(26) DEFAULT NULL COMMENT '事件关联ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='企业可用福豆变动表';


CREATE TABLE `xb_company` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '企业全称',
  `account_id` int(11) unsigned NOT NULL COMMENT '企业账号',
  `account_balance` decimal(30,2) DEFAULT '0.00' COMMENT '账户余额，记录打款失败金额',
  `legal_person` varchar(50) NOT NULL COMMENT '企业法人',
  `phone` varchar(15) NOT NULL COMMENT '公司联系电话',
  `province_id` smallint(6) NOT NULL COMMENT '所在省份ID',
  `city_id` smallint(6) NOT NULL COMMENT '所在市ID',
  `district_id` smallint(6) NOT NULL COMMENT '区域ID',
  `address` varchar(50) NOT NULL COMMENT '企业详细地址 ',
  `regtime` date NOT NULL COMMENT '企业成立时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:合作中 2:结束合作',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:无银行账户，2有独立账户',
  `has_tax_return` tinyint(1) DEFAULT '2' COMMENT '个税返还状态，1返还，2不返还',
  `service_fee` decimal(10,2) DEFAULT '0.00' COMMENT '服务费收费标准（元 / 人 / 次）',
  `tax_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '开票税金比例 ',
  `has_insurance` tinyint(1) DEFAULT '2' COMMENT '是否有商保，1有，2无',
  `insurance_fee` decimal(10,2) DEFAULT '0.00' COMMENT '商保收费标准（元 ／月）',
  `has_disabled_gold` tinyint(1) DEFAULT '2' COMMENT '是否代缴残疾金，1是，2否',
  `disabled_fee` decimal(10,2) DEFAULT '0.00' COMMENT '残疾金收费标准（元 ／月）',
  `disabled_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '残疾金开票税金比例 ',
  `insurance_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '商保开票税金比',
  `tax_return_rate` decimal(5,2) DEFAULT '0.00' COMMENT '个税返还比',
  `fudou_avaliable` int(11) DEFAULT '0' COMMENT '可用福豆数量',
  `fudou_can_thaw` int(11) DEFAULT '0' COMMENT '可解冻福豆数量',
  `fudou_frozen` int(11) DEFAULT '0' COMMENT '未解冻福豆数量',
  `join_at` timestamp NULL DEFAULT NULL COMMENT '开始合作时间',
  `quit_at` timestamp NULL DEFAULT NULL COMMENT '结束合作时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `account_id` (`account_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='企业表'


ALTER TABLE xb_company DROP COLUMN fudou_can_thaw;
ALTER TABLE xb_company DROP COLUMN fudou_frozen;


SELECT
	SUM(xb_tax_return.fudou) AS fudou,
	SUM(xb_tax_return.tax) AS money
FROM
	`xb_tax_return`
WHERE
	`xb_tax_return`.`company_id` = '153'
AND `xb_tax_return`.`status` = '2'
LIMIT 1 



SELECT
	a.company_id,
	NAME,
	thawable_at,
	SUM(unthawable) AS unthawable,
	SUM(thawable) AS thawable
FROM
	(
		(
			SELECT
				`xb_tax_return`.`company_id`,
				`xb_tax_return`.`thawable_at`,
				0 AS unthawable,
				SUM(xb_tax_return.fudou) AS thawable
			FROM
				`xb_tax_return`
			WHERE
				`xb_tax_return`.`status` = '1'
			GROUP BY
				`xb_tax_return`.`company_id`
		)
		UNION
			(
				SELECT
					`xb_tax_return`.`company_id`,
					`xb_tax_return`.`thawable_at`,
					SUM(xb_tax_return.fudou) AS unthawable,
					0 AS thawable
				FROM
					`xb_tax_return`
				WHERE
					`xb_tax_return`.`status` = '2'
				GROUP BY
					`xb_tax_return`.`company_id`
			)
	) AS a
JOIN xb_company AS c ON a.company_id = c.company_id
GROUP BY
	a.company_id
LIMIT 0,
 50 


INSERT INTO `zxb-1.2.1`.`xb_tax_return` (`id`, `company_id`, `order_id`, `tax`, `tax_return_rate`, `fudou_rate`, `fudou`, `operator`, `thawable_at`, `thaw_at`, `status`, `created_at`) 
VALUES ('4', '155', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26');

DELETE FROM xb_tax_return;
INSERT INTO `zxb-1.2.1`.`xb_tax_return` ( `company_id`, `order_id`, `tax`, `tax_return_rate`, `fudou_rate`, `fudou`, `operator`, `thawable_at`, `thaw_at`, `status`, `created_at`) 
VALUES 
( '155', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26'),
( '156', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26'),
( '157', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2016-07-30 00:00:00', NULL, '1', '2016-05-24 15:41:26'),
( '155', '146398335231612176', '288038.30', '15.00', '1.00', '43206', NULL, '2015-07-30 00:00:00', NULL, '2', '2016-05-24 15:41:26');






SELECT 
	company_id ,status, SUM(unthawable), SUM(thawable)  
FROM (
	SELECT company_id ,status, SUM(fudou) AS unthawable, 0 AS thawable FROM xb_tax_return WHERE status = 1 GROUP BY company_id
	UNION
	SELECT company_id ,status, 0 AS unthawable, SUM(fudou) AS thawable FROM xb_tax_return WHERE status = 2 GROUP BY status,company_id
) as a GROUP BY a.company_id


SHOW CREATE TABLE `xb_company`;


DROP TABLE IF EXISTS `xb_fudou_bill`;
CREATE TABLE `xb_fudou_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL COMMENT '账户ID',
  `amount` decimal(30,2) DEFAULT '0.00' COMMENT '金额',
  `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出1：收入，2.支出，3内转',
  `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，1返还福豆解冻，2商城消费，3分配给员工',
  `event_name` varchar(100) DEFAULT NULL COMMENT '事件名称',
  `after_rest_amt` decimal(30,2) DEFAULT '0.00' COMMENT '之后余额',
  `relation_id` bigint(26) DEFAULT NULL COMMENT '事件关联ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='企业可用福豆变动表';


DROP TABLE IF EXISTS `xb_fudou_user_bill`;
CREATE TABLE `xb_user_fudou_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `amount` decimal(30,2) DEFAULT '0.00' COMMENT '金额',
  `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出1：收入，2.支出，3内转',
  `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，1分配获得福豆，2商城消费',
  `event_name` varchar(100) DEFAULT NULL COMMENT '事件名称',
  `after_rest_amt` decimal(30,2) DEFAULT '0.00' COMMENT '之后余额',
  `relation_id` bigint(26) DEFAULT NULL COMMENT '事件关联ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户福豆变动表';




DROP TABLE IF EXISTS `xb_tax_return`;
CREATE TABLE `xb_tax_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `order_id` bigint(26) NOT NULL COMMENT '订单号',
  `tax` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '所交税额',
  `tax_return_rate` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '返税比',
  `fudou_rate` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '福豆兑换比',
  `fudou` int(11) NOT NULL DEFAULT '0' COMMENT '获得福豆数量',
  `operator` int(11) DEFAULT NULL COMMENT '解冻操作人',
  `thawable_at` timestamp NULL DEFAULT NULL COMMENT '可解冻时间',
  `thaw_at` timestamp NULL DEFAULT NULL COMMENT '解冻时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1不可解冻，2可解冻，3已解冻',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '返税时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业返税记录'




福豆变动记录
	获得
	可解冻
	使用

  `fudou_avaliable` int(11) DEFAULT '0' COMMENT '可用福豆数量',
  `fudou_can_thaw` int(11) DEFAULT '0' COMMENT '可解冻福豆数量',
  `fudou_frozen` int(11) DEFAULT '0' COMMENT '未解冻福豆数量',


CREATE TABLE `xb_company` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '企业全称',
  `account_id` int(11) unsigned NOT NULL COMMENT '企业账号',
  `account_balance` decimal(30,2) DEFAULT '0.00' COMMENT '账户余额，记录打款失败金额',
  `legal_person` varchar(50) NOT NULL COMMENT '企业法人',
  `phone` varchar(15) NOT NULL COMMENT '公司联系电话',
  `province_id` smallint(6) NOT NULL COMMENT '所在省份ID',
  `city_id` smallint(6) NOT NULL COMMENT '所在市ID',
  `district_id` smallint(6) NOT NULL COMMENT '区域ID',
  `address` varchar(50) NOT NULL COMMENT '企业详细地址 ',
  `regtime` date NOT NULL COMMENT '企业成立时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:合作中 2:结束合作',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:无银行账户，2有独立账户',
  `has_tax_return` tinyint(1) DEFAULT '2' COMMENT '个税返还状态，1返还，2不返还',
  `service_fee` decimal(10,2) DEFAULT '0.00' COMMENT '服务费收费标准（元 / 人 / 次）',
  `tax_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '开票税金比例 ',
  `has_insurance` tinyint(1) DEFAULT '2' COMMENT '是否有商保，1有，2无',
  `insurance_fee` decimal(10,2) DEFAULT '0.00' COMMENT '商保收费标准（元 ／月）',
  `has_disabled_gold` tinyint(1) DEFAULT '2' COMMENT '是否代缴残疾金，1是，2否',
  `disabled_fee` decimal(10,2) DEFAULT '0.00' COMMENT '残疾金收费标准（元 ／月）',
  `disabled_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '残疾金开票税金比例 ',
  `insurance_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '商保开票税金比',
  `tax_return_rate` decimal(5,2) DEFAULT '0.00' COMMENT '个税返还比',
  `fudou_avaliable` int(11) DEFAULT '0' COMMENT '可用福豆数量',
  `fudou_can_thaw` int(11) DEFAULT '0' COMMENT '可解冻福豆数量',
  `fudou_frozen` int(11) DEFAULT '0' COMMENT '未解冻福豆数量',
  `join_at` timestamp NULL DEFAULT NULL COMMENT '开始合作时间',
  `quit_at` timestamp NULL DEFAULT NULL COMMENT '结束合作时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `account_id` (`account_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='企业表'

ALTER TABLE `xb_salary_order` MODIFY   `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计,2已计福豆';


SHOW CREATE TABLE `xb_employee`;

CREATE TABLE `xb_salary_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `title` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_type` tinyint(1) DEFAULT '1' COMMENT '订单类型1无账户订单，2自主账户订单,参照company.type',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '工资发放日',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款状态，1未打款，2打款中，3完成打款，结果查询中，4完成结果查询',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0未提交，1已提交,未确认，2被拒绝，3待发放，4已发放，5发放中',
  `should_pay_num` int(10) DEFAULT '0' COMMENT '需打款人数',
  `should_pay_tax` decimal(20,2) DEFAULT '0.00' COMMENT '需付个税总金额',
  `should_pay_salary` decimal(20,2) DEFAULT '0.00' COMMENT '需付薪资总金额',
  `payed_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税总额',
  `payed_salary_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税前金额',
  `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计',
  `payed_success_count` smallint(5) DEFAULT '0' COMMENT '打款成功数量',
  `submit_at` timestamp NULL DEFAULT NULL COMMENT '提交时间',
  `confirm_at` timestamp NULL DEFAULT NULL COMMENT '确认时间',
  `refuse_at` timestamp NULL DEFAULT NULL COMMENT '拒绝时间',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',
  `refuse_reason` varchar(225) DEFAULT NULL COMMENT '拒绝理由',
  `operator_id` varchar(11) DEFAULT NULL COMMENT '最后操作人ID',
  `lastedit_at` timestamp NULL DEFAULT NULL COMMENT '最后操作时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  KEY `company_id` (`company_id`),
  KEY `payed_statistics_status` (`payed_statistics_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发放工资订单主表'




CREATE TABLE `xb_statement` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `service_num` int(10) DEFAULT '0' COMMENT '服务人数',
  `service_fee` decimal(10,2) DEFAULT '0.00' COMMENT '服务费收费标准（元 / 人 / 次）',
  `tax_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '开票税金比例 ',
  `has_insurance` tinyint(1) DEFAULT '2' COMMENT '是否有商保，1有，2无',
  `insurance_num` int(10) DEFAULT '0' COMMENT '商保代缴人数',
  `insurance_fee` decimal(10,2) DEFAULT '0.00' COMMENT '商保收费标准（元 ／月）',
  `insurance_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '商保开票税金比',
  `has_disabled_gold` tinyint(1) DEFAULT '2' COMMENT '是否代缴残疾金，1是，2否',
  `disabled_num` int(10) DEFAULT '0' COMMENT '残疾金代缴人数',
  `disabled_fee` decimal(10,2) DEFAULT '0.00' COMMENT '残疾金收费标准（元 ／月）',
  `disabled_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '残疾金开票税金比例 ',
  `total_fee` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '结算总费用',
  `receive_unit` varchar(100) DEFAULT NULL COMMENT '收款方单位名',
  `receive_card_no` varchar(30) DEFAULT NULL COMMENT '收款方银行卡号',
  `receive_bankname` varchar(50) DEFAULT NULL COMMENT '收款方开户行',
  `receive_contact` varchar(20) DEFAULT NULL COMMENT '收款方联系方式',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算表'



SHOW CREATE TABLE `xb_statement`;


CREATE TABLE `xb_salary_pay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `truename` varchar(60) NOT NULL COMMENT '真实姓名',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_id` bigint(26) NOT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL COMMENT '员工编号',
  `card_no` varchar(40) DEFAULT '0' COMMENT '银行卡号',
  `bank_name` varchar(40) DEFAULT '0' COMMENT '银行名称',
  `salary` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '薪资',
  `tax` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '税',
  `taxation_point` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '个税起征点',
  `tax_rate` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '税率',
  `quick_deduction` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '速算扣除数',
  `seperate_tag` smallint(6) NOT NULL DEFAULT '0' COMMENT '分割FLAG',
  `salary_accumulated` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '本月累计预发放、已过审核，打款未失败',
  `tax_accumulated` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '本月已计税额，已过审核，打款未失败',
  `tax_expected` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '实际需要总税额，月收入合并计税',
  `result_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款结果，0成功 ，1失败',
  `process_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '处理状态，1未打款，2已打款，3等待结果，0得到结果',
  `api_type` smallint(2) NOT NULL DEFAULT '0' COMMENT '支付接口类别0代表直接支付，1代表网银贷记',
  `pay_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `query_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `YURREF` varchar(30) DEFAULT NULL COMMENT '业务参考号',
  `REQNBR` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',
  `reason` varchar(50) DEFAULT NULL COMMENT '失败原因',
  `success_at` timestamp NULL DEFAULT NULL COMMENT '打款成功时间',
  `failed_at` timestamp NULL DEFAULT NULL COMMENT '打款失败时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新日期',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `YURREF` (`YURREF`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `process_status` (`process_status`),
  KEY `result_status` (`result_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4800 DEFAULT CHARSET=utf8 COMMENT='发放工资订单子表'




SELECT * 
FROM xb_salary_pay p JOIN xb_salary_order o on p.order_id = o.order_id
WHERE uid = ''
AND o.`status`  




SHOW create TABLE xb_salary_pay


CREATE TABLE `xb_salary_pay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `truename` varchar(60) NOT NULL COMMENT '真实姓名',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_id` bigint(26) NOT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL COMMENT '员工编号',
  `card_no` varchar(40) DEFAULT '0' COMMENT '银行卡号',
  `bank_name` varchar(40) DEFAULT '0' COMMENT '银行名称',
  `salary` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '薪资',
#  `seperate_tag` int(11) NOT NULL DEFAULT '0' COMMENT '超5w分割标记',
  `tax` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '税',
  `taxation_point` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '个税起征点',
  `tax_rate` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '税率',
  `quick_deduction` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '速算扣除数',

### 本次发放 
### 适用税率

## 本月累计预发放、已发放
`salary_accumulated`  decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '本月累计预发放、已过审核，打款未失败',
## 本月已计税额，已过审核，打款未失败
`tax_accumulated`  decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '本月已计税额，已过审核，打款未失败',
## 实际需要总税额
`tax_expected`  decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '实际需要总税额，月收入合并计税',




  `result_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款结果，0成功 ，1失败',
  `process_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '处理状态，1未打款，2已打款，3等待结果，0得到结果',
  `api_type` smallint(2) NOT NULL DEFAULT '0' COMMENT '支付接口类别0代表直接支付，1代表网银贷记',
  `pay_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `query_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `YURREF` varchar(30) DEFAULT NULL COMMENT '业务参考号',
  `REQNBR` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',
  `reason` varchar(50) DEFAULT NULL COMMENT '失败原因',
  `success_at` timestamp NULL DEFAULT NULL COMMENT '打款成功时间',
  `failed_at` timestamp NULL DEFAULT NULL COMMENT '打款失败时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新日期',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `YURREF` (`YURREF`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `process_status` (`process_status`),
  KEY `result_status` (`result_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4674 DEFAULT CHARSET=utf8 COMMENT='发放工资订单子表';



ALTER TABLE xb_salary_pay DROP COLUMN `seperate_tag`;
ALTER TABLE xb_salary_pay ADD COLUMN `salary_accumulated`  decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '本月累计预发放、已过审核，打款未失败' AFTER `quick_deduction`;
ALTER TABLE xb_salary_pay ADD COLUMN `tax_accumulated`  decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '本月已计税额，已过审核，打款未失败' AFTER `salary_accumulated`;
ALTER TABLE xb_salary_pay ADD COLUMN `tax_expected`  decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '实际需要总税额，月收入合并计税' AFTER `tax_accumulated`;

ALTER TABLE xb_salary_pay ADD COLUMN `seperate_tag`  SMALLINT NOT NULL DEFAULT 0 COMMENT '分割FLAG' AFTER `quick_deduction`;


SHOW CREATE TABLE `xb_company`;
CREATE TABLE `xb_company` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '企业全称',
  `account_id` int(11) unsigned NOT NULL COMMENT '企业账号',
  `account_balance` decimal(30,2) DEFAULT '0.00' COMMENT '账户余额，记录打款失败金额',
  `legal_person` varchar(50) NOT NULL COMMENT '企业法人',
  `phone` varchar(15) NOT NULL COMMENT '公司联系电话',
  `province_id` smallint(6) NOT NULL COMMENT '所在省份ID',
  `city_id` smallint(6) NOT NULL COMMENT '所在市ID',
  `district_id` smallint(6) NOT NULL COMMENT '区域ID',
  `address` varchar(50) NOT NULL COMMENT '企业详细地址 ',
  `regtime` date NOT NULL COMMENT '企业成立时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:合作中 2:结束合作',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:无银行账户，2有独立账户',
  `has_tax_return` tinyint(1) DEFAULT '2' COMMENT '个税返还状态，1返还，2不返还',
  `service_fee` decimal(10,2) DEFAULT '0.00' COMMENT '服务费收费标准（元 / 人 / 次）',
  `tax_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '开票税金比例 ',
  `has_insurance` tinyint(1) DEFAULT '2' COMMENT '是否有商保，1有，2无',
  `insurance_fee` decimal(10,2) DEFAULT '0.00' COMMENT '商保收费标准（元 ／月）',
  `has_disabled_gold` tinyint(1) DEFAULT '2' COMMENT '是否代缴残疾金，1是，2否',
  `disabled_fee` decimal(10,2) DEFAULT '0.00' COMMENT '残疾金收费标准（元 ／月）',
  `disabled_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '残疾金开票税金比例 ',
  `insurance_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '商保开票税金比',
  `tax_return_rate` decimal(5,2) DEFAULT '0.00' COMMENT '个税返还比',
  `fudou_avaliable` int(11) DEFAULT '0' COMMENT '可用福豆数量',
  `fudou_can_thaw` int(11) DEFAULT '0' COMMENT '可解冻福豆数量',
  `fudou_frozen` int(11) DEFAULT '0' COMMENT '未解冻福豆数量',
  `join_at` timestamp NULL DEFAULT NULL COMMENT '开始合作时间',
  `quit_at` timestamp NULL DEFAULT NULL COMMENT '结束合作时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `account_id` (`account_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='企业表'

  `fudou_avaliable` int(11) DEFAULT '0' COMMENT '可用福豆数量',
  `fudou_can_thaw` int(11) DEFAULT '0' COMMENT '可解冻福豆数量',
  `fudou_frozen` int(11) DEFAULT '0' COMMENT '未解冻福豆数量',

ALTER TABLE `xb_company` DROP COLUMN `fudou`;

ALTER TABLE `xb_company` ADD COLUMN `fudou_avaliable` int(11) DEFAULT '0' COMMENT '可用福豆数量' AFTER `tax_return_rate`;
ALTER TABLE `xb_company` ADD COLUMN `fudou_can_thaw` int(11) DEFAULT '0' COMMENT '可解冻福豆数量' AFTER `fudou_avaliable`;
ALTER TABLE `xb_company` ADD COLUMN `fudou_frozen` int(11) DEFAULT '0' COMMENT '未解冻福豆数量' AFTER `fudou_can_thaw`;

增加、修改、解冻


CREATE TABLE `xb_tax_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `order_id` bigint(26) NOT NULL COMMENT '订单号',
  `pay_id` int(11) DEFAULT NULL COMMENT '订单支付项编号',
  `tax` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '所交税额',
  `tax_return_rate` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '返税比',
  `fudou_rate` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '福豆兑换比',
  `fudou` int(11) NOT NULL DEFAULT '0' COMMENT '获得福豆数量',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个税返还记录'

CREATE TABLE `xb_company_fudou_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL COMMENT '账户ID',
  `amount` decimal(30,2) DEFAULT '0.00' COMMENT '金额',
  `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出0：转出，1.转入',
  `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，1薪资发放失败转入，2后台转出',
  `event_name` varchar(100) DEFAULT NULL COMMENT '事件名称',
  `after_rest_amt` decimal(30,2) DEFAULT '0.00' COMMENT '之后余额',
  `relation_id` bigint(26) DEFAULT NULL COMMENT '事件关联ID，et = 0 company_profit_id,salary_pay_id,withdraw_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='企业余额变动表'






SELECT
	`xb_salary_pay`.`id` AS `pay_id`,
	`xb_salary_pay`.`order_id`,
	`xb_salary_pay`.`salary`,
	`xb_salary_pay`.`tax`,
	`xb_salary_pay`.`bank_name`,
	`xb_salary_pay`.`card_no`,
	`xb_salary_pay`.`result_status`,
	`xb_salary_pay`.`reason`,
	`xb_salary_pay`.`process_status`,
	`xb_salary_pay`.`truename`
FROM
	`xb_salary_order`
INNER JOIN `xb_salary_pay` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
LIMIT 20 OFFSET 380 


CREATE TABLE `xb_salary_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `title` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_type` tinyint(1) DEFAULT '1' COMMENT '订单类型1无账户订单，2自主账户订单',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '工资发放日',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款状态，1未打款，2打款中，3完成打款，结果查询中，4完成结果查询',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0未提交，1已提交,未确认，2被拒绝，3待发放，4已发放，5发放中',
  `should_pay_num` int(10) DEFAULT '0' COMMENT '需打款人数',
  `should_pay_tax` decimal(20,2) DEFAULT '0.00' COMMENT '需付个税总金额',
  `should_pay_salary` decimal(20,2) DEFAULT '0.00' COMMENT '需付薪资总金额',
  `payed_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税总额',
  `payed_salary_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税前金额',
  `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计',
  `payed_success_count` smallint(5) DEFAULT '0' COMMENT '打款成功数量',
  `submit_at` timestamp NULL DEFAULT NULL COMMENT '提交时间',
  `confirm_at` timestamp NULL DEFAULT NULL COMMENT '确认时间',
  `refuse_at` timestamp NULL DEFAULT NULL COMMENT '拒绝时间',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',
  `refuse_reason` varchar(225) DEFAULT NULL COMMENT '拒绝理由',
  `operator_id` varchar(11) DEFAULT NULL COMMENT '最后操作人ID',
  `lastedit_at` timestamp NULL DEFAULT NULL COMMENT '最后操作时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  KEY `company_id` (`company_id`),
  KEY `payed_statistics_status` (`payed_statistics_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发放工资订单主表'


SHOW CREATE TABLE xb_salary_order

            'company.service_fee',
            'company.tax_invoice_proportion',
            'company.has_insurance',
            'company.insurance_fee',
            'company.insurance_invoice_proportion',
            'company.has_disabled_gold',
            'company.disabled_fee',
            'company.disabled_invoice_proportion',


SHOW CREATE TABLE xb_company

CREATE TABLE `xb_company` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '企业全称',
  `account_id` int(11) unsigned NOT NULL COMMENT '企业账号',
  `account_balance` decimal(30,2) DEFAULT '0.00' COMMENT '账户余额，记录打款失败金额',
  `legal_person` varchar(50) NOT NULL COMMENT '企业法人',
  `phone` varchar(15) NOT NULL COMMENT '公司联系电话',
  `province_id` smallint(6) NOT NULL COMMENT '所在省份ID',
  `city_id` smallint(6) NOT NULL COMMENT '所在市ID',
  `district_id` smallint(6) NOT NULL COMMENT '区域ID',
  `address` varchar(50) NOT NULL COMMENT '企业详细地址 ',
  `regtime` date NOT NULL COMMENT '企业成立时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:合作中 2:结束合作',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:无银行账户，2有独立账户',
  `has_tax_return` tinyint(1) DEFAULT '2' COMMENT '个税返还状态，1返还，2不返还',
  `service_fee` decimal(10,2) DEFAULT '0.00' COMMENT '服务费收费标准（元 / 人 / 次）',
  `tax_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '开票税金比例 ',
  `has_insurance` tinyint(1) DEFAULT '2' COMMENT '是否有商保，1有，2无',
  `insurance_fee` decimal(10,2) DEFAULT '0.00' COMMENT '商保收费标准（元 ／月）',
  `has_disabled_gold` tinyint(1) DEFAULT '2' COMMENT '是否代缴残疾金，1是，2否',
  `disabled_fee` decimal(10,2) DEFAULT '0.00' COMMENT '残疾金收费标准（元 ／月）',
  `disabled_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '残疾金开票税金比例 ',
  `insurance_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '商保开票税金比',
  `tax_return_rate` decimal(5,2) DEFAULT '0.00' COMMENT '个税返还比',
  `fudou` int(11) DEFAULT '0' COMMENT '福豆数量',
  `join_at` timestamp NULL DEFAULT NULL COMMENT '开始合作时间',
  `quit_at` timestamp NULL DEFAULT NULL COMMENT '结束合作时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `account_id` (`account_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='企业表'




DROP TABLE IF EXISTS `xb_statement`;
CREATE TABLE `xb_statement`(
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `service_num` int(10) DEFAULT '0' COMMENT '服务人数',
  `service_fee` decimal(10,2) DEFAULT '0.00' COMMENT '服务费收费标准（元 / 人 / 次）',
  `tax_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '开票税金比例 ',
  `has_insurance` tinyint(1) DEFAULT '2' COMMENT '是否有商保，1有，2无',
  `insurance_num` int(10) DEFAULT '0' COMMENT '商保代缴人数',
  `insurance_fee` decimal(10,2) DEFAULT '0.00' COMMENT '商保收费标准（元 ／月）',
  `insurance_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '商保开票税金比',
  `has_disabled_gold` tinyint(1) DEFAULT '2' COMMENT '是否代缴残疾金，1是，2否',
  `disabled_num` int(10) DEFAULT '0' COMMENT '残疾金代缴人数',
  `disabled_fee` decimal(10,2) DEFAULT '0.00' COMMENT '残疾金收费标准（元 ／月）',
  `disabled_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '残疾金开票税金比例 ',
  `total_fee` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '结算总费用',
  `receive_unit` varchar(100) DEFAULT NULL COMMENT '收款方单位名',
  `receive_card_no` varchar(30) DEFAULT NULL COMMENT '收款方银行卡号',
  `receive_bankname` varchar(50) DEFAULT NULL COMMENT '收款方开户行',
  `receive_contact` varchar(20) DEFAULT NULL COMMENT '收款方联系方式',
  PRIMARY KEY (`order_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算表'




CREATE TABLE `xb_salary_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `title` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_type` tinyint(1) DEFAULT '1' COMMENT '订单类型1自主账户订单，2无账户订单',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '工资发放日',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款状态，1未打款，2打款中，3完成打款，结果查询中，4完成结果查询',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0未提交，1已提交,未确认，2被拒绝，3待发放，4已发放，5发放中',
  `should_pay_num` int(10) DEFAULT '0' COMMENT '需打款人数',
  `should_pay_tax` decimal(20,2) DEFAULT '0.00' COMMENT '需付个税总金额',
  `should_pay_salary` decimal(20,2) DEFAULT '0.00' COMMENT '需付薪资总金额',

  `payed_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税总额',
  `payed_salary_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税前金额',
  `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计',
  `payed_success_count` smallint(5) DEFAULT '0' COMMENT '打款成功数量',
  `submit_at` timestamp NULL DEFAULT NULL COMMENT '提交时间',
  `confirm_at` timestamp NULL DEFAULT NULL COMMENT '确认时间',
  `refuse_at` timestamp NULL DEFAULT NULL COMMENT '拒绝时间',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',
  `refuse_reason` varchar(225) DEFAULT NULL COMMENT '拒绝理由',
  `operator_id` varchar(11) DEFAULT NULL COMMENT '最后操作人ID',
  `lastedit_at` timestamp NULL DEFAULT NULL COMMENT '最后操作时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  KEY `company_id` (`company_id`),
  KEY `payed_statistics_status` (`payed_statistics_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发放工资订单主表'


SHOW CREATE TABLE `xb_company`;
CREATE TABLE `xb_company` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '企业全称',
  `account_id` int(11) unsigned NOT NULL COMMENT '企业账号',
  `account_balance` decimal(30,2) DEFAULT '0.00' COMMENT '账户余额，记录打款失败金额',
  `legal_person` varchar(50) NOT NULL COMMENT '企业法人',
  `phone` varchar(15) NOT NULL COMMENT '公司联系电话',
  `province_id` smallint(6) NOT NULL COMMENT '所在省份ID',
  `city_id` smallint(6) NOT NULL COMMENT '所在市ID',
  `district_id` smallint(6) NOT NULL COMMENT '区域ID',
  `address` varchar(50) NOT NULL COMMENT '企业详细地址 ',
  `regtime` date NOT NULL COMMENT '企业成立时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:合作中 2:结束合作',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:无银行账户，2有独立账户',
  `has_tax_return` tinyint(1) DEFAULT '2' COMMENT '个税返还状态，1返还，2不返还',
  `service_fee` decimal(10,2) DEFAULT '0.00' COMMENT '服务费收费标准（元 / 人 / 次）',
  `tax_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '开票税金比例 ',
  `has_insurance` tinyint(1) DEFAULT '2' COMMENT '是否有商保，1有，2无',
  `insurance_fee` decimal(10,2) DEFAULT '0.00' COMMENT '商保收费标准（元 ／月）',
  `has_disabled_gold` tinyint(1) DEFAULT '2' COMMENT '是否代缴残疾金，1是，2否',
  `disabled_fee` decimal(10,2) DEFAULT '0.00' COMMENT '残疾金收费标准（元 ／月）',
  `disabled_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '残疾金开票税金比例 ',
  `insurance_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '商保开票税金比',
  `tax_return_rate` decimal(5,2) DEFAULT '0.00' COMMENT '个税返还比',
  `fudou` int(11) DEFAULT '0' COMMENT '福豆数量',
  `join_at` timestamp NULL DEFAULT NULL COMMENT '开始合作时间',
  `quit_at` timestamp NULL DEFAULT NULL COMMENT '结束合作时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `account_id` (`account_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='企业表'
ALTER TABLE `xb_company` MODIFY COLUMN `regtime` date NOT NULL COMMENT '企业成立时间';

ALTER TABLE `xb_company` MODIFY COLUMN `has_tax_return` tinyint(1) DEFAULT '0' COMMENT '个税返还状态，1返还，2不返还';

DELETE FROM xb_employee;
DELETE FROM xb_employee_company;
DELETE FROM xb_employee_quit;
DELETE FROM xb_employee_change_log;



SELECT
	`xb_employee`.`uid`,
	`xb_employee`.`truename`,
	`xb_employee`.`phone`,
	`xb_employee_company`.`bank_name`,
	`xb_employee_company`.`card_no`,
	`xb_employee_company`.`id` AS `employee_company_id`,
	`xb_employee_company`.`user_no`,
	`xb_employee_company`.`company_id`,
	`xb_employee_company`.`status`
FROM
	`xb_employee`
LEFT JOIN `xb_employee_company` ON `xb_employee`.`uid` = `xb_employee_company`.`uid`
AND `xb_employee_company`.`company_id` = '155'
WHERE
	`identity` = '110101200704011650'
LIMIT 1 


DROP TABLE IF EXISTS `xb_config`;
CREATE TABLE `xb_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT '键',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `info` varchar(100) DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='配置表';


SHOW CREATE TABLE xb_company;

DROP TABLE IF EXISTS `xb_company`;
CREATE TABLE `xb_company` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '企业全称',
  `account_id` int(11) unsigned NOT NULL COMMENT '企业账号',
  `account_balance` decimal(30,2) DEFAULT '0.00' COMMENT '账户余额，记录打款失败金额',
  `legal_person` varchar(50) NOT NULL COMMENT '企业法人',
  `phone` varchar(15) NOT NULL COMMENT '公司联系电话',
  `province_id` smallint(6) NOT NULL COMMENT '所在省份ID',
  `city_id` smallint(6) NOT NULL COMMENT '所在市ID',
  `district_id` smallint(6) NOT NULL COMMENT '区域ID',
  `address` varchar(50) NOT NULL COMMENT '企业详细地址 ',
  `regtime` datetime NOT NULL COMMENT '企业成立时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:合作中 2:结束合作',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:无银行账户，2有独立账户',
  `has_tax_return` tinyint(1) DEFAULT '0' COMMENT '个税返还状态，0不返还，1返还',
  `service_fee` decimal(10,2) DEFAULT '0.00' COMMENT '服务费收费标准（元 / 人 / 次）',
  `tax_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '开票税金比例 ',
  `has_insurance` tinyint(1) DEFAULT '0' COMMENT '是否有商保，0无，1有',
  `insurance_fee` decimal(10,2) DEFAULT '0.00' COMMENT '商保收费标准（元 ／月）',
  `insurance_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '商保开票税金比',
  `join_at` timestamp NULL DEFAULT NULL COMMENT '开始合作时间',
  `quit_at` timestamp NULL DEFAULT NULL COMMENT '结束合作时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `account_id` (`account_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='企业表'


服务费收费标准、每人
开票税金比例  tax_invoice_proportion
是否有商保
商保收费标准
商保开票税金比

ALTER TABLE `xb_company` ADD COLUMN `has_tax_return` TINYINT(1) NULL DEFAULT '0' COMMENT '个税返还状态，0不返还，1返还' AFTER `type`;
ALTER TABLE `xb_company` ADD COLUMN `service_fee` DECIMAL(10,2) NULL DEFAULT '0.00' COMMENT '服务费收费标准（元 / 人 / 次）' AFTER `has_tax_return`;
ALTER TABLE `xb_company` ADD COLUMN `tax_invoice_proportion` DECIMAL(5,2) NULL DEFAULT '0.00' COMMENT '开票税金比例 ' AFTER `service_fee`;
ALTER TABLE `xb_company` ADD COLUMN `has_insurance` TINYINT(1) NULL DEFAULT '0' COMMENT '是否有商保，0无，1有'  AFTER `tax_invoice_proportion`;
ALTER TABLE `xb_company` ADD COLUMN `insurance_fee` DECIMAL(10,2) NULL DEFAULT '0.00' COMMENT '商保收费标准（元 ／月）' AFTER `has_insurance`;
ALTER TABLE `xb_company` ADD COLUMN `insurance_invoice_proportion` DECIMAL(5,2) NULL DEFAULT '0.00' COMMENT '商保开票税金比' AFTER `insurance_fee`;

ALTER TABLE `xb_company` ADD COLUMN `tax_return_rate` DECIMAL(5,2) NULL DEFAULT '0.00' COMMENT '个税返还比' AFTER `insurance_invoice_proportion`;
ALTER TABLE `xb_company` ADD COLUMN `fudou` DECIMAL(10,2) NULL DEFAULT '0.00' COMMENT 'f福豆数量' AFTER `tax_return_rate`;



DROP TABLE IF EXISTS `xb_employees_payway`;
CREATE TABLE `xb_employees_payway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户账户ID',
  `card_no` varchar(40) DEFAULT NULL COMMENT '打款账户',
  `bank_name` varchar(40) DEFAULT NULL COMMENT '银行名称',
  `company_id` int(11) NOT NULL COMMENT '用户所属公司账户ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='用户支付方式表';


DROP TABLE IF EXISTS `xb_department`;
CREATE TABLE `xb_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL COMMENT '所属公司',
  `department_name` varchar(20) DEFAULT NULL COMMENT '名称',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='企业部门表';


离职快照


DROP TABLE IF EXISTS `xb_employees_quit`;
CREATE TABLE `xb_employees_quit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',

  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
	`payway_id` int(11) DEFAULT NULL COMMENT '支付方式ID',
  `join_at` timestamp NULL DEFAULT NULL COMMENT '入职时间',
  `quit_at` timestamp NULL DEFAULT NULL COMMENT '离职时间',

  `user_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `truename` varchar(30) DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `department_name` varchar(20) DEFAULT NULL COMMENT '名称',
  `card_no` varchar(40) DEFAULT NULL COMMENT '打款账户',
  `bank_name` varchar(40) DEFAULT NULL COMMENT '银行名称',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='员工离职日志';



DROP TABLE IF EXISTS `xb_employees_change_log`;
CREATE TABLE `xb_employees_change_log` (
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




DROP TABLE IF EXISTS `xb_employees_company`;
CREATE TABLE `xb_employees_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
	`payway_id` int(11) DEFAULT NULL COMMENT '支付方式ID',
  `user_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `join_at` timestamp NULL DEFAULT NULL COMMENT '入职时间',
  `quit_at` timestamp NULL DEFAULT NULL COMMENT '离职时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '在职状态状态1在职0离职',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='员工企业关系表';

DROP TABLE IF EXISTS `xb_employees`;
CREATE TABLE `xb_employees` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account` varchar(30) DEFAULT NULL COMMENT '用户登录账户名',
  `password` varchar(30) DEFAULT NULL COMMENT '用户密码',
  `truename` varchar(30) DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `identity` varchar(20) DEFAULT NULL COMMENT '身份证',
  `account_status` tinyint(2) unsigned DEFAULT '0' COMMENT '账户状态 0 启用 ，1 停用 ， 2 删除',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `identity` (`identity`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='员工表';


##SHOW CREATE TABLE xb_salary_pay

DROP TABLE IF EXISTS `xb_salary_pay`;
CREATE TABLE `xb_salary_pay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_id` bigint(26) NOT NULL COMMENT '订单号',

	`employees_id`  int(11) NOT NULL COMMENT '员工编号',

  `truename` varchar(30) NOT NULL COMMENT '真实姓名',
  `card_no` varchar(40) DEFAULT NULL COMMENT '银行卡号',
  `bank_name` varchar(40) DEFAULT NULL COMMENT '银行名称',
  `salary` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '薪资',
	`tax` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '税',

	`taxation_point` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '个税起征点',
	`tax_rate` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '税率',
	`quick_deduction` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '速算扣除数',
	`service_fee` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '服务费',
	`invoice_fee` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '开票费用',


  `result_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款结果，0成功 ，1失败',
  `process_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '处理状态，1未打款，2已打款，3等待结果，0得到结果',
  `api_type` smallint(2) NOT NULL DEFAULT '0' COMMENT '支付接口类别0代表直接支付，1代表网银贷记',
  `pay_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `query_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `YURREF` varchar(30) DEFAULT NULL COMMENT '业务参考号',
  `REQNBR` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',
  `reason` varchar(50) DEFAULT NULL COMMENT '失败原因',
  `success_at` timestamp NULL DEFAULT NULL COMMENT '打款成功时间',
  `failed_at` timestamp NULL DEFAULT NULL COMMENT '打款失败时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新日期',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `YURREF` (`YURREF`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `process_status` (`process_status`),
  KEY `result_status` (`result_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发放工资订单子表';


ALTER TABLE `xb_salary_pay` ADD COLUMN `employees_id`  int(11) NOT NULL COMMENT '员工编号' AFTER `order_id`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `taxation_point` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '个税起征点' AFTER `tax`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `tax_rate` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '税率' AFTER `taxation_point`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `quick_deduction` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '速算扣除数' AFTER `tax_rate`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `service_fee` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '服务费' AFTER `quick_deduction`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `invoice_fee` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '开票费用' AFTER `service_fee`;


DROP TABLE IF EXISTS `xb_salary_order`;
CREATE TABLE `xb_salary_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `title` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '工资发放日',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款状态，1未打款，2打款中，3完成打款，结果查询中，4完成结果查询',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0未提交，1已提交,未确认，2被拒绝，3待发放，4已发放，5发放中',
  `should_pay_num` int(10) DEFAULT '0' COMMENT '需打款人数',
  `should_pay_tax` decimal(20,2) DEFAULT '0.00' COMMENT '需付个税总金额',
  `should_pay_salary` decimal(20,2) DEFAULT '0.00' COMMENT '需付薪资总金额',

	`invoice_fee` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '开票总费用',
  `receive_unit` varchar(100) DEFAULT NULL COMMENT '收款方单位名',
	`receive_card_no` varchar(30) DEFAULT NULL COMMENT '收款方银行卡号',
	`receive_bankname` varchar(50) DEFAULT NULL COMMENT '收款方开户行',
	`receive_contact` varchar(20) DEFAULT NULL COMMENT '收款方联系方式',

  `payed_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税总额',
  `payed_salary_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税前金额',
  `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计',
  `payed_success_count` smallint(5) DEFAULT '0' COMMENT '打款成功数量',
  `submit_at` timestamp NULL DEFAULT NULL COMMENT '提交时间',
  `confirm_at` timestamp NULL DEFAULT NULL COMMENT '确认时间',
  `refuse_at` timestamp NULL DEFAULT NULL COMMENT '拒绝时间',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',
  `refuse_reason` varchar(225) DEFAULT NULL COMMENT '拒绝理由',
  `operator_id` varchar(11) DEFAULT NULL COMMENT '最后操作人ID',
  `lastedit_at` timestamp NULL DEFAULT NULL COMMENT '最后操作时间',
  `created_at` timestamp NULL COMMENT '创建时间',
  `updated_at` timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  KEY `company_id` (`company_id`),
  KEY `payed_statistics_status` (`payed_statistics_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发放工资订单主表'

ALTER TABLE `xb_salary_order` ADD COLUMN `invoice_fee` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '开票总费用' AFTER `should_pay_salary`;
ALTER TABLE `xb_salary_order` ADD COLUMN `receive_unit` varchar(100) DEFAULT NULL COMMENT '收款方单位名' AFTER `invoice_fee`;
ALTER TABLE `xb_salary_order` ADD COLUMN `receive_card_no` varchar(30) DEFAULT NULL COMMENT '收款方银行卡号' AFTER `receive_unit`;
ALTER TABLE `xb_salary_order` ADD COLUMN `receive_bankname` varchar(50) DEFAULT NULL COMMENT '收款方开户行' AFTER `receive_card_no`;
ALTER TABLE `xb_salary_order` ADD COLUMN `receive_contact` varchar(20) DEFAULT NULL COMMENT '收款方联系方式' AFTER `receive_bankname`;


select * from `xb_operator` where `loginname` = 'ice@renrenfenqi.com'