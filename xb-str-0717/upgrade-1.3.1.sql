
DROP PROCEDURE IF EXISTS dropColumnIfExists;
CREATE PROCEDURE dropColumnIfExists(
	IN __tablename VARCHAR(60),
  IN __columnName  VARCHAR(60)
)
BEGIN
	DECLARE __colNum int ;
	SET __colNum = 0;
	SELECT COUNT(*) INTO __colNum FROM information_schema.columns WHERE table_name = __tablename AND column_name = __columnName 
	AND table_schema = DATABASE() ;
	IF __colNum > 0 THEN
			SET @__sql = CONCAT('ALTER TABLE ',__tablename,' DROP COLUMN ',__columnName);
			prepare stmt from @__sql; 
			EXECUTE stmt;     
			deallocate prepare stmt;   
	END IF;
END;



DROP TABLE IF EXISTS `xb_payroll_property`;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='工资单属性';

INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('1', '姓名', '1', '20', 'required|between:2,50|specialChar|like_first:card_no', 'truename', '1', '1', '1', '2016-06-27 11:44:16');
INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('2', '开户行名称', '1', '30', 'required|between:2,60|checkSupportBank|like_first_meaning:card_no', 'bank_name', '1', '1', '1', '2016-06-27 11:44:42');
INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('3', '银行卡号', '1', '24', 'required|digits_between:15,20', 'card_no', '1', '1', '1', '2016-06-27 11:44:59');
INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('4', '实发工资', '2', '12', 'required|numeric|min:0.01|precision:2', 'amount', '4', '1', '1', '2016-06-29 10:53:26');
INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('5', '税前工资', '2', '20', 'required|numeric|min:0.01|precision:2', 'salary', '3', '1', '2', '2016-06-27 11:45:18');
INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('6', '个税', '2', '12', 'required|numeric|min:0|precision:2', 'tax', '2', '1', '2', '2016-06-27 11:45:36');



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



DROP TABLE IF EXISTS	xb_salary_payroll_value;
CREATE TABLE `xb_salary_payroll_value` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(26) NOT NULL COMMENT '订单号',
  `pay_id` int(10) DEFAULT NULL COMMENT 'xb_salary_pay的id',
  `payroll_id` int(11) NOT NULL COMMENT '工资单属性编号',
  `value` varchar(255) NOT NULL COMMENT '字段值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业工资单属性';


CALL dropColumnIfExists('xb_company','`business_type`');
CALL dropColumnIfExists('xb_company','`has_tax_return`');
CALL dropColumnIfExists('xb_company','`service_fee`');
CALL dropColumnIfExists('xb_company','`tax_invoice_proportion`');
CALL dropColumnIfExists('xb_company','`has_insurance`');
CALL dropColumnIfExists('xb_company','`insurance_fee`');
CALL dropColumnIfExists('xb_company','`has_disabled_gold`');
CALL dropColumnIfExists('xb_company','`disabled_fee`');
CALL dropColumnIfExists('xb_company','`disabled_invoice_proportion`');
CALL dropColumnIfExists('xb_company','`insurance_invoice_proportion`');
CALL dropColumnIfExists('xb_company','`tax_return_rate`');
CALL dropColumnIfExists('xb_company','`fudou_avaliable`');

ALTER TABLE xb_company ADD COLUMN `payroll_auto_push` tinyint(2) NOT NULL DEFAULT 1 COMMENT '微信工资单是否自动推送：1是   2否' AFTER `is_limited`;
ALTER TABLE xb_company ADD COLUMN `payroll_open_query` tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否开放工资单查询：	1是   2否' AFTER `is_limited`;
ALTER TABLE xb_company ADD COLUMN `employee_system_related` tinyint(2) NOT NULL DEFAULT 1 COMMENT '工资单是否和员工系统强关联：	1是   2否' AFTER `is_limited`;

ALTER TABLE xb_company ADD COLUMN `properties_calculate` tinyint(2) NOT NULL DEFAULT '1' COMMENT '工资单属性是否参与计算：1是   2否' AFTER payroll_auto_push;


