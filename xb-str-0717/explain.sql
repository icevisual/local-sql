SELECT
	count(*) AS AGGREGATE
FROM
	`xb_salary_order`
WHERE
	`order_id` = '146649820572771896';



SELECT
		`xb_salary_order`.`order_type`,
		`xb_salary_order`.`status` AS `order_status`,
		`xb_salary_order`.`pay_status` AS `order_pay_status`,
		`xb_salary_order`.`title`,
		`xb_salary_order`.`order_id`
	FROM
		`xb_salary_order`
	WHERE
		`xb_salary_order`.`order_id` = '146649820572771896'
	AND `xb_salary_order`.`company_id` = '28'
	AND `xb_salary_order`.`order_id` = '146649820572771896'
	LIMIT 1 ;


 SELECT
		`xb_salary_payroll_value`.`payroll_id`,
		`xb_salary_payroll_value`.`name`,
		`xb_salary_payroll_value`.`code`,
		`xb_salary_payroll_value`.`width`
	FROM
		`xb_salary_payroll_value`
	WHERE
		`order_id` = '146649820572771896'
	GROUP BY
		`xb_salary_payroll_value`.`payroll_id`
	ORDER BY
		`excel_sort` ASC ;

SELECT
			`xb_salary_pay`.`id` AS `pay_id`,
			`xb_salary_pay`.`truename`,
			`xb_salary_pay`.`salary`,
			`xb_salary_pay`.`tax`,
			`xb_salary_pay`.`amount`,
			`xb_salary_pay`.`bank_name`,
			`xb_salary_pay`.`card_no`,
			`xb_salary_pay`.`result_status`,
			`xb_salary_pay`.`reason`,
			`xb_salary_pay`.`process_status`,
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
			`xb_salary_order`
		INNER JOIN `xb_salary_pay` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
		INNER JOIN `xb_salary_payroll_value` ON `xb_salary_pay`.`id` = `xb_salary_payroll_value`.`pay_id`
		WHERE
			`xb_salary_order`.`order_id` = '146649820572771896'
		AND `xb_salary_order`.`company_id` = '28'
		AND `xb_salary_pay`.`result_status` = '1'
		GROUP BY
			`xb_salary_pay`.`id` 