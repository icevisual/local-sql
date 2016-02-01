CREATE DATABASE gzb_ol_0817


SELECT * FROM gzb_area WHERE name like "%阿拉善盟%"


DROP PROCEDURE IF EXISTS `select_info`;
CREATE PROCEDURE select_info(IN in_phone VARCHAR(20))  
BEGIN   
	DECLARE uuid INT(11);   
	DECLARE umy_code VARCHAR(20);   
	DECLARE is_cheat VARCHAR(20);
	DECLARE is_black VARCHAR(20);
  DECLARE is_from_black VARCHAR(20);
	DECLARE is_from_cheat VARCHAR(20);
	DECLARE ufrom_code VARCHAR(20);
	DECLARE ufrom_uid INT(11);
	DECLARE ufrom_phone VARCHAR(20);
	SELECT uid INTO uuid FROM gzb_user_account WHERE phone = in_phone LIMIT 1;
	IF uuid is not NULL THEN
		#user cheat
		SELECT phone INTO is_cheat FROM gzb_user_cheat WHERE phone = in_phone;
		IF is_cheat IS NOT NULL THEN
			SET is_cheat = 'YES';
		ELSE
			SET is_cheat = 'NO';
		END IF;
		SELECT my_code,from_code,from_uid INTO umy_code,ufrom_code,ufrom_uid  FROM gzb_user_redpacket_code WHERE uid = uuid;
		SELECT credit_status INTO is_black FROM gzb_user_info WHERE uid = uuid;
		#from user cheat
		IF ufrom_code IS NOT NULL THEN
			SELECT phone INTO ufrom_phone FROM gzb_user_account WHERE  uid = ufrom_uid;
			SELECT phone INTO is_from_cheat FROM gzb_user_cheat WHERE phone = ufrom_phone;
			SELECT credit_status INTO is_from_black FROM gzb_user_info WHERE uid = ufrom_uid;
			IF is_from_cheat IS NOT NULL THEN
				SET is_from_cheat = 'YES';
			ELSE
				SET is_from_cheat = 'NO';
			END IF;
		
			IF is_from_black = 3 THEN
				SET is_from_black = 'YES';
			ELSE
				SET is_from_black = 'NO';
			END IF;
		END IF;
		IF is_black = 3 THEN
			SET is_black = 'YES';
		ELSE
			SET is_black = 'NO';
		END IF;

		SELECT 	in_phone  ,
						uuid      ,
						umy_code,
						is_cheat,
						is_black   ,
						ufrom_phone,
						ufrom_uid,
						ufrom_code,
						is_from_cheat,
						is_from_black;
	ELSE
		SELECT 'UID Not Found';
	END IF;
END;


SELECT * FROM gzb_user_redpacket_account WHERE phone ='15372420410' ;


SELECT uid,phone,created_at FROM gzb_user_account WHERE phone ='15669057702' ;
#查询结果： 142308	15669057702	2015-08-14 22:13:40
SELECT uid,phone,created_at FROM gzb_user_account WHERE phone ='15372420410' ;
#查询结果： 106171	15372420410	2015-07-23 16:35:44
SELECT uid,name,identity,card FROM gzb_user_redpacket_account WHERE uid = 142308 ;
#查询结果： 142308	王玉顶	342221197605070058	6226227706595570
UPDATE gzb_user_redpacket_account 
	SET identity = NULL , card = NULL 
WHERE 
	uid = 142308;



select `uid`
, `phone`
, `province` 
from `gzb_user_account` 
where 1=1 
and `province` in ("新疆"
, "青海"
, "甘肃"
, "云南"
, "内蒙古"
, "贵州"
, "广西"
, "河南"
, "西藏"
, "海南"
, "山东"
, "重庆"
, "四川")




SELECT *
FROM (`gzb_adm_options` a)
WHERE `item_id` =  '1438434771042620' 


1438522889540499

1438559434074653

SELECT * 
FROM gzb_order_task a
JOIN gzb_order_task b ON (a.orderid = b.orderid AND a.option=b.option)
WHERE a.id > b.id AND  a.option = 'checkList'



SELECT * 
FROM gzb_order_task a
WHERE orderid = '1438499926748715'


1438522889540499

SELECT 
	a.item_id,
	a.poster aposter,
	FROM_UNIXTIME(a.created) atime,
	b.poster bposter,
  FROM_UNIXTIME(b.created) btime
FROM gzb_adm_options a
JOIN  gzb_adm_options b on (a.option = b.option AND a.item_id = b.item_id)
WHERE a.created > b.created AND a.option = 'order_option'
#GROUP BY a.item_id HAVING COUNT(a.poster) > 2
ORDER BY a.created desc

1436167846471114
1436162480317220
1436158155209936
1436157777840879
1436073532517126
1436058773915819
1435991594447809
1435972069003026
1435972043480147
1435971775138060


SELECT *,FROM_UNIXTIME(a.created) 
FROM (`gzb_adm_options` a)
WHERE `item_id` =  '1435971775138060' 

















SELECT *
FROM (`gzb_adm_options` a)
WHERE a.option = 'order_option'

WHERE `item_id` =  '1438560516564910' 









SELECT `a`.`cid`, `a`.`name` aname, `b`.`name` bname, `c`.`name` cname
FROM (`gzb_area` a)
JOIN `gzb_area` b ON `b`.`cid`=`a`.`cup`
JOIN `gzb_area` c ON `c`.`cid`=`b`.`cup`
WHERE a.cid = 497

UPDATE gzb_area SET is_open =0 WHERE type = 3

SELECT max(LENGTH(name)) ,cid,name FROM gzb_area  

SELECT cid,cup,name 
FROM gzb_area  WHERE LENGTH(name) = 45

SELECT 8 FROM 

SELECT a.id, a.status,b.status 
FROM gzb_order_pay a
JOIN gzb_order_pay_task b on a.pay_task_id = b.id

WHERE a.status > 0 AND b.status = 0

SELECT `OP`.id,`OP`.`pay_price` mon_price, `OP`.`early_price`, `OP`.`status`, `OPT`.`pay_price`
FROM (`gzb_order_pay` OP)
JOIN `gzb_order_pay_task` OPT ON `OPT`.`id`=`OP`.`pay_task_id`
WHERE `OP`.`payment_at` >= '2015-08-02 00:00:00'
AND `OP`.`status` > 0
AND `OPT`.`status` =  1 

SELECT a.id, a.status,b.status 
FROM gzb_order_pay a
JOIN gzb_order_pay_task b on a.pay_task_id = b.id