ALTER TABLE xb_salary_pay ADD COLUMN `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '打款金额' after tax;

CALL dropColumnIfExists('xb_salary_pay','taxation_point');
CALL dropColumnIfExists('xb_salary_pay','tax_rate');
CALL dropColumnIfExists('xb_salary_pay','quick_deduction');
CALL dropColumnIfExists('xb_salary_pay','salary_accumulated');
CALL dropColumnIfExists('xb_salary_pay','tax_accumulated');
CALL dropColumnIfExists('xb_salary_pay','tax_expected');


UPDATE xb_salary_pay SET amount = salary - tax;



ALTER TABLE xb_salary_order ADD COLUMN `should_pay_amount` decimal(20,2) DEFAULT '0.00' COMMENT '应打款总金额' AFTER should_pay_salary;

ALTER TABLE xb_salary_order ADD COLUMN `payed_amount` decimal(20,2) DEFAULT '0.00' COMMENT '已打款总金额' AFTER payed_salary_amount;



DROP VIEW IF EXISTS `order_pay_amount`;
CREATE VIEW order_pay_amount AS
SELECT
	SUM(amount) AS amount,
	order_id
FROM
	xb_salary_pay
GROUP BY
	order_id;

UPDATE xb_salary_order
JOIN order_pay_amount ON xb_salary_order.order_id = order_pay_amount.order_id
SET xb_salary_order.should_pay_amount = order_pay_amount.amount;

DROP VIEW IF EXISTS `order_pay_amount`;


DROP INDEX `phone` ON xb_employee ;
DROP INDEX `identity` ON xb_employee ;

ALTER TABLE xb_employee_company ADD COLUMN `weixin_authority` TINYINT(2) DEFAULT 1 COMMENT '微信权限，1有，2无' AFTER status;

ALTER TABLE xb_salary_order ADD COLUMN `year_month` date NULL COMMENT '工资单所属月份' AFTER title;

ALTER TABLE xb_order_monitoring ADD COLUMN `upload_file` varchar(200) DEFAULT NULL COMMENT '列表图片' AFTER order_id;

ALTER TABLE xb_salary_order ADD COLUMN `should_pay_time` int(10) DEFAULT '0' COMMENT '需打款次数' AFTER should_pay_num;


## new view , Add amount

DROP VIEW IF EXISTS `xb_view_order_payed_amount`;
CREATE VIEW `xb_view_order_payed_amount` AS SELECT
	`xb_salary_pay`.`order_id` AS `order_id`,
	count(`xb_salary_pay`.`id`) AS `payed_success_count`,
	sum(`xb_salary_pay`.`salary`) AS `payed_salary`,
    sum(`xb_salary_pay`.`amount`) AS `payed_amount`,
	sum(`xb_salary_pay`.`tax`) AS `payed_tax`
FROM
	(
		`xb_salary_order`
		JOIN `xb_salary_pay` ON (
			(
				(
					`xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
				)
				AND (
					`xb_salary_order`.`status` = 4
				)
				AND (
					`xb_salary_order`.`pay_status` = 4
				)
				AND (
					`xb_salary_order`.`payed_statistics_status` = 0
				)
				AND (
					`xb_salary_pay`.`result_status` = 0
				)
				AND (
					`xb_salary_pay`.`process_status` = 0
				)
			)
		)
	)
GROUP BY
	`xb_salary_pay`.`order_id`;

DROP VIEW IF EXISTS `xb_view_order_pay_amount`;
CREATE VIEW `xb_view_order_pay_amount` AS SELECT
	`xb_salary_pay`.`order_id` AS `order_id`,
	count(`xb_salary_pay`.`id`) AS `should_pay_num`,
	sum(`xb_salary_pay`.`salary`) AS `should_pay_salary`,
    sum(`xb_salary_pay`.`amount`) AS `should_pay_amount`,
	sum(`xb_salary_pay`.`tax`) AS `should_pay_tax`
