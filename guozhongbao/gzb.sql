UPDATE gzb_user_account SET password = '35c2cb8001987f43564a4a480751bd98',salt ='RAXqq2DE'

522 539
544 557
544 558

CALL select_info('uid',522);  18914945500
CALL select_info('uid',544);  15312345678

CALL select_info('uid',539);  38505696032
CALL select_info('uid',557);  18888888888
CALL select_info('uid',558);  18877777777

SELECT * FROM gzb_user_redpacket WHERE uid = 522

INSERT INTO `guozhongbao`.`gzb_user_redpacket` 
(`uid`, `amount`, `type`, `relation_id`, `status`, `created_at`, `expire_at`, `withdraw_id`) 
VALUES ( '539', '500', '3', '522', '0', '2015-08-07 11:39:52', '2018-10-07 21:26:31', '64');

SELECT * FROM gzb_user_redpacket WHERE uid = 522 AND relation_id = 539


SELECT * FROM gzb_user_redpacket WHERE type = 4 AND uid not in (

SELECT a.uid FROM (
	SELECT * FROM gzb_user_redpacket WHERE type = 4
) a
JOIN (
	SELECT * FROM gzb_user_redpacket WHERE type = 5
) b on (a.uid = b.uid AND a.relation_id = b.relation_id)

)


select * from `gzb_order_pay` where `uid` = ? and `orderid` = ? and `status` = ? and `pay_at` >= ? and `pay_at` <= ? limit 1

SELECT * FROM gzb_user_data WHERE uid = 547




INSERT INTO `guozhongbao`.`gzb_user_data` ( `uid`, `type`, `info`, `created_at`, `updated_at`, `picurl`, `status`) VALUES ('547', '0', NULL, '2015-06-10 22:37:24', '2015-06-10 22:37:24', '/datum/63/63_1433947044234968.jpg', '0');
INSERT INTO `guozhongbao`.`gzb_user_data` ( `uid`, `type`, `info`, `created_at`, `updated_at`, `picurl`, `status`) VALUES ( '547', '1', NULL, '2015-06-10 22:37:39', '2015-06-10 22:37:39', '/datum/63/63_1433947059079077.jpg', '0');
INSERT INTO `guozhongbao`.`gzb_user_data` ( `uid`, `type`, `info`, `created_at`, `updated_at`, `picurl`, `status`) VALUES ( '547', '2', NULL, '2015-06-10 22:37:48', '2015-06-10 22:37:48', '/datum/63/63_1433947068177557.jpg', '0');
INSERT INTO `guozhongbao`.`gzb_user_data` ( `uid`, `type`, `info`, `created_at`, `updated_at`, `picurl`, `status`) VALUES ('547', '3', NULL, '2015-06-10 22:38:30', '2015-06-10 22:38:30', '/datum/63/63_1433947110548313.jpg', '0');
INSERT INTO `guozhongbao`.`gzb_user_data` ( `uid`, `type`, `info`, `created_at`, `updated_at`, `picurl`, `status`) VALUES ( '547', '30', NULL, '2015-06-10 22:38:36', '2015-06-10 22:38:36', '/datum/63/63_1433947116655133.jpg', '0');





CALL select_info('18767135775');

547


SELECT * FROM gzb_user_redpacket_account where uid = 547

SELECT `gzb_order_pay`.* 
FROM `gzb_order_pay`
						JOIN `gzb_order_main` ON `gzb_order_pay`.orderid = `gzb_order_main`.orderid
						ORDER BY `gzb_order_main`.`created_at` DESC
 LIMIT 1

SELECT *  FROM gzb_order_main WHERE uid = 547;
SELECT *  FROM gzb_order_pay WHERE uid = 547;
SELECT *  FROM gzb_order_pay_task WHERE uid = 547;
SELECT *  FROM gzb_order_periods WHERE uid = 547;


select * 
from `gzb_order_periods` 
where `uid` = '547' 
and `orderid` = '1440117695578665' 
and `gzb_order_periods`.`orderid` = payday
limit 1

DELETE  FROM gzb_order_main WHERE uid = 547;
DELETE  FROM gzb_order_pay WHERE uid = 547;
DELETE  FROM gzb_order_pay_task WHERE uid = 547;
DELETE  FROM gzb_order_periods WHERE uid = 547;





SELECT * 
FROM gzb_user_redpacket_code 
WHERE uid is NULL AND id > 10000

1435815777580759
143977

SELECT m.orderid,m.updated_at,c.updated_at,a.phone,a.uid,c.*
from gzb_order_main m
JOIN gzb_user_account a on a.uid = m.uid
JOIN gzb_user_credit c ON a.uid = c.uid
WHERE `status` = 1 AND c.credits = 1000 AND c.real_credits = 1000
ORDER BY m.updated_at DESC