WHERE a.status > 0  AND b.status = 1

SELECT a.id, a.status,b.status 
FROM gzb_order_pay a
JOIN gzb_order_pay_task b on a.pay_task_id = b.id

WHERE b.status = 1 AND a.status =0   


UPDATE gzb_user_redpacket_withdraw_task 
SET created_at = '2015-08-11 09:20:51'
WHERE id = 31341 AND order_id = 'RPT14393424512254580'

UPDATE gzb_user_redpacket_account 
SET beblue_at = now()
WHERE user_type = 1 AND beblue_at is NULL 






SELECT * FROM gzb_user_redpacket_account WHERE user_type = 1 AND beblue_at is NULL 

SELECT now()

UPDATE gzb_user_redpacket_account 
SET beblue_at = now()
WHERE user_type = 1 AND beblue_at is NULL 



select `gzb_a`.`uid` 
from `gzb_user_account` as `gzb_a` 
inner join `gzb_user_info` as `gzb_i` on `gzb_a`.`uid` = `gzb_i`.`uid` 
where  `gzb_i`.`credit_status` = 3



SELECT DISTINCT type FROM gzb_user_data 

SELECT   
                M.orderid, 
                M.uid, 
                M.created_at, 
                M.STATUS as status, 
                M.pay_at, 
                M.updated_at, 
                M.order_task_id, 
                PE.price, 
                PE.tot_price, 
                PE.periods, 
                PE.periods_price, 
                PE.payday, 
                U.uid, 
                U. NAME as name, 
                U.identity, 
                U.company, 
                U.audit_status, 
                U.credit_status, 
                U.credit_status_info, 
                U.fraudmetrix_status, 
                AC.phone, 
                UA.area_id, 
                CRT.info,CRT.reason
,OPT.poster
FROM (`gzb_order_main` M)
INNER JOIN `gzb_order_periods` PE ON `M`.`orderid`=`PE`.`orderid`
INNER JOIN `gzb_user_info` U ON `M`.`uid`=`U`.`uid`
INNER JOIN `gzb_user_address` UA ON `UA`.`uid`=`U`.`uid` AND UA.type=1
INNER JOIN `gzb_user_account` AC ON `AC`.`uid`=`U`.`uid`
LEFT JOIN `gzb_order_task` CRT ON `CRT`.`orderid`=`M`.`orderid` AND CRT.option="checkList"
LEFT JOIN (SELECT * FROM (`gzb_adm_options`) WHERE `option` = "order_option" GROUP BY `item_id`) OPT ON `OPT`.`item_id`=`M`.`orderid` ORDER BY M.created_at DESC LIMIT 0,50 





CREATE DATABASE gzb_ol_0810

SELECT count(*) FROM gzb_user_redpacket_code WHERE uid is null

CALL select_info('13243241553');

select `uid`, `phone`, `created_at` from `gzb_user_account` where  uid in (4257,6083,6177,10272)  and SUBSTR(created_at,12,8) < "05:00:01" and SUBSTR(created_at,12,8) > "00:59:59"

SELECT * FROM gzb_user_account WHERE uid in (6,43,47,50)


SELECT  phone + 1,phone FROM gzb_user_account a

SELECT a.* FROM gzb_user_account a
JOIN (
	SELECT uid,phone FROM  gzb_user_account WHERE uid in (57732,57163,68028,62073)
) b ON ( a.phone >= CONCAT(SUBSTR(b.phone,1,9),'00') AND a.phone <= CONCAT(SUBSTR(b.phone,1,9),'99')   )


SELECT a.* FROM gzb_user_account a
JOIN (
	SELECT uid,phone FROM  gzb_user_account WHERE uid in (57732,57163,68028,62073)
) b ON SUBSTR(a.phone,1,9) = SUBSTR(b.phone,1,9)

SELECT a.uid,a.phone,b.uid,b.phone FROM gzb_user_account a
JOIN 	 gzb_user_account  b ON ( a.phone = b.phone + 1 or a.phone = b.phone -1 )   
WHERE b.uid in (57732,57163,68028,62073,68250,52836)
AND b.uid != a.uid

SELECT a.uid,a.phone,b.uid,b.phone -1 ,c.uid,c.phone + 1
FROM gzb_user_account a
LEFT JOIN 	 (
	SELECT uid,phone + 1 AS phone  FROM gzb_user_account WHERE uid in (57732,57163,68028,62073,68250,52836)
) b  ON a.phone = b.phone
LEFT JOIN 	 (
	SELECT uid,phone - 1 AS phone  FROM gzb_user_account WHERE uid in (57732,57163,68028,62073,68250,52836)
) C   ON a.phone = c.phone
WHERE b.uid is not null or  c.uid is not null 

ON ( a.phone = b.phone + 1 or a.phone = b.phone -1 )   
WHERE b.uid in (57732,57163,68028,62073,68250,52836)
AND b.uid != a.uid








62073

SELECT a.uid,a.phone,b.uid,b.phone FROM gzb_user_account a
JOIN 	 gzb_user_account  b ON ( a.phone >= CONCAT(SUBSTR(b.phone,1,9),'00') AND a.phone <= CONCAT(SUBSTR(b.phone,1,9),'99')   )
WHERE b.uid in (57732,57163,68028,62073,68250,52836)
AND b.uid != a.uid

SELECT a.* FROM gzb_user_account a
JOIN 	 gzb_user_account  b ON SUBSTR(a.phone,1,9) = SUBSTR(b.phone,1,9)
WHERE b.uid in (57732,57163,68028,62073)


SELECT a.* FROM gzb_user_account a
JOIN (
	SELECT uid,phone FROM  gzb_user_account WHERE uid in (57732,57163,68028,62073)
) b ON SUBSTR(a.phone,1,9) = SUBSTR(b.phone,1,9)




( a.phone >= CONCAT(SUBSTR(b.phone,1,9),'00') AND a.phone <= CONCAT(SUBSTR(b.phone,1,9),'99')   )



select `uid`
, `phone`
, `province` 
from `gzb_user_account` 
where `province` = '新疆' 
or `province` = '青海'
or `province` = '甘肃'
or `province` = '云南'
or `province` = '内蒙古'
or `province` = '贵州'
or `province` = '广西'

select `uid`
, `phone`
, `province` 
from `gzb_user_account` 
where  
 `province` = '四川'


