
SELECT
	SUBSTR(pay_at FROM 1 FOR 7) AS `YEAR_MONTH`,
	SUM(pay_price) AS pay_price,
	SUM(dalay_price) AS dalay_price,
	COUNT(DISTINCT uid) AS num
FROM
	(`gzb_order_pay`)
WHERE
	`status` = 0
AND `uid` NOT IN (
	5,
	12,
	28,
	34,
	85,
	106,
	170,
	5468,
	5478,
	5795,
	8482,
	8525,
	103887,
	117273,
	118124,
	27653,
	1133,
	13,
	108661,
	130699,
	168904,
	142667,
	226823,
	6437,
	187940
)
GROUP BY
	SUBSTR(pay_at FROM 1 FOR 7)


















UPDATE `guozongbao`.`gzb_order_pay` SET `id`='1596', `uid`='127504', `orderid`='1438502170820260', `mon_price`='500.00', `pay_price`='539.00', `early_price`='510.00', `dalay_price`='273.27', `status`='0', `is_message`='0', `pay_at`='2015-08-31 00:00:00', `payment_at`=NULL, `created_at`='2015-08-02 17:51:38', `updated_at`='2016-02-16 00:01:09', `pay_task_id`='0' WHERE (`id`='1596');
UPDATE `guozongbao`.`gzb_order_pay` SET `id`='1597', `uid`='127504', `orderid`='1438502170820260', `mon_price`='500.00', `pay_price`='539.00', `early_price`='510.00', `dalay_price`='224.76', `status`='0', `is_message`='0', `pay_at`='2015-09-30 00:00:00', `payment_at`=NULL, `created_at`='2015-08-02 17:51:38', `updated_at`='2016-02-16 00:01:09', `pay_task_id`='0' WHERE (`id`='1597');



SELECT * FROM gzb_order_main WHERE `status` = 2 AND order_version = 2


SELECT * FROM gzb_user_account WHERE UID = '127504'

SELECT * FROM gzb_user_info WHERE uid= 165682

1445480378074423
1445480378074423

select `gzb_order_main`.`pay_at`
, `gzb_order_main`.`orderid`
, `gzb_order_main`.`order_version`
, `gzb_order_periods`.`payday`
, `gzb_order_periods`.`price` ,`gzb_order_periods`.* 
from `gzb_order_main` 
inner join `gzb_order_periods` on `gzb_order_periods`.`orderid` = `gzb_order_main`.`orderid` 
where `gzb_order_main`.`uid` = '165682' 
and `gzb_order_main`.`status` in ('2'
, '3') 
order by `gzb_order_main`.`created_at` desc, `gzb_order_main`.`status` desc

 limit 1

select `gzb_order_main`.`pay_at`
, `gzb_order_main`.`orderid`
, `gzb_order_main`.`order_version`
, `gzb_order_periods`.`payday`
, `gzb_order_periods`.`price` ,`gzb_order_periods`.* 
from `gzb_order_main` 
inner join `gzb_order_periods` on `gzb_order_periods`.`orderid` = `gzb_order_main`.`orderid` 
where `gzb_order_main`.`uid` = '165682' 

ORDER BY gzb_order_main.order_version DESC