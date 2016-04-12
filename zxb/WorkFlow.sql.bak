
STOP;
## At 2016-04-11 09:39:35 优化招薪宝-总后台-工资确认列表
##　时间: 6.196s

SHOW INDEX FROM xb_salary_order;

SHOW INDEX FROM xb_salary_order;

SHOW INDEX FROM xb_salary_pay;

CREATE INDEX company_id on xb_salary_order(company_id)

CREATE INDEX status on xb_salary_order(status)
DROP INDEX company_id on xb_salary_order;
DROP INDEX status on xb_salary_order;

SELECT
	`xb_salary_order`.`order_id`,
	`xb_salary_order`.`company_id`,
	`xb_salary_order`.`title`,
	`xb_salary_order`.`payment_at`,
	
	`xb_salary_order`.`should_pay_salary` AS `salary_amount`,
	`xb_salary_order`.`should_pay_tax` AS `tax_amount`,
	`xb_salary_order`.`status`,
	`xb_salary_order`.`pay_status`,
	# SUM(xb_salary_pay.result_status) failed_count,
	`xb_salary_order`.`note`,
	`xb_salary_order`.`submit_at`,
	`xb_salary_order`.`operator_id`,
	`xb_salary_order`.`lastedit_at`,
COUNT(xb_salary_pay.id) user_count

FROM
	`xb_salary_order`
JOIN `xb_salary_pay` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
# INNER JOIN `xb_company` ON `xb_salary_order`.`company_id` = `xb_company`.`company_id`
WHERE
	`xb_salary_order`.`status` in (1,2,3,4,5)
GROUP BY
	`xb_salary_order`.`order_id`
ORDER BY
	`xb_salary_order`.`status` ASC,
	`xb_salary_order`.`submit_at` ASC
LIMIT 10 OFFSET 0 

SHOW INDEX FROM xb_salary_pay ;

CREATE INDEX result_status on xb_salary_pay (result_status);

DROP INDEX result_status on xb_salary_pay

CREATE VIEW xb_view_order_pay_count AS
SELECT 
	xb_salary_pay.order_id,
	SUM(xb_salary_pay.result_status) failed_count
FROM xb_salary_pay 
GROUP BY xb_salary_pay.order_id




SELECT a.*,xb_company.name FROM (
	SELECT
		`xb_salary_order`.`order_id`,
		`xb_salary_order`.`company_id`,
		`xb_salary_order`.`title`,
		`xb_salary_order`.`payment_at`,
		`xb_salary_order`.`should_pay_salary` AS `salary_amount`,
		`xb_salary_order`.`should_pay_tax` AS `tax_amount`,
		`xb_salary_order`.`status`,
		`xb_salary_order`.`pay_status`,
	#	SUM(xb_salary_pay.result_status) failed_count,
		`xb_salary_order`.`note`,
		`xb_salary_order`.`submit_at`,
		`xb_salary_order`.`operator_id`,
		`xb_salary_order`.`lastedit_at`,
		COUNT(xb_salary_pay.id) user_count
	FROM
		xb_salary_order
	JOIN xb_salary_pay ON xb_salary_order.order_id = xb_salary_pay.order_id
	WHERE `xb_salary_order`.`status` in (1,2,3,4,5)
	GROUP BY
		xb_salary_order.order_id
	ORDER BY
		`xb_salary_order`.`status` ASC,
		`xb_salary_order`.`submit_at` ASC

) a
JOIN `xb_company` ON `a`.`company_id` = `xb_company`.`company_id`

	LIMIT 10 OFFSET 0 




SELECT
	`xb_a`.*, `xb_company`.`name`,
	`xb_company`.`account_balance`,
	`xb_company`.`type`
FROM
	`xb_company`
INNER JOIN (
	SELECT
		`xb_salary_order`.`order_id`,
		`xb_salary_order`.`company_id`,
		`xb_salary_order`.`title`,
		`xb_salary_order`.`payment_at`,
		COUNT(xb_salary_pay.id) user_count,
		`xb_salary_order`.`should_pay_salary` AS `salary_amount`,
		`xb_salary_order`.`should_pay_tax` AS `tax_amount`,
		`xb_salary_order`.`status`,
		`xb_salary_order`.`pay_status`,
		`xb_salary_order`.`note`,
		`xb_salary_order`.`submit_at`
	FROM
		`xb_salary_order`
	LEFT JOIN `xb_salary_pay` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
	WHERE
	`xb_salary_order`.`status` IN ('1', '2', '3', '4', '5')
	GROUP BY
		`xb_salary_order`.`order_id`
	ORDER BY
		`xb_salary_order`.`status` ASC,
		`xb_salary_order`.`submit_at` ASC
) AS xb_a ON `xb_a`.`company_id` = `xb_company`.`company_id`
WHERE
	`xb_a`.`status` IN ('1', '2', '3', '4', '5')
LIMIT 20 OFFSET 0




SHOW INDEX FROM xb_salary_pay ;

CREATE INDEX result_status on xb_salary_pay (result_status);