select `uid`
, `phone`
, `province` 
from `gzb_user_account` 
where `province` in ("新疆"
, "青海"
, "甘肃"
, "云南"
, "内蒙古"
, "贵州"
, "广西"
, "河南"
, "西藏"
, "海南"
, "山东"
, "重庆"
, "四川")



SELECT COUNT(*) AS count
FROM (`gzb_user_account` AC)

LEFT JOIN `gzb_user_info` I ON `AC`.`uid`=`I`.`uid`
INNER JOIN `gzb_user_credit` C ON `AC`.`uid`=`C`.`uid`

AND AC.account_status = 0



SELECT COUNT(*)  
FROM gzb_user_redpacket_account R 
INNER JOIN `gzb_user_redpacket_code` RC ON `R`.`uid`=`RC`.`from_uid`
INNER JOIN `gzb_user_account` AC ON `RC`.`uid`=`AC`.`uid`
LEFT JOIN `gzb_user_info` I ON `RC`.`uid`=`I`.`uid`
INNER JOIN `gzb_user_credit` C ON `RC`.`uid`=`C`.`uid`
WHERE `R`.`user_type` =  1
AND AC.account_status = 0

SELECT COUNT(*) AS count
FROM (`gzb_user_account` AC)
INNER JOIN `gzb_user_redpacket_code` RC ON `AC`.`uid`=`RC`.`uid`
INNER JOIN `gzb_user_redpacket_account` R ON `RC`.`from_uid`=`R`.`uid`
LEFT JOIN `gzb_user_info` I ON `AC`.`uid`=`I`.`uid`
INNER JOIN `gzb_user_credit` C ON `AC`.`uid`=`C`.`uid`
WHERE `R`.`user_type` =  1
AND AC.account_status = 0








SELECT c.uid,c.my_code,c.from_code,a.user_type my_user_type,a1.user_type From_user_type
FROM gzb_user_redpacket_code c 
JOIN gzb_user_redpacket_account a on c.uid = a.uid
LEFT JOIN gzb_user_redpacket_account a1 on a1.uid = c.from_uid
WHERE c.uid = '128404'

SELECT c.uid,c.my_code,c.from_code,a.user_type my_user_type,a1.user_type From_user_type
FROM gzb_user_redpacket_code c 
JOIN gzb_user_redpacket_account a on c.uid = a.uid
LEFT JOIN gzb_user_redpacket_account a1 on a1.uid = c.from_uid
WHERE c.my_code = '65454'


select `gzb_c1`.`uid` 
from `gzb_user_change_phone_log` as `gzb_c1` 
inner join `gzb_user_change_phone_log` as `gzb_c2` on `gzb_c1`.`uid` = `gzb_c2`.`uid` 
and `gzb_c1`.`id` < `gzb_c2`.`id` 
where TO_DAYS(gzb_c2.created_at) - TO_DAYS(gzb_c1.created_at) <= 7
GROUP BY `gzb_c1`.`uid` 
;
SELECT i.uid,i.name,a.phone FROM gzb_user_info i JOIN gzb_user_account a on (i.uid = a.uid ) WHERE i.identity is not null;

SELECT * FROM gzb_user_account WHERE uid = 95613

SELECT i.uid,i.name,a.phone FROM gzb_user_info i JOIN gzb_user_account a on (i.uid = a.uid AND i.identity is not null)  ;



SELECT sa.* ,sm.created_at next_created,count(DISTINCT sa.orderid) FROM (
	SELECT * FROM (
		SELECT 	m.orderid, 		#订单id
				m.uid,				#uid
				m.created_at ,#下单时间
				pt.pay_at , 	#应还时间
				pt.payment_at #实际还款时间
		FROM gzb_order_main m
		JOIN gzb_order_pay pt on pt.orderid = m.orderid
		WHERE m.status = 3 AND pt.status > 0 AND m.uid= 11
		ORDER BY m.uid,pt.pay_at DESC
	) fa 
	GROUP BY fa.orderid
) sa INNER JOIN gzb_order_main sm on (sa.uid = sm.uid AND sm.created_at > sa.payment_at AND TO_DAYS(sm.created_at) - TO_DAYS( sa.payment_at) < 1 )
WHERE sa.pay_at > sa.payment_at 
GROUP BY sa.uid

SELECT ta.*,tm.orderid next_orderid FROM (
	SELECT * FROM (
		SELECT * FROM (
			SELECT 	m.orderid, m.uid,m.created_at ,pt.pay_at ,pt.payment_at
			FROM gzb_order_main m
			JOIN gzb_order_pay pt on pt.orderid = m.orderid
			WHERE m.status = 3 AND pt.status > 0
			ORDER BY m.uid,pt.pay_at DESC
		) fa
		GROUP BY fa.orderid
	) sa
	WHERE TO_DAYS(sa.pay_at ) = TO_DAYS(sa.payment_at)
	AND uid = 11
	ORDER BY sa.uid,sa.created_at
) ta LEFT JOIN gzb_order_main tm ON (ta.uid = tm.uid AND  tm.created_at > ta.payment_at AND TO_DAYS(tm.created_at) - TO_DAYS( ta.payment_at) < 1 )
		


SELECT i.uid,i.name FROM gzb_user_info i WHERE i.identity is not null AND (i.name is null or i.name = '')

SELECT  
                M.orderid,
				M.uid,
				M.created_at,
				M.STATUS as status,
				M.pay_at,
				M.updated_at,
                M.order_task_id,
				PE.price,
				PE.tot_price,
				PE.periods,
				PE.periods_price,
				PE.payday,
				U.uid,
                U. NAME as name,
                U.identity,
                U.company,
                U.audit_status,
                U.credit_status,
                U.credit_status_info,
        		U.fraudmetrix_status,
                AC.phone,
                UA.area_id,
                CRT.info,CRT.reason
FROM (`gzb_order_main` M)
INNER JOIN `gzb_order_periods` PE ON `M`.`orderid`=`PE`.`orderid`
INNER JOIN `gzb_user_info` U ON `M`.`uid`=`U`.`uid`
INNER JOIN `gzb_user_address` UA ON `UA`.`uid`=`U`.`uid` AND UA.type=1
INNER JOIN `gzb_user_account` AC ON `AC`.`uid`=`U`.`uid`
LEFT JOIN `gzb_order_task` CRT ON `CRT`.`orderid`=`M`.`orderid` AND CRT.option="checkList"

ORDER BY M.created_at


