
CREATE DATABASE `xb-str-0717`



DROP PROCEDURE IF EXISTS `insertDefaultPayrollProperties`;
CREATE PROCEDURE `insertDefaultPayrollProperties`()
BEGIN
	DECLARE _company_id int(11) ;
	DECLARE _company_id_str VARCHAR(255) ;
	DECLARE _done TINYINT ;
	DECLARE _cursor CURSOR FOR SELECT
			xb_company.company_id
		FROM
			xb_company
		LEFT JOIN xb_company_payroll_property ON xb_company.company_id = xb_company_payroll_property.company_id
		WHERE
			xb_company_payroll_property.id IS NULL;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET _done = 1 ;

	SET _done = 0 ;
	OPEN _cursor ;
	_cursor_loop:LOOP
		IF _done = 1 THEN
			LEAVE _cursor_loop;
		ELSE
			FETCH _cursor INTO _company_id;
			SET _company_id_str = CONCAT(_company_id_str,',',_company_id);
      INSERT INTO `xb_company_payroll_property` (`company_id`, `payroll_id`, `excel_sort`, `weixin_sort`, `is_weixin_show`, `created_at`)
			VALUES ( _company_id, 1, 1, 1, 2, now());
			INSERT INTO `xb_company_payroll_property` (`company_id`, `payroll_id`, `excel_sort`, `weixin_sort`, `is_weixin_show`, `created_at`)
			VALUES ( _company_id, 2, 2, 2, 2, now());
			INSERT INTO `xb_company_payroll_property` (`company_id`, `payroll_id`, `excel_sort`, `weixin_sort`, `is_weixin_show`, `created_at`)
			VALUES ( _company_id, 3, 3, 3, 2, now());
			INSERT INTO `xb_company_payroll_property` (`company_id`, `payroll_id`, `excel_sort`, `weixin_sort`, `is_weixin_show`, `created_at`)
			VALUES ( _company_id, 4, 4, 4, 2, now());
			INSERT INTO `xb_company_payroll_property` (`company_id`, `payroll_id`, `excel_sort`, `weixin_sort`, `is_weixin_show`, `created_at`)
			VALUES ( _company_id, 5, 5, 5, 2, now());
			INSERT INTO `xb_company_payroll_property` (`company_id`, `payroll_id`, `excel_sort`, `weixin_sort`, `is_weixin_show`, `created_at`)
			VALUES ( _company_id, 6, 6, 6, 2, now());
		END IF;
	END LOOP;
	SELECT _company_id_str;
END;




SHOW CREATE TABLE xb_payroll_property;

CREATE TABLE `xb_payroll_property` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '字段名',
  `type` tinyint(2) NOT NULL COMMENT '字段类别,1字符串，2金额，3整数',
  `width` tinyint(5) NOT NULL COMMENT '字段宽度',
  `validation` varchar(100) DEFAULT '' COMMENT '字段验证规则',
  `code` varchar(50) DEFAULT NULL COMMENT '字段CODE',
  `cal_mode` tinyint(2) NOT NULL COMMENT '计算模式,1不计算，2计算+，3计算-，4计算=',
  `limited_modification` tinyint(2) NOT NULL DEFAULT '2' COMMENT '是否限制修改，1是，2否',
  `required` tinyint(2) NOT NULL COMMENT '是否必须，1是，2否',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='工资单属性'



CREATE TABLE `xb_salary_payroll_value` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(26) NOT NULL COMMENT '订单号',
  `pay_id` int(10) DEFAULT NULL COMMENT 'xb_salary_pay的id',
  `payroll_id` int(11) NOT NULL COMMENT '工资单属性编号',
  `value` varchar(255) NOT NULL COMMENT '字段值',
  `name` varchar(60) NOT NULL COMMENT '字段名',
  `type` tinyint(2) NOT NULL COMMENT '字段类别,1字符串，2金额，3整数',
  `width` tinyint(5) NOT NULL COMMENT '字段宽度',
  `code` varchar(50) DEFAULT NULL COMMENT '字段CODE',
  `excel_sort` tinyint(5) NOT NULL COMMENT 'excel排序，小到大',
  `weixin_sort` tinyint(5) NOT NULL DEFAULT '0' COMMENT '微信显示排序，小到大',
  `is_weixin_show` tinyint(2) NOT NULL COMMENT '微信是否显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2025 DEFAULT CHARSET=utf8 COMMENT='企业工资单属性'



SELECT
	xb_salary_payroll_value.*, 
  xb_payroll_property. NAME,
	xb_payroll_property. CODE,
	xb_payroll_property.width,
	xb_payroll_property.type,
	xb_company_payroll_property.weixin_sort,
	xb_company_payroll_property.excel_sort,
	xb_company_payroll_property.is_weixin_show
FROM
	xb_salary_payroll_value
JOIN xb_salary_pay ON xb_salary_payroll_value.pay_id = xb_salary_pay.id
JOIN xb_payroll_property ON xb_salary_payroll_value.payroll_id = xb_payroll_property.id
JOIN xb_company_payroll_property ON xb_salary_payroll_value.payroll_id = xb_company_payroll_property.payroll_id
AND xb_company_payroll_property.company_id = xb_salary_pay.company_id
WHERE
	xb_salary_payroll_value.type = 0

SELECT
	xb_salary_payroll_value.*, 
  xb_payroll_property. NAME,
	xb_payroll_property. CODE,
	xb_payroll_property.width,
	xb_payroll_property.type,
	xb_company_payroll_property.weixin_sort,
	xb_company_payroll_property.excel_sort,
	xb_company_payroll_property.is_weixin_show
FROM
	xb_salary_payroll_value




