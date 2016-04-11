


















CCREATE TABLE `xb_salary_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `title` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '工资发放日',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款状态，1未打款，2打款中，3完成打款，结果查询中，4完成结果查询',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0未提交，1已提交,未确认，2被拒绝，3待发放，4已发放，5发放中',
  `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计',
  `payed_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税总额',
  `payed_salary_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税前金额',
  `pay_num` int(10) NOT NULL DEFAULT '0' COMMENT '支付条目数',
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
  KEY `company_id` (`company_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发放工资订单主表'

SHOW CREATE  table xb_salary_order

UPDATE xb_salary_order SET payed_statistics_status = 0;

ALTER TABLE xb_salary_order DROP COLUMN `payed_salary_amount` ;
ALTER TABLE xb_salary_order DROP COLUMN `payed_tax_amount` ;
ALTER TABLE xb_salary_order DROP COLUMN `payed_statistics_status` ;

ALTER TABLE xb_salary_order ADD COLUMN `payed_statistics_status` TINYINT(1) DEFAULT 0 COMMENT '成功发放统计状态0未统计，1已统计' AFTER `status`;
ALTER TABLE xb_salary_order ADD COLUMN `payed_salary_amount` decimal(20,2) DEFAULT 0.00 COMMENT '成功发放的税前金额' AFTER `status`;
ALTER TABLE xb_salary_order ADD COLUMN `payed_tax_amount` decimal(20,2) DEFAULT 0.00 COMMENT '成功发放的税总额' AFTER `status`;


SHOW CREATE PROCEDURE __order_pay_statistics

SHOW INDEX FROM  xb_salary_pay

CREATE INDEX result_status on xb_salary_pay (result_status);

CREATE INDEX process_status on xb_salary_pay (process_status);

DROP INDEX result_status on xb_salary_pay;
DROP INDEX process_status on xb_salary_pay;




SELECT 
		xb_salary_pay.order_id,
		SUM(xb_salary_pay.salary) as payed_salary,
		SUM(xb_salary_pay.tax) as payed_tax
	FROM xb_salary_order 
	JOIN xb_salary_pay on xb_salary_order.order_id = xb_salary_pay.order_id AND xb_salary_order.`status` = 4
	AND xb_salary_order.`pay_status` = 4
	AND xb_salary_order.`payed_statistics_status` = 0
	AND xb_salary_pay.result_status = 0
	AND xb_salary_pay.process_status = 0 
GROUP BY xb_salary_pay.order_id;

	WHERE xb_salary_order.`status` = 4
	AND xb_salary_order.`pay_status` = 4
	AND xb_salary_order.`payed_statistics_status` = 0
	AND xb_salary_pay.result_status = 0
	AND xb_salary_pay.process_status = 0 
	GROUP BY xb_salary_pay.order_id;


SELECT 
		xb_salary_pay.order_id,
		SUM(xb_salary_pay.salary) as payed_salary,
		SUM(xb_salary_pay.tax) as payed_tax
	FROM xb_salary_order 
	JOIN xb_salary_pay on xb_salary_order.order_id = xb_salary_pay.order_id
	WHERE xb_salary_order.`status` = 4
	AND xb_salary_order.`pay_status` = 4
	AND xb_salary_order.`payed_statistics_status` = 0
	AND xb_salary_pay.result_status = 0
	AND xb_salary_pay.process_status = 0 
	GROUP BY xb_salary_pay.order_id;

DELETE FROM `__tmp_order_statistics`;


DROP PROCEDURE IF EXISTS `__order_pay_statistics`;
CREATE PROCEDURE __order_pay_statistics()
BEGIN
	# 创建 打款统计临时表
	DROP TABLE IF EXISTS `__tmp_order_statistics`;
	CREATE TEMPORARY  TABLE `__tmp_order_statistics` 
	AS
	 SELECT 
		xb_salary_pay.order_id,
		SUM(xb_salary_pay.salary) as payed_salary,
		SUM(xb_salary_pay.tax) as payed_tax
	FROM xb_salary_order 
	JOIN xb_salary_pay on xb_salary_order.order_id = xb_salary_pay.order_id AND xb_salary_order.`status` = 4
	AND xb_salary_order.`pay_status` = 4
	AND xb_salary_order.`payed_statistics_status` = 0
	AND xb_salary_pay.result_status = 0
	AND xb_salary_pay.process_status = 0 
  GROUP BY xb_salary_pay.order_id;
	# 更新信息
	UPDATE xb_salary_order
	LEFT JOIN __tmp_order_statistics ON __tmp_order_statistics.order_id = xb_salary_order.order_id
	SET 
	 xb_salary_order.payed_salary_amount = IFNULL(__tmp_order_statistics.payed_salary,0),
	 xb_salary_order.payed_tax_amount = IFNULL(__tmp_order_statistics.payed_tax,0),
	 xb_salary_order.payed_statistics_status = 1
	WHERE
		xb_salary_order.payed_statistics_status = 0
		AND xb_salary_order.`status` = 4
		AND xb_salary_order.`pay_status` = 4;
	# 删除临时表
  DROP TABLE IF EXISTS `__tmp_order_statistics`;
END;




SELECT
	`xb_salary_order`.`order_id`,
	`xb_salary_order`.`company_id`,
	`xb_salary_order`.`status`,
	`xb_salary_order`.`pay_status`,
	`xb_company`.`type` AS `company_type`,
	`xb_company_pay_conf`.`login_name`,
	`xb_company_pay_conf`.`ip_address`,
	`xb_company_pay_conf`.`port`,
	`xb_company_pay_conf`.`ACCNBR`,
	`xb_company_pay_conf`.`C_BBKNBR`,
	`xb_company_pay_conf`.`BBKNBR`,
	`xb_company_pay_conf`.`CNVNBR`,
	`xb_salary_pay`.`id` AS `pay_id`,
	`xb_salary_pay`.`YURREF`,
	`xb_salary_pay`.`REQNBR`,
	`xb_salary_pay`.`api_type`
FROM
	`xb_salary_order`
INNER JOIN `xb_salary_pay` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
INNER JOIN `xb_company` ON `xb_salary_order`.`company_id` = `xb_company`.`company_id`
LEFT JOIN `xb_company_pay_conf` ON `xb_salary_order`.`company_id` = `xb_company_pay_conf`.`company_id`
WHERE
	`xb_salary_pay`.`process_status` IN ('3', '2')
LIMIT 10000 

CREATE INDEX process_status on xb_salary_pay(process_status)




SELECT * FROM mysql.proc WHERE db=DATABASE() AND name='__order_pay_statistics'


DROP VIEW IF EXISTS `xb_view_order_pay_amount`;

show  CREATE VIEW xb_view_order_pay_amount





CREATE VIEW `xb_view_order_pay_amount` AS SELECT
	xb_salary_pay.order_id,
	SUM(xb_salary_pay.salary) AS payed_salary,
	SUM(xb_salary_pay.tax) AS payed_tax
FROM
	xb_salary_order
JOIN xb_salary_pay ON xb_salary_order.order_id = xb_salary_pay.order_id
AND xb_salary_order.`status` = 4
AND xb_salary_order.`pay_status` = 4
AND xb_salary_order.`payed_statistics_status` = 0
AND xb_salary_pay.result_status = 0
AND xb_salary_pay.process_status = 0
GROUP BY
	xb_salary_pay.order_id;

SELECT * FROM __tmp_order_statistics

CALL __order_pay_statistics();


DROP TABLE IF EXISTS `__tmp_order_statistics`;
CREATE TABLE `__tmp_order_statistics` 
AS
SELECT 
	xb_salary_pay.order_id,
	SUM(xb_salary_pay.salary) as payed_salary,
  SUM(xb_salary_pay.tax) as payed_tax
FROM xb_salary_order 
JOIN xb_salary_pay on xb_salary_order.order_id = xb_salary_pay.order_id
WHERE xb_salary_order.`status` = 4
AND xb_salary_order.`pay_status` = 4
AND xb_salary_order.`payed_statistics_status` = 0
AND xb_salary_pay.result_status = 0
AND xb_salary_pay.process_status = 0 
GROUP BY xb_salary_pay.order_id

SELECT
	order_id,
	`status`,
	pay_status,
	payed_statistics_status,
	payed_salary_amount,
	payed_tax_amount
FROM xb_salary_order;

SELECT * FROM xb_salary_order WHERE order_id = '145794882390290295';
SELECT * FROM xb_salary_pay WHERE order_id = '145794882390290295';
SELECT COUNT(*) FROM xb_salary_pay;
SELECT COUNT(*) FROM __tmp_order_statistics;


UPDATE xb_salary_order
LEFT JOIN __tmp_order_statistics ON __tmp_order_statistics.order_id = xb_salary_order.order_id
SET 
 xb_salary_order.payed_salary_amount = IFNULL(__tmp_order_statistics.payed_salary,0),
 xb_salary_order.payed_tax_amount = IFNULL(__tmp_order_statistics.payed_tax,0),
 xb_salary_order.payed_statistics_status = 1
WHERE
	xb_salary_order.payed_statistics_status = 0
	AND xb_salary_order.`status` = 4
  AND xb_salary_order.`pay_status` = 4;