DROP INDEX result_status on xb_salary_pay


SELECT
	`xb_salary_order`.`order_id`,
	`xb_salary_order`.`company_id`,
	`xb_salary_order`.`title`,
	`xb_salary_order`.`payment_at`,
	`xb_salary_order`.`should_pay_salary` AS `salary_amount`,
	`xb_salary_order`.`should_pay_tax` AS `tax_amount`,
	`xb_salary_order`.`status`,
	`xb_salary_order`.`pay_status`,
	`xb_salary_order`.`note`,
	`xb_salary_order`.`submit_at`,
	`xb_salary_order`.`operator_id`,
	`xb_salary_order`.`lastedit_at`,
	COUNT(p.id) success_count
FROM
	xb_salary_order
JOIN xb_salary_pay p ON xb_salary_order.order_id = p.order_id AND p.result_status = 0  
WHERE `xb_salary_order`.`status` in (1,2,3,4,5)
 
GROUP BY
	xb_salary_order.order_id
ORDER BY
	`xb_salary_order`.`status` ASC,
	`xb_salary_order`.`submit_at` ASC
LIMIT 10 OFFSET 0 



SHOW CREATE TABLE xb_salary_order


ALTER TABLE xb_salary_order DROP COLUMN `should_pay_num` ;



ALTER TABLE xb_salary_order ADD COLUMN should_pay_salary DECIMAL(20,2) DEFAULT 0 COMMENT '需付薪资总金额' AFTER `status`;
ALTER TABLE xb_salary_order ADD COLUMN should_pay_tax DECIMAL(20,2) DEFAULT 0 COMMENT '需付个税总金额' AFTER `status`;
ALTER TABLE xb_salary_order ADD COLUMN `payed_success_count` SMALLINT (5) DEFAULT 0 COMMENT '打款成功数量' AFTER `payed_statistics_status`;
ALTER TABLE xb_salary_order ADD COLUMN `should_pay_num` int (10) DEFAULT 0 COMMENT '需打款人数' AFTER `status`;

DROP VIEW IF EXISTS `xb_view_order_pay_amount`;
CREATE VIEW `xb_view_order_pay_amount` 
AS
SELECT xb_salary_pay.order_id,
	COUNT(xb_salary_pay.id) AS should_pay_num,
	SUM(xb_salary_pay.salary) AS should_pay_salary,
	SUM(xb_salary_pay.tax) AS should_pay_tax
FROM
	xb_salary_order
JOIN xb_salary_pay ON xb_salary_order.order_id = xb_salary_pay.order_id
AND xb_salary_order.`should_pay_salary` = 0
AND xb_salary_order.`should_pay_tax` = 0
AND xb_salary_order.`should_pay_num` = 0
GROUP BY
	xb_salary_pay.order_id ;

UPDATE xb_salary_order SET 
 xb_salary_order.`should_pay_salary` = 0,
 xb_salary_order.`should_pay_tax` = 0,
 xb_salary_order.`should_pay_num` = 0
# STEPS 3
UPDATE xb_salary_order
JOIN xb_view_order_pay_amount ON xb_salary_order.order_id = xb_view_order_pay_amount.order_id
SET xb_salary_order.should_pay_salary = xb_view_order_pay_amount.should_pay_salary,
 xb_salary_order.should_pay_tax = xb_view_order_pay_amount.should_pay_tax,
xb_salary_order.should_pay_num = xb_view_order_pay_amount.should_pay_num;




SELECT order_id,payed_success_count,should_pay_num FROM xb_salary_order  WHERE should_pay_num = 0 ;





SELECT
	`xb_salary_order`.`order_id`,
	`xb_salary_order`.`company_id`,
	`xb_salary_order`.`title`,
	`xb_company`.`name`,
	`xb_company`.`account_balance`,
	`xb_company`.`type`,
	`xb_salary_order`.`payment_at`,
	#COUNT(xb_salary_pay.id) user_count,
	`xb_salary_order`.`should_pay_salary` AS `salary_amount`,
	`xb_salary_order`.`should_pay_tax` AS `tax_amount`,
	`xb_salary_order`.`status`,
	`xb_salary_order`.`pay_status`,
	#SUM(	xb_salary_pay.result_status) failed_count,
	`xb_salary_order`.`note`,
	`xb_salary_order`.`submit_at`
FROM
	`xb_salary_order`
#INNER JOIN `xb_salary_pay` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
INNER JOIN `xb_company` ON `xb_salary_order`.`company_id` = `xb_company`.`company_id`
WHERE
	`xb_salary_order`.`company_id` = '150'
GROUP BY
	`xb_salary_order`.`order_id`
ORDER BY
	`xb_salary_order`.`order_id` DESC
LIMIT 10 OFFSET 340 