UPDATE xb_salary_payroll_value
JOIN xb_salary_pay ON xb_salary_payroll_value.pay_id = xb_salary_pay.id
JOIN xb_payroll_property ON xb_salary_payroll_value.payroll_id = xb_payroll_property.id
JOIN xb_company_payroll_property ON xb_salary_payroll_value.payroll_id = xb_company_payroll_property.payroll_id
AND xb_company_payroll_property.company_id = xb_salary_pay.company_id
SET xb_salary_payroll_value.`name` = xb_payroll_property.`name`,
 xb_salary_payroll_value.`code` = xb_payroll_property.`code`,
 xb_salary_payroll_value.`width` = xb_payroll_property.`width`,
 xb_salary_payroll_value.`type` = xb_payroll_property.`type`,
 xb_salary_payroll_value.`weixin_sort` = xb_company_payroll_property.`weixin_sort`,
 xb_salary_payroll_value.`excel_sort` = xb_company_payroll_property.`excel_sort`,
 xb_salary_payroll_value.`is_weixin_show` = xb_company_payroll_property.`is_weixin_show`
WHERE
	xb_salary_payroll_value.type = 0




SHOW CREATE TABLE xb_salary_payroll_value_copy;

CREATE TABLE `xb_salary_payroll_value_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(26) NOT NULL COMMENT '订单号',
  `pay_id` int(10) DEFAULT NULL COMMENT 'xb_salary_pay的id',
  `payroll_id` int(11) NOT NULL COMMENT '工资单属性编号',
  `value` varchar(255) NOT NULL COMMENT '字段值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1955 DEFAULT CHARSET=utf8 COMMENT='企业工资单属性'


SHOW CREATE TABLE xb_payroll_property;

SHOW CREATE TABLE xb_company_payroll_property;

SHOW CREATE TABLE xb_salary_payroll_value;


CREATE TABLE `xb_company_payroll_property` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `payroll_id` int(11) NOT NULL COMMENT '工资单属性编号',
  `excel_sort` tinyint(5) NOT NULL COMMENT 'excel排序，小到大',
  `weixin_sort` tinyint(5) NOT NULL DEFAULT '0' COMMENT '微信显示排序，小到大',
  `is_weixin_show` tinyint(2) NOT NULL COMMENT '微信是否显示',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8 COMMENT='企业工资单属性'


CREATE TABLE `xb_payroll_property` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '字段名',
  `type` tinyint(2) NOT NULL COMMENT '字段类别,1字符串，2金额，3整数',
  `width` tinyint(5) NOT NULL COMMENT '字段宽度',
  `validation` varchar(100) DEFAULT '' COMMENT '字段验证规则',
  `code` varchar(50) DEFAULT NULL COMMENT '字段CODE',
  `cal_mode` tinyint(2) NOT NULL COMMENT '计算模式,1不计算，2计算+，3计算-，4计算=',
  `limited_modification` tinyint(2) NOT NULL DEFAULT '2' COMMENT '是否限制修改，1是，2否',
  `required` tinyint(2) NOT NULL COMMENT '是否必须，1是，2否',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='工资单属性'


DROP TABLE IF EXISTS xb_salary_payroll_value;
CREATE TABLE `xb_salary_payroll_value` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(26) NOT NULL COMMENT '订单号',
  `pay_id` int(10) DEFAULT NULL COMMENT 'xb_salary_pay的id',

  `name` varchar(60) NOT NULL COMMENT '字段名',
  `type` tinyint(2) NOT NULL COMMENT '字段类别,1字符串，2金额，3整数',
  `width` tinyint(5) NOT NULL COMMENT '字段宽度',
  `code` varchar(50) DEFAULT NULL COMMENT '字段CODE',
  `excel_sort` tinyint(5) NOT NULL COMMENT 'excel排序，小到大',
  `weixin_sort` tinyint(5) NOT NULL DEFAULT '0' COMMENT '微信显示排序，小到大',
  `is_weixin_show` tinyint(2) NOT NULL COMMENT '微信是否显示',

  `value` varchar(255) NOT NULL COMMENT '字段值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1955 DEFAULT CHARSET=utf8 COMMENT='企业工资单属性'

ALTER TABLE xb_salary_payroll_value ADD COLUMN   `name` varchar(60) NOT NULL COMMENT '字段名' ; 
ALTER TABLE xb_salary_payroll_value ADD COLUMN   `type` tinyint(2) NOT NULL COMMENT '字段类别,1字符串，2金额，3整数';
ALTER TABLE xb_salary_payroll_value ADD COLUMN   `width` tinyint(5) NOT NULL COMMENT '字段宽度';
ALTER TABLE xb_salary_payroll_value ADD COLUMN   `code` varchar(50) DEFAULT NULL COMMENT '字段CODE';
ALTER TABLE xb_salary_payroll_value ADD COLUMN   `excel_sort` tinyint(5) NOT NULL COMMENT 'excel排序，小到大';
ALTER TABLE xb_salary_payroll_value ADD COLUMN   `weixin_sort` tinyint(5) NOT NULL DEFAULT '0' COMMENT '微信显示排序，小到大';
ALTER TABLE xb_salary_payroll_value ADD COLUMN   `is_weixin_show` tinyint(2) NOT NULL COMMENT '微信是否显示';






DROP TABLE IF EXISTS xb_salary_payroll_value;
CREATE TABLE `xb_salary_payroll_value` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(26) NOT NULL COMMENT '订单号',
  `pay_id` int(10) DEFAULT NULL COMMENT 'xb_salary_pay的id',
  `payroll_id` int(11) NOT NULL COMMENT '工资单属性编号',
  `value` varchar(255) NOT NULL COMMENT '字段值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1955 DEFAULT CHARSET=utf8 COMMENT='企业工资单属性'





SHOW CREATE TABLE xb_validate_rules 

ALTER TABLE xb_employee DROP COLUMN account;


DROP TABLE IF EXISTS `xb_validate_rules`;
CREATE TABLE `xb_validate_rules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_zh` varchar(60) NOT NULL COMMENT '规则中文名',
  `name_en` varchar(60) NOT NULL COMMENT '规则英文名',
  `rule_prefix` varchar(60) NOT NULL COMMENT '规则',
  `desc` varchar(100) DEFAULT '' COMMENT '规则功能描述',
  `param_num` tinyint(2) NOT NULL COMMENT '参数数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='验证规则表'

INSERT INTO `xb_validate_rules` (`id`, `name_zh`, `name_en`, `rule_prefix`, `desc`, `param_num`) VALUES ('1', '可选', 'sometimes', 'sometimes', '', '0');
INSERT INTO `xb_validate_rules` (`id`, `name_zh`, `name_en`, `rule_prefix`, `desc`, `param_num`) VALUES ('2', '必填', 'required', 'required', '', '0');
INSERT INTO `xb_validate_rules` (`id`, `name_zh`, `name_en`, `rule_prefix`, `desc`, `param_num`) VALUES ('3', '长度范围', 'between', 'between', '', '2');
INSERT INTO `xb_validate_rules` (`id`, `name_zh`, `name_en`, `rule_prefix`, `desc`, `param_num`) VALUES ('4', '特殊字符检测', 'specialChar', 'specialChar', '', '0');
INSERT INTO `xb_validate_rules` (`id`, `name_zh`, `name_en`, `rule_prefix`, `desc`, `param_num`) VALUES ('5', '银行卡相同也相同', 'like_first', 'like_first:card_no', '', '0');
INSERT INTO `xb_validate_rules` (`id`, `name_zh`, `name_en`, `rule_prefix`, `desc`, `param_num`) VALUES ('6', '银行卡相同所属银行也相同', 'like_first_meaning', 'like_first_meaning:card_no', '', '0');
INSERT INTO `xb_validate_rules` (`id`, `name_zh`, `name_en`, `rule_prefix`, `desc`, `param_num`) VALUES ('7', '检测所属银行', 'checkSupportBank', 'checkSupportBank', '', '0');
INSERT INTO `xb_validate_rules` (`id`, `name_zh`, `name_en`, `rule_prefix`, `desc`, `param_num`) VALUES ('8', '为数字并且长度范围', 'digits_between', 'digits_between', '', '2');
INSERT INTO `xb_validate_rules` (`id`, `name_zh`, `name_en`, `rule_prefix`, `desc`, `param_num`) VALUES ('9', '最小值', 'min', 'min', '', '1');
INSERT INTO `xb_validate_rules` (`id`, `name_zh`, `name_en`, `rule_prefix`, `desc`, `param_num`) VALUES ('10', '最多两位小数', 'precision', 'precision:2', '', '0');
INSERT INTO `xb_validate_rules` (`id`, `name_zh`, `name_en`, `rule_prefix`, `desc`, `param_num`) VALUES ('11', '必须是数值', 'numeric', 'numeric', '', '0');
INSERT INTO `xb_validate_rules` (`id`, `name_zh`, `name_en`, `rule_prefix`, `desc`, `param_num`) VALUES ('12', '最大值', 'max', 'max', '', '1');
INSERT INTO `xb_validate_rules` (`id`, `name_zh`, `name_en`, `rule_prefix`, `desc`, `param_num`) VALUES ('13', '整数', 'integer', 'integer', '', '0');



时间，操作人，ip信息，操作前的数据，操作后的数据（至少要体现数据更改），

DELETE FROM xb_request_log

DROP TABLE IF EXISTS xb_operation_log;
CREATE TABLE `xb_operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_at` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `operator_id` varchar(50) NOT NULL DEFAULT '' COMMENT '操作ID',
  `operator_type` int(11) NOT NULL DEFAULT '0' COMMENT '管理员类别，1管理员，2企业账号，3企业操作员',
  `operation` varchar(255) NOT NULL DEFAULT '' COMMENT '操作类型',
  `context` text NULL COMMENT 'data',
  `ip` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='操作行为';






DROP TABLE IF EXISTS xb_weixin_push_task;
CREATE TABLE xb_weixin_push_task (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `open_id` varchar(100) NULL COMMENT 'open_id',
  `params` varchar(255) NULL COMMENT '参数',
  `template_id` varchar(100)  NULL COMMENT '推送模板ID',
  `msgid` varchar(50) NULL COMMENT '模板消息推送msgid',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '推送状态，1未推送，3已推送',
  `result_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '推送结果1未有结果，2推送成功，3推送失败',
  `errcode` varchar(100) NULL COMMENT '错误码',
  `errmsg` varchar(100) NULL COMMENT '失败原因',
  `notify_xml_id` text NULL COMMENT '模板消息结果通知XML',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='微信模板消息推送表';



