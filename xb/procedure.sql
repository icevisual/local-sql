SET FOREIGN_KEY_CHECKS=0;
CREATE TABLE `adm_area` (
`cid`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`cup`  int(11) NOT NULL DEFAULT 0 COMMENT '上一级的cid' ,
`type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '层级' ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地址名称' ,
`is_open`  tinyint(2) NULL DEFAULT 0 COMMENT '是否开放，0未开放，1已开放' ,
`fchar`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '首字母' ,
`abbreviation`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缩写' ,
PRIMARY KEY (`cid`),
INDEX `cup` (`cup`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `xb_company` ADD COLUMN `join_at`  timestamp NULL DEFAULT NULL COMMENT '合作时间' AFTER `status`;
CREATE UNIQUE INDEX `name` ON `xb_company`(`name`) USING BTREE ;
CREATE UNIQUE INDEX `company_id` ON `xb_company_business_configuration`(`company_id`) USING BTREE ;
CREATE TABLE `xb_company_business_configuration_log` (
`log_id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`payroll_time`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工资发放时间' ,
`enterprise_interest`  decimal(10,2) NOT NULL COMMENT '默认企业计息比例' ,
`distribution_share`  decimal(10,2) NOT NULL COMMENT '默认企业分配比例' ,
`company_id`  int(11) NULL DEFAULT 0 COMMENT '企业id' ,
`operator`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人姓名' ,
`created_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`log_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `xb_company_profit` MODIFY COLUMN `principal`  decimal(30,6) NOT NULL DEFAULT 0.000000 COMMENT '计息本金' AFTER `date`;
DROP PROCEDURE IF EXISTS `set_table_date`;
CREATE DEFINER = `root`@`localhost` PROCEDURE `set_table_date`(IN in_table_name VARCHAR(30),
	IN in_col_name VARCHAR(30),
	IN in_select_col VARCHAR(30),
  IN in_select_val VARCHAR(30),
	IN in_days int(11))
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
DROP PROCEDURE `set_table_date_iv`;
SET FOREIGN_KEY_CHECKS=1;