SELECT  
                M.orderid,
				M.uid,
				M.created_at,
				M.STATUS as status,
				M.pay_at,
				M.updated_at,
                M.order_task_id,
				PE.price,
				PE.tot_price,
				PE.periods,
				PE.periods_price,
				PE.payday,
				U.uid,
                U. NAME as name,
                U.identity,
                U.company,
                U.audit_status,
                U.credit_status,
                U.credit_status_info,
        		U.fraudmetrix_status,
                AC.phone,
                UA.area_id,
                CRT.info,CRT.reason
FROM (`gzb_order_main` M)
INNER JOIN `gzb_order_periods` PE ON `M`.`orderid`=`PE`.`orderid`
INNER JOIN `gzb_user_info` U ON `M`.`uid`=`U`.`uid`
INNER JOIN `gzb_user_address` UA ON `UA`.`uid`=`U`.`uid` AND UA.type=1
INNER JOIN `gzb_user_account` AC ON `AC`.`uid`=`U`.`uid`
LEFT JOIN `gzb_order_task` CRT ON `CRT`.`orderid`=`M`.`orderid` AND CRT.option="checkList"
LEFT JOIN (SELECT * FROM (`gzb_adm_options`) WHERE `option` = "order_option" GROUP BY `item_id`) OPT ON `OPT`.`item_id`=`M`.`orderid` 
ORDER BY M.created_at DESC LIMIT 0,10000






SELECT AC.uid as uid, I.name as name, AC.phone as phone, I.identity as identity, AC.created_at as ctime, I.company as company, I.audit_status, I.process_at, I.updated_at, I.credit_status_info, C.real_credits, I.credit_status as credit_status, CRT.info, CRT.reason, CRT.credits, CRT.score, CRT.id as taskid, CRT.created_at as t_created_at, CRT.updated_at as t_updated_at, CRT.status as t_status, CRT.poster, AD1.address, AD2.tel company_tel, AD2.area_id
FROM (`gzb_user_credit_task` CRT)
LEFT JOIN `gzb_user_info` I ON `CRT`.`uid`=`I`.`uid`
LEFT JOIN `gzb_user_credit` C ON `CRT`.`uid`=`C`.`uid`
LEFT JOIN `gzb_user_account` AC ON `CRT`.`uid`=`AC`.`uid`
LEFT JOIN `gzb_user_address` AD1 ON `AD1`.`uid`=`AC`.`uid` AND AD1.type = 0
LEFT JOIN `gzb_user_address` AD2 ON `AD2`.`uid`=`AC`.`uid` AND AD2.type = 1
WHERE AC.account_status =0
AND CRT.type =0
ORDER BY `CRT`.`created_at` DESC
LIMIT 10000




DISTINCT





SELECT c1.*
FROM gzb_user_change_phone_log c1 
JOIN gzb_user_change_phone_log c2 on c1.uid = c2.uid and c1.id < c2.id
WHERE TO_DAYS(c2.created_at) - TO_DAYS(c1.created_at) < 7 

SELECT l.* ,a.name
FROM gzb_user_change_phone_log l
LEFT JOIN gzb_user_info a on (l.uid = a.uid)




CREATE database gzb_ol_0803


SELECT phone
FROM gzb_user_account ;
GROUP BY FLOOR(phone/10) HAVING count(FLOOR(phone/10)) > 1

SELECT COUNT(* ) 
FROM gzb_user_account 



18857176754
18268855687
15868419082
13732287326
13927432315
18780068984
18357041478

SELECT 18857176749 ^ 18857176751

SELECT SIGNED(18857176749/10)

SELECT CAST(18857176749/10 AS UNSIGNED );

SELECT  FLOOR(18857176749/10)

18857176751

CAST
SELECT conv(18857176751,10,2);

10001100011111110011010111010110111
10001100011111110011010111010101111

11000

10001
00001
SELECT 9 ^ 1

SELECT a1.uid,a1.phone,a2.phone,a2.uid
FROM gzb_user_account a1
JOIN gzb_user_account a2 ON (a1.phone = a2.phone + 1 )
WHERE a1.uid != a2.uid AND a1.uid > a2.uid

SELECT a1.uid,a1.phone,a2.phone,a2.uid
FROM gzb_user_account a1
JOIN gzb_user_account a2 ON ( FLOOR(a1.phone/10) = FLOOR(a2.phone/10) )
WHERE a1.uid != a2.uid AND a1.uid > a2.uid

SELECT * FROM gzb_area WHERE cid = 31


select SQL_NO_CACHE * from `gzb_user_account` as `gzb_ac` 
inner join `gzb_user_address` as `gzb_addr` on `gzb_addr`.`uid` = `gzb_ac`.`uid` where `gzb_addr`.`type` = 1 and `gzb_ac`.`province` is not null;

select SQL_NO_CACHE * from `gzb_user_account` as `gzb_ac`
inner join `gzb_user_address` as `gzb_addr` on ( `gzb_addr`.`type` = 1 and `gzb_addr`.`uid` = `gzb_ac`.`uid` )
where  `gzb_ac`.`province` is not null;


SELECT * FROM gzb_user_account WHERE phone = '15961773667'

SELECT MAX(cid) FROM gzb_area

SELECT * FROM gzb_user_account WHERE province is NULL OR province =''

SELECT * FROM gzb_user_account WHERE uid = 116508;

SELECT addr.*,acc.phone FROM gzb_user_address addr JOIN gzb_user_account acc on acc.uid = addr.uid
WHERE  area_id > 3571 ORDER BY area_id  DESC

SELECT * FROM gzb_user_account WHERE uid = 588

SELECT * FROM gzb_area WHERE name like "%乌兰察布%"

SELECT * FROM gzb_area WHERE cid = 2259

SELECT * FROM gzb_user_account WHERE province like "%内蒙%"


=229|3ID=1702
SELECT 

AID=30|3ID=1893
SELECT * FROM gzb_area WHERE cup = 2810
3499

SELECT a.*,ar.name FROM gzb_user_address a
JOIN gzb_area ar on a.area_id = ar.cid
WHERE  a.id = 35709












DROP PROCEDURE IF EXISTS `select_info`;
CREATE PROCEDURE select_info(IN in_phone VARCHAR(20))  
BEGIN   
	DECLARE uuid INT(11);   
	DECLARE umy_code VARCHAR(20);   
	DECLARE is_cheat VARCHAR(20);
	
	ELSE
		SELECT 'UID Not Found';
	END IF;
END;

SHOW TABLES

