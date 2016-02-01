
DROP TABLE IF EXISTS `jk_inout_order`;
CREATE TABLE `jk_inout_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水',
  `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '出入库状态，0出库，1入库',
  `out_group_id` int(10) unsigned DEFAULT NULL COMMENT '出库组ID',
  `created_at` timestamp  DEFAULT '0000-00-00 00:00:00' NOT NULL COMMENT '时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品出入库订单表';







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




