


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