1434027493339318



4956384618

15587654321


SELECT * FROM gzb_user_credit WHERE uid = '568'

SELECT * FROM gzb_user_account WHERE uid = 568

SELECT * FROM gzb_adm_options  WHERE `option`='order_option' and  item_id = '1439621725571082';


SELECT * FROM gzb_order_task WHERE orderid = '1439621725571082';

SELECT * FROM gzb_order_main WHERE orderid = '1439621725571082';

SELECT * FROM gzb_order_pay WHERE orderid = '1435815777580759';

SELECT * FROM gzb_order_pay_task WHERE orderid = '1435815777580759';


SELECT * FROM gzb_order_main WHERE orderid = '1439781755361459'




SELECT * FROM gzb_order_pay WHERE orderid = '1439781755361459'



SELECT * FROM gzb_order_main WHERE orderid = '1439781755361459'


SELECT * FROM gzb_user_info WHERE identity = ''

SELECT `I`.`audit_status`, `I`.`identity`, `I`.`credit_status`, `I`.`fraudmetrix_status`
FROM (`gzb_user_info` I)
WHERE `I`.`uid` = '524'


SELECT a.status,b.status 
FROM gzb_order_pay a
JOIN gzb_order_pay_task b on a.pay_task_id = b.id

SELECT `I`.`audit_status`, `I`.`identity`, `I`.`credit_status`, `I`.`fraudmetrix_status`, `M`.`status`
FROM (`gzb_user_info` I)
LEFT JOIN `gzb_order_main` M ON `I`.`uid`=`M`.`uid` AND `M`.`status` IN (0, 1, 2, 3, 6)
WHERE `I`.`uid` = '524'













SELECT * FROM gzb_user_info WHERE credit_status = 3


SELECT * FROM gzb_user_account WHERE uid = 262

SELECT a1.uid,a1.phone,a2.phone,a2.uid
FROM gzb_user_account a1
JOIN gzb_user_account a2 ON ( SUBSTR(a1.phone,1,10) = SUBSTR(a2.phone,1,10) )
WHERE a1.uid != a2.uid AND a1.uid > a2.uid



SELECT a1.uid,a1.phone,a2.phone,a2.uid
FROM gzb_user_account a1
JOIN gzb_user_account a2 ON ( FLOOR(a1.phone/10) = FLOOR(a2.phone/10) )
WHERE a1.uid != a2.uid AND a1.uid > a2.uid








SELECT M.orderid, M.uid, M.created_at, M.updated_at, PA.pay_price, PA.updated_at, PA.dalay_price, PA.status, PA.dalay_price, PE.price, PE.tot_price, PE.periods, PE.periods_price, PE.payday, U.name, U.identity, AC.phone, U.company, U.credit_status, CRT.info, UA.area_id, M.pay_at m_pay_at
FROM (`gzb_order_pay` PA)
INNER JOIN `gzb_order_main` M ON `M`.`orderid`=`PA`.`orderid`
INNER JOIN `gzb_order_periods` PE ON `PA`.`orderid`=`PE`.`orderid`
INNER JOIN `gzb_user_info` U ON `PA`.`uid`=`U`.`uid`
INNER JOIN `gzb_user_account` AC ON `PA`.`uid`=`AC`.`uid`
INNER JOIN `gzb_user_address` UA ON `UA`.`uid`=`AC`.`uid` AND UA.type=1
LEFT JOIN `gzb_order_task` CRT ON `CRT`.`orderid`=`M`.`orderid` AND CRT.option="overdue"
WHERE PA.pay_at >='2015-07-17 00:00:00'
AND PA.pay_at <'2015-07-17 23:59:59'
AND PA.status = '0'
AND `PA`.`status` =  0
GROUP BY `PA`.`orderid`
LIMIT 50 


SELECT sum(PA.pay_price) pay_price, sum(PA.dalay_price) dalay_price
FROM (`gzb_order_pay` PA)

WHERE `PA`.`status` =  0
AND `PA`.`pay_at` >= '2015-07-17 00:00:00'
AND `PA`.`pay_at` < '2015-07-30'
AND `PA`.`pay_at` < '2015-07-17 23:59:59' 

SELECT * FROM gzb_area WHERE `name` like '%青海%'


SELECT *
FROM (`gzb_order_pay` PA)
WHERE `PA`.`status` =  0
AND `PA`.`pay_at` >= '2015-07-17 00:00:00'
AND `PA`.`pay_at` < '2015-07-30'
AND `PA`.`pay_at` < '2015-07-17 23:59:59' 
303
272

SELECT * FROM gzb_user_account WHERE uid = 105

105
105

270

273
275
276
278
290
294
296
300
302
303
312


270
273
275
276
278
290
294
296
300
302
312



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









