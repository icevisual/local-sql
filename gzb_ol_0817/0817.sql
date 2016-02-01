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




