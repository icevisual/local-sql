


SELECT * FROM information_schema.`COLUMNS` WHERE DATA_TYPE = 'double' LIMIT 10









EMPTY STRING


SELECT  SUBSTR(TABLE_NAME ,4) FROM op_tables

UPDATE op_tables SET TABLE_NAME = SUBSTR(TABLE_NAME ,4)

================================================================
DROP TABLE IF EXISTS `__temp`;
CREATE TABLE __temp
AS
SELECT
	op_tables.id AS TABLE_ID,
	COLUMN_NAME,
  COLUMN_COMMENT AS COLUMN_NAME_CN,
  IFNULL(COLUMN_DEFAULT,'NULL') AS COLUMN_DEFAULT,
	IS_NULLABLE,
  '2' AS IS_INPUT,  
	DATA_TYPE,
	CHARACTER_MAXIMUM_LENGTH,
	NUMERIC_PRECISION,
	NUMERIC_SCALE,
	COLUMN_COMMENT,
  '' AS COLUMN_VALIDATE
FROM
	information_schema.`COLUMNS` 
JOIN op_tables ON op_tables.TABLE_NAME = information_schema.`COLUMNS`.TABLE_NAME
WHERE
	TABLE_SCHEMA = DATABASE ();



COLLATE






SELECT GROUP_CONCAT('`',COLUMN_NAME,'`') FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = database() AND TABLE_NAME = '__temp';

================================================================

INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('2', 'id', '', 'NULL', 'NO', '2', 'int', null, '10', '0', '', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('2', 'attr_name', '属性名字', 'NULL', 'NO', '2', 'varchar', '80', null, null, '属性名字', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('2', 'attr_name_cn', '显示中文名', '', 'NO', '2', 'varchar', '255', null, null, '显示中文名', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('2', 'attr_type', '属性类别', 'NULL', 'NO', '2', 'varchar', '80', null, null, '属性类别', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('2', 'form_type', '表单控件类别', 'NULL', 'NO', '2', 'varchar', '80', null, null, '表单控件类别', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('3', 'id', '', 'NULL', 'NO', '2', 'int', null, '10', '0', '', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('3', 'component_name', '组件名称', 'NULL', 'NO', '2', 'varchar', '80', null, null, '组件名称', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('3', 'component_desc', '组件描述', 'NULL', 'NO', '2', 'varchar', '255', null, null, '组件描述', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('4', 'id', '', 'NULL', 'NO', '2', 'int', null, '10', '0', '', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('4', 'component_id', '组件ID', 'NULL', 'NO', '2', 'int', null, '10', '0', '组件ID', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('4', 'attr_id', '属性ID', 'NULL', 'NO', '2', 'int', null, '10', '0', '属性ID', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('4', 'default_value', '属性默认值', 'NULL', 'YES', '2', 'varchar', '80', null, null, '属性默认值', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('5', 'id', '', 'NULL', 'NO', '2', 'int', null, '10', '0', '', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('5', 'name', '表单名称', 'NULL', 'NO', '2', 'varchar', '80', null, null, '表单名称', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('5', 'created_at', '创建时间', 'NULL', 'YES', '2', 'timestamp', null, null, null, '创建时间', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('5', 'updated_at', '', 'NULL', 'YES', '2', 'timestamp', null, null, null, '', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('6', 'id', '', 'NULL', 'NO', '2', 'int', null, '10', '0', '', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('6', 'form_id', '表单ID', 'NULL', 'NO', '2', 'int', null, '10', '0', '表单ID', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('6', 'component_id', '组件ID', 'NULL', 'NO', '2', 'int', null, '10', '0', '组件ID', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('6', 'attr_id', '属性ID', 'NULL', 'NO', '2', 'varchar', '80', null, null, '属性ID', '');
INSERT INTO `op_columns` (`TABLE_ID`,`COLUMN_NAME`,`COLUMN_NAME_CN`,`COLUMN_DEFAULT`,`IS_NULLABLE`,`IS_INPUT`,`DATA_TYPE`,`CHARACTER_MAXIMUM_LENGTH`,`NUMERIC_PRECISION`,`NUMERIC_SCALE`,`COLUMN_COMMENT`,`COLUMN_VALIDATE`) VALUES ('6', 'attr_value', '属性值', 'NULL', 'NO', '2', 'varchar', '80', null, null, '属性值', '');




=======================================================================================


SHOW CREATE TABLE op_columns

CREATE TABLE `op_columns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TABLE_ID` int(11) NOT NULL COMMENT '表ID',
  `COLUMN_NAME` varchar(64) NOT NULL COMMENT '字段名',
  `COLUMN_NAME_CN` varchar(100) DEFAULT '' COMMENT '中文字段名',
  `COLUMN_DEFAULT` varchar(100) DEFAULT NULL COMMENT '默认值',
  `IS_NULLABLE` varchar(3) NOT NULL COMMENT '允许空',
  `IS_INPUT` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否从接口输入获取，1否，2是',
  `DATA_TYPE` varchar(64) NOT NULL COMMENT '数据类型',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) unsigned DEFAULT NULL COMMENT '字符长度',
  `NUMERIC_PRECISION` bigint(21) unsigned DEFAULT NULL COMMENT '位数',
  `NUMERIC_SCALE` bigint(21) unsigned DEFAULT NULL COMMENT '精度',
  `COLUMN_COMMENT` varchar(1024) NOT NULL COMMENT '备注',
  `COLUMN_VALIDATE` varchar(255) DEFAULT NULL COMMENT '字段验证规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8

SELECT COLUMN_DEFAULT FROM information_schema.`COLUMNS` GROUP BY COLUMN_DEFAULT;

SHOW CREATE TABLE op_tables


CREATE TABLE `op_tables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(80) NOT NULL COMMENT '表名',
  `TABLE_COMMENT` varchar(255) DEFAULT NULL COMMENT '表备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='TABLES表'


ALTER TABLE op_tables ADD COLUMN `CONNECTION` VARCHAR(64) NOT NULL DEFAULT 'mysql' COMMENT '数据库连接' AFTER  TABLE_COMMENT; 

CREATE TABLE `op_tables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(80) NOT NULL COMMENT '表名',
  `TABLE_COMMENT` varchar(255) DEFAULT NULL COMMENT '表备注',
  `CONNECTION` varchar(64) NOT NULL DEFAULT 'mysql' COMMENT '数据库连接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='TABLES表'


SHOW CREATE TABLE op_columns

CREATE TABLE `op_columns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TABLE_ID` int(11) NOT NULL COMMENT '表ID',
  `COLUMN_NAME` varchar(64) NOT NULL COMMENT '字段名',
  `COLUMN_NAME_CN` varchar(100) DEFAULT '' COMMENT '中文字段名',
  `COLUMN_DEFAULT` varchar(100) DEFAULT NULL COMMENT '默认值',
  `IS_NULLABLE` varchar(3) NOT NULL COMMENT '允许空',
  `IS_INPUT` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否从接口输入获取，1否，2是',
  `DATA_TYPE` varchar(64) NOT NULL COMMENT '数据类型',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) unsigned DEFAULT NULL COMMENT '字符长度',
  `NUMERIC_PRECISION` bigint(21) unsigned DEFAULT NULL COMMENT '位数',
  `NUMERIC_SCALE` bigint(21) unsigned DEFAULT NULL COMMENT '精度',
  `COLUMN_COMMENT` varchar(1024) NOT NULL COMMENT '备注',
  `COLUMN_VALIDATE` varchar(255) DEFAULT NULL COMMENT '字段验证规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8


ALTER TABLE op_columns ADD COLUMN `COLUMN_VALIDATE` varchar(255) NULL COMMENT '字段验证规则' AFTER COLUMN_COMMENT;



SELECT DATA_TYPE FROM information_schema.`COLUMNS` GROUP BY DATA_TYPE









DROP TABLE IF EXISTS `op_columns`;
CREATE TABLE `op_columns`  CHARACTER SET utf8
AS
SELECT
	'' AS P,
	COLUMN_NAME,
	COLUMN_DEFAULT,
	IS_NULLABLE,
	DATA_TYPE,
	CHARACTER_MAXIMUM_LENGTH,
	NUMERIC_PRECISION,
	NUMERIC_SCALE,
	COLUMN_COMMENT
FROM
	information_schema.`COLUMNS`
WHERE
	TABLE_SCHEMA = DATABASE ()
AND TABLE_NAME = 'op_attrs';

ALTER TABLE op_columns ADD COLUMN `id` int(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY AFTER P;
ALTER TABLE op_columns ADD COLUMN `TABLE_ID` int(11) NOT NULL DEFAULT '0' COMMENT '表ID' AFTER id;
ALTER TABLE op_columns ADD COLUMN `COLUMN_NAME_CN` varchar(100) NULL DEFAULT '' COMMENT '中文字段名' AFTER COLUMN_NAME;
ALTER TABLE op_columns DROP COLUMN P;
SHOW CREATE TABLE `op_columns`


DROP TABLE IF EXISTS `op_columns`;
CREATE TABLE `op_columns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TABLE_ID` int(11) NOT NULL COMMENT '表ID',
  `COLUMN_NAME` varchar(64) NOT NULL COMMENT '字段名',
  `COLUMN_NAME_CN` varchar(100) DEFAULT '' COMMENT '中文字段名',
  `COLUMN_DEFAULT` varchar(100) NULL COMMENT '默认值',
  `IS_NULLABLE` varchar(3) NOT NULL COMMENT '允许空',
  `DATA_TYPE` varchar(64) NOT NULL COMMENT '数据类型',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) unsigned DEFAULT NULL COMMENT '字符长度',
  `NUMERIC_PRECISION` bigint(21) unsigned DEFAULT NULL COMMENT '位数',
  `NUMERIC_SCALE` bigint(21) unsigned DEFAULT NULL COMMENT '精度',
  `COLUMN_COMMENT` varchar(1024) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8















SHOW CREATE TABLE op_tables

CREATE TABLE `op_tables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(80) NOT NULL COMMENT '表名',
  `TABLE_COMMENT` varchar(255) DEFAULT NULL COMMENT '表备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='TABLES表'

INSERT INTO `automation`.`op_tables` (`TABLE_NAME`) VALUES ('op_attrs'),('op_component'),('op_component_attrs'),('op_form'),('op_form_component');


ALTER TABLE op_tables ADD COLUMN `TABLE_COMMENT` varchar(255) NULL COMMENT '表备注' AFTER TABLE_NAME

SELECT TABLE_NAME,TABLE_COMMENT from information_schema.TABLES WHERE table_schema = DATABASE()


SHOW CREATE TABLE information_schema.`COLUMNS`



SELECT * FROM information_schema.`COLUMNS` GROUP BY DATA_TYPE


SELECT
	COLUMN_NAME,
	ORDINAL_POSITION,
	COLUMN_DEFAULT,
	IS_NULLABLE,
	DATA_TYPE,
	COLUMN_TYPE,
	CHARACTER_MAXIMUM_LENGTH,
	NUMERIC_PRECISION,
	NUMERIC_SCALE,
	CHARACTER_SET_NAME,
	COLLATION_NAME,
	COLUMN_COMMENT
FROM
	information_schema.`COLUMNS`
WHERE
	TABLE_SCHEMA = DATABASE ()
AND TABLE_NAME = 'op_attrs'

SELECT
	*
FROM
	information_schema.`COLUMNS`
WHERE
	TABLE_SCHEMA = DATABASE ()
AND TABLE_NAME = 'op_attrs'



CREATE TEMPORARY TABLE `COLUMNS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COLUMN_DEFAULT` longtext,
  `IS_NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_PRECISION` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_SCALE` bigint(21) unsigned DEFAULT NULL,
  `DATETIME_PRECISION` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(32) DEFAULT NULL,
  `COLLATION_NAME` varchar(32) DEFAULT NULL,
  `COLUMN_TYPE` longtext NOT NULL,
  `COLUMN_KEY` varchar(3) NOT NULL DEFAULT '',
  `EXTRA` varchar(30) NOT NULL DEFAULT '',
  `PRIVILEGES` varchar(80) NOT NULL DEFAULT '',
  `COLUMN_COMMENT` varchar(1024) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8


DROP TABLE IF EXISTS `op_form`;
CREATE TABLE `op_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL COMMENT '表单名称',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单表'



SHOW CREATE TABLE op_request_log


CREATE TABLE `op_request_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `uri` varchar(100) DEFAULT NULL COMMENT '路由',
  `method` varchar(30) NOT NULL COMMENT 'method',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `http_status` smallint(5) DEFAULT NULL COMMENT 'HTTP 状态码',
  `return` text COMMENT '返回',
  `sha1` varchar(100) DEFAULT NULL COMMENT 'SHA1 of uri & params & return ',
  `time_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '时间使用量S',
  `memory_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '内存使用量MB',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4212 DEFAULT CHARSET=utf8 COMMENT='请求日志'

SHOW CREATE TABLE op_attrs

SHOW CREATE TABLE op_component_attrs

SHOW CREATE TABLE op_component_instance


DROP TABLE IF EXISTS `op_form_component`;
CREATE TABLE `op_form_component` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL COMMENT '表单ID',
  `component_id` int(11) NOT NULL COMMENT '组件ID',
  `attr_id` varchar(80) NOT NULL COMMENT '属性ID',
  `attr_value` varchar(80) NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组件实例表'

DROP TABLE IF EXISTS `op_form`;
CREATE TABLE `op_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_name` varchar(80) NOT NULL COMMENT '表单名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单表'




CREATE TABLE `op_attrs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attr_name` varchar(80) NOT NULL COMMENT '属性名字',
  `attr_name_cn` varchar(255) NOT NULL DEFAULT '' COMMENT '显示中文名',
  `attr_value` varchar(80) NOT NULL COMMENT '属性值',
  `attr_type` varchar(80) NOT NULL COMMENT '属性类别',
  `form_type` varchar(80) NOT NULL COMMENT '表单控件类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='组件属性表'

ALTER TABLE op_attrs DROP COLUMN attr_value




ALTER TABLE op_request_log ADD COLUMN `method` varchar(30) NOT NULL COMMENT 'method' AFTER `uri`;



ALTER TABLE op_attrs ADD COLUMN `attr_name_cn` VARCHAR(255)  NOT NULL DEFAULT '' COMMENT '显示中文名' AFTER attr_name;


'attr_name_cn' => '显示中文名',



DELETE FROM op_request_log



SHOW CREATE TABLE op_attrs



DROP table IF EXISTS op_attrs;
CREATE TABLE `op_attrs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attr_name` varchar(80) NOT NULL COMMENT '属性名字',
  `attr_value` varchar(80) NOT NULL COMMENT '属性值',
  `attr_type` varchar(80) NOT NULL COMMENT '属性类别',
  `form_type` varchar(80) NOT NULL COMMENT '表单控件类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='组件属性表'





CREATE TABLE `op_attrs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attr_name_cn` varchar(80) NOT NULL COMMENT '属性名字',
  `attr_name_en` varchar(80) NOT NULL COMMENT '属性名字',
  `attr_type` varchar(80) NOT NULL COMMENT '属性类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='组件属性表'



