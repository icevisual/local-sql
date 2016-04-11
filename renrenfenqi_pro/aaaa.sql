ALTER TABLE ecs_pay_setting ADD UNIQUE KEY (pay_set_id);
ALTER TABLE ecs_pay_setting DROP PRIMARY KEY ;
ALTER TABLE ecs_pay_setting ADD PRIMARY KEY (uid);
ALTER TABLE ecs_orders ADD INDEX stu_id_ind(stu_id);


select COUNT(DISTINCT uid) INTO @uid FROM ecs_pay_setting  ;
select COUNT(*) INTO @pay_set_id FROM ecs_pay_setting ;
SELECT @pay_set_id,@uid;


SELECT
	`ecs_student_account`.`uid`,
	`ecs_students`.`name`,
	`ecs_students`.`school_id`,
	`ecs_schools`.`school_name`,
	`ecs_student_account`.`user_name` AS `account`,
	`ecs_pay_setting`.`refund_day`,
	`ecs_students`.`identity`,
	`ecs_orders`.`created_at` AS `time`,
	`ecs_orders`.`business_no`,
	`ecs_orders`.`goods_name`,
	`ecs_orders`.`goods_price`,
	`ecs_orders`.`monthly_price`,
	`ecs_orders`.`pay_first_price`,
	`ecs_orders`.`job_price`,
	`ecs_orders`.`order_id`
FROM
	`ecs_student_account`
INNER JOIN `ecs_students` ON `ecs_student_account`.`stu_id` = `ecs_students`.`stu_id`
INNER JOIN `ecs_pay_setting` ON `ecs_pay_setting`.`uid` = `ecs_student_account`.`uid`
INNER JOIN `ecs_orders` ON `ecs_orders`.`stu_id` = `ecs_students`.`stu_id`
LEFT JOIN `ecs_schools` ON `ecs_students`.`school_id` = `ecs_schools`.`school_id`
WHERE
	`ecs_orders`.`status` IN (5, 15)
AND `ecs_student_account`.`stu_id` IS NOT NULL
AND `ecs_student_account`.`stu_id` != 0
AND `ecs_student_account`.`uid` NOT IN (
	10,
	11,
	15,
	16,
	18,
	19,
	32,
	33,
	77,
	78,
	79,
	85,
	358,
	400,
	412,
	453,
	492,
	1098,
	11968,
	11967,
	999,
	13774,
	12427,
	14280,
	502,
	13288,
	17557,
	18517,
	1061,
	688,
	18309,
	18355,
	18310,
	18318,
	18332,
	18339,
	18313,
	18658,
	18613,
	18588,
	18558,
	18452,
	18228,
	18489,
	19474,
	22760,
	23565,
	23800,
	22789,
	25523,
	22818,
	23805,
	28178,
	28188,
	28204,
	31562,
	31727

)
AND `ecs_orders`.`created_at` >= '2014-07-01 00:00:00' 
AND `ecs_orders`.`created_at` <= '2015-12-31 23:59:59' 
ORDER BY
	`ecs_orders`.`order_id` ASC
