






UPDATE `ecs_delivery_adress` 
SET `ad_name` = 'da',`ad_phone` = '18754652589',`ad_uid` = '884',`ad_status` = '1',`ad_auth` = '1',`school_id` = '1',`ad_dorm_address` = '22223' 
WHERE  `ad_id` = '252'

select `account_id`, `nikename`, `username` 
from `ecs_account` 
right join `ecs_account_group` on `ecs_account`.`account_group_id` = `ecs_account_group`.`id` 
where `account_group_id` = '3sbt025107mc' and `flag_valid ` = 1

DESC ecs_account_group


select `account_id`, `username`, `nikename`, `password`, `account_group_id`, `flag_valid` from `ecs_account`







SELECT *
FROM (`ecs_module`)
WHERE `module_type` =  'module'
ORDER BY `module_order` asc



SELECT `ecs_module`.*
FROM (`ecs_module`)
INNER JOIN `ecs_group_permission` ON (`ecs_group_permission`.`sys_module_id` = `ecs_module`.`id` and user_group_id='3sbsuljdlov8' )

WHERE `module_type` =  'page'
AND `module_parent_id` =  '3sbv2cmqqisg'
ORDER BY `module_order` asc

SELECT * from ecs_group_permission


SELECT m.*,m1.module_name name FROM ecs_module m1
INNER JOIN ecs_module m on   ( m.module_parent_id = m1.id)
INNER JOIN ecs_group_permission 	p on ( m.id = p.sys_module_id )
where p.user_group_id='3sbsuljdlov8' and m.`module_type` =  'page' and m1.`module_type` =  'module'  
ORDER BY m1.module_order asc ,m.module_order asc ,m1.id;


SELECT m.*,m1.module_name name FROM ecs_group_permission 	p
INNER JOIN ecs_module m on  ( m.id = p.sys_module_id )
INNER JOIN ecs_module m1 on ( m.module_parent_id = m1.id)
where p.user_group_id='3sbsuljdlov8' and m.`module_type` =  'page' and m1.`module_type` =  'module'  
ORDER BY m1.module_order asc ,m.module_order asc ,m1.id;


SELECT m.*,m1.module_name name FROM ecs_group_permission 	p
INNER JOIN ecs_module m on  ( p.user_group_id='3sbsuljdlov8' and m.`module_type` =  'page' and m.id = p.sys_module_id )
INNER JOIN ecs_module m1 on ( m1.`module_type` =  'module'  and m.module_parent_id = m1.id)
ORDER BY m1.module_order asc ,m.module_order asc ,m1.id;

WHERE user_group_id='3sbsuljdlov8'


















select `ecs_a`.`goods_id`, `ecs_a`.`goods_map_id`, `ecs_a`.`attr_val_list`, 
	`ecs_a`.`goods_name`, `ecs_a`.`shop_price`, `ecs_a`.`cat_id`, `ecs_a`.`support_periods`, 
`ecs_a`.`first_pay`, `ecs_c`.`is_job`, `ecs_b`.`default_price` 
from `ecs_goods` as `ecs_a` 
left join `ecs_goods_jobs_edition` as `ecs_b` on `ecs_a`.`goods_map_id` = `ecs_b`.`goods_map_id` 
left join `ecs_goods_map` as `ecs_c` on `ecs_a`.`goods_map_id` = `ecs_c`.`goods_map_id` 
where `ecs_a`.`goods_name` like '%i%' limit 25




select `module_resource` 
from `ecs_group_permission g` left join `ecs_module m ` on `ecs_g`.`sys_module_id ` = `ecs_m`.`id` 
where `user_group_id` = 3sbsuljdlov8



CREATE DATABASE mysql_001

SELECT 
`a`.`goods_id`, `a`.`goods_map_id`, `a`.`attr_val_list`, 
`a`.`goods_name`, `a`.`shop_price`, `a`.`cat_id`, `a`.`support_periods`, 
`a`.`first_pay`, `c`.`is_job`, `b`.`default_price` 
FROM (`ecs_goods` a) 
LEFT JOIN `ecs_goods_jobs_edition` b ON `a`.`goods_map_id` = `b`.`goods_map_id` 
LEFT JOIN `ecs_goods_map` c ON `a`.`goods_map_id` = `c`.`goods_map_id` 
WHERE `a`.`goods_name` LIKE '%小米%' LIMIT 25

SELECT * FROM ecs_goods_map where goods_map_id in (6,772);


SELECT * FROM ecs_goods WHERE goods_id  in (26,7701);



14332315899085

SELECT  * from ecs_order_main WHERE business_no = '14331482404888';

SELECT * FROM ecs_order_goods WHERE business_no = '14331482404888';

SELECT * FROM ecs_goods WHERE goods_id = 121;