DROP TABLE IF EXISTS weixin_xml_record;
CREATE TABLE weixin_xml_record (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `open_id` varchar(100) NULL COMMENT 'open_id',
  `params` varchar(255) NULL COMMENT '参数',
  `template_id` varchar(100)  NULL COMMENT '推送模板ID',
  `msgid` varchar(50) NULL COMMENT '模板消息推送msgid',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '推送状态，1未推送，3已推送',
  `result_status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '推送结果1未得到结果，2推送成功，3推送失败',
  `errcode` varchar(100) NULL COMMENT '错误码',
  `errmsg` varchar(100) NULL COMMENT '失败原因',
  `notify_xml_id` int(11) NULL COMMENT '模板消息结果通知XML',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='微信模板消息推送表';




SELECT * FROM xb_fbsdk_log WHERE id in (18569	,18570	,18571);

SHOW CREATE TABLE xb_salary_order

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
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '打款金额',
  `seperate_tag` smallint(6) NOT NULL DEFAULT '0' COMMENT '分割FLAG',
  `result_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款结果，0成功 ，1失败',
  `process_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '处理状态，1未打款，2已打款，3等待结果，0得到结果',
  `api_type` smallint(2) NOT NULL DEFAULT '0' COMMENT '支付接口类别0代表直接支付，1代表网银贷记',
  `pay_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `group_pay_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
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
) ENGINE=InnoDB AUTO_INCREMENT=18076 DEFAULT CHARSET=utf8 COMMENT='发放工资订单子表'

ALTER TABLE xb_salary_pay DROP COLUMN `group_pay_log_id` ;
ALTER TABLE xb_salary_pay ADD COLUMN `group_query_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ' AFTER pay_log_id;




SELECT
	`xb_salary_order`.`year_month`,
	`xb_salary_pay`.`salary`,
	`xb_salary_pay`.`tax`,
	`xb_salary_pay`.`amount`,
	GROUP_CONCAT(
		xb_salary_payroll_value.payroll_id
	) AS payroll_id,
	GROUP_CONCAT(
		'#E#',
		xb_salary_payroll_value.
	VALUE
		,
		'#E#'
	) AS property_value
FROM
	`xb_employee`
INNER JOIN `xb_employee_company` ON `xb_employee_company`.`uid` = `xb_employee`.`uid`
INNER JOIN `xb_company` ON `xb_employee_company`.`company_id` = `xb_company`.`company_id`
INNER JOIN `xb_salary_pay` ON `xb_employee`.`uid` = `xb_salary_pay`.`uid`
INNER JOIN `xb_salary_order` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
INNER JOIN `xb_salary_payroll_value` ON `xb_salary_pay`.`id` = `xb_salary_payroll_value`.`pay_id`
INNER JOIN `xb_payroll_property` ON `xb_salary_payroll_value`.`payroll_id` = `xb_payroll_property`.`id`
INNER JOIN `xb_company_payroll_property` ON `xb_company_payroll_property`.`company_id` = `xb_employee_company`.`company_id`
AND `xb_company_payroll_property`.`payroll_id` = `xb_payroll_property`.`id`
WHERE
	`xb_employee`.`uid` = '46'
AND `xb_company`.`payroll_open_query` = '1'
AND `xb_employee_company`.`weixin_authority` = '1'
AND `xb_salary_order`.`status` = '4'
AND `xb_salary_order`.`pay_status` = '4'
GROUP BY
	`xb_salary_pay`.`id` 






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
  `daily_limit` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '每日打款金额上限',
  `is_limited` tinyint(2) NOT NULL DEFAULT '2' COMMENT '每日打款是否限额，1限额，2不限额',
  `employee_system_related` tinyint(2) NOT NULL DEFAULT '1' COMMENT '工资单是否和员工系统强关联：	1是   2否',
  `payroll_open_query` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否开放工资单查询：	1是   2否',
  `payroll_auto_push` tinyint(2) NOT NULL DEFAULT '1' COMMENT '微信工资单是否自动推送：1是   2否',
  `properties_calculate` tinyint(2) NOT NULL DEFAULT '1' COMMENT '工资单属性是否参与计算：1是   2否',
  `join_at` timestamp NULL DEFAULT NULL COMMENT '开始合作时间',
  `quit_at` timestamp NULL DEFAULT NULL COMMENT '结束合作时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `account_id` (`account_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='企业表'

CREATE TABLE `xb_employee_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `quit_id` int(11) DEFAULT NULL COMMENT '最后一次离职的ID',
  `card_no` varchar(40) DEFAULT '0' COMMENT '打款账户',
  `bank_name` varchar(40) DEFAULT '0' COMMENT '银行名称',
  `user_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `join_at` date DEFAULT NULL COMMENT '入职时间',
  `quit_at` date DEFAULT NULL COMMENT '离职时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '在职状态状态1在职0离职',
  `weixin_authority` tinyint(2) DEFAULT '1' COMMENT '微信权限，1有，2无',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='员工企业关系信息表'



CREATE DATABASE xb_test


SELECT * FROM xb_view_order_payed_amount;

SELECT * FROM  xb_view_order_payed_amount;

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
  `tax` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '税',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '打款金额',
  `seperate_tag` smallint(6) NOT NULL DEFAULT '0' COMMENT '分割FLAG',
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
) ENGINE=InnoDB AUTO_INCREMENT=18072 DEFAULT CHARSET=utf8 COMMENT='发放工资订单子表'

