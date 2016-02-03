
set global log_bin_trust_function_creators=1;
show variables like 'log_bin_trus%'


CREATE
[DEFINER = { user | CURRENT_USER }]
TRIGGER trigger_name
trigger_time trigger_event
ON tbl_name FOR EACH ROW
[trigger_order]
trigger_body


trigger_time: { BEFORE | AFTER }
trigger_event: { INSERT | UPDATE | DELETE }
trigger_order: { FOLLOWS | PRECEDES } other_trigger_name

DROP TRIGGER IF EXISTS `trigger_name`;

CREATE TRIGGER trigger_name BEFORE INSERT ON up_member_request FOR EACH ROW
SET NEW.date = FROM_UNIXTIME(UNIX_TIMESTAMP(),'%Y-%m-%d');

CALL _multi_exec_func();

SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(),'%Y-%m-%d')

SHOW TRIGGERS


DROP EVENT IF EXISTS `myevent`;

CREATE EVENT myevent ON COMPLETION COMMENT 'A sample comment.' DO
	UPDATE intelligentmask.up_member_request
SET date = DATE('%Y-%m-%d');

ALTER TABLE up_member_request add COLUMN date date COMMENT '上报时间' AFTER report_time




DROP FUNCTION IF EXISTS `_rand_timestamp`;
CREATE FUNCTION `_rand_timestamp`(
	_in_day int(11)
)
RETURNS int(10)
BEGIN
	DECLARE _return int(10);
	SET _return  = UNIX_TIMESTAMP() - round( (RAND() * _in_day ) * 86400 ) ;
	RETURN _return;
END
SELECT _rand_timestamp();



DROP FUNCTION IF EXISTS `_rand_lnumber`;
CREATE FUNCTION `_rand_lnumber`(
	_in_len int(11)
)
RETURNS VARCHAR(11)
BEGIN
	DECLARE _return VARCHAR(11);
	DECLARE _tmp1 int(10);
	DECLARE _tmp2 int(10);
	SET _tmp1 = RPAD('1',_in_len + 1,'0') + 0;
	SET _return = LPAD((round( RAND() * _tmp1 )),_in_len,'0');
	RETURN (_return);
END


SELECT _rand_lnumber(9);


DROP FUNCTION IF EXISTS `_rand_mobile`;
CREATE FUNCTION `_rand_mobile`()
RETURNS VARCHAR(11)
BEGIN
	DECLARE _return VARCHAR(11);
	DECLARE _number VARCHAR(10);
	DECLARE _index int(10);
	SET _number = '35784';
	SET _index = (round( RAND() * 10 ) % 5 + 1);
	SET _return = CONCAT('1',SUBSTR(_number,_index,1),LPAD((round( RAND() * 1000000000 )),9,'0'));
	RETURN (_return);
END



DROP FUNCTION IF EXISTS `_rand_range`;
CREATE FUNCTION `_rand_range`(
	_in_start int(11),
  _in_end int(11)
)
RETURNS int(11)
BEGIN
	DECLARE _return int(11);
	DECLARE _tmp int(11);
	DECLARE _index int(10);
	SET _tmp = _in_end - _in_start + 1;
	SET _return = (round( RAND() * _tmp ) % _tmp + _in_start) ;
	RETURN (_return);
END

ALTER TABLE up_member_account  AUTO_INCREMENT=1




SET @_mid = 0;

SET @_mid = @_mid + 1;
set @_time =  _rand_timestamp(100);
SET @_mobile = _rand_mobile();
INSERT INTO `intelligentmask`.`up_member_account` (
	`mid`,
	`passwd`,
	`uname`,
	`mobile`,
	`level_id`,
	`login_count`,
	`last_ip`,
	`access_token`,
	`is_state`,
	`update_time`,
	`create_time`,
	`token`
)
VALUES
	(
		@_mid,
		'21e5f08c0b2ec49454b33313e02167d2',
		CONCAT('mask',LPAD((round( RAND() * 1000000000 )),9,'0')),
		@_mobile,
		'1',
		'2',
		'125.119.252.164',
		'9459577d7053775f6a2f635adabb0009f9263727',
		'1',
		@_time,
		@_time,
		concat('adabb000',@_mobile)
	);
set @_time =  _rand_timestamp(100);
INSERT INTO `intelligentmask`.`up_member_equipment` (
	`member_id`,
	`production_date`,
	`device_number`,
	`system_version`,
	`is_bound`,
	`update_time`,
	`create_time`,
	`mode`,
	`token`
)
VALUES
	(
		@_mid,
		_rand_timestamp(100),
		CONCAT('MK',_rand_lnumber(6)),
		'2',
		'2',
		@_time,
		@_time,
		'1',
		CONCAT(_rand_lnumber(9),_rand_lnumber(9))
	);


SELECT MAX(mid) INTO @_mid FROM up_member_account;
SELECT @_mid ;

CALL _multi_exec(5005);


DELETE FROM up_member_request WHERE id > 2000

DROP PROCEDURE IF EXISTS `_multi_exec_func`;
CREATE  PROCEDURE `_multi_exec_func`()
BEGIN
	set @_time =  _rand_timestamp(18);
				INSERT INTO `intelligentmask`.`up_member_request` (
					`mode`,
					`member_id`,
					`latitude`,
					`longitude`,
					`report_time`,
					`city_name`,
					`update_time`,
					`create_time`,
					`report_ip`,
					`val_data`,
					`geohash`
				)
				VALUES
					(
						'1',
						_rand_range(1,100000),
						round(120.22 + RAND() * 10 - 5, 2),
						round(30.22 + RAND() * 10 - 5, 2),
						@_time ,
						'杭州',
						@_time,
						@_time,
						'10.67.33.21',
						round(200 + RAND() * 100 - 50,2),
						NULL
					);
END;




DROP PROCEDURE IF EXISTS `_multi_exec`;
CREATE  PROCEDURE `_multi_exec`(
	_in_time int(11)
)
BEGIN
	DECLARE _time int(11);
	DECLARE _i int(11);
	SET _i = 0;
	START  TRANSACTION  ;
	WHILE _i < _in_time DO
			CALL _multi_exec_func();
			SET _i = _i + 1;
	END WHILE;
	COMMIT;
END;


set @_time =  _rand_timestamp(100);
INSERT INTO `intelligentmask`.`up_member_request` (
	`mode`,
	`member_id`,
	`latitude`,
	`longitude`,
	`report_time`,
	`city_name`,
	`update_time`,
	`create_time`,
	`report_ip`,
	`val_data`,
	`geohash`
)
VALUES
	(
		'1',
		_rand_range(1,1000),
		round(120.22 + RAND() * 10 - 5, 2),
		round(30.22 + RAND() * 10 - 5, 2),
		@_time ,
		'杭州',
		@_time,
		@_time,
		'10.67.33.21',
		round(200 + RAND() * 100 - 50,2),
		NULL
	);












CREATE DATABASE intelligentMask DEFAULT charset=utf8






GRANT ALL PRIVILEGES on intelligentMask.* TO 'intelligengMask'@'localhost' IDENTIFIED BY '123456';
FLUSH PRIVILEGES;



DROP TABLE IF EXISTS `up_config`;
CREATE TABLE `up_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255)  NOT NULL COMMENT '描述',
  `code` varchar(80) NOT NULL COMMENT 'CODE',
  `value` varchar(255)  NOT NULL COMMENT '内容',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';