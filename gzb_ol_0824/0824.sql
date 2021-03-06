




select * from gzb_activity_goods into OUTFILE 'D://d1.txt'
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'








CREATE DATABASE admin;

START TRANSACTION;
DELETE FROM  gzb_order_pay 
WHERE id in (
	SELECT p.id from 
	gzb_order_pay p JOIN gzb_order_main m on p.orderid = m.orderid
	WHERE m.`status` = 1
)


SELECT  m.`status` ,count(m.`status` )
FROM gzb_order_pay p JOIN gzb_order_main m on p.orderid = m.orderid
GROUP BY m.`status` 


SELECT COUNT(*) AS notPayAmount
,a.area_id 
FROM (
SELECT IF (`status` = 2
,early_price
,pay_price) AS shouldPay
, IF (`status` = 0
,0
,IF (`status` = 2
,early_price
,pay_price)) AS hasPay
, uid
,pay_at
,status 
FROM gzb_order_pay 
WHERE uid NOT IN (1
,12
,28
,34
,85
,106
,170
,5468
,5478
,5795
,8482
,8525
,103887
,117273
,118124
,27653
,1133
,13
,108661
,130699
,168904
,142667) 
AND pay_at >= '2015-11-01 00:00:00' ) AS ttt JOIN gzb_user_address a on (ttt.uid = a.uid 
AND a.type = 1) GROUP BY a.area_id




create DATABASE xb;






DROP TABLE IF EXISTS `__tp`;
create  table `__tp` (
	`key` VARCHAR(200)
);

DROP TABLE IF EXISTS `__tp1`;
create  table `__tp1` (
	`key` VARCHAR(200)
)


















SELECT a.uid FROM 
	(
	SELECT * FROM gzb_user_payway_holding_task 
	WHERE created_at >= '2015-11-10 11:55:00'
	AND created_at <= '2015-11-10 12:30:00'
	AND type = 1
) a

 LEFT JOIN(
	SELECT * 
	FROM ( 
	SELECT `gzb_order_pay`.* 
	FROM `gzb_order_pay` 
	RIGHT JOIN `gzb_user_payway_holding` ON `gzb_user_payway_holding`.uid = `gzb_order_pay`.uid JOIN `gzb_order_main` ON `gzb_order_pay`.orderid = `gzb_order_main`.orderid 
	WHERE `gzb_order_pay`.`pay_at` <= '2015-11-10' 
	AND `gzb_order_pay`.status = '0' 
	AND `gzb_order_main`.`status` = 2
	##AND `gzb_order_pay`.uid = 217337 
	ORDER BY `gzb_order_pay`.`pay_at` DESC 
	) pay 
	GROUP BY uid desc, `orderid` 
) b on a.uid = b.uid
WHERE b.uid is null





SELECT 
a.area_id,
CONCAT(ar2.`name`,ar1.`name`,ar.`name`)
FROM gzb_order_pay p 
JOIN gzb_user_address a on a.uid = p.uid
JOIN gzb_area ar on a.area_id = ar.cid
JOIN gzb_area ar1 on ar.cup = ar1.cid
JOIN gzb_area ar2 on ar1.cup = ar2.cid
GROUP BY a.area_id 


SELECT SUM(shouldPayNum  ) FROM ( 

SELECT  
	COUNT(DISTINCT(ttt.uid))  AS  shouldPayNum  ,
	a.area_id
FROM (
	SELECT
		IF (`status` = 2,early_price,pay_price) AS shouldPay,
		IF (`status` = 0,0,IF (`status` = 2,early_price,pay_price)) AS hasPay,
		uid,pay_at,status
	FROM
		gzb_order_pay 
	WHERE uid NOT IN (1,12,28,34,85,106,170,5468,5478,5795,8482,8525,103887,117273,118124,27653,1133,13,108661,130699,168904,142667) 
		AND  pay_at >= '2015-11-01 00:00:00' 
) AS ttt
JOIN gzb_user_address a on (ttt.uid = a.uid AND a.type = 1)
GROUP BY a.area_id

) as fdff


SELECT  
	COUNT(DISTINCT(ttt.uid))  AS  shouldPayNum  ,
	a.area_id
FROM (
	SELECT
		IF (`status` = 2,early_price,pay_price) AS shouldPay,
		IF (`status` = 0,0,IF (`status` = 2,early_price,pay_price)) AS hasPay,
		uid,pay_at,status
	FROM
		gzb_order_pay 
	WHERE uid NOT IN (1,12,28,34,85,106,170,5468,5478,5795,8482,8525,103887,117273,118124,27653,1133,13,108661,130699,168904,142667) 
		AND  pay_at >= '2015-11-01 00:00:00'  AND `status` = 0
) AS ttt
JOIN gzb_user_address a on (ttt.uid = a.uid AND a.type = 1)
GROUP BY a.area_id




SELECT  COUNT(DISTINCT(ttt.uid))  AS  notPayNum ,a.area_id FROM (SELECT

IF (`status` = 2,early_price,pay_price) AS shouldPay,

IF (`status` = 0,0,IF (`status` = 2,early_price,pay_price)) AS hasPay,
 uid,pay_at,status
FROM
	gzb_order_pay WHERE uid NOT IN (1,12,28,34,85,106,170,5468,5478,5795,8482,8525,103887,117273,118124,27653,1133,13,108661,130699,168904,142667) AND  pay_at >= '2015-11-01 00:00:00' ) AS ttt JOIN gzb_user_address a on (ttt.uid = a.uid AND a.type = 1) WHERE `status` = 0  GROUP BY a.area_id






SELECT 
	SUM(shouldPay) AS shouldPay, 
	SUM(hasPay) AS hasPay 
FROM (
	SELECT
		IF (`status` = 2,early_price,pay_price) AS shouldPay,
		IF (`status` = 0,0,IF (`status` = 2,early_price,pay_price)) AS hasPay,
		uid,
		pay_at,
		`status`
FROM
	gzb_order_pay 
WHERE uid NOT IN (1,12,28,34,85,106,170,5468,5478,5795,8482,8525,103887,117273,118124,27653,1133,13,108661,130699,168904,142667) 
AND  pay_at >= '2015-11-01 00:00:00' ) AS ttt;

7422845.10	7371727.89
4895871.95	4845364.74
7422845.10	7371727.89


SELECT SUM(shouldPay ),SUM(hasPay ) FROM (  
SELECT 
	SUM(shouldPay) AS shouldPay, 
	SUM(hasPay) AS hasPay ,
	a.area_id,
	CONCAT(ar2.`name`,ar1.`name`,ar.`name`),
	COUNT(DISTINCT ttt.uid) as c
FROM (
	SELECT
		IF (`status` = 2,early_price,pay_price) AS shouldPay,
		IF (`status` = 0,0,IF (`status` = 2,early_price,pay_price)) AS hasPay,
		uid,
		pay_at,
		`status`
FROM
	gzb_order_pay 
WHERE uid NOT IN (1,12,28,34,85,106,170,5468,5478,5795,8482,8525,103887,117273,118124,27653,1133,13,108661,130699,168904,142667) 
AND  pay_at >= '2015-11-01 00:00:00' ) AS ttt
JOIN gzb_user_address a on (ttt.uid = a.uid AND a.type = 1)
JOIN gzb_area ar on a.area_id = ar.cid
JOIN gzb_area ar1 on ar.cup = ar1.cid
JOIN gzb_area ar2 on ar1.cup = ar2.cid
GROUP BY a.area_id
) as trrt




SELECT SUM(shouldPay ),SUM(hasPay ) FROM (  

SELECT 
	SUM(shouldPay) AS shouldPay, 
	SUM(hasPay) AS hasPay ,
	a.area_id,
	CONCAT(ar2.`name`,ar1.`name`,ar.`name`),
	COUNT(DISTINCT ttt.uid) as c
FROM (
	SELECT
		IF (`status` = 2,early_price,pay_price) AS shouldPay,
		IF (`status` = 0,0,IF (`status` = 2,early_price,pay_price)) AS hasPay,
		uid,
		pay_at,
		`status`
FROM
	gzb_order_pay 
WHERE uid NOT IN (1,12,28,34,85,106,170,5468,5478,5795,8482,8525,103887,117273,118124,27653,1133,13,108661,130699,168904,142667) 
AND  pay_at >= '2015-11-01 00:00:00' ) AS ttt
JOIN gzb_user_address a on (ttt.uid = a.uid AND a.type = 1)
JOIN gzb_area ar on a.area_id = ar.cid
JOIN gzb_area ar1 on ar.cup = ar1.cid
JOIN gzb_area ar2 on ar1.cup = ar2.cid
GROUP BY a.area_id

) as trrt






SELECT p.uid,addr.id,addr.area_id,addr.address FROM 
gzb_order_pay p
LEFT JOIN gzb_user_address addr on addr.uid = p.uid and addr.type = 1 
WHERE addr.address is null 
GROUP BY p.uid



INSERT INTO `gzb_topic_config` 
( `key`, `value`,`info`) 
VALUES ( 'COUPON_EXPIRE_TIME', '7776000', '还款券有效期（秒）');


insert into `gzb_topic_config`(`key`,`value`,`info`)values('time_interval.status','1|0|1','info');
insert into `gzb_topic_config`(`key`,`value`,`info`)values('time_interval.default','10','info');
insert into `gzb_topic_config`(`key`,`value`,`info`)values('time_interval.rules.v2.0/user/create_userinfo','1','info');
insert into `gzb_topic_config`(`key`,`value`,`info`)values('time_interval.rules.v2.0/order/put_credit','1','info');
insert into `gzb_topic_config`(`key`,`value`,`info`)values('ump_factor_validate.status','0|1|0','info');
insert into `gzb_topic_config`(`key`,`value`,`info`)values('ump_factor_validate.always','deny|allow|deny','info');
insert into `gzb_topic_config`(`key`,`value`,`info`)values('ump_factor_validate.error','[errors]','info');
insert into `gzb_topic_config`(`key`,`value`,`info`)values('ump_factor_validate.rules.create_userinfo','3|4','info');
insert into `gzb_topic_config`(`key`,`value`,`info`)values('auto_rejection_rules.status','1|0','info');
insert into `gzb_topic_config`(`key`,`value`,`info`)values('auto_rejection_rules.rules.open_area','1|0','info');
insert into `gzb_topic_config`(`key`,`value`,`info`)values('auto_rejection_rules.rules.black_list','1|0','info');
insert into `gzb_topic_config`(`key`,`value`,`info`)values('auto_rejection_rules.rules.factor_error','1|0','info');
insert into `gzb_topic_config`(`key`,`value`,`info`)values('auto_rejection_rules.rules.over_due','0|1|0','info');
insert into `gzb_topic_config`(`key`,`value`,`info`)values('single_log.status','1|0','info');










ALTER TABLE `gzb_user_account` ADD COLUMN `from_type`  tinyint(2) NULL DEFAULT 0 COMMENT '账号来源，0国众宝，1p2p' AFTER `account_status`;

INSERT INTO `gzb_activity_goods` ( `goods_name`, `godds_price`, `goods_stock`, `goods_status`, `created_at`, `updated_at`) 
VALUES 
('OPPO X9070 Find 7 联通4G 黑色', '2468.00', '1', '1', now(),now()),
('OPPO X9070 Find 7 联通4G 白色', '2468.00', '2', '1', now(),now()),
('OPPO X9077 Find 7 移动4G 白色', '2468.00', '1', '1', now(),now()),
('OPPO R8315 移动4G 白色', '850.00', '5', '1', now(),now()),
('美图2 16G 联通3G 月光白', '1688.00', '5', '1', now(),now()),
('三星 TAB ST700 WIFI 炫目白', '2100.00', '2', '1', now(),now()),
('小米 16G 纯白色', '1188.00', '1', '1', now(),now()),
('小米 16G 淡粉色', '1188.00', '12', '1', now(),now()),
('小米 16G 柠檬黄', '1188.00', '1', '1', now(),now()),
('小米 16G 浅绿色', '1188.00', '7', '1', now(),now()),
('小米 64G 淡粉色', '1388.00', '4', '1', now(),now());





SELECT SUM(c) from (

SELECT 
	a.area_id,
	CONCAT(ar2.`name`,ar1.`name`,ar.`name`),
	COUNT(DISTINCT p.uid) as c
FROM gzb_order_pay p
JOIN gzb_user_address a on (p.uid = a.uid AND a.type = 1)
JOIN gzb_area ar on a.area_id = ar.cid
JOIN gzb_area ar1 on ar.cup = ar1.cid
JOIN gzb_area ar2 on ar1.cup = ar2.cid
GROUP BY a.area_id


) aaa



SELECT  
	a.area_id,
	CONCAT(ar2.`name`,ar1.`name`,ar.`name`),
	COUNT(DISTINCT(ttt.uid))  AS  shouldPayNum  
FROM (
	SELECT
		IF (`status` = 2,early_price,pay_price) AS shouldPay,
		IF (`status` = 0,0,IF (`status` = 2,early_price,pay_price)) AS hasPay,
		uid,
		pay_at,
		`status`
	FROM
		gzb_order_pay  
) AS ttt

JOIN gzb_user_address a on (ttt.uid = a.uid AND a.type = 1)
JOIN gzb_area ar on a.area_id = ar.cid
JOIN gzb_area ar1 on ar.cup = ar1.cid
JOIN gzb_area ar2 on ar1.cup = ar2.cid
GROUP BY a.area_id