DROP PROCEDURE IF EXISTS `proc`;
CREATE PROCEDURE `proc` ()
BEGIN
	declare done int;  
	declare result varchar(200);  
	declare tbname varchar(20);  
	declare cur_test CURSOR for 
		SELECT uid FROM gzb_user_account  LIMIT 5; 
  declare continue handler FOR SQLSTATE '02000' SET done = 1;  
	DROP TABLE IF EXISTS `tmp_tb`;
	CREATE TABLE `tmp_tb`(
		
	)
	SET result = '';
	open cur_test;  
		repeat  
				fetch cur_test into tbname;  
				SET result = CONCAT(result,',',tbname);
		until done = 1 end repeat;  
	close cur_test;  
	SET result = SUBSTR(result,2);
	select result;  
END;
CALL proc();


 begin  
 ->     declare name varchar(20);  
 ->     declare pass varchar(20);  
 ->     declare done int;  
 ->     declare cur_test CURSOR for select user_name,user_pass from test.users;  
 ->     declare continue handler FOR SQLSTATE '02000' SET done = 1;  
 ->     if param then  
 ->         select concat_ws(',',user_name,user_pass) into result from test.users where id=param;  
 ->     else  
 ->         open cur_test;  
 ->         repeat  
 ->             fetch cur_test into name, pass;  
 ->             select concat_ws(',',result,name,pass) into result;  
 ->         until done end repeat;  
 ->         close cur_test;  
 ->     end if;  
 -> end;| 


SELECT a.province,ar.`name` FROM gzb_user_account a
LEFT JOIN gzb_area ar on (ar.name = a.province  or ar.name = CONCAT(a.province,'省'))
WHERE a.province is not null 
GROUP BY a.province
limit 10

SELECT a.province,ar.`name` FROM gzb_user_account a
LEFT JOIN gzb_area ar on (ar.name = a.province  or substr(ar.name,-1) = a.province)
WHERE a.province is not null 
GROUP BY a.province
limit 10

SELECT * FROM (
	SELECT province,city FROM gzb_user_account GROUP BY city,province ORDER BY province
) a 
JOIN gzb_area ar on (ar.name = a.province  or substr(ar.name,-1) = a.province)


SELECT * FROM (
	SELECT province,city FROM gzb_user_account GROUP BY city,province ORDER BY province
) a 
JOIN (
	SELECT province,city FROM gzb_user_account GROUP BY city,province ORDER BY province
) b ON (a.province != b.province AND a.city = b.city)

SELECT * FROM gzb_user_address WHERE type = 1 AND area_id > 3571 ORDER BY area_id  DESC


SELECT * FROM gzb_area a
JOIN gzb_area b on a.cup = b.cid
WHERE a.name = '常熟市'

SELECT * FROM gzb_user_address WHERE  area_id > 3571 ORDER BY area_id  DESC

CREATE DATABASE gzb_ol_0729


SELECT * FROM gzb_area WHERE cid in (1444,
1133,
1496,
3500);

SELECT * FROM gzb_area WHERE cid in (
1130,
1441,
1492,
3499);

SELECT * FROM gzb_area WHERE cid in (
1105,
1440,
1440,
3413)



SELECT cid,name,substr(name,1,2) FROM gzb_area



SELECT * FROM gzb_area WHERE `name` like '%青海%'




SELECT sa.* ,sm.created_at next_created,count(DISTINCT sa.orderid) FROM (
	SELECT * FROM (
		SELECT 	m.orderid, 		#订单id
						m.uid,				#uid
						m.created_at ,#下单时间
						pt.pay_at , 	#应还时间
						pt.payment_at #实际还款时间
		FROM gzb_order_main m
		JOIN gzb_order_pay pt on pt.orderid = m.orderid
		WHERE m.status = 3 AND pt.status > 0
		ORDER BY m.uid,pt.pay_at DESC
	) fa 
	GROUP BY fa.orderid
) sa INNER JOIN gzb_order_main sm on (sa.uid = sm.uid AND sm.created_at > sa.payment_at AND TO_DAYS(sm.created_at) - TO_DAYS( sa.payment_at) < 1 )
WHERE sa.pay_at > sa.payment_at 
GROUP BY sa.uid



SELECT TO_DAYS('2015-08-12 00:00:00') - TO_DAYS('2015-07-13 17:39:32');

SELECT  TO_DAYS(pay_at) - TO_DAYS(created_at)
FROM gzb_order_pay WHERE `status` > 0

SELECT FROM_DAYS( TO_DAYS('2015-07-28 09:50:05') )


SELECT * FROM gzb_order_pay WHERE id in (436,435,434)

SELECT * FROM gzb_order_main WHERE uid = 479
	

SELECT ta.*,tm.orderid next_orderid FROM (
	SELECT * FROM (
		SELECT * FROM (
			SELECT 	m.orderid, 		#订单id
							m.uid,				#uid
							m.created_at ,#下单时间
							pt.pay_at , 	#应还时间
							pt.payment_at #实际还款时间
			FROM gzb_order_main m
			JOIN gzb_order_pay pt on pt.orderid = m.orderid
			WHERE m.status = 3 AND pt.status > 0
			ORDER BY m.uid,pt.pay_at DESC
		) fa 
		GROUP BY fa.orderid
	) sa 
	WHERE TO_DAYS(sa.pay_at ) = TO_DAYS(sa.payment_at) 
	AND uid in (479) 
	ORDER BY uid,created_at
) ta LEFT JOIN gzb_order_main tm ON (ta.uid = tm.uid AND  tm.created_at > ta.payment_at AND TO_DAYS(tm.created_at) - TO_DAYS( ta.payment_at) < 1 )


SELECT uid,phone,created_at 
FROM gzb_user_account 
WHERE SUBSTR(created_at,12,8) < '05:00:00' 
AND SUBSTR(created_at,12,8) > '00:59:59' 

SELECT created_at 
FROM gzb_user_account 
WHERE created_at < CONCAT(FROM_DAYS(TO_DAYS(created_at)) ,' 09:00:00') 
AND created_at > CONCAT(FROM_DAYS(TO_DAYS(created_at)) ,' 01:00:00') 

SELECT created_at ,SUBSTR(created_at,11,9)
FROM gzb_user_account 


2015-07-28 08:06:00
2015-06-28 08:04:00
2015-05-29 08:00:00


2015-04-29 11:16:38
2015-05-29 11:19:17
2015-06-28 11:22:39





