SELECT
	`xb_salary_order`.`order_id`,
	`xb_salary_order`.`company_id`,
	`xb_salary_order`.`title`,
	`xb_company`.`name`,
	`xb_company`.`account_balance`,
	`xb_company`.`type`,
	`xb_salary_order`.`payment_at`,
	COUNT(xb_salary_pay.id) user_count,
	SUM(xb_salary_pay.salary) salary_amount,
	SUM(xb_salary_pay.tax) tax_amount,
	`xb_salary_order`.`status`,
	`xb_salary_order`.`pay_status`,
	SUM(
		xb_salary_pay.result_status
	) failed_count,
	`xb_salary_order`.`note`,
	`xb_salary_order`.`submit_at`,
	`xb_salary_order`.`operator_id`,
	`xb_salary_order`.`lastedit_at`
FROM
	`xb_salary_order`
 JOIN `xb_salary_pay` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id` AND `xb_salary_order`.`status` > 0
INNER JOIN `xb_company` ON `xb_salary_order`.`company_id` = `xb_company`.`company_id`
-- WHERE
-- 	`xb_salary_order`.`status` > 0 ## IN ('1', '2', '3', '4', '5')
GROUP BY
	`xb_salary_order`.`order_id`
ORDER BY
	`xb_salary_order`.`status` ASC,
	`xb_salary_order`.`submit_at` ASC
LIMIT 10 OFFSET 0 



SHOW CREATE TABLE xb_salary_order


SELECT
	`xb_salary_order`.`order_id`,
	`xb_salary_order`.`company_id`,
	`xb_salary_order`.`title`,
	`xb_company`.`name`,
	`xb_company`.`account_balance`,
	`xb_company`.`type`,
	`xb_salary_order`.`payment_at`,
	COUNT(xb_salary_pay.id) user_count,
	SUM(xb_salary_pay.salary) salary_amount,
	SUM(xb_salary_pay.tax) tax_amount,
	`xb_salary_order`.`status`,
	`xb_salary_order`.`pay_status`,
	SUM(
		xb_salary_pay.result_status
	) failed_count,
	`xb_salary_order`.`note`,
	`xb_salary_order`.`submit_at`,
	`xb_salary_order`.`operator_id`,
	`xb_salary_order`.`lastedit_at`
FROM
	`xb_salary_order`
LEFT JOIN `xb_salary_pay` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
INNER JOIN `xb_company` ON `xb_salary_order`.`company_id` = `xb_company`.`company_id`

GROUP BY
	`xb_salary_pay`.`order_id`
ORDER BY
	`xb_salary_order`.`status` ASC,
	`xb_salary_order`.`submit_at` ASC
LIMIT 10 OFFSET 0 


SHOW INDEX FROM xb_salary_pay



CREATE INDEX result_status on xb_salary_pay (`result_status`) USING BTREE

CREATE INDEX salary on xb_salary_pay (salary) USING BTREE

SHOW INDEX FROM xb_company


DROP INDEX company_id on xb_salary_pay 



delete  FROM xb_salary_pay WHERE company_id = 250





UPDATE xb_salary_order SET company_id=150 WHERE  company_id = 250;

UPDATE xb_salary_pay SET company_id=150 WHERE  company_id = 250;


CREATE DATABASE zxb_test


SELECT count(*) FROM xb_salary_pay WHERE created_at  >= '2016-04-05 17:30:00';


show index FROM xb_salary_pay 

delete  FROM xb_salary_order WHERE created_at  >= '2016-04-05 17:30:00';
delete  FROM xb_salary_pay WHERE created_at  >= '2016-04-05 17:30:00';





SELECT
	SUBSTR(xb_salary_order.pay_at, 1, 7) AS yearMonth,
	SUM(xb_salary_pay.salary) AS salary,
	SUM(xb_salary_pay.tax) AS tax,
FROM
	`xb_salary_order`
INNER JOIN `xb_salary_pay` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
WHERE
	`xb_salary_order`.`company_id` = '150'
AND `xb_salary_order`.`status` = '4'
AND `xb_salary_order`.`pay_status` = '4'
AND `xb_salary_order`.`pay_at` >= '2015-01-01 00:00:01'
AND `xb_salary_order`.`pay_at` <= '2015-12-31 23:59:59'
GROUP BY
	`yearMonth`






