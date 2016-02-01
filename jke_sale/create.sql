


show TABLES LIKE 'adm_%';







SELECT
	`jk_daily_sales`.`date`,
	`jk_daily_sales`.`group_id`,
	`jk_group`.`group_name`
FROM
	`jk_daily_sales`
INNER JOIN `jk_group` ON `jk_daily_sales`.`group_id` = `jk_group`.`group_id`
GROUP BY
	`jk_daily_sales`.`group_id`,
	`jk_daily_sales`.`date`
ORDER BY
	`jk_daily_sales`.`date` DESC,
	`jk_daily_sales`.`group_id` DESC