CREATE TABLE `gzb_user_login_log` (
  `id` 				int(11) NOT NULL AUTO_INCREMENT,
  `uid` 			int(11) DEFAULT NULL,
  `login_at` 	timestamp NOT NULL COMMENT '登录时间',
  `ip_addr` 	varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户登录日志表';


SELECT * ,count(uid)
FROM gzb_user_login_log
WHERE SUBSTR(login_at,12,8) < '05:00:00' 
AND SUBSTR(login_at,12,8) > '00:59:59' 
GROUP BY uid HAVING count(uid) > 3



SELECT * FROM gzb_user_account





SELECT created_at,TO_DAYS(created_at)  FROM gzb_order_main 

SELECT created_at,FROM_UNIXTIME(created_at) ,UNIX_TIMESTAMP(created_at),TO_DAYS(created_at) FROM gzb_order_main 

CALL select_info ('15612345675');




select * FROM gzb_user_address WHERE uid = 90

15612345675

SELECT * FROM gzb_order_main WHERE uid = 274  AND STATUS = 3

SELECT sa.* ,sm.created_at FROM (
	SELECT * FROM (
		SELECT m.orderid,m.uid,m.pay_at,m.created_at ,UNIX_TIMESTAMP( pt.created_at) pt_created_at,pt.pay_price
		FROM gzb_order_main m
		JOIN gzb_order_pay_task pt on pt.orderid = m.orderid
		WHERE m.status = 3 AND pt.status = 1 AND m.uid = 274
		AND TO_DAYS(m.pay_at) - TO_DAYS(m.created_at) < 30
		ORDER BY pt.created_at DESC
	) fa 
	GROUP BY fa.orderid
	ORDER BY uid,fa.pt_created_at DESC
) sa INNER JOIN gzb_order_main sm on (sa.uid = sm.uid AND sm.created_at > sa.pay_at AND TO_DAYS(sm.created_at) - TO_DAYS( sa.pay_at) < 1 )
GROUP BY sa.orderid, sa.uid
GROUP BY 

SELECT TO_DAYS('2015-07-16 00:00:01'),TO_DAYS('2015-07-16 23:00:01'),TO_DAYS('2015-07-17 23:00:01')

SELECT * FROM gzb_order_main WHERE uid = 78 AND status = 3



SELECT sa.* ,sm.created_at next_created,count(DISTINCT sa.orderid) FROM (
	SELECT * FROM (
		SELECT m.orderid,m.uid,m.created_at , pt.created_at pay_created_at,p.tot_price,p.periods
		FROM gzb_order_main m
		JOIN gzb_order_periods p ON p.orderid = m.orderid
		JOIN gzb_order_pay_task pt on pt.orderid = m.orderid
		WHERE m.status = 3 AND pt.status = 1
		AND TO_DAYS(pt.created_at) - TO_DAYS(m.created_at) < 30 * p.periods
		ORDER BY pt.created_at DESC
	) fa 
	GROUP BY fa.orderid
	ORDER BY uid,fa.pay_created_at DESC
) sa INNER JOIN gzb_order_main sm on (sa.uid = sm.uid AND sm.created_at > sa.pay_created_at AND TO_DAYS(sm.created_at) - TO_DAYS( sa.pay_created_at) < 1 )
GROUP BY sa.uid










506

	SELECT * FROM (
		SELECT m.orderid,m.uid,m.created_at , pt.created_at pay_created_at,p.tot_price,p.periods
		FROM gzb_order_main m
		JOIN gzb_order_periods p ON p.orderid = m.orderid
		JOIN gzb_order_pay_task pt on pt.orderid = m.orderid
		WHERE m.status = 3 AND pt.status = 1
		AND TO_DAYS(pt.created_at) - TO_DAYS(m.created_at) = 30 * p.periods
		ORDER BY pt.created_at DESC
	) fa 
	GROUP BY fa.orderid






CREATE DATABASE gzb_ol_0727


CREATE TABLE `gzb_user_change_phone_log` (
  `id` 					int(11) NOT NULL AUTO_INCREMENT,
  `uid` 				int(11) DEFAULT NULL,
  `oldphone` 		varchar(11) DEFAULT NULL ,
  `unbind_code` varchar(11) DEFAULT NULL,
  `rebind_code` varchar(11) DEFAULT NULL,
  `newphone` 		varchar(11) DEFAULT NULL,
	`created_at`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更改时间',
	`save_status` tinyint(2) DEFAULT NULL COMMENT '保存结果，0失败，1成功',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户更改绑定手机日志表';

delete FROM gzb_user_cheat WHERE phone = '18767135775'

CALL select_info ('18767135775');

CREATE DATABASE guozhongbao1

6cd1df99a21a8f9b5179f406dfe9085d

lli2nnj3


UPDATE gzb_user_account SET PASSWORD = '6cd1df99a21a8f9b5179f406dfe9085d',salt = 'lli2nnj3'

select * FROM gzb_user_account WHERE phone = '18767135775'


SELECT t.*,c.my_code ,c.from_code 
				FROM  gzb_user_redpacket_withdraw_task t 
				INNER JOIN gzb_user_redpacket_code c on (  t.uid = c.uid  )
				LEFT JOIN gzb_user_redpacket r on ( r.relation_id = t.uid	and r.type = 2  )
				WHERE  r.id is null  
					and t.`status` = 1  
					and c.from_code = '68088'   
				GROUP BY t.uid



CALL select_info('13888888888');


18767135776

SELECT * FROM gzb_user_redpacket_account   WHERE uid = 282
SELECT * FROM gzb_user_redpacket_account  WHERE phone = '13888888888'
282

DROP PROCEDURE IF EXISTS `select_info`;
CREATE PROCEDURE select_info(IN in_phone VARCHAR(20))  
BEGIN   
	DECLARE uuid INT(11);   
	DECLARE umy_code VARCHAR(20);   
	DECLARE is_cheat VARCHAR(20);
	DECLARE is_black VARCHAR(20);
  DECLARE is_from_black VARCHAR(20);
	DECLARE is_from_cheat VARCHAR(20);
	DECLARE ufrom_code VARCHAR(20);
	DECLARE ufrom_uid INT(11);
	DECLARE ufrom_phone VARCHAR(20);
	SELECT uid INTO uuid FROM gzb_user_account WHERE phone = in_phone LIMIT 1;
	IF uuid is not NULL THEN
		#user cheat
		SELECT phone INTO is_cheat FROM gzb_user_cheat WHERE phone = in_phone;
		IF is_cheat IS NOT NULL THEN
			SET is_cheat = 'YES';
		ELSE
			SET is_cheat = 'NO';
		END IF;
		SELECT my_code,from_code,from_uid INTO umy_code,ufrom_code,ufrom_uid  FROM gzb_user_redpacket_code WHERE uid = uuid;
		SELECT credit_status INTO is_black FROM gzb_user_info WHERE uid = uuid;
		#from user cheat
		IF ufrom_code IS NOT NULL THEN
			SELECT phone INTO ufrom_phone FROM gzb_user_account WHERE  uid = ufrom_uid;
			SELECT phone INTO is_from_cheat FROM gzb_user_cheat WHERE phone = ufrom_phone;
			SELECT credit_status INTO is_from_black FROM gzb_user_info WHERE uid = ufrom_uid;
			IF is_from_cheat IS NOT NULL THEN
				SET is_from_cheat = 'YES';
			ELSE
				SET is_from_cheat = 'NO';
			END IF;
		
			IF is_from_black = 3 THEN
				SET is_from_cheat = 'YES';
			ELSE
				SET is_from_cheat = 'NO';
			END IF;
		END IF;
		IF is_black = 3 THEN
			SET is_black = 'YES';
		ELSE
			SET is_black = 'NO';
		END IF;

		SELECT 	in_phone  ,
						uuid      ,
						umy_code,
						is_cheat,
						is_black   ,
						ufrom_phone,
						ufrom_uid,
						ufrom_code,
						is_from_cheat,
						is_from_black;
	ELSE
		SELECT 'UID Not Found';
	END IF;
END;



UPDATE `gzb_user_info` SET `credit_status` = '3', `process_at` = '2015-07-14 19:46:43' WHERE `uid` = 310




SELECT * FROM `gzb_user_info` WHERE `uid` = 310




explain  SELECT t.*,c.my_code ,c.from_code 
FROM  gzb_user_redpacket_withdraw_task t 
INNER JOIN gzb_user_redpacket_code c on ( t.`status` = 1 and t.uid = c.uid and c.from_code = 69455 )
left JOIN gzb_user_redpacket r on (r.type = 2 and r.relation_id = t.uid )
WHERE  r.id is null
GROUP BY t.uid

explain  SELECT SQL_NO_CACHE t.*,c.my_code ,c.from_code 
FROM  gzb_user_redpacket_withdraw_task t 
INNER JOIN gzb_user_redpacket_code c on c.uid = t.uid 
WHERE  not EXISTS (
	SELECT * FROM gzb_user_redpacket r WHERE  t.uid = r.relation_id AND r.type = 2 
) AND 
c.from_uid = 296 and t.`status` = 1  
GROUP BY t.uid

explain  SELECT SQL_NO_CACHE t.*,c.my_code ,c.from_code 
FROM  gzb_user_redpacket_withdraw_task t 
INNER JOIN gzb_user_redpacket_code c on c.uid = t.uid 
WHERE  not EXISTS (
	SELECT * FROM gzb_user_redpacket r WHERE  t.uid = r.relation_id AND r.type = 2 
) AND 
c.from_uid = 296 and t.`status` = 1  
GROUP BY t.uid

SELECT SQL_NO_CACHE t.*,c.my_code ,c.from_code 
FROM  gzb_user_redpacket_withdraw_task t 
INNER JOIN gzb_user_redpacket_code c on t.uid = c.uid 
WHERE  not EXISTS (
	SELECT * FROM gzb_user_redpacket r WHERE  t.uid = r.relation_id AND r.type = 2 
) AND 
c.from_code = 69455 and t.`status` = 1  
GROUP BY t.uid



DROP PROCEDURE IF EXISTS `delete_account`;
CREATE PROCEDURE delete_account(IN in_phone VARCHAR(20))  
BEGIN   
DECLARE uuid INT(11);   
SELECT uid INTO uuid FROM gzb_user_account WHERE phone = in_phone LIMIT 1;
IF uuid is not NULL THEN
	DELETE FROM gzb_user_account WHERE uid = uuid;
	DELETE FROM gzb_user_redpacket_account WHERE uid = uuid;
	DELETE FROM gzb_user_redpacket WHERE uid = uuid;
	UPDATE gzb_user_redpacket_code SET uid = null,from_code=NULL,from_uid = null WHERE uid = uuid;
ELSE
	SELECT 'UID Not Found';
END IF;
END;
CALL delete_account('13567193215');

CALL delete_account('18767139999');


DROP PROCEDURE IF EXISTS `delete_redpacket`;
CREATE PROCEDURE delete_redpacket(IN in_phone VARCHAR(20))  
BEGIN   
DECLARE uuid INT(11);   
SELECT uid INTO uuid FROM gzb_user_account WHERE phone = in_phone LIMIT 1;
IF uuid is not NULL THEN
	DELETE FROM gzb_user_redpacket WHERE uid = uuid;
	UPDATE gzb_user_redpacket_code SET uid = null,from_code=NULL,from_uid = null WHERE uid = uuid;
	SELECT concat('UID:',uuid);
ELSE
	SELECT 'UID Not Found';
END IF;
END ;
CALL delete_redpacket('18767139999');

SELECT * FROM gzb_user_info WHERE credit_status = 3


SELECT uid   FROM gzb_user_account WHERE phone = 18767139999

296,302,293,93,107,303,292,70,78,117,112,109,102,291

SELECT * FROM gzb_user_cheat WHERE uid in (296,302,293,93,107,303,292,70,78,117,112,109,102,291)

SELECT * FROM gzb_order_main WHERE uid = 71

SELECT t.*,c.my_code ,c.from_code 
			FROM  gzb_user_redpacket_withdraw_task t 
			INNER JOIN gzb_user_redpacket_code c on ( t.`status` = 1 and t.uid = c.uid and c.from_code = 284 )
			left JOIN gzb_user_redpacket r on (r.type = 2 and r.relation_id = t.uid )
			WHERE  r.id is null
			GROUP BY t.uid

SELECT count(*) from gzb_user_redpacket_code

select `id`, `uid`, `status`, `credits`, `created_at`, `reason` from `gzb_user_credit_task` where `uid` = 284

insert into `gzb_user_credit_task`(`uid`,`status`,`credits`,`created_at`,`reason`)
values('284','0','5000.00','2015-06-24 12:59:27','')

insert into `gzb_user_credit_task`(`uid`,`status`,`credits`,`created_at`,`reason`)
values('284','2','3000.00','2015-06-24 11:24:00','您的资料不符合放款条件')

insert into `gzb_user_credit_task`(`uid`,`status`,`credits`,`created_at`,`reason`)
values('284','1','3000.00','2015-06-24 11:24:00','您的资料不符合放款条件')

DELETE FROM gzb_user_credit_task WHERE id = 327

DELETE FROM gzb_user_credit_task WHERE uid = 284

select `id`, `uid`, `status`, `credits`, `created_at`, `reason` from `gzb_user_credit_task` where `uid` = 284;

select `id`, `uid`, `status`, `credits`, `created_at`, `reason` from `gzb_user_credit_task` where `uid` = 284 
GROUP BY credits  ORDER BY id DESC

SELECT * from (
	select `id`, `uid`, `status`, `credits`, `created_at`, `reason` from `gzb_user_credit_task` where `uid` = 284 
	ORDER BY credits asc, id DESC
) a GROUP BY a.credits

select `id`, `uid`, `status`, `credits`, `created_at`, `reason` from `gzb_user_credit_task` where `uid` = 276;

SHOW VARIABLES like 'SQL_NO_CACHE'

show variables like '%query_cache%'

select SQL_NO_CACHE  * from (
	select `id`, `uid`, `status`, `credits`, `created_at`, `reason` 
	from `gzb_user_credit_task` 
	where `uid` = 284 order by `credits` asc, `id` desc) a 
group by a.credits

select SQL_CACHE  * from (
	select `id`, `uid`, `status`, `credits`, `created_at`, `reason` 
	from `gzb_user_credit_task` 
	where `uid` = 284 order by `credits` asc, `id` desc) a 
group by a.credits

283
282
281
280
279
278
277
276
275
274
273
272
271

CREATE database gzb

DELETE FROM gzb_user_redpacket_code WHERE my_code < '01000'

SELECT * FROM gzb_user_redpacket_code WHERE my_code < '01000' ORDER BY my_code

SELECT count(*) from gzb_user_redpacket_code
 

SELECT * FROM  gzb_user_redpacket_code ORDER BY id DESC



SELECT * FROM gzb_user_redpacket_code  order by id desc
 WHERE uid>0

SELECT * FROM gzb_user_redpacket_code  WHERE uid>0

update gzb_user_redpacket_code set uid = null WHERE id > 100

SELECT count(*) from gzb_user_redpacket_code

select * from `gzb_user_redpacket_code` where `uid` is null order by `id` asc limit 1

SELECT t.*,c.my_code ,c.from_code 
			FROM  gzb_user_redpacket_withdraw_task t 
			INNER JOIN gzb_user_redpacket_code c on ( t.`status` = 1 and t.uid = c.uid and c.from_code = 91492 )
			left JOIN gzb_user_redpacket r on (r.type = 2 and r.relation_id = t.uid )
			WHERE  ISNULL(r.id) = 1
			GROUP BY t.uid



CREATE TABLE `gzb_user_redpacket_withdraw_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '提现状态0：待提现，1：提现成功，2：提现失败',
  `amount` int(11) DEFAULT NULL COMMENT '提现金额',
  `reason` varchar(100) DEFAULT '' COMMENT '审核失败原因',
  `info` varchar(100) DEFAULT '' COMMENT '审核备注',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



DROP TABLE IF EXISTS `gzb_user_redpacket_code`;
CREATE TABLE `gzb_user_redpacket_code` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
  `my_code` varchar(10) NOT NULL COMMENT '我的兑换码',
  `uid` int(11) DEFAULT NULL COMMENT '账户ID',
  `from_code` varchar(10) DEFAULT NULL COMMENT '邀请码',
  `from_uid` int(11) DEFAULT NULL COMMENT '邀请码所属UID',
  PRIMARY KEY (`id`),
	UNIQUE KEY `my_code`  (`my_code`) USING BTREE,
  UNIQUE KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;




DROP TABLE IF EXISTS `gzb_user_redpacket_code`;
CREATE TABLE `gzb_user_redpacket_code` (
  `code` varchar(10) NOT NULL COMMENT '我的兑换码',
  `uid` int(11) DEFAULT NULL COMMENT '账户ID',
  `from_code` varchar(10) DEFAULT NULL COMMENT '邀请码',
  `from_uid` int(11) DEFAULT NULL COMMENT '邀请码所属UID',
  PRIMARY KEY (`code`),
  UNIQUE KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;







CREATE TABLE `gzb_adm_audit_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `audit_id` bigint(26) unsigned NOT NULL DEFAULT '0' COMMENT '审核流水ID',
  `info` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 风控审核，2,提额审核',
  `data` text COMMENT '补充信息',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`audit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1259 DEFAULT CHARSET=utf8 COMMENT='用户审核资料日志';




SELECT *
FROM (`gzb_order_main`)
WHERE `created_at` >= '2015-06-01 00:00:01'
AND `created_at` <= '2015-06-30 23:59:59'
AND `status` IN (1, 2, 3) 



select sum(`gzb_order_periods`.`price`) as aggregate 
from `gzb_order_main` 
left join `gzb_order_periods` on `gzb_order_main`.`orderid` = `gzb_order_periods`.`orderid` 
where (`gzb_order_main`.`uid` = 78) 
and (`gzb_order_main`.`status` = 0 
or `gzb_order_main`.`status` = 1 
or `gzb_order_main`.`status` = 2)

select *
from `gzb_order_main` 
left join `gzb_order_periods` on `gzb_order_main`.`orderid` = `gzb_order_periods`.`orderid` 
where (`gzb_order_main`.`uid` = 78) 
and (`gzb_order_main`.`status` = 0 
or `gzb_order_main`.`status` = 1 
or `gzb_order_main`.`status` = 2)


SELECT count(1) AS count, audit_status
FROM (`gzb_user_account` a)
LEFT JOIN `gzb_user_info` i ON `a`.`uid`=`i`.`uid`
GROUP BY `audit_status` ;

SELECT sum(2) AS count, audit_status
FROM (`gzb_user_account` a)
LEFT JOIN `gzb_user_info` i ON `a`.`uid`=`i`.`uid`
GROUP BY `audit_status` ;


SELECT * FROM gzb_user_info WHERE  ISNULL(audit_status)  = 1

订单状态 0申请中，1审核通过
,未打款，2审核通过,正在还款中，3审核通过,已还清，4审核不通过 5订单作废
SELECT COUNT(1) AS count, status
FROM (`gzb_order_main`)
GROUP BY `status` 




