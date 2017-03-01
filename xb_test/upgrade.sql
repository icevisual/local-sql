



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

INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('1', '姓名', '1', '20', 'required|between:2,50|specialChar', 'truename', '1', '1', '1', '2016-06-27 11:44:16');
INSERT INTO `xb_payroll_property` (`id`, `name`, `type`, `width`, `validation`, `code`, `cal_mode`, `limited_modification`, `required`, `created_at`) VALUES ('2', '开户行名称', '1', '30', 'required|between:2,60|checkSupportBank', 'bank_name', '1', '1', '1', '2016-06-27 11:44:42');
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

ALTER TABLE xb_company ADD COLUMN `payroll_auto_push` tinyint(2) NOT NULL DEFAULT 1 COMMENT '微信工资单是否自动推送：1是   2否' AFTER `is_limited`;
ALTER TABLE xb_company ADD COLUMN `payroll_open_query` tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否开放工资单查询：	1是   2否' AFTER `is_limited`;
ALTER TABLE xb_company ADD COLUMN `employee_system_related` tinyint(2) NOT NULL DEFAULT 1 COMMENT '工资单是否和员工系统强关联：	1是   2否' AFTER `is_limited`;

ALTER TABLE xb_company ADD COLUMN `properties_calculate` tinyint(2) NOT NULL DEFAULT '1' COMMENT '工资单属性是否参与计算：1是   2否' AFTER payroll_auto_push;


ALTER TABLE xb_salary_pay ADD COLUMN `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '打款金额' after tax;

ALTER TABLE xb_salary_pay DROP COLUMN taxation_point;
ALTER TABLE xb_salary_pay DROP COLUMN tax_rate;
ALTER TABLE xb_salary_pay DROP COLUMN quick_deduction;
ALTER TABLE xb_salary_pay DROP COLUMN salary_accumulated;
ALTER TABLE xb_salary_pay DROP COLUMN tax_accumulated;
ALTER TABLE xb_salary_pay DROP COLUMN tax_expected;


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


	
ALTER TABLE xb_salary_order ADD COLUMN `should_pay_time` int(10) DEFAULT '0' COMMENT '需打款次数' AFTER should_pay_num;

ALTER TABLE xb_salary_pay ADD COLUMN `group_pay_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ' AFTER pay_log_id;


