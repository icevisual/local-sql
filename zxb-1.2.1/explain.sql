SELECT
	`xb_salary_pay`.`uid`,
	`xb_salary_pay`.`id` AS `pay_id`,
	`xb_salary_pay`.`order_id`,
	`xb_salary_pay`.`company_id`,
	`xb_salary_pay`.`amount`
FROM
	`xb_salary_pay`
INNER JOIN `xb_employee` ON `xb_salary_pay`.`uid` = `xb_employee`.`uid`
INNER JOIN `xb_company` ON `xb_salary_pay`.`company_id` = `xb_company`.`company_id`
INNER JOIN `xb_employee_company` ON `xb_employee_company`.`uid` = `xb_salary_pay`.`uid`
AND `xb_employee_company`.`company_id` = `xb_salary_pay`.`company_id`
WHERE
	(
		`xb_salary_pay`.`YURREF` = 'I2016070709290010010000000'
		AND `xb_salary_pay`.`card_no` = '6222620170003931032'
		AND `xb_salary_pay`.`truename` = '金燕林'
		AND `xb_salary_pay`.`id` = '18074'
	)
AND `xb_salary_pay`.`uid` != '0'
AND `xb_salary_pay`.`uid` IS NOT NULL
AND `xb_employee`.`open_id` != ''
AND `xb_employee`.`open_id` IS NOT NULL
AND `xb_company`.`payroll_open_query` = '1'
AND `xb_company`.`payroll_auto_push` = '1'
AND `xb_employee_company`.`weixin_authority` = '1'
LIMIT 1 