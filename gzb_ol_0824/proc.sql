

客户：董斌
账号：15021732645
问题：该客户逾期很久未还，经协商以1605元结清账单，收取滞纳金527元。客户于2月5日线下还款1605元，麻烦技术后台修改滞纳金匹配账单，确保客户还款完成，谢谢！
UPDATE `guozongbao`.`gzb_order_pay` SET `id`='761', `uid`='29858', `orderid`='1436498489517631', `mon_price`='500.00', `pay_price`='539.00', `early_price`='510.00', `dalay_price`='289.44', `status`='1', `is_message`='0', `pay_at`='2015-08-10 00:00:00', `payment_at`='2016-02-05 00:00:00', `created_at`='2015-07-11 18:35:06', `updated_at`='2016-02-14 11:54:31', `pay_task_id`='145542207192086' WHERE (`id`='761');
UPDATE `guozongbao`.`gzb_order_pay` SET `id`='762', `uid`='29858', `orderid`='1436498489517631', `mon_price`='500.00', `pay_price`='539.00', `early_price`='510.00', `dalay_price`='240.93', `status`='1', `is_message`='0', `pay_at`='2015-09-09 00:00:00', `payment_at`='2016-02-05 00:00:00', `created_at`='2015-07-11 18:35:06', `updated_at`='2016-02-14 11:54:31', `pay_task_id`='145542207192086' WHERE (`id`='762');
UPDATE `guozongbao`.`gzb_order_pay_task` SET `id`='145542207192086', `uid`='29858', `orderid`='1436498489517631', `type`='0', `pay_type`='3', `pay_price`='1608.37', `deduction_price`='0.00', `status`='1', `payid`='[761,762]', `difference`='-3.37', `created_at`='2016-02-14 11:54:31', `updated_at`='2016-02-14 11:54:31' WHERE (`id`='145542207192086');

CALL _delay2('15021732645',1605,527)
SELECT @uid;

287.60	
239.40



客户：李德顺
账号：13262293579
问题：该客户逾期很久未还，经协商以1400元结清账单，收取滞纳金361元。客户于2月5日线下还款1400元，
麻烦技术后台修改滞纳金匹配账单，确保客户还款完成，谢谢！

CALL _delay2('13262293579',1400,361)
SELECT @uid;



客户：黄健
账号：18936255383
问题：该客户逾期很久未还，经协商以1355元结清账单，收取滞纳金316元。客户于2月5日线下还款1355元，
麻烦技术后台修改滞纳金匹配账单，确保客户还款完成，谢谢！
UPDATE `guozongbao`.`gzb_order_pay_task` SET `id`='145541803137484', `uid`='212347', `orderid`='1443504898393985', `type`='0', `pay_type`='3', `pay_price`='1353.81', `deduction_price`='0.00', `status`='1', `payid`='[5148]', `difference`='1.19', `created_at`='2016-02-14 10:47:11', `updated_at`='2016-02-14 10:47:11' WHERE (`id`='145541803137484');
UPDATE `guozongbao`.`gzb_order_pay` SET `id`='5148', `uid`='212347', `orderid`='1443504898393985', `mon_price`='1000.00', `pay_price`='1039.00', `early_price`='1020.00', `dalay_price`='314.81', `status`='1', `is_message`='0', `pay_at`='2015-10-28 00:00:00', `payment_at`='2016-02-06 00:00:00', `created_at`='2015-09-29 14:05:24', `updated_at`='2016-02-14 10:47:11', `pay_task_id`='145541803137484' WHERE (`id`='5148');

CALL _delay2('18936255383',1355,316)
SELECT @uid;


客户：刘飞
账号：13770311837
问题：该客户逾期很久未还，经协商以1400.57元结清账单，收取滞纳金361.57元。客户于2月5日线下还款1400.57元，
麻烦技术后台修改滞纳金匹配账单，确保客户还款完成，谢谢！
UPDATE `guozongbao`.`gzb_order_pay_task` SET `id`='145541824415153', `uid`='137461', `orderid`='1440067169145131', `type`='0', `pay_type`='3', `pay_price`='1466.02', `deduction_price`='0.00', `status`='1', `payid`='[2200]', `difference`='-65.45', `created_at`='2016-02-14 10:50:44', `updated_at`='2016-02-14 10:50:44' WHERE (`id`='145541824415153');
UPDATE `guozongbao`.`gzb_order_pay` SET `id`='2200', `uid`='137461', `orderid`='1440067169145131', `mon_price`='1000.00', `pay_price`='1039.00', `early_price`='1020.00', `dalay_price`='427.02', `status`='1', `is_message`='0', `pay_at`='2015-09-18 00:00:00', `payment_at`='2016-02-02 00:00:00', `created_at`='2015-08-20 20:47:47', `updated_at`='2016-02-14 10:50:44', `pay_task_id`='145541824415153' WHERE (`id`='2200');

