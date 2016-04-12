# Add COLUMN
ALTER TABLE xb_salary_order ADD COLUMN `payed_statistics_status` TINYINT(1) DEFAULT 0 COMMENT '成功发放统计状态0未统计，1已统计' AFTER `status`;
ALTER TABLE xb_salary_order ADD COLUMN `payed_salary_amount` decimal(20,2) DEFAULT 0.00 COMMENT '成功发放的税前金额' AFTER `status`;
ALTER TABLE xb_salary_order ADD COLUMN `payed_tax_amount` decimal(20,2) DEFAULT 0.00 COMMENT '成功发放的税总额' AFTER `status`;
ALTER TABLE xb_salary_order ADD COLUMN `payed_success_count` SMALLINT (5) DEFAULT 0 COMMENT '打款成功数量' AFTER `payed_statistics_status`;
ALTER TABLE xb_salary_order ADD COLUMN `should_pay_salary` DECIMAL(20,2) DEFAULT 0 COMMENT '需付薪资总金额' AFTER `status`;
ALTER TABLE xb_salary_order ADD COLUMN `should_pay_tax` DECIMAL(20,2) DEFAULT 0 COMMENT '需付个税总金额' AFTER `status`;
ALTER TABLE xb_salary_order ADD COLUMN `should_pay_num` int (10) DEFAULT 0 COMMENT '需打款人数' AFTER `status`;

# Create View `xb_view_order_pay_amount` To Update Should Pay Amount
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

# Clear New Column Values
UPDATE xb_salary_order SET 
 xb_salary_order.`should_pay_salary` = 0,
 xb_salary_order.`should_pay_tax` = 0,
 xb_salary_order.`should_pay_num` = 0;

# Update Update Should Pay Amount
UPDATE xb_salary_order
JOIN xb_view_order_pay_amount ON xb_salary_order.order_id = xb_view_order_pay_amount.order_id
SET 
	xb_salary_order.should_pay_salary = xb_view_order_pay_amount.should_pay_salary,
	xb_salary_order.should_pay_tax = xb_view_order_pay_amount.should_pay_tax,
	xb_salary_order.should_pay_num = xb_view_order_pay_amount.should_pay_num;


# Create View `xb_view_order_payed_amount` To Update Payed Statistics Info
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

# Clear New Column Values
UPDATE xb_salary_order SET payed_statistics_status = 0 ;

# Update Payed Statistics Info
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