FROM
	(
		`xb_salary_order`
		JOIN `xb_salary_pay` ON (
			(
				(
					`xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
				)
				AND (
					`xb_salary_order`.`should_pay_salary` = 0
				)
				AND (
					`xb_salary_order`.`should_pay_tax` = 0
				)
				AND (
					`xb_salary_order`.`should_pay_num` = 0
				)
			)
		)
	)
GROUP BY
	`xb_salary_pay`.`order_id`;

	
	
	
UPDATE xb_salary_order
SET payed_statistics_status = 0,
 `xb_salary_order`.`should_pay_salary` = 0,
 `xb_salary_order`.`should_pay_tax` = 0,
 `xb_salary_order`.`should_pay_num` = 0,
 `xb_salary_order`.`should_pay_amount` = 0;
 
 
UPDATE xb_salary_order
LEFT JOIN xb_view_order_pay_amount ON xb_view_order_pay_amount.order_id = xb_salary_order.order_id
SET 
 xb_salary_order.should_pay_time = IFNULL(xb_view_order_pay_amount.should_pay_num,0),
 xb_salary_order.should_pay_num = IFNULL(xb_view_order_pay_amount.should_pay_num,0),
 xb_salary_order.should_pay_salary = IFNULL(xb_view_order_pay_amount.should_pay_salary,0),
 xb_salary_order.should_pay_amount = IFNULL(xb_view_order_pay_amount.should_pay_amount,0),
 xb_salary_order.should_pay_tax = IFNULL(xb_view_order_pay_amount.should_pay_tax,0)
WHERE
	xb_salary_order.payed_statistics_status = 0;
	
	
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


	

##ALTER TABLE xb_salary_pay ADD COLUMN `group_pay_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ' AFTER pay_log_id;

##ALTER TABLE xb_salary_pay DROP COLUMN `group_pay_log_id` ;
ALTER TABLE xb_salary_pay ADD COLUMN `group_query_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ' AFTER pay_log_id;


## 初始化企业的配置信息


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


## CALL insertDefaultPayrollProperties();
## CREATE TABLE _tmp as SELECT company_id FROM xb_company_payroll_property GROUP BY company_id HAVING COUNT(*) = 4
## DELETE FROM xb_company_payroll_property WHERE company_id in (SELECT company_id FROM _tmp)
## DROP TABLE IF EXISTS _tmp
## SELECT * FROM xb_company_payroll_property GROUP BY company_id HAVING COUNT(DISTINCT payroll_id) != COUNT( payroll_id) 


## year_month


UPDATE xb_salary_order SET `year_month` = CONCAT(SUBSTR(created_at FROM 1 FOR 8),'01');


CREATE INDEX uid_company ON xb_employee_company(uid,company_id);

ALTER TABLE xb_employee ADD COLUMN open_id VARCHAR(60) NULL COMMENT 'OPENID' AFTER account_status; 



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

DROP TABLE IF EXISTS xb_weixin_xml_record;
CREATE TABLE xb_weixin_xml_record (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `xml` text NULL COMMENT '模板消息结果通知XML',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='微信推送XML记录表';





DROP TABLE IF EXISTS `xb_validate_rules`;
CREATE TABLE `xb_validate_rules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_zh` varchar(60) NOT NULL COMMENT '规则中文名',
  `name_en` varchar(60) NOT NULL COMMENT '规则英文名',
  `rule_prefix` varchar(60) NOT NULL COMMENT '规则',
  `desc` varchar(100) DEFAULT '' COMMENT '规则功能描述',
  `param_num` tinyint(2) NOT NULL COMMENT '参数数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='验证规则表';

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


CALL dropColumnIfExists('xb_employee','account');


ALTER TABLE xb_salary_payroll_value ADD COLUMN   `name` varchar(60) NOT NULL COMMENT '字段名' ; 
ALTER TABLE xb_salary_payroll_value ADD COLUMN   `type` tinyint(2) NOT NULL COMMENT '字段类别,1字符串，2金额，3整数';
ALTER TABLE xb_salary_payroll_value ADD COLUMN   `width` tinyint(5) NOT NULL COMMENT '字段宽度';
ALTER TABLE xb_salary_payroll_value ADD COLUMN   `code` varchar(50) DEFAULT NULL COMMENT '字段CODE';
ALTER TABLE xb_salary_payroll_value ADD COLUMN   `excel_sort` tinyint(5) NOT NULL COMMENT 'excel排序，小到大';
ALTER TABLE xb_salary_payroll_value ADD COLUMN   `weixin_sort` tinyint(5) NOT NULL DEFAULT '0' COMMENT '微信显示排序，小到大';
ALTER TABLE xb_salary_payroll_value ADD COLUMN   `is_weixin_show` tinyint(2) NOT NULL COMMENT '微信是否显示';


DROP TABLE IF EXISTS `xb_backup_data`;
CREATE TABLE `xb_backup_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT 'API名字',
  `data` text DEFAULT NULL COMMENT '数据',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='备份';

CREATE INDEX pay_id on xb_salary_payroll_value(pay_id);
CREATE INDEX order_id on xb_salary_payroll_value(order_id);