SELECT SUM(shouldPay) AS shouldPay, SUM(hasPay) AS hasPay FROM (SELECT

IF (`status` = 2,early_price,pay_price) AS shouldPay,

IF (`status` = 0,0,IF (`status` = 2,early_price,pay_price)) AS hasPay,
 uid,pay_at,status
FROM
	gzb_order_pay WHERE uid NOT IN (1) AND  pay_at >= '2015-11-01 00:00:00' ) AS ttt


SELECT  COUNT(DISTINCT(uid))  AS  shouldPayNum  FROM (

SELECT
	IF (`status` = 2,early_price,pay_price) AS shouldPay,
	IF (`status` = 0,0,IF (`status` = 2,early_price,pay_price)) AS hasPay,
	uid,
	pay_at,
	`status`
FROM
	gzb_order_pay  ) AS ttt




SELECT  COUNT(DISTINCT(uid))  AS  notPayNum  FROM (SELECT

IF (`status` = 2,early_price,pay_price) AS shouldPay,

IF (`status` = 0,0,IF (`status` = 2,early_price,pay_price)) AS hasPay,
 uid,pay_at,status
FROM
	gzb_order_pay WHERE uid NOT IN (1) 
AND  pay_at >= '2015-11-01 00:00:00' ) AS ttt WHERE `status` = 0 


SELECT  COUNT(*)  AS  allAmount  FROM (SELECT

IF (`status` = 2,early_price,pay_price) AS shouldPay,

IF (`status` = 0,0,IF (`status` = 2,early_price,pay_price)) AS hasPay,
 uid,pay_at,status
FROM
	gzb_order_pay WHERE uid NOT IN (1) AND  pay_at >= '2015-11-01 00:00:00' ) AS ttt




SELECT  COUNT(*)  AS  notPayAmount  FROM (SELECT

IF (`status` = 2,early_price,pay_price) AS shouldPay,

IF (`status` = 0,0,IF (`status` = 2,early_price,pay_price)) AS hasPay,
 uid,pay_at,status
FROM
	gzb_order_pay WHERE uid NOT IN (1) AND  pay_at >= '2015-11-01 00:00:00' ) AS ttt where `status` = 0 

































UPDATE `gzb_ol_0824`.`gzb_user_info` SET `uid`='991', `nickname`=NULL, `name`='name', `sex`='0', `age`='0', `qq`='123123123', `wechat`=NULL, `email`=NULL, `emergency_contact`='99999', `company`='群创光电有限公司C厂制造部二课', `join_at`='3099-99-99', `identity`='61052819900207271X', `created_at`='2015-11-02 14:43:30', `updated_at`='2015-11-02 19:14:37', `process_at`='2015-06-22 12:21:15', `audit_status`='0', `credit_status`='0', `fraudmetrix_status`=NULL, `credit_status_info`='' WHERE (`uid`='991');
UPDATE `gzb_ol_0824`.`gzb_user_info` SET `uid`='951', `nickname`=NULL, `name`='name', `sex`='0', `age`='0', `qq`='12312312', `wechat`=NULL, `email`=NULL, `emergency_contact`='123123', `company`='市区错误', `join_at`='12312123', `identity`='342201198710054470', `created_at`='2015-10-31 16:01:25', `updated_at`='2015-11-02 19:14:37', `process_at`='2015-10-31 16:01:51', `audit_status`='3', `credit_status`='4', `fraudmetrix_status`='0', `credit_status_info`='' WHERE (`uid`='951');
UPDATE `gzb_ol_0824`.`gzb_user_info` SET `uid`='165723', `nickname`=NULL, `name`='name', `sex`='0', `age`='0', `qq`=NULL, `wechat`=NULL, `email`=NULL, `emergency_contact`=NULL, `company`=NULL, `join_at`=NULL, `identity`='330327199201066107', `created_at`='2015-10-26 15:45:44', `updated_at`='2015-11-02 19:14:37', `process_at`=NULL, `audit_status`='3', `credit_status`='4', `fraudmetrix_status`=NULL, `credit_status_info`='Review' WHERE (`uid`='165723');
UPDATE `gzb_ol_0824`.`gzb_user_info` SET `uid`='165682', `nickname`=NULL, `name`='name', `sex`='0', `age`='0', `qq`=NULL, `wechat`=NULL, `email`=NULL, `emergency_contact`=NULL, `company`=NULL, `join_at`=NULL, `identity`='330521200601014072', `created_at`='2015-10-23 19:54:44', `updated_at`='2015-11-02 19:14:37', `process_at`=NULL, `audit_status`='3', `credit_status`='4', `fraudmetrix_status`=NULL, `credit_status_info`='Review' WHERE (`uid`='165682');
UPDATE `gzb_ol_0824`.`gzb_user_info` SET `uid`='165708', `nickname`=NULL, `name`='name', `sex`='0', `age`='0', `qq`='123123123', `wechat`=NULL, `email`=NULL, `emergency_contact`='99999', `company`='123123', `join_at`='3099-99-99', `identity`='140424200404133732', `created_at`='2015-10-16 19:42:03', `updated_at`='2015-11-02 19:14:37', `process_at`='2015-10-19 09:49:28', `audit_status`='2', `credit_status`='0', `fraudmetrix_status`=NULL, `credit_status_info`='' WHERE (`uid`='165708');
UPDATE `gzb_ol_0824`.`gzb_user_info` SET `uid`='965682', `nickname`=NULL, `name`='name', `sex`='0', `age`='0', `qq`='12312123', `wechat`=NULL, `email`=NULL, `emergency_contact`='123123123', `company`='撒旦撒放', `join_at`='2014-12-12', `identity`='330521200601014071', `created_at`='2015-10-12 11:17:01', `updated_at`='2015-11-02 19:14:37', `process_at`='2015-09-29 10:02:47', `audit_status`='3', `credit_status`='4', `fraudmetrix_status`=NULL, `credit_status_info`='' WHERE (`uid`='965682');
UPDATE `gzb_ol_0824`.`gzb_user_info` SET `uid`='165709', `nickname`=NULL, `name`='name', `sex`='0', `age`='0', `qq`='123123123', `wechat`=NULL, `email`=NULL, `emergency_contact`='99999', `company`='杀敌发多少', `join_at`='3099-99-99', `identity`='140424200404132019', `created_at`='2015-10-09 16:15:46', `updated_at`='2015-11-02 19:14:37', `process_at`='2015-10-09 16:53:56', `audit_status`='2', `credit_status`='0', `fraudmetrix_status`=NULL, `credit_status_info`='' WHERE (`uid`='165709');
UPDATE `gzb_ol_0824`.`gzb_user_info` SET `uid`='133', `nickname`=NULL, `name`='name', `sex`='0', `age`='0', `qq`=NULL, `wechat`=NULL, `email`=NULL, `emergency_contact`='23', `company`='123123', `join_at`='23', `identity`='520121199101201830', `created_at`='2015-09-29 11:28:28', `updated_at`='2015-11-02 19:14:37', `process_at`=NULL, `audit_status`='0', `credit_status`='3', `fraudmetrix_status`=NULL, `credit_status_info`='' WHERE (`uid`='133');
INSERT INTO `gzb_ol_0824`.`gzb_user_info` (`uid`, `nickname`, `name`, `sex`, `age`, `qq`, `wechat`, `email`, `emergency_contact`, `company`, `join_at`, `identity`, `created_at`, `updated_at`, `process_at`, `audit_status`, `credit_status`, `fraudmetrix_status`, `credit_status_info`) VALUES ('991', NULL, 'name', '0', '0', '123123123', NULL, NULL, '99999', '群创光电有限公司C厂制造部二课', '3099-99-99', '61052819900207271X', '2015-11-02 14:43:30', '2015-11-02 19:14:37', '2015-06-22 12:21:15', '0', '0', NULL, '');
INSERT INTO `gzb_ol_0824`.`gzb_user_info` (`uid`, `nickname`, `name`, `sex`, `age`, `qq`, `wechat`, `email`, `emergency_contact`, `company`, `join_at`, `identity`, `created_at`, `updated_at`, `process_at`, `audit_status`, `credit_status`, `fraudmetrix_status`, `credit_status_info`) VALUES ('951', NULL, 'name', '0', '0', '12312312', NULL, NULL, '123123', '市区错误', '12312123', '342201198710054470', '2015-10-31 16:01:25', '2015-11-02 19:14:37', '2015-10-31 16:01:51', '3', '4', '0', '');
INSERT INTO `gzb_ol_0824`.`gzb_user_info` (`uid`, `nickname`, `name`, `sex`, `age`, `qq`, `wechat`, `email`, `emergency_contact`, `company`, `join_at`, `identity`, `created_at`, `updated_at`, `process_at`, `audit_status`, `credit_status`, `fraudmetrix_status`, `credit_status_info`) VALUES ('165723', NULL, 'name', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, '330327199201066107', '2015-10-26 15:45:44', '2015-11-02 19:14:37', NULL, '3', '4', NULL, 'Review');
INSERT INTO `gzb_ol_0824`.`gzb_user_info` (`uid`, `nickname`, `name`, `sex`, `age`, `qq`, `wechat`, `email`, `emergency_contact`, `company`, `join_at`, `identity`, `created_at`, `updated_at`, `process_at`, `audit_status`, `credit_status`, `fraudmetrix_status`, `credit_status_info`) VALUES ('165682', NULL, 'name', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, '330521200601014072', '2015-10-23 19:54:44', '2015-11-02 19:14:37', NULL, '3', '4', NULL, 'Review');
INSERT INTO `gzb_ol_0824`.`gzb_user_info` (`uid`, `nickname`, `name`, `sex`, `age`, `qq`, `wechat`, `email`, `emergency_contact`, `company`, `join_at`, `identity`, `created_at`, `updated_at`, `process_at`, `audit_status`, `credit_status`, `fraudmetrix_status`, `credit_status_info`) VALUES ('165708', NULL, 'name', '0', '0', '123123123', NULL, NULL, '99999', '123123', '3099-99-99', '140424200404133732', '2015-10-16 19:42:03', '2015-11-02 19:14:37', '2015-10-19 09:49:28', '2', '0', NULL, '');
INSERT INTO `gzb_ol_0824`.`gzb_user_info` (`uid`, `nickname`, `name`, `sex`, `age`, `qq`, `wechat`, `email`, `emergency_contact`, `company`, `join_at`, `identity`, `created_at`, `updated_at`, `process_at`, `audit_status`, `credit_status`, `fraudmetrix_status`, `credit_status_info`) VALUES ('965682', NULL, 'name', '0', '0', '12312123', NULL, NULL, '123123123', '撒旦撒放', '2014-12-12', '330521200601014071', '2015-10-12 11:17:01', '2015-11-02 19:14:37', '2015-09-29 10:02:47', '3', '4', NULL, '');
INSERT INTO `gzb_ol_0824`.`gzb_user_info` (`uid`, `nickname`, `name`, `sex`, `age`, `qq`, `wechat`, `email`, `emergency_contact`, `company`, `join_at`, `identity`, `created_at`, `updated_at`, `process_at`, `audit_status`, `credit_status`, `fraudmetrix_status`, `credit_status_info`) VALUES ('165709', NULL, 'name', '0', '0', '123123123', NULL, NULL, '99999', '杀敌发多少', '3099-99-99', '140424200404132019', '2015-10-09 16:15:46', '2015-11-02 19:14:37', '2015-10-09 16:53:56', '2', '0', NULL, '');
INSERT INTO `gzb_ol_0824`.`gzb_user_info` (`uid`, `nickname`, `name`, `sex`, `age`, `qq`, `wechat`, `email`, `emergency_contact`, `company`, `join_at`, `identity`, `created_at`, `updated_at`, `process_at`, `audit_status`, `credit_status`, `fraudmetrix_status`, `credit_status_info`) VALUES ('133', NULL, 'name', '0', '0', NULL, NULL, NULL, '23', '123123', '23', '520121199101201830', '2015-09-29 11:28:28', '2015-11-02 19:14:37', NULL, '0', '3', NULL, '');



SELECT atb.*,COUNT(d.id) c FROM (
SELECT m.uid,a.phone 
FROM gzb_order_main m
JOIN gzb_order_periods p on m.orderid = p.orderid
JOIN gzb_user_account a ON (a.uid = m.uid )
JOIN gzb_user_info i ON (a.uid = i.uid )
WHERE m.`status` = 3 
AND p.price >= 2000
AND i.audit_status = 2 
AND i.qq is NULL
GROUP BY a.uid 
) as atb
join gzb_user_data d ON atb.uid = d.uid
GROUP BY atb.uid
ORDER BY c desc

SELECT * FROM gzb_user_data WHERE uid = 3628

update gzb_user_data set uid = 0 WHERE id in (57713,
57719,
57721,);

INSERT INTO `gzb_ol_0824`.`gzb_user_data` (`id`, `uid`, `type`, `info`, `created_at`, `updated_at`, `picurl`, `status`) VALUES ('57713', '3628', '31', NULL, '2015-07-09 11:49:09', '2015-07-09 11:49:09', '/datum/3628/3628_1436413749576486.jpg', '0');
INSERT INTO `gzb_ol_0824`.`gzb_user_data` (`id`, `uid`, `type`, `info`, `created_at`, `updated_at`, `picurl`, `status`) VALUES ('57719', '3628', '32', NULL, '2015-07-09 11:49:32', '2015-07-09 11:49:32', '/datum/3628/3628_1436413772327306.jpg', '0');
INSERT INTO `gzb_ol_0824`.`gzb_user_data` (`id`, `uid`, `type`, `info`, `created_at`, `updated_at`, `picurl`, `status`) VALUES ('57721', '3628', '33', NULL, '2015-07-09 11:50:12', '2015-07-09 11:50:12', '/datum/3628/3628_1436413812951012.jpg', '0');