SELECT  * from ecs_order_log WHERE business_no = '14332315899085'

SELECT  * from ecs_order_log WHERE business_no = '14332333902075'


 

SELECT s.stu_id,s.`name`,s.age,s.phone,a.user_name,a.nikename  
FROM ecs_student_account a JOIN ecs_students s  on s.stu_id = a.stu_id
WHERE ISNULL(a.stu_id) = 1 AND s.phone = '18612345678'

SELECT count(*) from (
SELECT s.stu_id,s.`name`,s.age,s.phone,  a.user_name,a.nikename  
FROM ecs_students s LEFT JOIN ecs_student_account a  on s.stu_id = a.stu_id
) a
181
SELECT s.stu_id,s.`name`,s.age,s.phone,  a.user_name,a.nikename  
FROM ecs_students s LEFT JOIN ecs_student_account a  on s.stu_id = a.stu_id
WHERE ISNULL(a.stu_id) = 1 
AND s.phone = '18612345678'

SELECT s.stu_id,s.`name`,s.age,s.phone,  a.user_name,a.nikename  
FROM ecs_students s LEFT JOIN ecs_student_account a  on s.stu_id = a.stu_id
WHERE s.phone = '18612345678'

SELECT COUNT(*) FROM ecs_students 
494
SELECT * FROM ecs_students limit 1;
SELECT * FROM ecs_student_account limit 1;

SELECT * FROM ecs_students WHERE phone='18612345678' 

SELECT * FROM ecs_student_account WHERE stu_id = 494

SELECT * FROM ecs_student_account WHERE user_name='18612345678' LIMIT 1










SELECT * FROM ecs_delivery_adress WHERE ad_uid = 349 ORDER BY ad_id DESC

SELECT *,COUNT(ad_id) FROM ecs_delivery_adress GROUP BY ad_uid HAVING COUNT(ad_id) > 1

SELECT * FROM ecs_order_log where business_no = 14328667838321
{"ad_id":"252","ad_name":"11111111","ad_phone":"18754652589","ad_uid":"884","ad_status":"1","ad_auth":"1","ad_remark":null,"school_id":"23","ad_dorm_address":"22223"}
755

SELECT * FROM ecs_goods_map WHERE goods_map_id


7667
SELECT 
`a`.`goods_id`, `a`.`goods_map_id`, `a`.`attr_val_list`, 
`a`.`goods_name`, `a`.`shop_price`, `a`.`cat_id`, `a`.`support_periods`, 
`a`.`first_pay`, `c`.`is_job`, `b`.`default_price` 
FROM (`ecs_goods` a) 
LEFT JOIN `ecs_goods_jobs_edition` b ON `a`.`goods_map_id` = `b`.`goods_map_id` 
LEFT JOIN `ecs_goods_map` c ON `a`.`goods_map_id` = `c`.`goods_map_id` 
WHERE `a`.`goods_name` LIKE '%白条%' LIMIT 25

SELECT * FROM ecs_goods WHERE goods_id = 7666;

SELECT * FROM ecs_goods WHERE goods_id = 49;
SELECT * FROM ecs_goods_map WHERE goods_map_id = 753;

SELECT * FROM ecs_goods WHERE first_pay = NULL;

DROP VIEW gd_211

CREATE VIEW gd_211 AS
SELECT goods_id FROM ecs_goods WHERE  isnull(first_pay) = 1;

SELECT * FROM gd_211

0|10|20|30|40|50|60|70|80|90|100

##UPDATE ecs_goods set first_pay = '0|10|20|30|40|50|60|70|80|90|100' WHERE  isnull(first_pay) = 1;

SELECT * FROM ecs_goods WHERE  isnull(first_pay) = 1;


SELECT * FROM ecs_goods_price WHERE goods_id = 7663



SELECT COUNT(*) from ecs_student_account

SELECT * FROM ecs_goods WHERE goods_map_id = 755

UPDATE ecs_goods set purchase_price = shop_price

SELECT * FROM ecs_goods WHERE goods_id = 7688;
7688	767	4949:4951:4954:4957:4959	i1000电脑13寸红色i7 2G  500G	ECS150504001	5000	0	5000	5000	5	3	1	6	7	3|6|9|12|24|36	0|10|20|30|40|50|60|70|80|90|100	5.5		1	0	2015-05-04 16:03:39	2015-06-01 12:03:49	

SELECT * FROM ecs_goods WHERE goods_id =26 ;
26	6	140:141:142	小米4 联通3G版 亮白16GB 	ECS140818001	2002		2002	2002	0	100	1	6	6	3|6|9|12	0|30|40|50|80|100	小米4来袭哦~发烧级硬件配置，超高性价		1	0	2014-08-18 05:52:26	2015-06-01 12:03:49	





DELETE FROM ecs_order_main WHERE uid = 884