CALL _delay2('13770311837',1400.57,361.57)
SELECT @uid;


13771134023

SELECT * FROM gzb_user_account WHERE uid= 29451;

DROP PROCEDURE IF EXISTS `_delay2`;
CREATE PROCEDURE `_delay2`(
  _in_phone VARCHAR(20),
	_in_repay VARCHAR(20),
	_in_delay VARCHAR(20)
)
BEGIN 
	SET @phone = _in_phone;-- alter @ to DECLARE/
	SET @repay = _in_repay;
	SET @delay = _in_delay;
	SET @uid = 0;
	SET @pay_price = 0;
	SET @difference = 0;
	SET @payid = 0;
	SET @payids = 0,@delay_id1 = 0,@delay_id2 = 0;

	SELECT uid INTO @uid FROM gzb_user_account WHERE phone = @phone;-- uid not found
	SELECT pay_price,difference,payid INTO @pay_price,@difference,@payid 
		FROM gzb_order_pay_task WHERE uid = @uid AND `status` = 1 ORDER BY id DESC LIMIT 1;

	SET @a = @pay_price + @difference = @repay;
	SET @b = SUBSTR(@payid FROM LENGTH(@payid) FOR 1) = ']';
	SET @c = SUBSTR(@payid FROM 1 FOR 1) = '[';

	IF  @a AND @b AND @c THEN
		SET @payids = SUBSTR(@payid, 2,LENGTH(@payid) - 2);
		SELECT @payid,@payids;
		SET @pst = POSITION(',' IN @payids);
		SET @delay_id1 = SUBSTR(@payids FROM 1 FOR @pst - 1);
		SET @delay_id2 = SUBSTR(@payids FROM @pst + 1 FOR LENGTH(@payids));
		SELECT @delay_id1,@delay_id2;
		IF @delay_id1 != '' AND @delay_id2 != '' THEN
			SELECT * FROM gzb_order_pay WHERE uid = @uid AND ( id = @delay_id1 or id = @delay_id2) ;
			SELECT * FROM gzb_order_pay_task WHERE uid = @uid AND `status` = 1;
			SELECT dalay_price INTO @dalay1 FROM gzb_order_pay WHERE uid = @uid AND id = @delay_id1 ; 
		  SELECT dalay_price INTO @dalay2 FROM gzb_order_pay WHERE uid = @uid AND id = @delay_id2 ; 
			SET @base = @delay /(@dalay1 + @dalay2 );

			SET @n_dalay1 = ROUND(@dalay1 * @base,2);
			SET @n_dalay2 = ROUND(@dalay2 * @base,2);
			SELECT ROUND(@dalay1 * @base,2) , ROUND(@dalay2 * @base,2); -- sum not match
		END  IF ; -- just one pay record
	ELSE 
		SELECT @pay_price , @difference,@pay_price + @difference , @repay;
	END IF;
END;















15074000943,18793940675,15088121968,18228955051,18721034176,13726118754,15976005912,18566350820

SELECT * FROM gzb_user_account WHERE phone = '18566350820';
SELECT * FROM gzb_user_payway_holding_task WHERE uid = 217337;
SELECT * FROM gzb_order_pay WHERE uid = 217337;


DROP PROCEDURE IF EXISTS `payway_holding_select`;
CREATE PROCEDURE `payway_holding_select`(
	IN _in_phone VARCHAR(20)
)
BEGIN
	DECLARE _uid BIGINT ;
	SET _uid = 0;
	SELECT uid INTO _uid FROM gzb_user_account WHERE phone = '18566350820';
	IF _uid = 0 THEN
		SELECT * FROM gzb_user_payway_holding_task WHERE uid = _uid;
		SELECT * FROM gzb_order_pay WHERE uid = _uid;
	ELSE 
		SELECT 'Account ';
	END IF;
	
END;

call payway_holding_select('18566350820')

 clearVersionThreeOrder()