ALTER TABLE `gzb_order_main` MODIFY COLUMN `order_version`  tinyint(2) NULL DEFAULT 1 COMMENT '订单版本,1:1,0版本，2:2.0版本,3线下信用支付订单' AFTER `info`;
ALTER TABLE `gzb_user_data` MODIFY COLUMN `type`  tinyint(4)
 NOT NULL COMMENT '0 身份证正面，1身份证反面，2手持身份证，3工牌照片，(4流水情况，5行驶证照片，6房产证照片) >= 30 银行流水，>= 40 社保图片' AFTER `uid`;


START TRANSACTION;

UPDATE gzb_user_account SET phone = 1 WHERE uid = 1
ROLLBACK
SELECT * FROM gzb_user_account WHERE uid = 1

14122222234

insert into `gzb_adm_audit_log`(`uid`,`audit_id`,`info`,`reason`,`type`,`data`)values('541','1446023345729524','【系统自动拒绝】有超5天逾期','您的系统综合评分不足，不可办理借款','1','{"uid":541,"phone":"15057467387","name":"灵通卡-","qq":"123123123","company":"宁波群创光电有限公司","identity":"532924199310050318","credit_status":2,"audit_status":2,"join_at":"3099-99-99","emergency_contact":"99999","addresses":[{"id":2607,"uid":541,"area_id":39,"address":"浙江省宁波市北仑区北仑区扬子江北路16号","tel":"057486865999","type":1,"created_at":"2015-08-04 08:51:08","updated_at":"2015-08-04 08:51:08"},{"id":2608,"uid":541,"area_id":0,"address":"北仑区沿河山路富春二期1栋10804室","tel":"","type":0,"created_at":"2015-08-04 08:51:08","updated_at":"2015-08-04 08:51:08"}],"address_com":"浙江省宁波市北仑区北仑区扬子江北路16号","company_tel":"057486865999","area_id":39,"address":"北仑区沿河山路富春二期1栋10804室","home_area_id":0,"payway":[{"card":"6217233901001166398","payname":"工商银行-灵通卡-借记卡","payway":1}],"userData":{"0":{"id":5902,"uid":541,"type":0,"info":null,"created_at":"2015-06-28 22:08:05","updated_at":"2015-08-04 08:51:08","picurl":"\/datum\/541\/541_1438649468077053.jpg","status":0},"1":{"id":5903,"uid":541,"type":1,"info":null,"created_at":"2015-06-28 22:08:05","updated_at":"2015-08-04 08:51:08","picurl":"\/datum\/541\/541_1438649468403400.jpg","status":0},"2":{"id":5904,"uid":541,"type":2,"info":null,"created_at":"2015-06-28 22:08:05","updated_at":"2015-08-04 08:51:08","picurl":"\/datum\/541\/541_1438649468450595.jpg","status":0},"3":{"id":5905,"uid":541,"type":3,"info":null,"created_at":"2015-06-28 22:08:05","updated_at":"2015-08-04 08:51:08","picurl":"\/datum\/541\/541_1438649468176276.jpg","status":0},"ls":[{"id":5906,"uid":541,"type":31,"info":null,"created_at":"2015-06-28 22:12:49","updated_at":"2015-06-28 22:12:49","picurl":"\/datum\/541\/541_1435500769378777.jpg","status":0},{"id":5907,"uid":541,"type":32,"info":null,"created_at":"2015-06-28 22:13:04","updated_at":"2015-07-01 21:38:02","picurl":"\/datum\/541\/541_1435757882069045.jpg","status":0},{"id":5908,"uid":541,"type":35,"info":null,"created_at":"2015-06-28 22:14:22","updated_at":"2015-06-28 22:14:22","picurl":"\/datum\/541\/541_1435500862428420.jpg","status":0},{"id":8144,"uid":541,"type":30,"info":null,"created_at":"2015-07-01 21:36:24","updated_at":"2015-07-01 21:37:20","picurl":"\/datum\/541\/541_1435757840677442.jpg","status":0},{"id":8147,"uid":541,"type":34,"info":null,"created_at":"2015-07-01 21:38:45","updated_at":"2015-07-01 21:38:45","picurl":"\/datum\/541\/541_1435757925974439.jpg","status":0}]}}')





CALL delete_account('18767109019');


select FROM_UNIXTIME(1445683668)



CREATE TABLE `gzb_user_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0 身份证正面，1身份证反面，2手持身份证，3工牌照片，(4流水情况，5行驶证照片，6房产证照片) >= 30 银行流水，>= 40 社保图片',
  `info` varchar(60) DEFAULT NULL COMMENT '补充信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `picurl` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:通过，1:不通过',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=141846 DEFAULT CHARSET=utf8 COMMENT='用户资料表，type: 0 身份证正面，1身份证反面，2身份证正反照，3工牌照片，4流水情况，5行驶证照片，6房产证照片';





select `gzb_order_main`.`pay_at`
, `gzb_order_main`.`orderid`
, `gzb_order_main`.`order_version`
, `gzb_order_periods`.`payday`
, `gzb_order_periods`.`price` 
from `gzb_order_main` 
inner join `gzb_order_periods` on `gzb_order_periods`.`orderid` = `gzb_order_main`.`orderid` 
where `gzb_order_main`.`uid` = '165682' 
and `gzb_order_main`.`status` in ('2'
, '3') order by `gzb_order_main`.`status` desc
, `gzb_order_main`.`created_at` desc
 limit 1




CREATE TABLE `tmp1` AS SELECT uid ,phone from gzb_user_account LIMIT 10


DROP TABLE tmp2;
CREATE TABLE `tmp2` AS SELECT uid ,salt as phone from gzb_user_account LIMIT  10

SELECT * FROM tmp1 ;

SELECT * FROM tmp2 ;

=======================================================================================
#At 2015-10-22 08:28:49

DROP TABLE IF EXISTS `gzb_order_suborder`;
CREATE TABLE `gzb_order_suborder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `main_orderid` bigint(26) NOT NULL COMMENT '主订单流水号',
  `sub_orderid` bigint(26) NOT NULL COMMENT '子订单流水号',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0申请中，1审核通过,未打款，2审核通过,正在还款中，3审核通过,已还清，4审核不通过 5订单作废，6：待面签',
  `info` varchar(225) DEFAULT NULL COMMENT '备注',
  `order_version` tinyint(2) DEFAULT '1' COMMENT '订单版本,1:1,0版本，2:2.0版本',
  `ordered_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '申请时间',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '借贷款额',
  `tot_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '应还款额',
  `periods` tinyint(2) NOT NULL DEFAULT '0' COMMENT '分期数',
  `payday` int(6) NOT NULL DEFAULT '0' COMMENT '还款周期',
	`rest_quota` decimal(11,2) DEFAULT '0.00' COMMENT '线下支付剩余额度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='线下信用支付订单-子表';


DROP TABLE IF EXISTS `gzb_user_identification_history`;
CREATE TABLE `gzb_user_identification_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '账户UID',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `card` varchar(40) DEFAULT '0' COMMENT '银行账户',
  `identity` varchar(20) DEFAULT NULL COMMENT '身份证',
  `total_quota` decimal(11,2) DEFAULT '0.00' COMMENT '线下支付总额度',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `audit_status` tinyint(2) DEFAULT '0' COMMENT '认证状态,0:无资料 1：审核通过，2：审核失败',
	`audit_status_info` varchar(100) DEFAULT '0' COMMENT '认证失败原因',
  `factor_status` tinyint(2) DEFAULT '0' COMMENT '三要素状态,0:无记录 1：一致，2：不一致',
	`factor_status_info` varchar(100) DEFAULT '0' COMMENT '三要素不通过原因',
	`credit_status` tinyint(2) unsigned DEFAULT '0' COMMENT '账户信用状态 0 无记录，1，信誉良好，2 有过逾期 ，3 黑名单 4，同盾可疑账户 ',
	`credit_status_info` varchar(100) DEFAULT '' COMMENT '账户信用状态备注',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='线下信用支付-用户信息认证历史记录表';




DROP TABLE IF EXISTS `gzb_user_credit_account`;
CREATE TABLE `gzb_user_credit_account` (
  `uid` int(11) unsigned NOT NULL COMMENT '账户UID',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `card` varchar(40) DEFAULT '0' COMMENT '银行账户',
  `identity` varchar(20) DEFAULT NULL COMMENT '身份证',
  `total_quota` decimal(11,2) DEFAULT '0.00' COMMENT '线下支付总额度',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `audit_status` tinyint(2) DEFAULT '0' COMMENT '认证状态,0:无资料 1：审核通过，2：审核失败',
	`audit_status_info` varchar(100) DEFAULT '0' COMMENT '认证失败原因',
  `factor_status` tinyint(2) DEFAULT '0' COMMENT '三要素状态,0:无记录 1：一致，2：不一致',
	`factor_status_info` varchar(100) DEFAULT '0' COMMENT '三要素不通过原因',
	`credit_status` tinyint(2) unsigned DEFAULT '0' COMMENT '账户信用状态 0 无记录，1，信誉良好，2 有过逾期 ，3 黑名单 4，同盾可疑账户 ',
	`credit_status_info` varchar(100) DEFAULT '' COMMENT '账户信用状态备注',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `identity` (`identity`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='线下信用支付-用户详细信息表';


=======================================================================================





CREATE TABLE gzb_order_history
AS
SELECT 
	m.orderid,
	m.uid,
	m.pay_at,
	m.`status`,
	m.info,
	m.order_version,
	m.type,
	m.created_at as ordered_at,
	p.price,
	p.pay_price,
	p.tot_price,
	p.periods,
	p.payday
FROM gzb_order_main m
JOIN gzb_order_periods p on m.orderid = p.orderid


DROP TABLE	IF EXISTS `gzb_order_history`;
CREATE TABLE `gzb_order_history` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` bigint(26) NOT NULL COMMENT '订单流水号',
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '财务打款时间',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0申请中，1审核通过,未打款，2审核通过,正在还款中，3审核通过,已还清，4审核不通过 5订单作废，6：待面签',
  `info` varchar(225) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `order_version` tinyint(2) DEFAULT '1' COMMENT '订单版本,1:1,0版本，2:2.0版本',
  `type` tinyint(2) DEFAULT '0' COMMENT '是否免息 0 不免息，1 免息',
  `ordered_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '申请时间',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '借贷款额',
  `pay_price` decimal(11,2) DEFAULT '0.00' COMMENT '应打款金额',
  `tot_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '应还款额',
  `periods` tinyint(2) NOT NULL DEFAULT '0' COMMENT '分期数',
  `payday` int(6) NOT NULL DEFAULT '0' COMMENT '还款周期',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;







DROP TABLE IF EXISTS `gzb_user_error_report`;
CREATE TABLE `gzb_user_error_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`uid`	int(11)   NULL COMMENT '上报UID',  
  `content` text NOT NULL COMMENT '上报内容',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户错误上报';




梁创业


CALL select_info('phone','18767135775');


select `gzb_order_main`.`pay_at`
, `gzb_order_main`.`orderid`
, `gzb_order_main`.`order_version`
, `gzb_order_periods`.`payday`
, `gzb_order_periods`.`price` 
from `gzb_order_main` 
inner join `gzb_order_periods` on `gzb_order_periods`.`orderid` = `gzb_order_main`.`orderid` 
where `gzb_order_main`.`uid` = '165682' 
and `gzb_order_main`.`status` in ('2'
, '3') 
order by `gzb_order_main`.`status` desc
, `gzb_order_main`.`created_at` desc
 limit 1







CREATE TABLE `gzb_user_credit_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `inout_amount` decimal(11,2) DEFAULT '0.00' COMMENT '收入支出金额，收入为正数，支出为负数',
  `absolute_amount` decimal(11,2) DEFAULT '0.00' COMMENT '金额绝对值',
  `rest_amount` decimal(11,2) DEFAULT '0.00' COMMENT '余额',
  `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，0还款，1分享获得',
  `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出0：支出，1.收入',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '事件状态0：失败，1.成功',
  `pay_order_id` bigint(26) DEFAULT NULL COMMENT '还款的订单流水号',
  `pay_task_id` bigint(26) DEFAULT NULL COMMENT '还款的支付流水号',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户还款现金';



Consumption quota



