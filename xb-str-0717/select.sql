SELECT
	`xb_company`.`company_id`
FROM
	`xb_company`
LEFT JOIN `xb_company_payroll_property` ON `xb_company_payroll_property`.`company_id` = `xb_company`.`company_id`
AND `xb_company_payroll_property`.`id` IS NULL 



SELECT
	`xb_company`.`company_id`
FROM
	`xb_company`
LEFT JOIN `xb_company_payroll_property` ON `xb_company_payroll_property`.`company_id` = `xb_company`.`company_id`
WHERE `xb_company_payroll_property`.`id` IS NULL 



SHOW CREATE TABLE xb_company_payroll_property


CREATE TABLE `xb_company_payroll_property` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `payroll_id` int(11) NOT NULL COMMENT '工资单属性编号',
  `excel_sort` tinyint(5) NOT NULL COMMENT 'excel排序，小到大',
  `weixin_sort` tinyint(5) NOT NULL DEFAULT '0' COMMENT '微信显示排序，小到大',
  `is_weixin_show` tinyint(2) NOT NULL COMMENT '微信是否显示',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业工资单属性'



SELECT
	`xb_company`.`company_id`, COUNT(xb_company_payroll_property.id) 
FROM
	`xb_company`
LEFT JOIN `xb_company_payroll_property` ON `xb_company_payroll_property`.`company_id` = `xb_company`.`company_id`
AND `xb_company_payroll_property`.`id` IS NULL 
GROUP BY `xb_company`.`company_id` HAVING COUNT(xb_company_payroll_property.id) = 6



SELECT
	`xb_company`.`company_id`, COUNT(xb_company_payroll_property.id) 
FROM
	`xb_company`
LEFT JOIN `xb_company_payroll_property` ON `xb_company_payroll_property`.`company_id` = `xb_company`.`company_id`
GROUP BY `xb_company`.`company_id` HAVING COUNT(xb_company_payroll_property.id) = 0


SELECT
	`xb_company`.`company_id`, COUNT(xb_company_payroll_property_copy.id) 
FROM
	`xb_company`
LEFT JOIN `xb_company_payroll_property_copy` ON `xb_company_payroll_property_copy`.`company_id` = `xb_company`.`company_id`
GROUP BY `xb_company`.`company_id`


SELECT
	`xb_salary_order`.`company_id`,
	`xb_salary_order`.`order_id`
FROM
	`xb_salary_order`
GROUP BY
	`xb_salary_order`.`order_id`
LIMIT 1000

46224 277344


SHOW PROCESSLIST


SELECT COUNT(DISTINCT id) FROM xb_salary_payroll_value;
SELECT COUNT(DISTINCT id) FROM xb_salary_pay;

SELECT COUNT(DISTINCT company_id) FROM xb_salary_pay;

SELECT COUNT(DISTINCT order_id) FROM xb_salary_pay;

SELECT COUNT(DISTINCT order_id) FROM xb_salary_order;


SELECT 
A.order_id
FROM xb_salary_order LEFT JOIN (

SELECT order_id FROM xb_salary_pay GROUP BY order_id ) as A ON xb_salary_order.order_id = A.order_id
WHERE xb_salary_order.order_id is NULL 

SELECT * FROM (

SELECT xb_salary_pay.order_id FROM xb_salary_pay GROUP BY order_id ) as A WHERE A.order_id not in (
SELECT xb_salary_order.order_id FROM xb_salary_order)






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










