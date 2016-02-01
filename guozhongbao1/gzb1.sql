SELECT a.uid,a.phone
FROM 
gzb_order_main m 
JOIN gzb_order_periods p on m.orderid = p.orderid
JOIN gzb_user_account a on a.uid = m.uid
LEFT JOIN gzb_user_info_refund r on m.uid = r.uid  
WHERE p.price = 3000 AND m.`status` = 4
AND r.uid is NULL
GROUP BY m.uid



SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT ,TABLE_NAME,TABLE_SCHEMA FROM INFORMATION_SCHEMA.COLUMNS  
WHERE   table_schema = 'gzb_ol_0824' AND TABLE_NAME = 'gzb_order_main' AND COLUMN_NAME = 'updated_at'

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



SELECT * FROM gzb_order_main WHERE orderid = '1433986839916855';
CALL reset_order_date('1433986839916855',-30);
SELECT * FROM gzb_order_main WHERE orderid = '1433986839916855';

CALL set_table_date('gzb_order_pay_task','created_at','orderid','1433986839916855',30);



DROP PROCEDURE IF EXISTS `reset_order_date`;
CREATE PROCEDURE 	reset_order_date(IN in_orderid VARCHAR(30),IN in_days INT(11))  
BEGIN   
	DECLARE forward_seconds INT(11);   
	SET forward_seconds = 86400 * in_days;
	
	UPDATE gzb_order_main SET pay_at = FROM_UNIXTIME(UNIX_TIMESTAMP(pay_at) + forward_seconds),updated_at = updated_at WHERE orderid = in_orderid;
	UPDATE gzb_order_main SET created_at = FROM_UNIXTIME(UNIX_TIMESTAMP(created_at) + forward_seconds),updated_at = updated_at  WHERE orderid = in_orderid;

  UPDATE gzb_order_pay SET created_at = FROM_UNIXTIME(UNIX_TIMESTAMP(created_at) + forward_seconds) WHERE orderid = in_orderid;
  UPDATE gzb_order_pay SET pay_at = FROM_UNIXTIME(UNIX_TIMESTAMP(pay_at) + forward_seconds) WHERE orderid = in_orderid;
	UPDATE gzb_order_pay SET payment_at = FROM_UNIXTIME(UNIX_TIMESTAMP(payment_at) + forward_seconds) WHERE orderid = in_orderid;

	UPDATE gzb_order_periods SET created_at = FROM_UNIXTIME(UNIX_TIMESTAMP(created_at) + forward_seconds) WHERE orderid = in_orderid;

	UPDATE gzb_order_pay_task SET created_at = FROM_UNIXTIME(UNIX_TIMESTAMP(created_at) + forward_seconds) WHERE orderid = in_orderid;
	UPDATE gzb_order_task SET created_at = FROM_UNIXTIME(UNIX_TIMESTAMP(created_at) + forward_seconds) WHERE orderid = in_orderid;
	UPDATE gzb_order_pay SET dalay_price = 0 WHERE orderid = in_orderid AND pay_at >= now();
END; 



UPDATE gzb_order_pay SET dalay_price = 0 WHERE orderid = in_orderid AND pay_at >= now();

SELECT now();

SELECT * FROM gzb_order_main WHERE orderid = '1433986839916855';

CALL reset_order_date('1433986839916855',-30);
SELECT * FROM gzb_order_main WHERE orderid = '1433986839916855';

CALL delete_account('18767135776');

CALL delete_account('18658190851');

CALL select_info('phone','18658190851');

CALL select_info('phone','15512345655');

SELECT * FROM gzb_user_account WHERE phone = '15512345655';


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