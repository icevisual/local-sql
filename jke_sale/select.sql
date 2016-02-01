



mysqldump -uroot -p adm_actions adm_actions_role  adm_admins adm_admins_options  adm_area  adm_category  adm_roles --dump-date --add-drop-table --result-file=/d/sqlLog/test/s/dump-ads-jks.sql



ALTER TABLE jk_inout_order ADD COLUMN note VARCHAR (255) NULL COMMENT '备注';













SELECT
	`jk_daily_sales`.`date`,
	`jk_daily_sales`.`group_id`,
	`jk_daily_sales`.`goods_id`,
	`jk_group`.`group_name`,
	`jk_sales_audit`.`group_confirm`,
	`jk_sales_audit`.`finance_confirm`,
	SUM(sales_num) AS num,
	sum(sales_num * sales_price) amount
FROM
	`jk_daily_sales`
INNER JOIN `jk_group` ON `jk_daily_sales`.`group_id` = `jk_group`.`group_id`
LEFT JOIN `jk_sales_audit` ON `jk_sales_audit`.`sales_date` = `jk_daily_sales`.`date`
AND `jk_sales_audit`.`group_id` = `jk_daily_sales`.`group_id`
GROUP BY
	`jk_daily_sales`.`group_id`,
	`jk_daily_sales`.`date`,
	`jk_daily_sales`.`goods_id`
ORDER BY
	`jk_daily_sales`.`date` DESC,
	`jk_daily_sales`.`group_id` DESC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SELECT
	`jk_daily_sales`.`group_id`,
	`jk_group_member`.`group_id`,
	`jk_group_member`.`member_name`,
	`jk_daily_sales`.`goods_id`,
	SUM(sales_num) AS num,
	sum(sales_num * sales_price) amount
FROM
	`jk_daily_sales`
JOIN `jk_group_member` ON `jk_daily_sales`.`member_id` = `jk_group_member`.`member_id`
AND `jk_daily_sales`.`date` = '2016-01-06'
GROUP BY
	`jk_group_member`.`member_id`





SELECT
	`jk_group_member`.`member_id`,
	`jk_group_member`.`member_name`,
	`jk_daily_sales`.`goods_id`,
	SUM(sales_num) AS num,
	sum(sales_num * sales_price) amount
FROM
	`jk_daily_sales`
RIGHT JOIN `jk_group_member` ON `jk_daily_sales`.`member_id` = `jk_group_member`.`member_id`
AND `jk_daily_sales`.`group_id` = `jk_group_member`.`group_id`
AND `jk_daily_sales`.`date` = '2016-01-06'
WHERE
	`jk_group_member`.`group_id` = '16'
GROUP BY
	`jk_group_member`.`member_id`,
	`jk_daily_sales`.`goods_id`
ORDER BY
	`jk_daily_sales`.`member_id` DESC

;;;

SELECT
	jk_inout_order.out_group_id,
	jk_inout_detail.goods_id,
	SUM(jk_inout_detail.goods_num) sum
FROM
	jk_inout_order
JOIN jk_inout_detail ON jk_inout_order.order_id = jk_inout_detail.order_id
WHERE
	jk_inout_order.`inout` = 0
GROUP BY
	jk_inout_order.out_group_id,
	jk_inout_detail.goods_id;

SELECT
	group_id,
	goods_id,
	SUM(sum) asum
FROM
	(
		SELECT
			'sales' AS from_,
			group_id,
			goods_id,
			SUM(sales_num) sum
		FROM
			jk_daily_sales
		GROUP BY
			group_id,
			goods_id
		UNION
			SELECT
				'storage' AS from_,
				group_id,
				goods_id,
				SUM(goods_storage) sum
			FROM
				jk_group_storage
			GROUP BY
				group_id,
				goods_id
	) AS a
GROUP BY
	group_id,
	goods_id