UPDATE xb_salary_order
SET payed_statistics_status = 0,
 `xb_salary_order`.`should_pay_salary` = 0,
 `xb_salary_order`.`should_pay_tax` = 0,
 `xb_salary_order`.`should_pay_num` = 0,
 `xb_salary_order`.`should_pay_amount` = 0;
 
 
UPDATE xb_salary_order
LEFT JOIN xb_view_order_pay_amount ON xb_view_order_pay_amount.order_id = xb_salary_order.order_id
SET 
 xb_salary_order.should_pay_num = IFNULL(xb_view_order_pay_amount.should_pay_num,0),
 xb_salary_order.should_pay_salary = IFNULL(xb_view_order_pay_amount.should_pay_salary,0),
 xb_salary_order.should_pay_amount = IFNULL(xb_view_order_pay_amount.should_pay_amount,0),
 xb_salary_order.should_pay_tax = IFNULL(xb_view_order_pay_amount.should_pay_tax,0)
WHERE
	xb_salary_order.payed_statistics_status = 0
	
	
UPDATE xb_salary_order
LEFT JOIN xb_view_order_payed_amount ON xb_view_order_payed_amount.order_id = xb_salary_order.order_id
SET 
 xb_salary_order.payed_salary_amount = IFNULL(xb_view_order_payed_amount.payed_salary,0),
 xb_salary_order.payed_tax_amount = IFNULL(xb_view_order_payed_amount.payed_tax,0),
 xb_salary_order.payed_amount = IFNULL(xb_view_order_payed_amount.payed_amount,0),
 xb_salary_order.payed_success_count = IFNULL(xb_view_order_payed_amount.payed_success_count,0),
 xb_salary_order.payed_statistics_status = 1
WHERE
	xb_salary_order.payed_statistics_status = 0
	AND xb_salary_order.`status` = 4
	AND xb_salary_order.`pay_status` = 4;

DISTINCT

ALTER TABLE xb_salary_order ADD COLUMN `should_pay_time` int(10) DEFAULT '0' COMMENT '需打款次数' AFTER should_pay_num;