DROP PROCEDURE IF EXISTS `clearVersionThreeOrder`;
CREATE PROCEDURE `clearVersionThreeOrder`(
	IN _in_phone VARCHAR(20)
)
BEGIN
	DECLARE _uid BIGINT ;
	DECLARE _orderid VARCHAR(40);
	DECLARE _done TINYINT ;
	DECLARE _cursor CURSOR FOR SELECT orderid FROM gzb_order_main WHERE uid = _uid AND order_version = 3;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET _done = 1 ;
	SELECT uid INTO _uid FROM gzb_user_account WHERE phone = _in_phone;
	SET _done = 0 ;
	OPEN _cursor ;
	_cursor_loop:LOOP
		IF _done = 1 THEN
			LEAVE _cursor_loop;
		ELSE
			FETCH _cursor INTO _orderid;
			START TRANSACTION;
			DELETE FROM gzb_order_main WHERE orderid = _orderid;
			DELETE FROM gzb_order_periods WHERE orderid = _orderid;
			DELETE FROM gzb_order_pay WHERE orderid = _orderid;
			DELETE FROM gzb_order_pay_task WHERE orderid = _orderid;
			DELETE FROM gzb_order_suborder WHERE uid = _uid;
			DELETE FROM gzb_user_credit_account WHERE uid = _uid;
			COMMIT;
		END IF;
	END LOOP;
END

CALL clearVersionThreeOrder('18767135775');

CALL clearVersionThreeOrder('18767135775');

CALL clearVersionThreeOrder('18767135775');

CALL clearVersionThreeOrder('18767135775');


1445516986870655
1445515428362739
1445500809167235
1445482345001257







================================================================


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
	DECLARE _max_length int ; 
	
	declare cur_test CURSOR for 
		SELECT COLUMN_NAME FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = DATABASE() AND table_name = _in_table_name;
  declare continue handler FOR SQLSTATE '02000' SET done = 1;  

	SELECT MAX(LENGTH(COLUMN_NAME)) INTO _max_length  FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = DATABASE() AND table_name = _in_table_name;
	
	set _i = 0 ;
	SET _key = _in_key_name;
	OPEN cur_test;
	_cur_loop:LOOP
		FETCH cur_test INTO _COLUMN_NAME;
		IF done = 1 THEN
			LEAVE _cur_loop;
		ELSE
			SET _i = _i + 1; 
			SET @dt = 'Not Found';
			SET @sql = CONCAT('SELECT `',_COLUMN_NAME,'` INTO @dt FROM ',_in_table_name,' limit 1 ');
			prepare stmt from @sql; 
			EXECUTE stmt;     
			deallocate prepare stmt;  
			IF @dt = 'Not Found' AND _i = 1 THEN 
				LEAVE _cur_loop;
			END If;
			IF @dt is NULL THEN
				SET @dt = 'NULL';
			END IF;
			#SET @c_l = LENGTH(_COLUMN_NAME);
			#SET @t_n = CEIL( (_max_length - LENGTH(_COLUMN_NAME) ) / 4 );
			SET _COLUMN_NAME = UPPER(_COLUMN_NAME);
			SET @value = QUOTE( CONCAT(RPAD(_COLUMN_NAME,_max_length ,' '),'=',@dt));
			SET @sql = CONCAT('UPDATE __tmp SET ',_key,'=',@value,' WHERE id = ',_i);
			prepare stmt from @sql; 
			EXECUTE stmt;     
			deallocate prepare stmt;   
		END IF;
	END LOOP;
	close cur_test;   
END;

CALL test();
_phone				=18639036962

_region			=
_register_a			=2015
rep
SELECT CONCAT('=',repeat("\t",4),'=');
26-3 / 4 23/4
=				=
_phone				=18639036962


333333					=
3333333					=
6 7
	SET @str = '3333333';
	SET @t_n = CEIL( (26 - LENGTH(@str) ) / 4 );
	SELECT @t_n;


		SET @t_n = CEIL( (_max_length - LENGTH(_COLUMN_NAME) ) / 4 );

			SET @value = QUOTE( CONCAT(RPAD(_COLUMN_NAME,@t_n,"\t"),'=',@dt));


SELECT MAX(LENGTH(COLUMN_NAME)),COLUMN_NAME FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = DATABASE() AND table_name = '__tmp_select_02';

SELECT LPAD(str,len,padstr)

SELECT @dt;

DESC gzb_user_payway

SELECT  payname FROM gzb_user_payway limit 1 INTO @aaa;

show user variables;

SELECT @payname := payname FROM gzb_user_payway limit 2 ;

SELECT @payname;