DROP TABLE	IF EXISTS `gzb_user_credit_account`;
CREATE TABLE `gzb_user_credit_account` (
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `rest_quota` decimal(11,2) DEFAULT '0.00' COMMENT '线下支付剩余额度',
  `total_quota` decimal(11,2) DEFAULT '0.00' COMMENT '线下支付总额度',
  `created_at` timestamp NULL DEFAULT NULL,
	`updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户线下支付额度表';


select * FROM gzb_user_account

DESC gzb_user_account

password 35c2cb8001987f43564a4a480751bd98	RAXqq2DE
salt RAXqq2DE
created_at
updated_at

CALL  delete_account('13588434967');


DROP PROCEDURE IF EXISTS `create_blue`;
CREATE PROCEDURE `create_blue`(
	IN _in_phone varchar(20)
)
BEGIN
	DECLARE _uid VARCHAR(20);
	DECLARE _code VARCHAR(20);
	SET _uid = NULL;
	SELECT uid into _uid  FROM gzb_user_account WHERE phone = _in_phone;
	
	IF _uid IS NULL THEN 
		START TRANSACTION ;
		INSERT INTO gzb_user_account(`phone`,`password`,`salt`,`created_at`)
			VALUES(_in_phone,'35c2cb8001987f43564a4a480751bd98','RAXqq2DE',now());
		SELECT uid into _uid  FROM gzb_user_account WHERE phone = _in_phone;
		
		INSERT INTO `gzb_user_redpacket_account` (`uid`, `user_type`,  `phone`,  `status`, `created_at`) 
			VALUES (_uid, '1', _in_phone, 2, now());
		SELECT my_code INTO _code FROM gzb_user_redpacket_code WHERE uid is NULL limit 1;
		UPDATE gzb_user_redpacket_code SET uid = _uid WHERE my_code = _code AND uid IS NULL;
		UPDATE gzb_user_account SET phone = CONCAT('9',SUBSTR(phone,2))  WHERE uid = _uid;
		SELECT _code;
		COMMIT;
	ELSE
		SELECT 'Registered';
	END IF;
END;

SELECT SUBSTR('121',2)


CALL  delete_account('13588434967');

CALL  delete_account('15355713685');


CALL select_info('phone','93588434967');

CALL create_blue('13588434967'); 
CALL create_blue('15355713685'); 
CALL create_blue('18658176131'); 
CALL create_blue('13588705767'); 
CALL create_blue('13958158747'); 

165719
INSERT INTO 
`gzb_user_info` (`uid`, `nickname`, `name`, `sex`, `age`, `qq`, `wechat`, `email`, `emergency_contact`, `company`, `join_at`, `identity`, `created_at`, `updated_at`, `process_at`, `audit_status`, `credit_status`, `fraudmetrix_status`, `credit_status_info`) VALUES ('0', NULL, '吞粪御用测试号', '0', '0', NULL, NULL, NULL, NULL, '做不完吞粪有限公司', NULL, '102145368545232321', '2015-07-21 00:37:19', '2015-07-21 09:38:51', '2015-07-14 15:11:38', '1', '0', '0', '0');


CALL select_info('phone','93588434967');

CALL create_blue('13588434967');

CREATE TABLE `gzb_blue_angel`
AS
SELECT * FROM gzb_user_redpacket_account WHERE user_type = 1

SELECT * FROM `gzb_blue_angel`

update gzb_user_redpacket_account set  user_type = 2 WHERE  user_type = 1 


update gzb_user_redpacket_account set  user_type = 1 WHERE  uid in (SELECT uid FROM gzb_blue_angel)

SELECT * FROM gzb_user_redpacket_account WHERE user_type = 1


CALL create_blue('13588434967');
CALL create_blue('15355713685');
CALL create_blue('18658176131');
CALL create_blue('13588705767');
CALL create_blue('13958158747');





SELECT * FROM gzb_user_redpacket_code WHERE uid is NULL limit 1
15355713685













DROP TABLE `__tmp_s`

SELECT * FROM __tmp_s


CREATE TABLE __tmp_s as 
SELECT i.uid ,a.phone
FROM gzb_user_info i 
JOIN gzb_user_data d on i.uid = d.uid  
JOIN gzb_user_account a on a.uid = i.uid
WHERE i.audit_status = 2 AND d.type = 30
 
UPDATE gzb_user_info
SET qq = '123123123',
emergency_contact = '99999',
join_at = '3099-99-99'
WHERE uid in (
SELECT uid FROM __tmp_s
 
)

SELECT * FROM gzb_user_info WHERE audit_status = 2

UPDATE gzb_user_info
SET qq = '123123123',
emergency_contact = '99999',
join_at = '3099-99-99'
WHERE audit_status = 2

SELECT count(*) FROM gzb_order_main;

SELECT count(*) FROM gzb_order_pay;

select `gzb_order_main`.`pay_at`
, `gzb_order_main`.`orderid`
, `gzb_order_main`.`order_version`
, `gzb_order_periods`.`payday`
, `gzb_order_periods`.`price` 
from `gzb_order_main` 
inner join `gzb_order_periods` on `gzb_order_periods`.`orderid` = `gzb_order_main`.`orderid` 
where `gzb_order_main`.`uid` = '165708' 
and `gzb_order_main`.`status` in ('2'
, '3') order by `gzb_order_main`.`created_at` desc
 limit 1


DROP PROCEDURE IF EXISTS `__repayment`;
CREATE PROCEDURE `__repayment`() 
BEGIN 
	DECLARE _uid VARCHAR(50);
	DECLARE _area_id VARCHAR(50);
	DECLARE _company VARCHAR(50) character set 'utf8';
	DECLARE _orderid VARCHAR(50);
	DECLARE _name VARCHAR(50) character set 'utf8';
	DECLARE _identity VARCHAR(50);
	DECLARE _phone VARCHAR(50);
	DECLARE _playingTime VARCHAR(50);
	DECLARE _price VARCHAR(50);
	DECLARE _periods VARCHAR(50);
	DECLARE _payday VARCHAR(50);
	DECLARE _periods_price VARCHAR(50);
	DECLARE _shouldPayDay VARCHAR(50);
	DECLARE _tot_price VARCHAR(50);
	DECLARE _orderPayId VARCHAR(50);
	DECLARE _status VARCHAR(50);
	DECLARE _pay_price VARCHAR(50);
	DECLARE _early_price VARCHAR(50);
	DECLARE _dalay_price VARCHAR(50);
	DECLARE _realPayDay VARCHAR(50);
	DECLARE _payType VARCHAR(50);
	DECLARE _numericalorder VARCHAR(50);
	DECLARE _realMoney VARCHAR(50);
	DECLARE _deduction VARCHAR(50);
	DECLARE _payDifference VARCHAR(50);

	DECLARE fetchSeqOk BOOLEAN ;
	DECLARE _CURSOR CURSOR FOR 
			select `gzb_user_account`.`uid`
			, `gzb_user_address`.`area_id`
			, `gzb_user_info`.`company`
			, `gzb_order_main`.`orderid`
			, `gzb_user_info`.`name`
			, `gzb_user_info`.`identity`
			, `gzb_user_account`.`phone`
			, `gzb_order_main`.`pay_at` as `playingTime`
			, `gzb_order_periods`.`price`
			, `gzb_order_periods`.`periods`
			, `gzb_order_periods`.`payday`
			, `gzb_order_periods`.`periods_price`
			, `gzb_order_pay`.`pay_at` as `shouldPayDay`
			, `gzb_order_periods`.`tot_price`
			, `gzb_order_pay`.`id` as `orderPayId`
			, `gzb_order_pay`.`status`
			, `gzb_order_pay`.`pay_price`
			, `gzb_order_pay`.`early_price`
			, `gzb_order_pay`.`dalay_price`
			, `gzb_order_pay`.`payment_at` as `realPayDay`
			, `gzb_order_pay_task`.`pay_type` as `payType`
			, `gzb_order_pay_task`.`id` as `numericalorder`
			, `gzb_order_pay_task`.`pay_price` as `realMoney`
			, `gzb_order_pay_task`.`deduction_price` as `deduction`
			, `gzb_order_pay_task`.`difference` as `payDifference`
			from `gzb_order_pay` 
			inner join `gzb_user_account` on `gzb_user_account`.`uid` = `gzb_order_pay`.`uid` 
			inner join `gzb_order_main` on `gzb_order_main`.`orderid` = `gzb_order_pay`.`orderid` 
			inner join `gzb_order_periods` on `gzb_order_periods`.`orderid` = `gzb_order_main`.`orderid` 
			inner join `gzb_user_info` on `gzb_order_pay`.`uid` = `gzb_user_info`.`uid` 
			inner join `gzb_user_address` on `gzb_user_address`.`uid` = `gzb_user_info`.`uid` 
			left join `gzb_order_pay_task` on `gzb_order_pay_task`.`id` = `gzb_order_pay`.`pay_task_id` 
			where `gzb_user_address`.`type` = '1' 
			and `gzb_user_account`.`uid` not in 
			('1', '12', '28', '34', '85', '106', '170', '5468',
			'5478', '5795', '8482', '8525', '103887', '117273',
			'118124', '27653', '1133', '13', '108661', '130699', '168904'
			, '142667') 
			order by `gzb_order_main`.`orderid` asc , `gzb_order_pay`.`id` asc;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fetchSeqOk = true;#结束标识
	SET fetchSeqOk = FALSE;

	SET @ct = 0;
	OPEN _CURSOR;
	_CUR_LOOP:LOOP
		FETCH _CURSOR INTO 
			_uid,_area_id,_company,_orderid,_name,
			_identity,_phone,_playingTime,_price,_periods,
			_payday,_periods_price,_shouldPayDay,_tot_price,_orderPayId,
			_status,_pay_price,_early_price,_dalay_price,_realPayDay,
			_payType,_numericalorder,_realMoney,_deduction,_payDifference;
		IF fetchSeqOk = 1 THEN
			LEAVE _CUR_LOOP;
		ELSE
			IF _numericalorder = 0 THEN 
				SET _numericalorder = NULL;
			END IF;
			
			IF _status == 0 THEN
				SET _payTypeName = "ad";
			ELSE
				IF payType = 0 THEN 
					SET _payTypeName = '支付宝';
				ELSEIF payType = 1 THEN 
					SET _payTypeName = '一键支付';
				ELSEIF payType = 2 THEN 
					SET _payTypeName = '代扣';
				ELSEIF payType = 3 THEN 
					SET _payTypeName = '线下还款';
				ELSE
					SET _payTypeName = '未知';
				END IF;
			END IF;

          
		END IF;
	END LOOP;
END;


CALL __repayment();


select `gzb_user_account`.`uid`
, `gzb_user_address`.`area_id`
, `gzb_user_info`.`company`
, `gzb_order_main`.`orderid`
, `gzb_user_info`.`name`
, `gzb_user_info`.`identity`
, `gzb_user_account`.`phone`
, `gzb_order_main`.`pay_at` as `playingTime`
, `gzb_order_periods`.`price`
, `gzb_order_periods`.`periods`
, `gzb_order_periods`.`payday`
, `gzb_order_periods`.`periods_price`
, `gzb_order_pay`.`pay_at` as `shouldPayDay`
, `gzb_order_periods`.`tot_price`
, `gzb_order_pay`.`id` as `orderPayId`
, `gzb_order_pay`.`status`
, `gzb_order_pay`.`pay_price`
, `gzb_order_pay`.`early_price`
, `gzb_order_pay`.`dalay_price`
, `gzb_order_pay`.`payment_at` as `realPayDay`
, `gzb_order_pay_task`.`pay_type` as `payType`
, `gzb_order_pay_task`.`id` as `numericalorder`
, `gzb_order_pay_task`.`pay_price` as `realMoney`
, `gzb_order_pay_task`.`deduction_price` as `deduction`
, `gzb_order_pay_task`.`difference` as `payDifference`
, `gzb_order_pay_task`.`pay_type` as `payType` 
from `gzb_order_pay` 
inner join `gzb_user_account` on `gzb_user_account`.`uid` = `gzb_order_pay`.`uid` 
inner join `gzb_order_main` on `gzb_order_main`.`orderid` = `gzb_order_pay`.`orderid` 
inner join `gzb_order_periods` on `gzb_order_periods`.`orderid` = `gzb_order_main`.`orderid` 
inner join `gzb_user_info` on `gzb_order_pay`.`uid` = `gzb_user_info`.`uid` 
inner join `gzb_user_address` on `gzb_user_address`.`uid` = `gzb_user_info`.`uid` 
left join `gzb_order_pay_task` on `gzb_order_pay_task`.`id` = `gzb_order_pay`.`pay_task_id` 
where `gzb_user_address`.`type` = '1' 
and `gzb_user_account`.`uid` not in ('1'
, '12'
, '28'
, '34'
, '85'
, '106'
, '170'
, '5468'
, '5478'
, '5795'
, '8482'
, '8525'
, '103887'
, '117273'
, '118124'
, '27653'
, '1133'
, '13'
, '108661'
, '130699'
, '168904'
, '142667') order by `gzb_order_main`.`orderid` asc
, `gzb_order_pay`.`id` asc;
















DROP TABLE IF EXISTS `gzb_user_device_statistics`;
CREATE TABLE `gzb_user_device_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`uid`	int(11)   NULL COMMENT '上报UID',  
  `devicetype` VARCHAR(20) NOT NULL COMMENT '设备类别，ios/adr/wphone',
  `version` varchar(50) NOT NULL  COMMENT '系统版本',
	`width` VARCHAR(20) NOT NULL COMMENT '分辨率-宽',
  `height` VARCHAR(20) NOT NULL COMMENT '分辨率-高',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户设备记录统计';




SELECT 
	a.phone,
	a.uid,
	i.`name`,
	COUNT(m.orderid)
FROM 	
	gzb_user_account a
INNER JOIN gzb_user_info i on i.uid = a.uid 
INNER JOIN gzb_order_main m on a.uid = m.uid
WHERE m.`status` = 3
GROUP BY m.uid HAVING  COUNT(m.orderid) > 3 
LIMIT 10


SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE `gzb_pay_user_corp` ADD COLUMN `code`  varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付返回状态码' AFTER `status`;
ALTER TABLE `gzb_pay_user_corp` MODIFY COLUMN `status`  tinyint(1) NULL DEFAULT NULL COMMENT '支付状态 0 处理中 1：支付成功 2支付失败 3扣款待确认' AFTER `protocolid`;
ALTER TABLE `gzb_user_info_refund` ADD COLUMN `qq`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `card`;
ALTER TABLE `gzb_user_info_refund` MODIFY COLUMN `identity`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证' AFTER `emergency_contact`;
ALTER TABLE `gzb_user_info_refund` DROP COLUMN `comtel`;
SET FOREIGN_KEY_CHECKS=1;










INSERT INTO `gzb_adm_category` ( `cat_name`, `cat_pid`, `cat_level`, `status`, `sort`, `code`, `created`, `updated`) 
VALUES ( 'QQ号码错误', '2', '0', '0', NULL, 'qq_error', now(), NULL);


CALL select_info('uid',165682);

select `id`
, `orderid`
, `pay_price`
, `dalay_price`
, `pay_at` 
from `gzb_order_pay` 
where `uid` = '165708' 
and `orderid` = '1444376065743289' 
and `status` = '0' 
and `pay_at` <= '2016-02-06 00:00:00' order by `pay_at` asc


SELECT * FROM gzb_order_pay p WHERE uid = 165682 AND ((`status` > 0 AND TO_DAYS(payment_at) - TO_DAYS(pay_at) > 5 ) or ( `status` = 0 AND TO_DAYS(now()) - TO_DAYS(pay_at) > 5))

165682



SELECT COUNT(DISTINCT AC.uid) AS count
FROM (`gzb_user_account` AC)
LEFT JOIN `gzb_user_info` I ON `AC`.`uid`=`I`.`uid`
INNER JOIN `gzb_user_credit` C ON `AC`.`uid`=`C`.`uid`
LEFT JOIN `gzb_order_main` M ON `AC`.`uid`=`M`.`uid` 
WHERE AC.account_status =0 and M.uid is null 




CALL select_info('phone','15091894602');


EXPLAIN SELECT  COUNT(DISTINCT AC.uid) AS count
FROM (`gzb_user_account` AC)
LEFT JOIN `gzb_user_info` I ON `AC`.`uid`=`I`.`uid`
INNER JOIN `gzb_user_credit` C ON `AC`.`uid`=`C`.`uid`
LEFT JOIN `gzb_order_main` M ON `AC`.`uid`=`M`.`uid` and M.status<3 and M.uid is null
LEFT JOIN `gzb_user_credit_task` CRT ON `AC`.`uid`=`CRT`.`uid` and CRT.uid is null 
WHERE AC.account_status =0
AND I.identity is not null

EXPLAIN
SELECT  COUNT(DISTINCT AC.uid) AS count
FROM (`gzb_user_account` AC)
LEFT JOIN `gzb_user_info` I ON `AC`.`uid`=`I`.`uid`
INNER JOIN `gzb_user_credit` C ON `AC`.`uid`=`C`.`uid`
LEFT JOIN `gzb_order_main` M ON `AC`.`uid`=`M`.`uid` and M.status<3 and M.uid is null
LEFT JOIN `gzb_user_credit_task` CRT ON `AC`.`uid`=`CRT`.`uid` 
WHERE AC.account_status =0 and  CRT.`status` is null ##(CRT.status  != 0 AND CRT.status  != 1 AND CRT.status  != 2 AND CRT.status  != 3 )
AND I.identity is not null 
SHOW CREATE TABLE gzb_user_credit_task
20284

GROUP BY `AC`.`uid`


SELECT * FROM (
						SELECT `gzb_order_pay`.* FROM `gzb_order_pay`
						RIGHT JOIN `gzb_user_payway_holding` ON `gzb_user_payway_holding`.uid = `gzb_order_pay`.uid
						JOIN `gzb_order_main` ON `gzb_order_pay`.orderid = `gzb_order_main`.orderid
						WHERE `gzb_order_pay`.`pay_at` <= '2015-09-29'
						AND `gzb_order_pay`.status = 0
						AND `gzb_order_main`.`status` = 2
						ORDER BY `gzb_order_pay`.`pay_at` DESC
				)
				pay GROUP BY `orderid`















CALL reset_order_date('1443519189983954',-70);

delete_account 

DROP PROCEDURE IF EXISTS `set_table_date`;
CREATE PROCEDURE 	`set_table_date`(
	IN in_table_name VARCHAR(30),
	IN in_col_name VARCHAR(30),
	IN in_select_col VARCHAR(30),
  IN in_select_val VARCHAR(30),
	IN in_days int(11)
)  
BEGIN   
	DECLARE forward_seconds INT(11);  
	DECLARE exec_sql VARCHAR(500);   
	DECLARE has_updated_at VARCHAR(50);
	DECLARE updated_at_val VARCHAR(50);
	SET forward_seconds = 86400 * in_days;
	SELECT COLUMN_NAME INTO has_updated_at FROM INFORMATION_SCHEMA.COLUMNS  WHERE   table_schema = DATABASE() AND TABLE_NAME = in_table_name AND COLUMN_NAME = 'updated_at';
	IF has_updated_at = 'updated_at' AND in_col_name != 'updated_at' THEN
		SET @update_sql =  CONCAT('UPDATE ',in_table_name,' SET updated_at = updated_at,',in_col_name,' = FROM_UNIXTIME(UNIX_TIMESTAMP(',in_col_name,') + ',forward_seconds,')',' WHERE ',in_select_col,' = "',in_select_val,'"');
	ELSE 
		SET @update_sql =  CONCAT('UPDATE ',in_table_name,' SET ',in_col_name,' = FROM_UNIXTIME(UNIX_TIMESTAMP(',in_col_name,') + ',forward_seconds,')',' WHERE ',in_select_col,' = "',in_select_val,'"');
	END IF;
	prepare stmt from @update_sql; 
	EXECUTE stmt;     
	deallocate prepare stmt;   
END; 

DROP PROCEDURE IF EXISTS `reset_order_date`;
CREATE PROCEDURE 	reset_order_date(IN in_orderid VARCHAR(30),IN in_days INT(11))  
BEGIN  
	START TRANSACTION ;
	CALL set_table_date('gzb_order_main','pay_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_main','created_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_main','updated_at','orderid',in_orderid,in_days);

	CALL set_table_date('gzb_order_pay','created_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_pay','pay_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_pay','payment_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_pay','updated_at','orderid',in_orderid,in_days);

	CALL set_table_date('gzb_order_periods','created_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_periods','updated_at','orderid',in_orderid,in_days);

	CALL set_table_date('gzb_order_pay_task','created_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_pay_task','updated_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_task','created_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_task','updated_at','orderid',in_orderid,in_days);
	UPDATE gzb_order_pay SET dalay_price = 0 WHERE orderid = in_orderid AND pay_at >= now();
	COMMIT;
END; 

SELECT SUBSTRING('123',2)

UPDATE gzb_ump_withholding SET media_id = SUBSTRING(media_id,2)

UPDATE gzb_ump_withholding SET identity_code = SUBSTRING(identity_code,2)

CALL select_info('phone','14122222331');

SELECT * FROM gzb_ol_0810.gzb_adm_actions ORDER BY actionid DESC;
SELECT * FROM gzb_ol_0824.gzb_adm_actions ORDER BY actionid DESC;

SELECT TO_DAYS(now())
13688888888
SELECT * FROM gzb_user_account WHERE uid = 106

CALL select_info('phone','18368251013');

SELECT a.uid,aa.phone FROM 
(
SELECT * 
FROM gzb_order_pay 
WHERE (`status` > 0 AND TO_DAYS(payment_at) - TO_DAYS(pay_at) > 5 ) or ( `status` > 0 AND TO_DAYS(now())
 - TO_DAYS(pay_at) > 5) 
) as  a JOIN gzb_user_account aa on aa.uid = a.uid 


`created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',





SELECT C.uid,A.phone,I.`name`,C.rest_amount FROM (
	SELECT * FROM gzb_user_repayment_cash WHERE status = 1 ORDER BY created_at DESC 
) as C 
LEFT JOIN gzb_user_account A ON A.uid = C.uid
LEFT JOIN gzb_user_info I ON I.uid = c.uid
GROUP BY C.uid
ORDER BY A.created_at;

DISTINCT

D:\wnmp\PHP5\extras\ssl\openssl.cnf

SELECT card ,SUBSTRING(card,2) FROM gzb_user_payway_holding LIMIT 1

UPDATE gzb_user_payway_holding 
SET card = SUBSTRING(card,2)



INSERT INTO `gzb_adm_category` ( `cat_name`, `cat_pid`, `cat_level`, `status`, `sort`, `code`, `created`, `updated`) 
VALUES ( '入职时间错误', '2', '0', '0', NULL, 'join_at_error', now(), NULL);
INSERT INTO `gzb_adm_category` ( `cat_name`, `cat_pid`, `cat_level`, `status`, `sort`, `code`, `created`, `updated`) 
VALUES ( '紧急联系人错误', '2', '0', '0', NULL, 'emergency_contact_error', now(), NULL);

ALTER TABLE gzb_adm_category MODIFY COLUMN `code` varchar(50) DEFAULT NULL COMMENT '代号'

ALTER TABLE `gzb_adm_category` MODIFY COLUMN `code`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代号' AFTER `sort`;


ALTER TABLE gzb_user_info_refund DROP COLUMN `join_at`;
ALTER TABLE gzb_user_info_refund ADD COLUMN `join_at` VARCHAR(30) DEFAULT NULL COMMENT '入职时间' AFTER `company`;
ALTER TABLE gzb_user_info_refund ADD COLUMN `emergency_contact` VARCHAR(30) DEFAULT NULL COMMENT '紧急联系人' AFTER `join_at`;

18767135775

CALL select_info('phone','18510021001');


CALL select_info('phone','18767135775');


CALL select_info('uid',38);

SELECT * FROM (
						SELECT `gzb_order_pay`.* FROM `gzb_order_pay`
						JOIN `gzb_user_payway_holding` ON `gzb_user_payway_holding`.uid = `gzb_order_pay`.uid
						JOIN `gzb_order_main` ON `gzb_order_pay`.orderid = `gzb_order_main`.orderid
						WHERE `gzb_order_pay`.`pay_at` <= '2015-09-14'
						AND `gzb_order_pay`.status = '0'
						AND `gzb_order_main`.`status` = 2
						ORDER BY `gzb_order_pay`.`pay_at` DESC
				)
				pay GROUP BY `orderid`



INSERT INTO `gzb_ol_0824`.`gzb_user_repayment_coupon` ( `uid`, `amount`, `for_amount`, `gain_type`, `pay_order_id`, `pay_task_id`, `status`, `created_at`, `expire_at`) VALUES ( '951', '40', '2000', '1', NULL, NULL, '0', '2015-09-09 17:27:37', '2015-12-08 17:27:37');
INSERT INTO `gzb_ol_0824`.`gzb_user_repayment_coupon` ( `uid`, `amount`, `for_amount`, `gain_type`, `pay_order_id`, `pay_task_id`, `status`, `created_at`, `expire_at`) VALUES ( '951', '60', '3000', '1', NULL, NULL, '0', '2015-09-09 17:27:37', '2015-12-08 17:27:37');
INSERT INTO `gzb_ol_0824`.`gzb_user_repayment_coupon` (`uid`, `amount`, `for_amount`, `gain_type`, `pay_order_id`, `pay_task_id`, `status`, `created_at`, `expire_at`) VALUES ( '951', '80', '4000', '1', NULL, NULL, '0', '2015-09-09 17:27:37', '2015-12-08 17:27:37');
INSERT INTO `gzb_ol_0824`.`gzb_user_repayment_coupon` (`uid`, `amount`, `for_amount`, `gain_type`, `pay_order_id`, `pay_task_id`, `status`, `created_at`, `expire_at`) VALUES ( '951', '100', '5000', '1', NULL, NULL, '0', '2015-09-09 17:27:37', '2015-12-08 17:27:37');


SELECT * FROM (
		SELECT `gzb_order_pay`.* FROM `gzb_order_pay`
		RIGHT JOIN `gzb_user_payway_holding` ON `gzb_user_payway_holding`.uid = `gzb_order_pay`.uid
		JOIN `gzb_order_main` ON `gzb_order_pay`.orderid = `gzb_order_main`.orderid
		WHERE `gzb_order_pay`.`pay_at` <= '2015-09-11'
		AND `gzb_order_pay`.status = 0
		AND `gzb_order_main`.`status` = 2
		ORDER BY `gzb_order_pay`.`pay_at` DESC
)pay GROUP BY `orderid`












CALL select_info('uid','951');












 SELECT  @@FOREIGN_KEY_CHECKS;

CALL delete_account('18767135785');

SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE `gzb_order_pay_task` ADD COLUMN `deduction_price`  decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '抵扣金额' AFTER `pay_price`;
SET FOREIGN_KEY_CHECKS=1;


DROP TABLE IF EXISTS 	`gzb_user_repayment_coupon`;
CREATE TABLE `gzb_user_repayment_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `amount` int(11) DEFAULT 0 COMMENT '金额',
  `for_amount` int(11) DEFAULT 0 COMMENT '适用的还款金额金额',
	`gain_type` SMALLINT(5) DEFAULT 0 COMMENT '获得的事件类别',
  `pay_order_id` bigint(26) DEFAULT NULL COMMENT '所使用的订单流水号',
  `pay_task_id` bigint(26) DEFAULT NULL COMMENT '使用的支付流水表ID',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '使用状态状态0：未使用，1.已使用',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '获得时间',
  `expire_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户代金券表';

DROP TABLE IF EXISTS 	`gzb_user_repayment_cash`;
CREATE TABLE `gzb_user_repayment_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `amount` int(11) DEFAULT 0 COMMENT '金额',
	`gain_type` SMALLINT(5) DEFAULT 0 COMMENT '获得的事件类别',
	`pay_order_id` bigint(26) DEFAULT NULL COMMENT '所使用的订单流水号',
  `pay_task_id` bigint(26) DEFAULT NULL COMMENT '使用的支付流水表ID',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '使用状态状态0：未使用，1.已使用',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '获得时间',
  `expire_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户还款现金';
  


INSERT INTO `gzb_ol_0824`.`gzb_user_data` ( `uid`, `type`, `info`, `created_at`, `updated_at`, `picurl`, `status`) VALUES ( '165682', '0', NULL, '2015-08-24 10:01:31', '2015-08-24 10:01:31', '/datum/165658/165658_1440381691836102.jpg', '0');
INSERT INTO `gzb_ol_0824`.`gzb_user_data` ( `uid`, `type`, `info`, `created_at`, `updated_at`, `picurl`, `status`) VALUES ( '165682', '1', NULL, '2015-08-24 10:01:45', '2015-08-24 10:01:45', '/datum/165658/165658_1440381705310125.jpg', '0');
INSERT INTO `gzb_ol_0824`.`gzb_user_data` ( `uid`, `type`, `info`, `created_at`, `updated_at`, `picurl`, `status`) VALUES ( '165682', '2', NULL, '2015-08-24 10:03:31', '2015-08-24 10:03:31', '/datum/165658/165658_1440381811234074.jpg', '0');
INSERT INTO `gzb_ol_0824`.`gzb_user_data` ( `uid`, `type`, `info`, `created_at`, `updated_at`, `picurl`, `status`) VALUES ( '165682', '3', NULL, '2015-08-24 10:04:04', '2015-08-24 10:04:04', '/datum/165658/165658_1440381844158044.jpg', '0');






DROP TABLE IF EXISTS 	`gzb_user_repayment_cash`;
CREATE TABLE `gzb_user_repayment_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `inout_amount` int(11) DEFAULT 0 COMMENT '收入支出金额，收入为正数，支出为负数',
  `absolute_amount` int(11) DEFAULT 0 COMMENT '金额绝对值',
	`rest_amount` decimal(11,2)  DEFAULT 0 COMMENT '余额',
	`event_type` SMALLINT(5) DEFAULT 0 COMMENT '事件类别，0还款，1分享获得',
  `inout` tinyint(2) NOT NULL DEFAULT 0 COMMENT '收入支出0：支出，1.收入',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '事件状态0：失败，1.成功',
  `pay_order_id` bigint(26) DEFAULT NULL COMMENT '还款的订单流水号',
  `pay_task_id` bigint(26) DEFAULT NULL COMMENT '还款的支付流水号',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户还款现金';
  





deduction_price
 
DROP TABLE IF EXISTS 	`gzb_order_pay_deduction`;
CREATE TABLE `gzb_order_pay_deduction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '账户ID',
	`orderid` bigint(26) NOT NULL COMMENT '订单ID',
  `amount` int(11) DEFAULT 0 COMMENT '金额',
	`gain_type` SMALLINT(5) DEFAULT 0 COMMENT '获得的事件类别',
  `pay_task_id` bigint(26) DEFAULT '0' COMMENT '使用的支付流水表ID',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '使用状态状态0：未使用，1.已使用',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '获得时间',
  `expire_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90150 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户还款现金';


CREATE TABLE `gzb_order_pay_task` (
  `id` bigint(26) NOT NULL,
  `uid` int(11) NOT NULL,
  `orderid` bigint(26) NOT NULL COMMENT '订单ID',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：月还，1：全部还清，2：银行代扣生成的月还数据',
  `pay_type` tinyint(2) DEFAULT '0' COMMENT '0：支付宝，  1：一键支付， 2：代扣，  3：线下还款',
  `pay_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '偿还金额(本金+滞纳金)',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0：未支付，1：支付成功',
  `payid` varchar(50) DEFAULT NULL COMMENT 'order_pay id',
  `difference` decimal(11,2) DEFAULT '0.00' COMMENT '线下还款差价',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单还款流水';


























UPDATE gzb_user_account SET password = '35c2cb8001987f43564a4a480751bd98',salt ='RAXqq2DE'


create DATABASE gzb_ol_0906


select `gzb_order_main`.`orderid`, `gzb_order_periods`.`payday` 
from `gzb_order_main` 
inner join `gzb_order_periods` on `gzb_order_periods`.`orderid` = `gzb_order_main`.`orderid` 
where `gzb_order_main`.`uid` = '951' order by `gzb_order_main`.`created_at` desc limit 1





SELECT  a.uid,a.phone,d.picurl
FROM gzb_user_data d JOIN gzb_user_account a on a.uid = d.uid
WHERE type >= 30 AND a.uid = 951



SELECT * FROM gzb_area a  
JOIN gzb_area b on ( a.cid != b.cid AND  a.`name` = b.`name`)
WHERE a.type = 2 AND b.type = 2 AND a.cid > b.cid


3194


SELECT CONCAT(a3.name,a2.name,a1.name) as name , a1.cid 
FROM gzb_area a1 
JOIN gzb_area a2 on a1.cup = a2.cid
JOIN gzb_area a3 on a2.cup = a3.cid
WHERE a1.cid = 1209

SELECT MAX(cid) FROM gzb_area 
4781  562
5343

SELECT * FROM gzb_user_address WHERE id = area_id AND type = 1;

SELECT * FROM gzb_user_account WHERE uid in (1442,
1591,
10777,
133806)

SELECT * FROM gzb_user_address WHERE id = area_id AND area_id >= 3571 AND type = 1;

SELECT * FROM gzb_user_address WHERE  area_id >= 3571 ORDER BY updated_at DESC

黑龙江省 哈尔滨市 宾  县 宾州镇南大街64号
SELECT * FROM gzb_area WHERE name like '%仙桃市%'

河南省省直辖神农架济源市荆梁南街1号
黑龙江省 哈尔滨市 宾  县 宾州镇南大街64号

SELECT * FROM gzb_user_address WHERE  area_id >= 3571 AND type = 1;


//代金券，现金红包


CREATE TABLE `gzb_user_redpacket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `amount` int(11) DEFAULT '5' COMMENT '红包金额',
  `type` tinyint(2) DEFAULT '1' COMMENT '红包类别，1 填写兑换码获得，2推广获得，红包3(填写蓝色兑换码获得)，红包4(填写蓝色兑换码后，蓝色天使获得)，红包5(填写蓝色兑换码的用户，填写提现资料后蓝色天使获得)',
  `relation_id` int(11) DEFAULT NULL COMMENT '被推广的uid',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '提现状态0：未提现，1.提现中，2.已提现',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '获得时间',
  `expire_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  `withdraw_id` int(11) DEFAULT NULL COMMENT '提现审核id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='用户红包表';























\\\
CREATE TABLE ``

SELECT i.uid,a.phone,i.`name`,i.identity,p.card,credit_status_info,'0' `status`,'' '' message
FROM gzb_user_info i 
JOIN gzb_user_payway p on i.uid = p.uid
JOIN gzb_user_account a on i.uid = a.uid
WHERE i.created_at >= '2015-08-01 00:00:00' 
AND i.created_at <= '2015-08-11 00:00:00'
AND credit_status = 5 

or  credit_status = 3


	SELECT * FROM gzb_ump_commonvalidate 
	WHERE created_at >= '2015-08-01 00:00:00' 
	AND created_at <= '2015-08-11 00:00:00'
	AND ret_code != '0000' AND type = 4

SELECT * FROM (
	SELECT * FROM gzb_ump_commonvalidate 
	WHERE created_at >= '2015-08-01 00:00:00' 
	AND created_at <= '2015-08-11 00:00:00'
	AND ret_code != '0000'
) a
JOIN (
	SELECT * FROM gzb_ump_commonvalidate 
	WHERE created_at >= '2015-08-01 00:00:00' 
	AND created_at <= '2015-08-11 00:00:00'
	AND ret_code != '0000'
) b
on (a.identity_code = b.identity_code AND a.common_id != b.common_id)




CREATE TABLE ``

SELECT i.uid,a.phone,i.`name`,i.identity,p.card,'0' `status`,'' '' message
FROM gzb_user_info i 
JOIN gzb_user_payway p on i.uid = p.uid
JOIN gzb_user_account a on i.uid = a.uid
WHERE i.created_at >= '2015-08-01 00:00:00' 
AND i.created_at <= '2015-08-11 00:00:00'
AND credit_status = 5 or  credit_status = 3





SELECT count(*) 
FROM gzb_user_info i 
WHERE i.created_at >= '2015-08-01 00:00:00' 
AND i.created_at <= '2015-08-11 00:00:00'
AND credit_status = 5 or  credit_status = 3





SELECT FROM_UNIXTIME('1440655200')

165686
165685
165684
140842
CALL select_info('phone','117273');


CALL delete_account('14788046411');

CALL delete_account('18767135780');


CALL delete_account('18767135777');

165686

CALL select_info('uid','165686');

889153
889153
CALL select_info('code','291474');

CALL select_info('phone','18565867390');

13162851087
159007 031077


SELECT * FROM gzb_user_account WHERE uid = 165677





117215

SELECT * FROM gzb_user_redpacket_withdraw_task WHERE uid = 117215

DROP PROCEDURE IF EXISTS `user_order_info_selector`;
CREATE PROCEDURE user_order_info_selector(IN in_uid VARCHAR(20))  


show tables 

SELECT * FROM information_schema.`tables` WHERE TABLE_SCHEMA = 'gzb_ol_0824'

SELECT DISTINCT TABLE_TYPE FROM information_schema.`TABLES`

CREATE VIEW `a_view` as 
SELECT * FROM gzb_user_account limit 5

SELECT * FROM a_view

DROP VIEW `a_view`













DROP PROCEDURE IF EXISTS `INITBNSTRENDS`;

CREATE PROCEDURE `INITBNSTRENDS`()
BEGIN
		DECLARE fetchSeqOk BOOLEAN;
		DECLARE _COM_ID INT;

		DECLARE _COM_ID_CURSOR CURSOR FOR SELECT id FROM e_enterprise WHERE user_id IS NOT NULL AND status<>'-3';#企业游标

		DECLARE CONTINUE HANDLER FOR NOT FOUND SET fetchSeqOk = true;#结束标识
		SET fetchSeqOk = FALSE;

    OPEN _COM_ID_CURSOR;
    _COM_ID_CURSOR:LOOP
				IF fetchSeqOk THEN
						LEAVE _COM_ID_CURSOR;
				ELSE
						FETCH _COM_ID_CURSOR INTO _COM_ID;#把企业ID值覆给_COM_ID
						#处理资讯
						BEGIN
								DECLARE _INFO_ID INT;
								DECLARE _INFO_SHORTSUBJECT VARCHAR(255);
								DECLARE _INFO_IMGPATH VARCHAR(128);
								DECLARE _INFO_ISSUEDATE DATETIME;
								DECLARE fetchSeqOk BOOLEAN DEFAULT 'inner'; 
								DECLARE _INFO_CURSOR CURSOR FOR SELECT id,shortsubject,micropic,issuedate FROM hc_info WHERE issue_id=_COM_ID AND issuedate>'2012-01-01' AND status<>'-3';
								DECLARE CONTINUE HANDLER FOR NOT FOUND SET fetchSeqOk = true;#结束标识
								SET fetchSeqOk = FALSE;
								OPEN _INFO_CURSOR;
								_INFO_CURSOR:LOOP
										FETCH _INFO_CURSOR INTO _INFO_ID,_INFO_SHORTSUBJECT,_INFO_IMGPATH,_INFO_ISSUEDATE;
										IF fetchSeqOk THEN
												LEAVE _INFO_CURSOR;
										ELSE
												INSERT INTO bns_trends(OBJECT_ID,OBJECT_TYPE,SUMMARY,IMG_PATH,COM_ID,VOTE_NUM,COMMEND_NUM,COMMENT_NUM,CREATE_TIME,STATUS)
												VALUES(_INFO_ID,'3',_INFO_SHORTSUBJECT,_INFO_IMGPATH,_COM_ID,0,0,0,_INFO_ISSUEDATE,'1');
										END IF;
								END LOOP;
						END;

						#处理供应
						BEGIN
								DECLARE _SALE_ID INT;
								DECLARE _SALE_TITLE VARCHAR(255);
								DECLARE _SALE_IMGPATH VARCHAR(128);
								DECLARE _SALE_ISSUEDATE DATETIME;
								DECLARE fetchSeqOk BOOLEAN DEFAULT 'inner'; 
								DECLARE _SALE_CURSOR CURSOR FOR SELECT id,title,picurl,issuedate FROM e_product_sale WHERE e_id=_COM_ID AND issuedate>'2012-01-01' AND status<>'-3';
								DECLARE CONTINUE HANDLER FOR NOT FOUND SET fetchSeqOk = true;#结束标识
								SET fetchSeqOk = FALSE;
								OPEN _SALE_CURSOR;
								_SALE_CURSOR:LOOP
										FETCH _SALE_CURSOR INTO _SALE_ID,_SALE_TITLE,_SALE_IMGPATH,_SALE_ISSUEDATE;
										IF fetchSeqOk THEN
												LEAVE _SALE_CURSOR;
										ELSE												
												INSERT INTO bns_trends(OBJECT_ID,OBJECT_TYPE,SUMMARY,IMG_PATH,COM_ID,VOTE_NUM,COMMEND_NUM,COMMENT_NUM,CREATE_TIME,STATUS)
												VALUES(_SALE_ID,'1',_SALE_TITLE,_SALE_IMGPATH,_COM_ID,0,0,0,_SALE_ISSUEDATE,'1');
										END IF;
								END LOOP;
						END;

						#处理求购
						BEGIN
								DECLARE _BUY_ID INT;
								DECLARE _BUY_TITLE VARCHAR(255);
								DECLARE _BUY_IMGPATH VARCHAR(128);
								DECLARE _BUY_ISSUEDATE DATETIME;
								DECLARE fetchSeqOk BOOLEAN DEFAULT 'inner'; 
								DECLARE _BUY_CURSOR CURSOR FOR SELECT id,title,picurl,issuedate FROM e_product_buy WHERE e_id=_COM_ID AND status<>'-3';
								DECLARE CONTINUE HANDLER FOR NOT FOUND SET fetchSeqOk = true;#结束标识
								SET fetchSeqOk = FALSE;
								OPEN _BUY_CURSOR;
								_BUY_CURSOR:LOOP
										FETCH _BUY_CURSOR INTO _BUY_ID,_BUY_TITLE,_BUY_IMGPATH,_BUY_ISSUEDATE;
										IF fetchSeqOk THEN
												LEAVE _BUY_CURSOR;
										ELSE												
												INSERT INTO bns_trends(OBJECT_ID,OBJECT_TYPE,SUMMARY,IMG_PATH,COM_ID,VOTE_NUM,COMMEND_NUM,COMMENT_NUM,CREATE_TIME,STATUS)
												VALUES(_BUY_ID,'1',_BUY_TITLE,_BUY_IMGPATH,_COM_ID,0,0,0,_BUY_ISSUEDATE,'1');
										END IF;
								END LOOP;
						END;
				END IF;
		END LOOP;
END;


CREATE TABLE `gzb_user_account` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(30) DEFAULT NULL COMMENT '用户名',
  `account_status` tinyint(2) unsigned DEFAULT '0' COMMENT '账户状态 0 启用 ，1 停用 ， 2 删除',
  `card` varchar(30) DEFAULT NULL COMMENT '手机卡类型',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=165710 DEFAULT CHARSET=utf8 COMMENT='用户账户表';



--User info selector
--Selcct User info by uid
--Return : 1.base info ;2.payway; 3.address 4.redpacket info 
--1.base info 

Consists of a pair of COLUMNS
ignore columns
key value 

desc information_schema.`COLUMNS` 

SELECT * FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = 'gzb_ol_0824' AND table_name = 'gzb_user_info'

prepare stmt from @update_sql; 
	EXECUTE stmt;     
	deallocate prepare stmt;   

desc information_schema.`COLUMNS`

DROP TABLE `__select`
CREATE TABLE `__select`
AS
SELECT * FROM gzb_user_info WHERE uid= 89 limit 1

SELECT * FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = 'gzb_ol_0824' AND table_name = '__select'


CALL select_info('phone','18767135799');

=========================================================================================================
SELECT * FROM __tmp

##__tmp 表的操作

DROP PROCEDURE IF EXISTS `__tmp_process`;
CREATE PROCEDURE `__tmp_process` (
	IN _in_operation VARCHAR(30)
)
BEGIN
	IF _in_operation = 'DROP' THEN 
		DROP TABLE IF EXISTS `__tmp`;
	ELSEIF _in_operation = 'CLEAR' THEN 
		DELETE FROM __tmp;
		ALTER TABLE __tmp AUTO_INCREMENT = 1;
	ELSEIF _in_operation = 'SELECT' THEN 
		SELECT *  FROM __tmp;
	ELSEIF _in_operation = 'CREATE' THEN 
		DROP TABLE IF EXISTS `__tmp`;
		CREATE TABLE `__tmp`( 
			id int(11) unsigned NOT NULL AUTO_INCREMENT ,
			_key_1 VARCHAR(100) NULL ,
			_key_2 VARCHAR(100) NULL ,
			_key_3 VARCHAR(100) NULL ,
			_key_4 VARCHAR(100) NULL ,
			_key_5 VARCHAR(100) NULL ,
			_key_6 VARCHAR(100) NULL ,
			_key_7 VARCHAR(100) NULL ,
			_key_8 VARCHAR(100) NULL ,
			_key_9 VARCHAR(100) NULL ,
			PRIMARY KEY(id)
		) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='临时表';
	ELSEIF _in_operation = 'INIT' THEN 
		BEGIN
			DECLARE _max int ;
			DECLARE _i int ;
	
			SET _i = 0;
			SET _max = 30;
			SET @_sql = 'INSERT INTO __tmp (`_key_1`)VALUES(NULL)';
			SET _max = _max - 1;
			_cur_loop:LOOP
				IF _i = _max THEN
					LEAVE _cur_loop;
				ELSE
					SET _i = _i + 1; 
					SET @_sql = CONCAT( @_sql ,',(NULL)');
				END IF;
			END LOOP;
			prepare stmt from @_sql; 
			EXECUTE stmt;     
			deallocate prepare stmt;   
		END;
	END IF;
END


SELECT SUBSTRING('asd',0,-1)

SELECT SUBSTR('asd',-1,0)


CALL __tmp_process('INIT');

CALL __tmp_process('DROP');

CALL __tmp_process('CREATE');

CALL __tmp_process('SELECT');

CALL __tmp_process('CLEAR');

SELECT database();

SELECT company,QUOTE(company) FROM gzb_user_info WHERE uid = 105045;

SELECT company FROM gzb_user_info WHERE uid = 105045;


##将临时表一行写入tmp表的一列
DROP PROCEDURE IF EXISTS `__tmp_table_select_first`;
CREATE PROCEDURE `__tmp_table_select_first` (
	in _in_table_name VARCHAR (30),
	in _in_key_name VARCHAR (30)
)
BEGIN
	declare done int;  
	declare _COLUMN_NAME VARCHAR(40);
	DECLARE _key VARCHAR(20) ; 
	DECLARE _i int ; 
	
	declare cur_test CURSOR for 
		SELECT COLUMN_NAME FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = DATABASE() AND table_name = _in_table_name;
  declare continue handler FOR SQLSTATE '02000' SET done = 1;  

	set _i = 0 ;
	SET _key = _in_key_name;
	OPEN cur_test;
	_cur_loop:LOOP
		FETCH cur_test INTO _COLUMN_NAME;
		IF done = 1 THEN
			LEAVE _cur_loop;
		ELSE
			SET _i = _i + 1; 
			SET @sql = CONCAT('SELECT `',_COLUMN_NAME,'` INTO @dt FROM ',_in_table_name,' limit 1 ');
			prepare stmt from @sql; 
			EXECUTE stmt;     
			deallocate prepare stmt;  
			
			IF @dt is NULL THEN
				SET @dt = 'NULL';
			END IF;
			SET @value = QUOTE( CONCAT(_COLUMN_NAME,'=',@dt));
			SET @sql = CONCAT('UPDATE __tmp SET ',_key,'=',@value,' WHERE id = ',_i);
			prepare stmt from @sql; 
			EXECUTE stmt;     
			deallocate prepare stmt;   
		END IF;
	END LOOP;
	close cur_test;   
END;



CALL __tmp_table_select_first('gzb_user_info','_key_2');



DROP PROCEDURE IF EXISTS `test`;
CREATE PROCEDURE 	`test`(
	IN _in_uid int 
)  
BEGIN   
	CALL __tmp_process('CREATE');
	CALL __tmp_process('INIT');
	DROP VIEW IF EXISTS `__tmp_select_01`;
	SET @sql = CONCAT('CREATE VIEW __tmp_select_01 AS SELECT * FROM gzb_user_info WHERE uid = ',_in_uid);
	prepare stmt from @sql; 
	EXECUTE stmt;      
	CALL __tmp_table_select_first('__tmp_select_01','_key_1');

	DROP VIEW IF EXISTS `__tmp_select_01`;
	SET @sql = CONCAT('CREATE VIEW __tmp_select_01 AS SELECT * FROM gzb_user_account WHERE uid = ',_in_uid);
	prepare stmt from @sql; 
	EXECUTE stmt;     
	CALL __tmp_table_select_first('__tmp_select_01','_key_2');

	DROP VIEW IF EXISTS `__tmp_select_01`;
	SET @sql = CONCAT('CREATE VIEW __tmp_select_01 AS SELECT * FROM gzb_user_address WHERE type = 1 AND uid =',_in_uid);
	prepare stmt from @sql; 
	EXECUTE stmt;     
	deallocate prepare stmt; 
	CALL __tmp_table_select_first('__tmp_select_01','_key_3');
	DROP VIEW IF EXISTS `__tmp_select_01`;
	CALL __tmp_process('SELECT');
END;

CALL test(105045);


SET @sql = 'SELECT `name` INTO @dt FROM gzb_user_info WHERE `name` > "" limit 1 ;';
			##INSERT INTO `__tmp` (_key)VALUES(_COLUMN_NAME);
	prepare stmt from @sql; 
	EXECUTE stmt;     
	deallocate prepare stmt;   
	SELECT @dt;



show variables like '%char%'

DROP PROCEDURE IF EXISTS `test`;
CREATE PROCEDURE 	`test`()  
BEGIN   
	DECLARE forward_seconds varchar(222);  

	#SELECT `name` INTO forward_seconds FROM gzb_user_info WHERE `name` > '' limit 1 ;
	SELECT forward_seconds;
	SET @sql = 'SELECT `name` INTO @dt FROM gzb_user_info WHERE `name` > "" limit 1 ;';
			##INSERT INTO `__tmp` (_key)VALUES(_COLUMN_NAME);
	prepare stmt from @sql; 
	EXECUTE stmt;     
	deallocate prepare stmt;   
	SELECT @dt;
END;
CALL test();



SELECT * FROM __tmp

SELECT CONCAT('name=',name) AS name FROM gzb_user_info WHERE uid = 18 limit 1

=========================================================================================================


SELECT LOCATE('aasd','asdfghjjkl') INTO __tmp;

SELECT POSITION('d' in 'asdfghjjkl');
uid,nickname,name,sex,age,qq,wechat,email,emergency_contact,company,join_at,identity,created_at,updated_at,process_at,audit_status,credit_status,fraudmetrix_status,credit_status_info,credit_status_info
DROP PROCEDURE IF EXISTS `test`;
CREATE PROCEDURE 	`test`()  
BEGIN   
	DECLARE forward_seconds text;  

  SELECT * INTO forward_seconds FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = 'gzb_ol_0824' AND table_name = 'gzb_user_info';


END;

CALL test();


DROP PROCEDURE IF EXISTS `set_table_date`;
CREATE PROCEDURE 	`set_table_date`(
	IN in_table_name VARCHAR(30),
	IN in_col_name VARCHAR(30),
	IN in_select_col VARCHAR(30),
  IN in_select_val VARCHAR(30),
	IN in_days int(11)
)  
BEGIN   
	DECLARE forward_seconds INT(11);  
	DECLARE exec_sql VARCHAR(500);   
	DECLARE has_updated_at VARCHAR(50);
	DECLARE updated_at_val VARCHAR(50);
	SET forward_seconds = 86400 * in_days;
	SELECT COLUMN_NAME INTO has_updated_at FROM INFORMATION_SCHEMA.COLUMNS  WHERE   table_schema = DATABASE() AND TABLE_NAME = in_table_name AND COLUMN_NAME = 'updated_at';
	IF has_updated_at = 'updated_at' AND in_col_name != 'updated_at' THEN
		SET @update_sql =  CONCAT('UPDATE ',in_table_name,' SET updated_at = updated_at,',in_col_name,' = FROM_UNIXTIME(UNIX_TIMESTAMP(',in_col_name,') + ',forward_seconds,')',' WHERE ',in_select_col,' = "',in_select_val,'"');
	ELSE 
		SET @update_sql =  CONCAT('UPDATE ',in_table_name,' SET ',in_col_name,' = FROM_UNIXTIME(UNIX_TIMESTAMP(',in_col_name,') + ',forward_seconds,')',' WHERE ',in_select_col,' = "',in_select_val,'"');
	END IF;
	prepare stmt from @update_sql; 
	EXECUTE stmt;     
	deallocate prepare stmt;   
END;




--User order info selector
--Return : 1.a order each line; 2.each consists of {order info ,repayment }

--User redpacket info selector
--Return : 1.withdraw info 2.redpacket list,statistics 

DROP PROCEDURE IF EXISTS `user_info_selector`;
CREATE PROCEDURE user_info_selector(IN in_uid VARCHAR(20))  
BEGIN   
	DECLARE uuid INT(11);   
  DECLARE in_phone VARCHAR(20);  
	DECLARE umy_code VARCHAR(20);   
	DECLARE is_cheat VARCHAR(20);
	DECLARE is_black VARCHAR(20);
  DECLARE is_from_black VARCHAR(20);
	DECLARE is_from_cheat VARCHAR(20);
	DECLARE ufrom_code VARCHAR(20);
	DECLARE ufrom_uid INT(11);
	DECLARE ufrom_phone VARCHAR(20);
  DECLARE uuser_type VARCHAR(20);
  DECLARE upromotion_type VARCHAR(20);
	SELECT uid ,phone INTO uuid,in_phone FROM gzb_user_account WHERE uid = in_uid LIMIT 1;
	IF uuid is not NULL THEN
		#user cheat
		SELECT phone INTO is_cheat FROM gzb_user_cheat WHERE phone = in_phone;
		IF is_cheat IS NOT NULL THEN
			SET is_cheat = 'YES';
		ELSE
			SET is_cheat = 'NO';
		END IF;
	  SELECT user_type INTO uuser_type FROM gzb_user_redpacket_account WHERE uid = uuid;
		IF uuser_type = 1 THEN
			SET uuser_type = 'blue';
		ELSE
			SET uuser_type = 'normal';
		END IF;

		SELECT my_code,from_code,from_uid,type INTO umy_code,ufrom_code,ufrom_uid,upromotion_type  FROM gzb_user_redpacket_code WHERE uid = uuid;
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
						uuser_type,
						upromotion_type,
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



DROP PROCEDURE IF EXISTS `set_table_date`;
CREATE PROCEDURE 	`set_table_date`(
	IN in_table_name VARCHAR(30),
	IN in_col_name VARCHAR(30),
	IN in_select_col VARCHAR(30),
  IN in_select_val VARCHAR(30),
	IN in_days int(11)
)  
BEGIN   
	DECLARE forward_seconds INT(11);  
	DECLARE exec_sql VARCHAR(500);   
	DECLARE has_updated_at VARCHAR(50);
	DECLARE updated_at_val VARCHAR(50);
	SET forward_seconds = 86400 * in_days;
	SELECT COLUMN_NAME INTO has_updated_at FROM INFORMATION_SCHEMA.COLUMNS  WHERE   table_schema = DATABASE() AND TABLE_NAME = in_table_name AND COLUMN_NAME = 'updated_at';
	IF has_updated_at = 'updated_at' AND in_col_name != 'updated_at' THEN
		SET @update_sql =  CONCAT('UPDATE ',in_table_name,' SET updated_at = updated_at,',in_col_name,' = FROM_UNIXTIME(UNIX_TIMESTAMP(',in_col_name,') + ',forward_seconds,')',' WHERE ',in_select_col,' = "',in_select_val,'"');
	ELSE 
		SET @update_sql =  CONCAT('UPDATE ',in_table_name,' SET ',in_col_name,' = FROM_UNIXTIME(UNIX_TIMESTAMP(',in_col_name,') + ',forward_seconds,')',' WHERE ',in_select_col,' = "',in_select_val,'"');
	END IF;
	prepare stmt from @update_sql; 
	EXECUTE stmt;     
	deallocate prepare stmt;   
END; 

DROP PROCEDURE IF EXISTS `reset_order_date`;
CREATE PROCEDURE 	reset_order_date(IN in_orderid VARCHAR(30),IN in_days INT(11))  
BEGIN  
	START TRANSACTION ;
	CALL set_table_date('gzb_order_main','pay_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_main','created_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_main','updated_at','orderid',in_orderid,in_days);

	CALL set_table_date('gzb_order_pay','created_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_pay','pay_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_pay','payment_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_pay','updated_at','orderid',in_orderid,in_days);

	CALL set_table_date('gzb_order_periods','created_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_periods','updated_at','orderid',in_orderid,in_days);

	CALL set_table_date('gzb_order_pay_task','created_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_pay_task','updated_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_task','created_at','orderid',in_orderid,in_days);
	CALL set_table_date('gzb_order_task','updated_at','orderid',in_orderid,in_days);
	UPDATE gzb_order_pay SET dalay_price = 0 WHERE orderid = in_orderid AND pay_at >= now();
	COMMIT;
END; 




DROP PROCEDURE IF EXISTS `info_selector`;
CREATE PROCEDURE info_selector(IN in_uid VARCHAR(20))  
BEGIN   
	DECLARE uuid INT(11);   
  DECLARE in_phone VARCHAR(20);  
	DECLARE umy_code VARCHAR(20);   
	DECLARE is_cheat VARCHAR(20);
	DECLARE is_black VARCHAR(20);
  DECLARE is_from_black VARCHAR(20);
	DECLARE is_from_cheat VARCHAR(20);
	DECLARE ufrom_code VARCHAR(20);
	DECLARE ufrom_uid INT(11);
	DECLARE ufrom_phone VARCHAR(20);
  DECLARE uuser_type VARCHAR(20);
  DECLARE upromotion_type VARCHAR(20);
	SELECT uid ,phone INTO uuid,in_phone FROM gzb_user_account WHERE uid = in_uid LIMIT 1;
	IF uuid is not NULL THEN
		#user cheat
		SELECT phone INTO is_cheat FROM gzb_user_cheat WHERE phone = in_phone;
		IF is_cheat IS NOT NULL THEN
			SET is_cheat = 'YES';
		ELSE
			SET is_cheat = 'NO';
		END IF;
	  SELECT user_type INTO uuser_type FROM gzb_user_redpacket_account WHERE uid = uuid;
		IF uuser_type = 1 THEN
			SET uuser_type = 'blue';
		ELSE
			SET uuser_type = 'normal';
		END IF;

		SELECT my_code,from_code,from_uid,type INTO umy_code,ufrom_code,ufrom_uid,upromotion_type  FROM gzb_user_redpacket_code WHERE uid = uuid;
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
						uuser_type,
						upromotion_type,
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


DROP PROCEDURE IF EXISTS `select_info`;
CREATE PROCEDURE select_info(
	IN in_data_type VARCHAR(20),
	IN in_data VARCHAR(20)
)  
BEGIN   
	DECLARE uuid INT(11);   
	IF in_data_type = 'uid' THEN 
			set uuid = in_data;
	ELSEIF in_data_type = 'phone' THEN 
			SELECT uid INTO uuid FROM gzb_user_account WHERE phone = in_data LIMIT 1;
	ELSEIF in_data_type = 'code' THEN 
			SELECT uid INTO uuid FROM gzb_user_redpacket_code WHERE my_code = in_data LIMIT 1;
	ELSE
			SELECT 'in_data_type Not Validate';
  END IF;
	
	IF uuid is not NULL THEN
		CALL info_selector(uuid);
	ELSE
		SELECT 'UID Not Found';
	END IF;
END;



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


call delete_account('18767139999');




insert into `gzb_topic_config` (`key`, `value`, `status`, `info`) values ('COUPON_STATUS', '0', '0', '注册送还款券是否开启');
insert into `gzb_topic_config` (`key`, `value`, `status`, `info`) values ('COUPON_EXPIRE_TIME', '7776000', '0', '还款券有效期（秒）');







insert into `gzb_topic_config` (`key`, `value`, `status`, `info`) values ('REDPACKET_TYPE_6_AMOUNT', '0', '0', '红包6(填写兑换码获得)的金额');
insert into `gzb_topic_config` (`key`, `value`, `status`, `info`) values ('REDPACKET_TYPE_7_AMOUNT', '0', '0', '红包7(推广获得)的金额');
insert into `gzb_topic_config` (`key`, `value`, `status`, `info`) values ('REDPACKET_V1_3_1_END_DATE', '0', '0', '1.3.1蓝色天使关系截止时间');
insert into `gzb_topic_config` (`key`, `value`, `status`, `info`) values ('REDPACKET_BLUE_STATUS', '0', '0', '蓝色天使红包开启状态');
insert into `gzb_topic_config` (`key`, `value`, `status`, `info`) values ('REDPACKET_SHOW_CODE', '0', '0', '是否显示兑换码输入框');
insert into `gzb_topic_config` (`key`, `value`, `status`, `info`) values ('REDPACKET_TOPPIC_REGISTE', '0', '0', '注册页面头图');
insert into `gzb_topic_config` (`key`, `value`, `status`, `info`) values ('REDPACKET_TOPPIC_LOGIN', '0', '0', '登录页面头图');
insert into `gzb_topic_config` (`key`, `value`, `status`, `info`) values ('REDPACKET_END_TEXT', '0', '0', '红包结束语');
insert into `gzb_topic_config` (`key`, `value`, `status`, `info`) values ('REDPACKET_SHOW_END_TEXT', '0', '0', '是否显示红包结束语');
insert into `gzb_topic_config` (`key`, `value`, `status`, `info`) values ('REDPACKET_BLUE_EXPIRE', '0', '0', '蓝色天使红包超时时间');


CREATE database gzb_ol_0824

SELECT a.uid,a.phone,i.`name`,i.identity
FROM gzb_user_account a
JOIN gzb_user_info i ON a.uid = i.uid
WHERE phone = '18800658696';
#查询结果： 34958	18800658696	刘娜娜	32132219900126742X
SELECT uid,phone,name,identity,card FROM gzb_user_redpacket_account WHERE identity = '32132219900126742X';
#查询结果： 141417	13861820349	刘娜娜	32132219900126742X	6228480435294668171
UPDATE gzb_user_redpacket_account
	SET 
		identity= null,
		card = NULL
WHERE uid = 141417 AND identity = '32132219900126742X';

SELECT a.uid,a.phone,i.`name`,i.identity
FROM gzb_user_account a
JOIN gzb_user_info i ON a.uid = i.uid
WHERE phone = '18012657202';
#查询结果： 115554	18012657202	张天友	
SELECT uid,phone,name,identity,card FROM gzb_user_redpacket_account WHERE identity = '372924198606100316';
#查询结果： 151686	18888396991	张天友	372924198606100316	6222021001126615985
UPDATE gzb_user_redpacket_account
	SET 
		identity= null,
		card = NULL
WHERE uid = 151686 AND identity = '372924198606100316';


SELECT a.uid,a.phone,i.`name`,i.identity
FROM gzb_user_account a
JOIN gzb_user_info i ON a.uid = i.uid
WHERE phone = '15950413232';
#查询结果： 118338	15950413232	魏艳艳	320321198810291225
SELECT uid,phone,name,identity,card FROM gzb_user_redpacket_account WHERE identity = '320321198810291225';
#查询结果： 150790	13775901623	魏艳艳	320321198810291225	6217001240008699824
UPDATE gzb_user_redpacket_account
	SET 
		identity= null,
		card = NULL
WHERE uid = 150790 AND identity = '320321198810291225';





SELECT * FROM gzb_user_redpacket_account WHERE identity = '372924198606100316';

SELECT * FROM gzb_user_redpacket_account WHERE identity = '32132219900126742X';

SELECT * FROM gzb_user_redpacket_account WHERE identity = '320321198810291225';







CALL select_info('17084991651');



select `gzb_order_main`.`orderid`, `gzb_order_main`.`pay_at` as `playingTime`, 
`gzb_order_periods`.`price`, `gzb_order_periods`.`periods`, `gzb_order_periods`.`periods_price`, 
`gzb_order_pay`.`pay_at` as `shouldPayDay`, `gzb_order_periods`.`tot_price`, 
`gzb_order_pay`.`id` as `orderPayId`, `gzb_order_pay`.`status`, `gzb_order_pay`.`pay_price`,
 `gzb_order_pay`.`early_price`, `gzb_order_pay`.`dalay_price`, `gzb_order_pay`.`payment_at` as `realPayDay`,
 `gzb_order_pay_task`.`pay_type` as `payType`, `gzb_order_pay_task`.`id` as `numericalorder`, 
`gzb_order_pay_task`.`pay_price` as `realMoney`,
 `gzb_order_pay_task`.`difference` as `payDifference`, 
`gzb_order_pay_task`.`pay_type` as `payType` 
from `gzb_order_pay` 
inner join `gzb_user_account` on `gzb_user_account`.`uid` = `gzb_order_pay`.`uid`
inner join `gzb_order_main` on `gzb_order_main`.`orderid` = `gzb_order_pay`.`orderid` 
inner join `gzb_order_periods` on `gzb_order_periods`.`orderid` = `gzb_order_main`.`orderid` 
left join `gzb_order_pay_task` on `gzb_order_pay_task`.`id` = `gzb_order_pay`.`pay_task_id` 
where `gzb_order_pay`.`status` > 0 and `gzb_order_pay_task`.`status` = 1 
and `gzb_order_pay`.`payment_at` >= '2015-08-01 00:00:00' and `gzb_user_account`.`uid` not in (1, 12, 28, 34, 85, 106, 170, 5468, 5478, 5795, 8482, 8525, 103887, 117273, 118124, 27653, 1133, 13)




393
18659386911

SELECT * FROM gzb_user_account WHERE phone="18659386911"

SELECT * FROM gzb_user_account WHERE uid  = 393

SELECT * FROM gzb_user_info WHERE uid  = 393



SELECT 
p.uid,p.orderid,p.mon_price,p.pay_price,p.early_price,p.dalay_price,p.status,p.payment_at,
t.type,t.pay_type,t.id,t.pay_price,t.difference,t.created_at
FROM gzb_order_pay p
JOIN gzb_order_pay_task t on p.pay_task_id = t.id 
WHERE p.`status` >0 AND t.`status` = 1 AND p.orderid = t.orderid










SELECT a.uid,a.phone,b.identity,b.name
FROM gzb_user_account a
JOIN gzb_user_info b on a.uid = b.uid
WHERE a.phone = '18262419098';
##查询结果：105063	18262419098	410724199104142019	郭涛
SELECT uid,name,identity,card FROM gzb_user_redpacket_account WHERE identity = '410724199104142019'  ;
##查询结果：148583	郭涛	410724199104142019	6217850800012578066
UPDATE gzb_user_redpacket_account 
SET 
	identity = NULL,
	card = NULL
WHERE uid = 148583;

SELECT * FROM gzb_user_redpacket_withdraw_task WHERE uid = 148583

SELECT SUM(amount) FROM gzb_user_redpacket WHERE uid = 105063




SELECT * FROM gzb_user_account WHERE phone = '18939426567'

3235

SELECT * FROM gzb_user_data WHERE uid = 3235

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

SHOW VARIABLES like 'SQL_NO_CACHE'

show variables like '%query_cache%'