ALTER TABLE xb_salary_pay ADD COLUMN `group_pay_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ' AFTER pay_log_id;

UPDATE xb_salary_order JOIN xb_salary_pay on xb_salary_order.order_id = xb_salary_pay.order_id
SET xb_salary_order.should_pay_time = COUNT(xb_salary_pay.id) GROUP BY xb_salary_order.order_id


;
SHOW CREATE TABLE xb_salary_order;

CREATE TABLE `xb_salary_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `title` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `year_month` date DEFAULT NULL COMMENT '工资单所属月份',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_type` tinyint(1) DEFAULT '2' COMMENT '订单类型1无账户订单，2自主账户订单,参照company.type',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '工资发放日',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款状态，1未打款，2打款中，3完成打款，结果查询中，4完成结果查询',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0未提交，1已提交,未确认，2被拒绝，3待发放，4已发放，5发放中',
  `should_pay_num` int(10) DEFAULT '0' COMMENT '需打款人数',
  `should_pay_tax` decimal(20,2) DEFAULT '0.00' COMMENT '需付个税总金额',
  `should_pay_salary` decimal(20,2) DEFAULT '0.00' COMMENT '需付薪资总金额',
  `should_pay_amount` decimal(20,2) DEFAULT '0.00' COMMENT '应打款总金额',
  `payed_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税总额',
  `payed_salary_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税前金额',
  `payed_amount` decimal(20,2) DEFAULT '0.00' COMMENT '已打款总金额',
  `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计,2已计福豆',
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



SHOW CREATE TABLE xb_order_monitoring ;

ALTER TABLE xb_order_monitoring ADD COLUMN `upload_file` varchar(200) DEFAULT NULL COMMENT '列表图片' AFTER order_id;

CREATE TABLE `xb_order_monitoring` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `upload_file` varchar(200) DEFAULT NULL COMMENT '列表图片',
  `type` smallint(5) DEFAULT '0' COMMENT '类别，1上传时间，2打款时间',
  `count` int(11) DEFAULT '0' COMMENT '数量',
  `time_usage` int(11) DEFAULT '0' COMMENT '用时，单位秒',
  `context` text COMMENT '上下文',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='订单监测'



SELECT
	`order_id`,
	`status`
FROM
	`xb_salary_order`
WHERE
	
	 `order_id` = '146572118966074953'

LIMIT 1 [] []

SHOW CREATE TABLE xb_salary_order 


ALTER TABLE xb_salary_order ADD COLUMN `year_month` date NULL COMMENT '工资单所属月份' AFTER title;

CREATE TABLE `xb_salary_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `title` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_type` tinyint(1) DEFAULT '2' COMMENT '订单类型1无账户订单，2自主账户订单,参照company.type',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '工资发放日',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款状态，1未打款，2打款中，3完成打款，结果查询中，4完成结果查询',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0未提交，1已提交,未确认，2被拒绝，3待发放，4已发放，5发放中',
  `should_pay_num` int(10) DEFAULT '0' COMMENT '需打款人数',
  `should_pay_tax` decimal(20,2) DEFAULT '0.00' COMMENT '需付个税总金额',
  `should_pay_salary` decimal(20,2) DEFAULT '0.00' COMMENT '需付薪资总金额',
  `should_pay_amount` decimal(20,2) DEFAULT '0.00' COMMENT '应打款总金额',
  `payed_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税总额',
  `payed_salary_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税前金额',
  `payed_amount` decimal(20,2) DEFAULT '0.00' COMMENT '已打款总金额',
  `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计,2已计福豆',
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

SELECT * FROM xb_employee_company WHERE card_no = '6228480661305067712';

SELECT RAND()

SELECT LENGTH('6228480661305067712')

SELECT SUBSTR('6228480661305067712' FROM 14 FOR 6);

SELECT CONCAT(SUBSTR('6228480661305067712' FROM 1 FOR 13),SUBSTR(RAND() FROM 3 FOR 6));

UPDATE xb_employee_company SET card_no = CONCAT(SUBSTR('6228480661305067712' FROM 1 FOR 13),SUBSTR(RAND() FROM 3 FOR 6))
WHERE card_no = '6228480661305067712';


DROP INDEX `phone` ON xb_employee ;
DROP INDEX `identity` ON xb_employee ;  (`phone`) 
ALTER TABLE xb_employee DROP INDEX 

SHOW CREATE TABLE xb_employee_company

ALTER TABLE xb_employee_company ADD COLUMN `weixin_authority` TINYINT(2) DEFAULT 1 COMMENT '微信权限，1有，2无' AFTER status;


ALTER TABLE xb_employee DROP COLUMN weixin_authority

CREATE TABLE `xb_employee_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `quit_id` int(11) DEFAULT NULL COMMENT '最后一次离职的ID',
  `card_no` varchar(40) DEFAULT '0' COMMENT '打款账户',
  `bank_name` varchar(40) DEFAULT '0' COMMENT '银行名称',
  `user_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `join_at` date DEFAULT NULL COMMENT '入职时间',
  `quit_at` date DEFAULT NULL COMMENT '离职时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '在职状态状态1在职0离职',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='员工企业关系信息表'



CREATE TABLE `xb_employee` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account` varchar(30) DEFAULT NULL COMMENT '用户登录账户名',
  `password` varchar(30) DEFAULT NULL COMMENT '用户密码',
  `truename` varchar(30) DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(11) DEFAULT '0' COMMENT '电话',
  `identity` varchar(20) DEFAULT NULL COMMENT '身份证',
  `fudou_avaliable` int(11) DEFAULT '0' COMMENT '可用福豆数量',
  `account_status` tinyint(2) unsigned DEFAULT '0' COMMENT '账户状态 1 启用 ，2 停用 ， 3 删除',
  `weixin_authority` tinyint(2) DEFAULT '1' COMMENT '微信权限，1有，2无',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='员工表'



