



SELECT
	SUBSTR(xb_salary_order.pay_at, 1, 7) AS yearMonth,
	SUM(xb_salary_pay.salary) AS salary,
	SUM(xb_salary_pay.tax) AS tax
FROM
	`xb_salary_order`
INNER JOIN `xb_salary_pay` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
WHERE
	`xb_salary_order`.`company_id` = '150'
AND `xb_salary_order`.`pay_at` >= '2015-01-01 00:00:01'
AND `xb_salary_order`.`pay_at` <= '2015-12-31 23:59:59'
AND `xb_salary_order`.`status` = '4'
AND `xb_salary_order`.`pay_status` = '4'
AND `xb_salary_pay`.`result_status` = '0'
AND `xb_salary_pay`.`process_status` = '0'
GROUP BY
	`yearMonth`

  