SELECT @aaa:= 'payname';

SELECT @@aaa;

CALL __tmp_process('CREATE');
CALL __tmp_process('INIT');

CALL __tmp_table_select_first('__tmp_select_01','_key_1');

CALL __tmp_process('SELECt');

CREATE VIEW __tmp_select_01 AS SELECT * FROM gzb_user_info WHERE uid = 99

SELECT * FROM __tmp_select_01

DROP PROCEDURE IF EXISTS `user_info_selector`;
CREATE PROCEDURE 	`user_info_selector`(
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
	CALL __tmp_table_select_first('__tmp_select_01','_key_3');

	DROP VIEW IF EXISTS `__tmp_select_01`;
	SET @sql = CONCAT('CREATE VIEW __tmp_select_01 AS SELECT * FROM gzb_user_payway WHERE uid =',_in_uid);
	prepare stmt from @sql; 
	EXECUTE stmt;  
	CALL __tmp_table_select_first('__tmp_select_01','_key_4');

	DROP VIEW IF EXISTS `__tmp_select_01`;
	SET @sql = CONCAT('CREATE VIEW __tmp_select_01 AS SELECT * FROM gzb_user_redpacket_account WHERE uid =',_in_uid);
	prepare stmt from @sql; 
	EXECUTE stmt;  
	deallocate prepare stmt; 
	CALL __tmp_table_select_first('__tmp_select_01','_key_5');
	
	DROP VIEW IF EXISTS `__tmp_select_01`;
	
	CALL __tmp_process('SELECT');
END;


CALL select_info('phone','18639036962');


DROP PROCEDURE IF EXISTS `user_info_selector`;
CREATE PROCEDURE 	`user_info_selector`(
	IN _in_uid int 
)  
BEGIN 
	DECLARE _phone VARCHAR(50);
	DECLARE _region VARCHAR(50)  character set 'utf8';
	DECLARE _register_at VARCHAR(50);
	DECLARE _name VARCHAR(50)  character set 'utf8';
	DECLARE _qq VARCHAR(50);
	DECLARE _company VARCHAR(50)  character set 'utf8';
	DECLARE _identity VARCHAR(50);
	DECLARE _created_at VARCHAR(50);
	DECLARE _audit_status VARCHAR(50);
	DECLARE _credit_status VARCHAR(50);
	DECLARE _fraudmetrix_status VARCHAR(50);
	DECLARE _area_id VARCHAR(50);
	DECLARE _address VARCHAR(50)  character set 'utf8';
	DECLARE _card VARCHAR(50);
	DECLARE _payname VARCHAR(50)  character set 'utf8';
				

	SELECT phone , CONCAT(province,' ',city,' ',areacode) region,created_at as register_at 
		INTO  _phone , _region,_register_at 
			FROM gzb_user_account WHERE uid = _in_uid;
	SELECT `name`,qq,company,identity,created_at,audit_status,credit_status,fraudmetrix_status 
		INTO _name,_qq,_company,_identity,_created_at,_audit_status,_credit_status,_fraudmetrix_status 
			FROM gzb_user_info WHERE uid = _in_uid;
	SELECT area_id,address 
		INTO _area_id,_address 
			FROM gzb_user_address WHERE type= 1 AND uid = _in_uid;
	SELECT card ,payname 
		INTO _card ,_payname 
			FROM gzb_user_payway WHERE uid = _in_uid;

	DROP TABLE IF EXISTS `__tmp_select_02`;
	CREATE TABLE `__tmp_select_02` CHARACTER SET utf8 
	AS
	SELECT 
		_phone,
		_region ,
		_register_at ,
		_name ,
		_qq ,
		_company ,
		_identity,
		_created_at ,
		_audit_status ,
		_credit_status ,
		_fraudmetrix_status ,
		_area_id ,
		_address ,
		_card ,
		_payname ;
END;


DROP PROCEDURE IF EXISTS `user_redpacket_selector`;
CREATE PROCEDURE 	`user_redpacket_selector`(
	IN _in_uid int 
)  
BEGIN 

	DECLARE _uid VARCHAR(50);
	DECLARE _user_type VARCHAR(50);
	DECLARE _blue_area VARCHAR(50)character set 'utf8';
	DECLARE _beblue_at VARCHAR(50);
	DECLARE _phone VARCHAR(50);
	DECLARE _name VARCHAR(50) character set 'utf8';
	DECLARE _identity VARCHAR(50);
	DECLARE _type VARCHAR(50);
	DECLARE _card VARCHAR(50);
	DECLARE _payname VARCHAR(50) character set 'utf8';
	DECLARE _status VARCHAR(50);
	DECLARE _credit_status VARCHAR(50);

	DECLARE _redpacket_amt_tot DECIMAL(9,4); #总金额
	DECLARE _redpacket_amt_valid DECIMAL(9,4);#有效金额
	DECLARE _redpacket_amt_withdrawing DECIMAL(9,4);#提现中金额
	DECLARE _redpacket_amt_withdrawed DECIMAL(9,4);#已提现金额
	DECLARE _redpacket_amt_expire DECIMAL(9,4);#过期金额

	SELECT `uid`,`user_type`,`blue_area`,`beblue_at`,`phone`,`name`,`identity`,`type`,`card`,`payname`,`status`,`credit_status` 
		INTO _uid,_user_type,_blue_area,_beblue_at,_phone,_name,_identity,_type,_card,_payname,_status,_credit_status
			FROM gzb_user_redpacket_account WHERE uid = _in_uid;
	SELECT SUM(amount)/100 INTO _redpacket_amt_tot FROM gzb_user_redpacket WHERE uid = _in_uid;
	SELECT SUM(amount)/100 INTO _redpacket_amt_valid FROM gzb_user_redpacket WHERE uid = _in_uid AND `status` = 0 AND expire_at > now();
	SELECT SUM(amount)/100 INTO _redpacket_amt_withdrawed FROM gzb_user_redpacket WHERE uid = _in_uid AND `status` = 2;
	SELECT SUM(amount)/100 INTO _redpacket_amt_withdrawing FROM gzb_user_redpacket WHERE uid = _in_uid AND `status` = 1;
	SELECT SUM(amount)/100 INTO _redpacket_amt_expire FROM gzb_user_redpacket WHERE uid = _in_uid AND `status` = 0 AND expire_at < now();
	SELECT c.uid,a.phone,c.my_code FROM gzb_user_redpacket_code c JOIN gzb_user_account a on a.uid= c.uid  WHERE from_uid = _in_uid;

	DROP TABLE IF EXISTS `__tmp_select_02`;
	CREATE TABLE `__tmp_select_02` CHARACTER SET utf8 
	AS
	SELECT 
		_uid,
		_user_type,
		_blue_area,
		_beblue_at,
		_phone,
		_name,
		_identity,
		_type,
		_card,
		_payname,
		_status,
		_credit_status,
		_redpacket_amt_tot,
		_redpacket_amt_valid,
		_redpacket_amt_withdrawing,
		_redpacket_amt_withdrawed,
		_redpacket_amt_expire;
END;

DROP PROCEDURE IF EXISTS `test`;
CREATE PROCEDURE `test`()
BEGIN
	CALL __tmp_process('CREATE');

	CALL __tmp_process('INIT');

	CALL user_info_selector(139334);
	CALL __tmp_table_select_first('__tmp_select_02','_key_1');

	CALL user_redpacket_selector(139334);
	CALL __tmp_table_select_first('__tmp_select_02','_key_2');

	CALL __tmp_process('SELECT');

END;

CALL __tmp_process('CREATE');

CALL __tmp_process('INIT');

CALL user_info_selector(139334);
CALL __tmp_table_select_first('__tmp_select_02','_key_1');

CALL user_redpacket_selector(139334);
CALL __tmp_table_select_first('__tmp_select_02','_key_2');

CALL __tmp_process('SELECT');





35900

CALL __tmp_process('CREATE');

CALL __tmp_process('INIT');


CALL user_info_selector(87);

SELECT * FROM __tmp_select_02;

CALL __tmp_table_select_first('__tmp_select_02','_key_1');

CALL __tmp_process('SELECT');

INSERT INTO __tmp (_key_1)SELECT 'asd'


CALL user_redpacket_selector(87);

SET @sql = 'SELECT `name` INTO @dt FROM gzb_user_info WHERE `name` > "" limit 1 ;';
			##INSERT INTO `__tmp` (_key)VALUES(_COLUMN_NAME);
	prepare stmt from @sql; 
	EXECUTE stmt;     
	deallocate prepare stmt;   
	SELECT @dt;



DROP PROCEDURE IF EXISTS `test`;
CREATE PROCEDURE 	`test`()  
BEGIN   
	IF 'abc def' = 'abc\ def' THEN 
		select 'yes';
	ELSE
		select 'no';
	END IF;
END;
CALL test();

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