CREATE TABLE `xb_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL COMMENT '所属公司',
  `department_name` varchar(20) DEFAULT NULL COMMENT '名称',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='企业部门表'

CREATE TABLE `xb_employee_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `quit_id` int(11) DEFAULT NULL COMMENT '最后一次离职的ID',
  `card_no` varchar(40) DEFAULT '0' COMMENT '打款账户',
  `bank_name` varchar(40) DEFAULT '0' COMMENT '银行名称',
  `user_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `join_at` date DEFAULT NULL COMMENT '入职时间',
  `quit_at` date DEFAULT NULL COMMENT '离职时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '在职状态状态1在职0离职',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='员工企业关系信息表'

UPDATE 


UPDATE xb_salary_order JOIN  xb_salary_pay on xb_salary_order.order_id = xb_salary_pay.order_id  
SET xb_salary_order.should_pay_amount = sum(salary) - SUM(tax);



DROP VIEW IF EXISTS `order_pay_amount`;
CREATE VIEW order_pay_amount AS
SELECT
	SUM(amount) AS amount,
	order_id
FROM
	xb_salary_pay
GROUP BY
	order_id
UPDATE xb_salary_order JOIN  order_pay_amount on xb_salary_order.order_id = order_pay_amount.order_id  
SET xb_salary_order.should_pay_amount = order_pay_amount.amount




UPDATE xb_salary_order
JOIN order_pay_amount ON xb_salary_order.order_id = order_pay_amount.order_id
SET xb_salary_order.should_pay_amount = order_pay_amount.amount


SHOW CREATE TABLE xb_salary_order;


  `should_pay_num` int(10) DEFAULT '0' COMMENT '需打款人数',
  `should_pay_tax` decimal(20,2) DEFAULT '0.00' COMMENT '需付个税总金额',
  `should_pay_salary` decimal(20,2) DEFAULT '0.00' COMMENT '需付薪资总金额',
  `payed_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税总额',
  `payed_salary_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税前金额',
  `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计,2已计福豆',
  `payed_success_count` smallint(5) DEFAULT '0' COMMENT '打款成功数量',


ALTER TABLE xb_salary_order ADD COLUMN `should_pay_amount` decimal(20,2) DEFAULT '0.00' COMMENT '应打款总金额' AFTER should_pay_salary;

ALTER TABLE xb_salary_order ADD COLUMN `payed_amount` decimal(20,2) DEFAULT '0.00' COMMENT '已打款总金额' AFTER payed_salary_amount;



CREATE TABLE `xb_salary_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `title` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_type` tinyint(1) DEFAULT '2' COMMENT '订单类型1无账户订单，2自主账户订单,参照company.type',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '工资发放日',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款状态，1未打款，2打款中，3完成打款，结果查询中，4完成结果查询',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0未提交，1已提交,未确认，2被拒绝，3待发放，4已发放，5发放中',
  `should_pay_num` int(10) DEFAULT '0' COMMENT '需打款人数',
  `should_pay_tax` decimal(20,2) DEFAULT '0.00' COMMENT '需付个税总金额',
  `should_pay_salary` decimal(20,2) DEFAULT '0.00' COMMENT '需付薪资总金额',
  `payed_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税总额',
  `payed_salary_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税前金额',
  `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计,2已计福豆',
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




SHOW CREATE TABLE xb_company_payroll_property

SHOW CREATE TABLE xb_salary_pay 

SHOW CREATE TABLE xb_salary_payroll_value



ALTER TABLE xb_salary_pay ADD COLUMN `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '打款金额' after tax


ALTER TABLE xb_salary_pay DROP COLUMN taxation_point;
ALTER TABLE xb_salary_pay DROP COLUMN tax_rate;
ALTER TABLE xb_salary_pay DROP COLUMN quick_deduction;
ALTER TABLE xb_salary_pay DROP COLUMN salary_accumulated;
ALTER TABLE xb_salary_pay DROP COLUMN tax_accumulated;
ALTER TABLE xb_salary_pay DROP COLUMN tax_expected;


ALTER TABLE xb_salary_pay ADD COLUMN `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '打款金额' after tax;

ALTER TABLE xb_salary_pay DROP COLUMN taxation_point;
ALTER TABLE xb_salary_pay DROP COLUMN tax_rate;
ALTER TABLE xb_salary_pay DROP COLUMN quick_deduction;
ALTER TABLE xb_salary_pay DROP COLUMN salary_accumulated;
ALTER TABLE xb_salary_pay DROP COLUMN tax_accumulated;
ALTER TABLE xb_salary_pay DROP COLUMN tax_expected;


UPDATE xb_salary_pay SET amount = salary - tax;


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
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '打款金额',
  `seperate_tag` smallint(6) NOT NULL DEFAULT '0' COMMENT '分割FLAG',
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
) ENGINE=InnoDB AUTO_INCREMENT=17688 DEFAULT CHARSET=utf8 COMMENT='发放工资订单子表'



SHOW CREATE TABLE xb_company ;

ALTER TABLE xb_company ADD COLUMN `properties_calculate` tinyint(2) NOT NULL DEFAULT '1' COMMENT '工资单属性是否参与计算：1是   2否' AFTER payroll_auto_push

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
  `daily_limit` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '每日打款金额上限',
  `is_limited` tinyint(2) NOT NULL DEFAULT '2' COMMENT '每日打款是否限额，1限额，2不限额',
  `employee_system_related` tinyint(2) NOT NULL DEFAULT '1' COMMENT '工资单是否和员工系统强关联：	1是   2否',
  `payroll_open_query` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否开放工资单查询：	1是   2否',
  `payroll_auto_push` tinyint(2) NOT NULL DEFAULT '1' COMMENT '微信工资单是否自动推送：1是   2否',
  `join_at` timestamp NULL DEFAULT NULL COMMENT '开始合作时间',
  `quit_at` timestamp NULL DEFAULT NULL COMMENT '结束合作时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `account_id` (`account_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='企业表'




ALTER TABLE xb_payroll_property MODIFY `code` varchar(50)  NULL DEFAULT NULL COMMENT '字段CODE',

