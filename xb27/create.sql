
DROP TABLE  IF EXISTS `xb_company_bankroll`;
CREATE TABLE `xb_company_bankroll` (
    `company_id` int(11) NOT NULL COMMENT '账户ID',
    `company_amount` decimal(30,2) DEFAULT 0 COMMENT '企业资金池余额，该企业下的员工的企业资金池总额',
    `profit_amount` decimal(30,2) DEFAULT 0 COMMENT '累计收益，企业可用资金',
    `salary_amount` decimal(30,2) DEFAULT 0 COMMENT '发放工资总额',
	`tax_amount` decimal(30,2) DEFAULT 0 COMMENT '工资含税总额',
    `created_at` timestamp NULL  COMMENT '时间',
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='企业资金账户表';

DROP TABLE  IF EXISTS `xb_company_bill`;
CREATE TABLE `xb_company_bill` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `company_id` int(11) NOT NULL COMMENT '账户ID',
    `amount` decimal(30,2) DEFAULT '0.00' COMMENT '金额',
    `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出0：支出，1.收入,2转账',
    `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，0收益，1薪资发放，2提现，3提现失败返回，4离职企业资金池转入个人资金池,5取消合作',
    `event_name` varchar(100) DEFAULT NULL COMMENT '事件名称',
    `after_rest_amt` decimal(30,2) DEFAULT 0 COMMENT '之后余额',
    `relation_id` bigint(26) NULL COMMENT '事件关联ID，et = 0 company_profit_id,salary_pay_id,withdraw_id',
    `relation_uid` int(11) NOT NULL COMMENT '事件关联UID',
    `created_at` timestamp NULL  COMMENT '时间',
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='企业资金池变动表';

DROP TABLE  IF EXISTS `xb_company_profit`;
CREATE TABLE `xb_company_profit` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `company_id` int(11) NOT NULL COMMENT '企业ID',
    `date` date NULL DEFAULT NULL COMMENT '日期',
    `principal` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '计息本金',
    `interest_rate` decimal(11,4) DEFAULT '0.0000' COMMENT '计息比例',
    `income_rate` decimal(11,4) DEFAULT '0.0000' COMMENT '收益率',
    `profit_rate` decimal(11,4) DEFAULT '0.0000' COMMENT '收益分配比例',
    `profit` decimal(30,2) DEFAULT 0 COMMENT '收益金额',
    `cumulative_profit` decimal(30,2) DEFAULT 0 COMMENT '累计收益金额',
   	`after_principal` decimal(30,2) DEFAULT 0 COMMENT '收益后的-收益本金',
    `created_at` timestamp NULL  COMMENT '时间',
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='企业收益表';

DROP TABLE  IF EXISTS `xb_user_profit`;
CREATE TABLE `xb_user_profit` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `uid` int(11) NOT NULL COMMENT '用户ID',
    `date` date NULL DEFAULT NULL COMMENT '日期',
    `principal` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '计息本金',
    `income_rate` decimal(11,4) DEFAULT '0.0000' COMMENT '收益率',
    `profit` decimal(30,2) DEFAULT 0 COMMENT '收益金额',
    `personal_profit` decimal(30,2) DEFAULT 0 COMMENT '收益金额-个人资金池所得收益',
    `company_profit` decimal(30,2) DEFAULT 0 COMMENT '收益金额-企业资金池所得收益',
    `cumulative_profit` decimal(30,2) DEFAULT 0 COMMENT '累计收益金额',
    `after_rest_amt` decimal(30,2) DEFAULT 0 COMMENT '收益后的-收益本金',
    `after_personal_amt` decimal(30,2) DEFAULT 0 COMMENT '收益后的-收益本金-个人部分',
    `after_company_amt` decimal(30,2) DEFAULT 0 COMMENT '收益后的-收益本金-企业部分',
    `created_at` timestamp NULL  COMMENT '时间',
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `date` (`date`) USING BTREE,
    KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户收益表';

DROP TABLE  IF EXISTS `xb_user_bankroll`;
CREATE TABLE `xb_user_bankroll` (
    `uid` int(11) NOT NULL COMMENT '账户ID',
    `rest_amount` decimal(30,2) DEFAULT 0 COMMENT '账户余额，个人资金 + 企业资金',
    `personal_amount` decimal(30,2) DEFAULT 0 COMMENT '个人资金池余额，离职企业薪资+个人收益',
    `company_amount` decimal(30,2) DEFAULT 0 COMMENT '企业资金池余额，当前所在公司发放的薪资总额',
    `withdraw_amount` decimal(30,2) DEFAULT 0 COMMENT '提现资金池，所有的提现成功金额',
    `tax_amount` decimal(30,2) DEFAULT 0 COMMENT '交税资金池，所有交的税',
    `salary_amount` decimal(30,2) DEFAULT 0 COMMENT '薪资资金池，所有薪资',
    `profit_amount` decimal(30,2) DEFAULT 0 COMMENT '收益资金池，所有收益，昨日余额*收益率',
    `created_at` timestamp NULL  COMMENT '时间',
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户资金表';
DROP TABLE  IF EXISTS `xb_user_bill`;
CREATE TABLE `xb_user_bill` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `uid` int(11) NOT NULL COMMENT '账户ID',
    `amount` decimal(30,2) DEFAULT '0.00' COMMENT '金额',
    `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出0：支出，1.收入,2转账',
    `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，0收益，1薪资发放，2提现，3提现失败返回，4离职企业资金池转入个人资金池',
    `event_name` varchar(100) DEFAULT NULL COMMENT '事件名称',
    `after_rest_amt` decimal(30,2) DEFAULT 0 COMMENT '之后余额',
    `after_personal_amt` decimal(30,2) DEFAULT 0 COMMENT '之后个人资金池余额',
    `after_company_amt` decimal(30,2) DEFAULT 0 COMMENT '之后企业资金池余额',
    `relation_id` bigint(26) NULL COMMENT '事件关联ID，',
    `created_at` timestamp NULL  COMMENT '时间',
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户账单表';

UPDATE `xb_salary_order` SET `status` = 3,`pay_at` = NULL WHERE `status` = 4;
UPDATE `xb_salary_pay` SET `pay_status` = 1,`pay_at` = NULL ;

DROP TABLE  IF EXISTS `xb_withdraw_order`;
CREATE TABLE `xb_withdraw_order` (
  `order_id` bigint(26) NOT NULL COMMENT '提现订单流水',
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '提现状态0：已申请，1：提现中，2：提现成功，3：提现失败',
  `payway_id` int(11) NOT NULL COMMENT '',
  `amount` decimal(30,2) DEFAULT NULL COMMENT '提现金额',
  `rest_amount` decimal(30,2) DEFAULT NULL COMMENT '余额',
  `from_personal_amt` decimal(30,2) DEFAULT NULL COMMENT '提现金额-成分-个人资金池',
  `from_company_amt` decimal(30,2) DEFAULT NULL COMMENT '提现金额-成分-企业资金池',
  `success_at` timestamp NULL DEFAULT NULL COMMENT '成功时间',
  `failed_at` timestamp NULL DEFAULT NULL COMMENT '失败时间',
  `reason` varchar(100) DEFAULT '' COMMENT '失败原因',
  `info` varchar(100) DEFAULT '' COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '处理时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='提现订单';


DROP TABLE  IF EXISTS `xb_income_rate_setting`;
CREATE TABLE `xb_income_rate_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `principal` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '计息金额',
  `rate` decimal(11,4) DEFAULT '0.0000' COMMENT '收益率，0-100',
  `operator_id`  varchar(11) NOT NULL COMMENT '操作人ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='七日年化收益设置';

DROP PROCEDURE IF EXISTS 	`set_table_date`;
CREATE PROCEDURE `set_table_date`(
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


DROP PROCEDURE IF EXISTS 	`set_table_date_iv`;
CREATE PROCEDURE `set_table_date_iv`(
	IN in_table_name VARCHAR(30),
	IN in_col_name VARCHAR(30),
	IN in_select_col VARCHAR(30),
  	IN in_select_val VARCHAR(30),
	IN in_days int(11),
	IN in_iv int(11)
)
BEGIN   
	DECLARE forward_seconds INT(11);  
	DECLARE exec_sql VARCHAR(500);   
	DECLARE has_updated_at VARCHAR(50);
	DECLARE updated_at_val VARCHAR(50);
	SET forward_seconds = 86400 * in_days + in_iv;
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

COMMIT;