UPDATE xb_salary_order
LEFT JOIN xb_view_order_payed_amount ON xb_view_order_payed_amount.order_id = xb_salary_order.order_id
SET 
 xb_salary_order.payed_salary_amount = IFNULL(xb_view_order_payed_amount.payed_salary,0),
 xb_salary_order.payed_tax_amount = IFNULL(xb_view_order_payed_amount.payed_tax,0),
 xb_salary_order.payed_success_count = IFNULL(xb_view_order_payed_amount.payed_success_count,0),
 xb_salary_order.payed_statistics_status = 1
WHERE
	xb_salary_order.payed_statistics_status = 0
	AND xb_salary_order.`status` = 4
	AND xb_salary_order.`pay_status` = 4;


UPDATE xb_salary_order SET payed_statistics_status = 0 

DROP VIEW IF EXISTS `xb_view_order_payed_amount`;
CREATE VIEW `xb_view_order_payed_amount` AS SELECT
	xb_salary_pay.order_id,
	COUNT(xb_salary_pay.id) AS payed_success_count,
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
	xb_salary_pay.order_id ;



show status like 'Handler_read%';

# STEPS 1
ALTER TABLE xb_salary_order ADD COLUMN should_pay_salary DECIMAL(20,2) DEFAULT 0 COMMENT '需付薪资总金额' AFTER `status`;
ALTER TABLE xb_salary_order ADD COLUMN should_pay_tax DECIMAL(20,2) DEFAULT 0 COMMENT '需付个税总金额' AFTER `status`;
# STEPS 2



DROP VIEW IF EXISTS `xb_view_order_pay_amount`;
CREATE VIEW `xb_view_order_pay_amount` 
AS
SELECT xb_salary_pay.order_id,
	COUNT(xb_salary_pay.id) AS should_pay_num,
	SUM(xb_salary_pay.salary) AS should_pay_salary,
	SUM(xb_salary_pay.tax) AS should_pay_tax
FROM
	xb_salary_order
JOIN xb_salary_pay ON xb_salary_order.order_id = xb_salary_pay.order_id
AND xb_salary_order.`should_pay_salary` = 0
AND xb_salary_order.`should_pay_tax` = 0
AND xb_salary_order.`should_pay_num` = 0
GROUP BY
	xb_salary_pay.order_id ;

UPDATE xb_salary_order SET 
 xb_salary_order.`should_pay_salary` = 0,
 xb_salary_order.`should_pay_tax` = 0,
 xb_salary_order.`should_pay_num` = 0
# STEPS 3
UPDATE xb_salary_order
JOIN xb_view_order_pay_amount ON xb_salary_order.order_id = xb_view_order_pay_amount.order_id
SET xb_salary_order.should_pay_salary = xb_view_order_pay_amount.should_pay_salary,
 xb_salary_order.should_pay_tax = xb_view_order_pay_amount.should_pay_tax,
xb_salary_order.should_pay_num = xb_view_order_pay_amount.should_pay_num;


# STEPS 4
SELECT xb_salary_pay.order_id,
	SUM(xb_salary_pay.salary) AS should_pay_salary,
	SUM(xb_salary_pay.tax) AS should_pay_tax
FROM
	xb_salary_order
JOIN xb_salary_pay ON xb_salary_order.order_id = xb_salary_pay.order_id
WHERE 
	xb_salary_pay.order_id  = '145985192860284397';



SELECT order_id,should_pay_salary,should_pay_tax FROM xb_salary_order ;


DROP VIEW IF EXISTS `xb_view_order_pay_amount`;
CREATE VIEW `xb_view_order_pay_amount` 
AS
SELECT xb_salary_pay.order_id,
	SUM(xb_salary_pay.salary) AS should_pay_salary,
	SUM(xb_salary_pay.tax) AS should_pay_tax
FROM
	xb_salary_order
JOIN xb_salary_pay ON xb_salary_order.order_id = xb_salary_pay.order_id
AND xb_salary_order.`should_pay_salary` = 0
AND xb_salary_order.`should_pay_tax` = 0
GROUP BY
	xb_salary_pay.order_id ;




UPDATE xb_salary_order
JOIN xb_view_order_pay_amount ON xb_salary_order.order_id = xb_view_order_pay_amount.order_id
SET xb_salary_order.should_pay_salary = xb_view_order_pay_amount.should_pay_salary,
 xb_salary_order.should_pay_tax = xb_view_order_pay_amount.should_pay_tax



SHOW CREATE VIEW `xb_view_order_pay_amount`;

SHOW CREATE TABLE xb_salary_order ;

CREATE TABLE `xb_salary_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `title` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '工资发放日',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款状态，1未打款，2打款中，3完成打款，结果查询中，4完成结果查询',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0未提交，1已提交,未确认，2被拒绝，3待发放，4已发放，5发放中',
  `should_pay_tax` decimal(20,2) DEFAULT '0.00' COMMENT '需付个税总金额',
  `should_pay_salary` decimal(20,2) DEFAULT '0.00' COMMENT '需付薪资总金额',
  `payed_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税总额',
  `payed_salary_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税前金额',
  `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计',
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

SELECT * FROM xb_view_order_pay_amount;

SELECT * FROM xb_view_order_payed_amount;





