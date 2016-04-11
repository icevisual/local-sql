

select * from `xb_company` where `company_id` = 100 limit 1


CREATE DATABASE jke_sale



SHOW TABLES LIKE "xb_%";


ALTER TABLE xb_withdraw_order ADD COLUMN failed_card_no varchar(40) DEFAULT '0' COMMENT '打款账户' AFTER reason,

-- ads

adm_area
SELECT DATA_LENGTH/1024/1024 FROM information_schema.`TABLES` WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'xb_students'

SELECT DATA_LENGTH/1024/1024,TABLE_NAME FROM information_schema.`TABLES` WHERE TABLE_SCHEMA = DATABASE()  ORDER BY DATA_LENGTH DESC LIMIT 1



DROP TABLE xb_fbsdk_log

RENAME TABLE xb_fbsdk_log_tmp to xb_fbsdk_log


SELECT
	a.id,
	b.`func_name`  ,
	b.`login_name`  ,
	a.send_url,
	a.send_xml,
	a.send_status,
	a.send_error,
	a.received_xml,
	a.created_at,
	a.updated_at
FROM
	xb_fbsdk_log a
JOIN xb_fbsdk_func_name b ON a.id = b.log_id

CREATE TABLE xb_fbsdk_log_tmp AS
SELECT
	a.id,
	b.`func_name`  ,
	b.`login_name`  ,
	a.send_url,
	a.send_xml,
	a.send_status,
	a.send_error,
	a.received_xml,
	a.created_at,
	a.updated_at
FROM
	xb_fbsdk_log a
JOIN xb_fbsdk_func_name b ON a.id = b.log_id




SELECT
	DATA_LENGTH/1024/1024
FROM
	information_schema.`TABLES`
WHERE
	TABLE_SCHEMA = DATABASE ()
AND TABLE_NAME = 'xb_fbsdk_log'

DROP TABLE  IF EXISTS `xb_fbsdk_log`;
CREATE TABLE `xb_fbsdk_log` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `send_xml` text DEFAULT NULL COMMENT '发送的XML',
    `send_url` VARCHAR(50) DEFAULT NULL COMMENT '发送的URL',
		`send_status` SMALLINT(2) DEFAULT 0 COMMENT '发送状态0失败，1成功',
		`send_error` VARCHAR(100) DEFAULT NULL COMMENT '错误信息',
		`received_xml` text DEFAULT NULL COMMENT '接收到的XML',
    `created_at` timestamp NULL  COMMENT '时间',
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='fbsdk_log';


DROP TABLE  IF EXISTS `xb_fbsdk_func_name`;
CREATE TABLE `xb_fbsdk_func_name` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
		`log_id` int(11) NOT NULL ,
		`func_name`  VARCHAR(50) DEFAULT NULL COMMENT 'API名字',
		`login_name`  VARCHAR(50) DEFAULT NULL COMMENT '登录账户名',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='fbsdk_log';





DROP TABLE  IF EXISTS `xb_fbsdk_log`;
CREATE TABLE `xb_fbsdk_log` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
		`func_name`  VARCHAR(50) DEFAULT NULL COMMENT 'API名字',
		`login_name`  VARCHAR(50) DEFAULT NULL COMMENT '登录账户名',
    `send_xml` text DEFAULT NULL COMMENT '发送的XML',
    `send_url` VARCHAR(50) DEFAULT NULL COMMENT '发送的URL',
		`send_status` SMALLINT(2) DEFAULT 0 COMMENT '发送状态0失败，1成功',
		`send_error` VARCHAR(100) DEFAULT NULL COMMENT '错误信息',
		`received_xml` text DEFAULT NULL COMMENT '接收到的XML',
    `created_at` timestamp NULL  COMMENT '时间',
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='fbsdk_log';















SHOW tables;
show COLUMNS FROM xb_company;
RENAME table ecs_students to xb_students;



CREATE DATABASE b2b2cv11

SELECT SYSDATE()

SELECT SESSION_USER();

SELECT SUBDATE(date,INTERVAL expr unit)


SELECT ADDDATE(date,INTERVAL expr unit)

SELECT CAST(expr AS type)

SELECT CURDATE()


show variables like '%sql_mode%'
show variables like '%ignore_space%'