CREATE UNIQUE INDEX `code` ON `xb_payroll_property`(`code`) USING BTREE ;

UPDATE xb_payroll_property SET `code` = NULL WHERE `code` = '';


GROUP_CONCAT(expr)


SELECT uid,GROUP_CONCAT(salary,',',tax),GROUP_CONCAT(tax) FROM xb_salary_pay GROUP BY uid



SHOW CREATE TABLE xb_salary_order ;

CREATE TABLE `xb_salary_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `title` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_type` tinyint(1) DEFAULT '2' COMMENT '订单类型1无账户订单，2自主账户订单,参照company.type',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '工资发放日',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款状态，1未打款，2打款中，3完成打款，结果查询中，4完成结果查询',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0未提交，1已提交,未确认，2被拒绝，3待发放，4已发放，5发放中',
  `should_pay_num` int(10) DEFAULT '0' COMMENT '需打款人数',
  `should_pay_tax` decimal(20,2) DEFAULT '0.00' COMMENT '需付个税总金额',
  `should_pay_salary` decimal(20,2) DEFAULT '0.00' COMMENT '需付薪资总金额',
  `payed_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税总额',
  `payed_salary_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税前金额',
  `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计,2已计福豆',
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



CREATE TABLE `xb_employee_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `quit_id` int(11) DEFAULT NULL COMMENT '最后一次离职的ID',
  `card_no` varchar(40) DEFAULT '0' COMMENT '打款账户',
  `bank_name` varchar(40) DEFAULT '0' COMMENT '银行名称',
  `user_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `join_at` date DEFAULT NULL COMMENT '入职时间',
  `quit_at` date DEFAULT NULL COMMENT '离职时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '在职状态状态1在职0离职',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='员工企业关系信息表'


SHOW CREATE TABLE xb_payroll_property ;

Limited modification


ALTER TABLE xb_payroll_property DROP COLUMN `size` 

ALTER TABLE xb_payroll_property ADD COLUMN `validation` VARCHAR(100) NULL DEFAULT '' COMMENT '字段验证规则' AFTER width;

ALTER TABLE xb_payroll_property ADD COLUMN `code` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '字段CODE' AFTER validation;

ALTER TABLE xb_payroll_property MODIFY COLUMN `limited_modification` tinyint(2) NOT NULL DEFAULT 2 COMMENT '是否限制修改，1是，2否' AFTER cal_mode;

CREATE TABLE `xb_payroll_property` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '字段名',
  `type` tinyint(2) NOT NULL COMMENT '字段类别,1字符串，2金额，3整数',
  `width` tinyint(5) NOT NULL COMMENT '字段宽度',
  `validation` varchar(100) DEFAULT '' COMMENT '字段验证规则',
  `code` varchar(50) DEFAULT NULL COMMENT '字段CODE',
  `cal_mode` tinyint(2) NOT NULL COMMENT '计算模式,1不计算，2计算+，3计算-，4计算=',
  `limited_modification` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否限制修改，1是，2否',
  `required` tinyint(2) NOT NULL COMMENT '是否必须，1是，2否',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='工资单属性'

INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('1', '姓名', '1', '20', 'required|between:2,50|specialChar', 'truename', '1', '1', '1', '2016-06-27 11:44:16');
INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('2', '开户行名称', '1', '30', 'required|between:2,60|checkSupportBank', 'bank_name', '1', '1', '1', '2016-06-27 11:44:42');
INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('3', '银行卡号', '1', '24', 'required|digits_between:15,20', 'card_no', '1', '1', '1', '2016-06-27 11:44:59');
INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('4', '实发工资', '2', '12', 'required|numeric|min:0.01|precision:2', 'amount', '4', '1', '1', '2016-06-29 10:53:26');
INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('5', '税前工资', '2', '20', 'required|numeric|min:0.01|precision:2', 'salary', '3', '1', '2', '2016-06-27 11:45:18');
INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('6', '个税', '2', '12', 'required|numeric|min:0|precision:2', 'tax', '2', '1', '2', '2016-06-27 11:45:36');


SHOW CREATE TABLE xb_employee ;
ALTER TABLE xb_employee MODIFY COLUMN `weixin_authority` TINYINT(2) DEFAULT 1 COMMENT '微信权限，1有，2无' AFTER account_status;

ALTER TABLE xb_employee ADD COLUMN `weixin_authority` TINYINT(2) DEFAULT 1 COMMENT '微信权限，1有，2无' AFTER account_status;

CREATE TABLE `xb_employee` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account` varchar(30) DEFAULT NULL COMMENT '用户登录账户名',
  `password` varchar(30) DEFAULT NULL COMMENT '用户密码',
  `truename` varchar(30) DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(11) DEFAULT '0' COMMENT '电话',
  `identity` varchar(20) DEFAULT NULL COMMENT '身份证',
  `fudou_avaliable` int(11) DEFAULT '0' COMMENT '可用福豆数量',
  `account_status` tinyint(2) unsigned DEFAULT '0' COMMENT '账户状态 1 启用 ，2 停用 ， 3 删除',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `identity` (`identity`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='员工表'




DROP TABLE IF EXISTS `xb_company_payroll_property`;
CREATE TABLE `xb_company_payroll_property` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `payroll_id` int(11) NOT NULL COMMENT '工资单属性编号',
  `excel_sort` tinyint(5) NOT NULL COMMENT 'excel排序，小到大',
  `weixin_sort` tinyint(5) NOT NULL DEFAULT 0 COMMENT '微信显示排序，小到大',
  `is_weixin_show` tinyint(2) NOT NULL COMMENT '微信是否显示',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业工资单属性';





SHOW CREATE TABLE xb_company;

ALTER TABLE xb_company DROP COLUMN `business_type`;
ALTER TABLE xb_company DROP COLUMN `has_tax_return`;
ALTER TABLE xb_company DROP COLUMN `service_fee`;
ALTER TABLE xb_company DROP COLUMN `tax_invoice_proportion`;
ALTER TABLE xb_company DROP COLUMN `has_insurance`;
ALTER TABLE xb_company DROP COLUMN `insurance_fee`;
ALTER TABLE xb_company DROP COLUMN `has_disabled_gold`;
ALTER TABLE xb_company DROP COLUMN `disabled_fee`;
ALTER TABLE xb_company DROP COLUMN `disabled_invoice_proportion`;
ALTER TABLE xb_company DROP COLUMN `insurance_invoice_proportion`;
ALTER TABLE xb_company DROP COLUMN `tax_return_rate`;
ALTER TABLE xb_company DROP COLUMN `fudou_avaliable`;

是否开放工资单查询：	1是   2否
工资单是否和员工系统强关联：	1是   2否
微信工资单是否自动推送：1是   2否


ALTER TABLE xb_company ADD COLUMN `payroll_auto_push` tinyint(2) NOT NULL DEFAULT 1 COMMENT '微信工资单是否自动推送：1是   2否' AFTER `is_limited`;
ALTER TABLE xb_company ADD COLUMN `payroll_open_query` tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否开放工资单查询：	1是   2否' AFTER `is_limited`;
ALTER TABLE xb_company ADD COLUMN `employee_system_related` tinyint(2) NOT NULL DEFAULT 1 COMMENT '工资单是否和员工系统强关联：	1是   2否' AFTER `is_limited`;



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
  `daily_limit` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '每日打款金额上限',
  `is_limited` tinyint(2) NOT NULL DEFAULT '2' COMMENT '每日打款是否限额，1限额，2不限额',


  `join_at` timestamp NULL DEFAULT NULL COMMENT '开始合作时间',
  `quit_at` timestamp NULL DEFAULT NULL COMMENT '结束合作时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `account_id` (`account_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='企业表'



SHOW CREATE TABLE xb_salary_pay ;



SELECT
	`xb_payroll_property`.`id`,
	`xb_payroll_property`.`name`,
	`xb_payroll_property`.`type`,
	`xb_payroll_property`.`cal_mode`
FROM
	`xb_payroll_property`
WHERE
	`xb_payroll_property`.`required` = '2'
ORDER BY
	`xb_payroll_property`.`created_at` DESC
LIMIT 20 OFFSET 0 


DROP TABLE IF EXISTS `xb_payroll_property`;
CREATE TABLE `xb_payroll_property`(
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '字段名',
  `type` TINYINT(2) NOT NULL COMMENT '字段类别,1字符串，2金额，3整数',
  `size` TINYINT(5) NOT NULL COMMENT '字段长度',
  `width` TINYINT(5) NOT NULL COMMENT '字段宽度',
  `cal_mode` TINYINT(2) NOT NULL COMMENT '计算模式,1不计算，2计算+，3计算-，计算=',
  `is_required` TINYINT(2) NOT NULL COMMENT '是否必须，1是，2否',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17688 DEFAULT CHARSET=utf8 COMMENT='工资单属性';


DROP TABLE IF EXISTS `xb_company_payroll_property`;
CREATE TABLE `xb_company_payroll_property`(
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `payroll_id` int(11) NOT NULL COMMENT '工资单属性编号',
  `excel_sort` TINYINT(5) NOT NULL COMMENT 'excel排序，小到大',
  `weixin_sort` TINYINT(5) NOT NULL COMMENT '微信显示排序，小到大',
  `is_weixin_show` TINYINT(2) NOT NULL COMMENT '微信是否显示',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17688 DEFAULT CHARSET=utf8 COMMENT='企业工资单属性';



DROP TABLE IF EXISTS `xb_salary_payroll_value`;
CREATE TABLE `xb_salary_payroll_value`(
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pay_id` int(10) DEFAULT NULL COMMENT 'xb_salary_pay的id',
  `payroll_id` int(11) NOT NULL COMMENT '工资单属性编号',
  `value` varchar(255) NOT NULL COMMENT '字段值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17688 DEFAULT CHARSET=utf8 COMMENT='企业工资单属性';



CREATE TABLE `xb_salary_pay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
## 订单信息
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_id` bigint(26) NOT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL COMMENT '员工编号',
## 支付关键信息
  `truename` varchar(60) NOT NULL COMMENT '真实姓名',
  `card_no` varchar(40) DEFAULT '0' COMMENT '银行卡号',
  `bank_name` varchar(40) DEFAULT '0' COMMENT '银行名称',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '打款金额',
## 支付状态
  `result_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款结果，0成功 ，1失败',
  `process_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '处理状态，1未打款，2已打款，3等待结果，0得到结果',
  `api_type` smallint(2) NOT NULL DEFAULT '0' COMMENT '支付接口类别0代表直接支付，1代表网银贷记',
  `reason` varchar(50) DEFAULT NULL COMMENT '失败原因',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新日期',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `process_status` (`process_status`),
  KEY `result_status` (`result_status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='发放工资订单子表'

CREATE TABLE `xb_pay_information` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pay_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '打款金额',
  `pay_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `group_query_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `detail_query_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `YURREF` varchar(30) DEFAULT NULL COMMENT '业务参考号',
  `REQNBR` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',
  `reason` varchar(50) DEFAULT NULL COMMENT '失败原因',
  `result_at` timestamp NULL DEFAULT NULL COMMENT '得到结果时间',
  `status` int(11) DEFAULT NULL COMMENT '1未支付，2请求支付中，3已支付，4处理中，5得到结果',
  `result_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款结果，0成功 ，1失败',

}ENGINE=InnoDB AUTO_INCREMENT=17688 DEFAULT CHARSET=utf8 COMMENT='发放工资订单子表'



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
  `tax_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '税率',
  `quick_deduction` int(11) NOT NULL DEFAULT '0' COMMENT '速算扣除数',
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
) ENGINE=InnoDB AUTO_INCREMENT=17688 DEFAULT CHARSET=utf8 COMMENT='发放工资订单子表'


