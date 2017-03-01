SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE `xb_company` ADD COLUMN `business_type`  tinyint(2) NULL DEFAULT 1 COMMENT '业务列别，1不含员工福豆，2包含' AFTER `type`;
ALTER TABLE `xb_company` ADD COLUMN `has_tax_return`  tinyint(1) NULL DEFAULT 2 COMMENT '个税返还状态，1返还，2不返还' AFTER `is_limited`;
ALTER TABLE `xb_company` ADD COLUMN `service_fee`  decimal(10,2) NULL DEFAULT 0.00 COMMENT '服务费收费标准（元 / 人 / 次）' AFTER `has_tax_return`;
ALTER TABLE `xb_company` ADD COLUMN `tax_invoice_proportion`  decimal(5,2) NULL DEFAULT 0.00 COMMENT '开票税金比例 ' AFTER `service_fee`;
ALTER TABLE `xb_company` ADD COLUMN `has_insurance`  tinyint(1) NULL DEFAULT 2 COMMENT '是否有商保，1有，2无' AFTER `tax_invoice_proportion`;
ALTER TABLE `xb_company` ADD COLUMN `insurance_fee`  decimal(10,2) NULL DEFAULT 0.00 COMMENT '商保收费标准（元 ／月）' AFTER `has_insurance`;
ALTER TABLE `xb_company` ADD COLUMN `insurance_invoice_proportion`  decimal(5,2) NULL DEFAULT 0.00 COMMENT '商保开票税金比' AFTER `insurance_fee`;
ALTER TABLE `xb_company` ADD COLUMN `tax_return_rate`  decimal(5,2) NULL DEFAULT 0.00 COMMENT '个税返还比' AFTER `insurance_invoice_proportion`;
ALTER TABLE `xb_company` ADD COLUMN `fudou_avaliable`  int(11) NULL DEFAULT 0 COMMENT '可用福豆数量' AFTER `tax_return_rate`;
ALTER TABLE `xb_company` ADD COLUMN `has_disabled_gold`  tinyint(1) NULL DEFAULT 2 COMMENT '是否代缴残疾金，1是，2否' AFTER `fudou_avaliable`;
ALTER TABLE `xb_company` ADD COLUMN `disabled_fee`  decimal(10,2) NULL DEFAULT 0.00 COMMENT '残疾金收费标准（元 ／月）' AFTER `has_disabled_gold`;
ALTER TABLE `xb_company` ADD COLUMN `disabled_invoice_proportion`  decimal(5,2) NULL DEFAULT 0.00 COMMENT '残疾金开票税金比例 ' AFTER `disabled_fee`;
ALTER TABLE `xb_company` MODIFY COLUMN `regtime`  date NOT NULL COMMENT '企业成立时间' AFTER `address`;
CREATE TABLE `xb_config` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
`fid`  int(10) NULL DEFAULT 0 COMMENT '上级ID' ,
`key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '键' ,
`value`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值' ,
`created_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `xb_department` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`company_id`  int(11) UNSIGNED NOT NULL COMMENT '所属公司' ,
`department_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称' ,
`created_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `xb_employee` (
`uid`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID' ,
`account`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登录账户名' ,
`password`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码' ,
`truename`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名' ,
`phone`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '电话' ,
`identity`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证' ,
`fudou_avaliable`  int(11) NULL DEFAULT 0 COMMENT '可用福豆数量' ,
`account_status`  tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '账户状态 1 启用 ，2 停用 ， 3 删除' ,
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`uid`),
UNIQUE INDEX `phone` (`phone`) USING BTREE ,
UNIQUE INDEX `identity` (`identity`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `xb_employee_change_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`uid`  int(11) NOT NULL COMMENT '用户ID' ,
`change_at`  timestamp NULL DEFAULT NULL COMMENT '变更时间' ,
`property`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更属性' ,
`before`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更前' ,
`after`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更后' ,
`type`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '属性变更类别，1编辑,2批量上传' ,
`operator`  int(11) NOT NULL COMMENT '操作人ID' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `xb_employee_company` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`uid`  int(11) UNSIGNED NOT NULL COMMENT '用户ID' ,
`company_id`  int(11) NULL DEFAULT NULL COMMENT '所属公司' ,
`department_id`  int(11) NULL DEFAULT NULL COMMENT '部门ID' ,
`quit_id`  int(11) NULL DEFAULT NULL COMMENT '最后一次离职的ID' ,
`card_no`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '打款账户' ,
`bank_name`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '银行名称' ,
`user_no`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工编号' ,
`join_at`  date NULL DEFAULT NULL COMMENT '入职时间' ,
`quit_at`  date NULL DEFAULT NULL COMMENT '离职时间' ,
`status`  tinyint(4) NULL DEFAULT 1 COMMENT '在职状态状态1在职0离职' ,
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `xb_employee_quit` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`uid`  int(11) UNSIGNED NOT NULL COMMENT '用户ID' ,
`company_id`  int(11) NULL DEFAULT NULL COMMENT '所属公司' ,
`department_id`  int(11) NULL DEFAULT NULL COMMENT '部门ID' ,
`join_at`  date NULL DEFAULT NULL COMMENT '入职时间' ,
`quit_at`  date NULL DEFAULT NULL COMMENT '离职时间' ,
`user_no`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工编号' ,
`truename`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名' ,
`identity`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证' ,
`phone`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话' ,
`department_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称' ,
`card_no`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打款账户' ,
`bank_name`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行名称' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `xb_fudou_bill` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`operator_id`  int(11) NOT NULL COMMENT '操作者' ,
`operator_type`  int(11) NOT NULL COMMENT '操作者类型，1后台管理员，2企业账户，3企业操作员' ,
`company_id`  int(11) NOT NULL COMMENT '企业账户ID' ,
`amount`  int(11) NULL DEFAULT 0 COMMENT '数量' ,
`inout`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '收入支出1：收入，2.支出，3内转' ,
`event_type`  smallint(5) NULL DEFAULT 0 COMMENT '事件类别，1返还福豆解冻，2商城消费，3后台扣除，4分配给员工' ,
`event_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件名称' ,
`after_rest_amt`  decimal(30,2) NULL DEFAULT 0.00 COMMENT '之后余额' ,
`relation_id`  bigint(26) NULL DEFAULT NULL COMMENT '事件关联ID' ,
`created_at`  timestamp NULL DEFAULT NULL COMMENT '时间' ,
`comments`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `xb_fudou_user_bill` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`uid`  int(11) NOT NULL COMMENT '账户ID' ,
`amount`  int(11) NULL DEFAULT 0 COMMENT '数量' ,
`inout`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '收入支出1：收入，2.支出，3内转' ,
`event_type`  smallint(5) NULL DEFAULT 0 COMMENT '事件类别，1分配获得福豆，2商城消费' ,
`event_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件名称' ,
`after_rest_amt`  decimal(30,2) NULL DEFAULT 0.00 COMMENT '之后余额' ,
`relation_id`  bigint(26) NULL DEFAULT NULL COMMENT '事件关联ID' ,
`created_at`  timestamp NULL DEFAULT NULL COMMENT '时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `xb_operator` (
`oid`  mediumint(8) NOT NULL AUTO_INCREMENT ,
`company_id`  int(11) NULL DEFAULT NULL COMMENT '所属公司' ,
`loginname`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员账号' ,
`password`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码' ,
`truename`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱' ,
`roleid`  tinyint(1) NOT NULL COMMENT '所属角色' ,
`authority`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限' ,
`remember_token`  varchar(62) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`single_token`  varchar(62) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单人登录令牌' ,
`lastlogin`  timestamp NULL DEFAULT NULL COMMENT '最后登录时间' ,
`prevlogin`  timestamp NULL DEFAULT NULL COMMENT '上一次登录时间' ,
`initial_pwd_flag`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否为初始密码，1是，2不是' ,
`status`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '使用状态:1使用 2:停用 ' ,
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`oid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `xb_order_monitoring` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`order_id`  bigint(26) NOT NULL COMMENT '订单流水号' ,
`type`  smallint(5) NULL DEFAULT 0 COMMENT '类别，1上传时间，2打款时间' ,
`count`  int(11) NULL DEFAULT 0 COMMENT '数量' ,
`time_usage`  int(11) NULL DEFAULT 0 COMMENT '用时，单位秒' ,
`context`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '上下文' ,
`created_at`  timestamp NULL DEFAULT NULL COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `xb_rate_adjustment` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`operator_id`  int(11) NOT NULL COMMENT '操作者' ,
`company_id`  int(11) NOT NULL COMMENT '企业账户ID' ,
`before`  decimal(30,2) NULL DEFAULT 0.00 COMMENT '改动前' ,
`after`  decimal(30,2) NULL DEFAULT 0.00 COMMENT '改动后' ,
`effected_at`  timestamp NULL DEFAULT NULL COMMENT '生效时间' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:未生效，2已生效，3已取消' ,
`updated_at`  timestamp NULL DEFAULT NULL ,
`created_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `xb_salary_order` ADD COLUMN `order_type`  tinyint(1) NULL DEFAULT 2 COMMENT '订单类型1无账户订单，2自主账户订单,参照company.type' AFTER `company_id`;
ALTER TABLE `xb_salary_order` MODIFY COLUMN `payed_statistics_status`  tinyint(1) NULL DEFAULT 0 COMMENT '成功发放统计状态0未统计，1已统计,2已计福豆' AFTER `payed_salary_amount`;
ALTER TABLE `xb_salary_order` MODIFY COLUMN `created_at`  timestamp NULL DEFAULT NULL COMMENT '创建时间' AFTER `lastedit_at`;
ALTER TABLE `xb_salary_order` MODIFY COLUMN `updated_at`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' AFTER `created_at`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `uid`  int(11) NOT NULL COMMENT '员工编号' AFTER `order_id`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `seperate_tag`  int(11) NOT NULL DEFAULT 0 COMMENT '超5w分割标记' AFTER `salary`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `salary_accumulated`  decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '本月累计预发放、已过审核，打款未失败' AFTER `seperate_tag`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `tax_accumulated`  decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '本月已计税额，已过审核，打款未失败' AFTER `salary_accumulated`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `tax_expected`  decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '实际需要总税额，月收入合并计税' AFTER `tax_accumulated`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `taxation_point`  decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '个税起征点' AFTER `tax`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `tax_rate`  decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT '税率' AFTER `taxation_point`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `quick_deduction`  int(11) NOT NULL DEFAULT 0 COMMENT '速算扣除数' AFTER `tax_rate`;
CREATE TABLE `xb_statement` (
`order_id`  bigint(26) NOT NULL COMMENT '订单流水号' ,
`service_num`  int(10) NULL DEFAULT 0 COMMENT '服务人数' ,
`service_fee`  decimal(10,2) NULL DEFAULT 0.00 COMMENT '服务费收费标准（元 / 人 / 次）' ,
`tax_invoice_proportion`  decimal(5,2) NULL DEFAULT 0.00 COMMENT '开票税金比例 ' ,
`has_insurance`  tinyint(1) NULL DEFAULT 2 COMMENT '是否有商保，1有，2无' ,
`insurance_num`  int(10) NULL DEFAULT 0 COMMENT '商保代缴人数' ,
`insurance_fee`  decimal(10,2) NULL DEFAULT 0.00 COMMENT '商保收费标准（元 ／月）' ,
`insurance_invoice_proportion`  decimal(5,2) NULL DEFAULT 0.00 COMMENT '商保开票税金比' ,
`has_disabled_gold`  tinyint(1) NULL DEFAULT 2 COMMENT '是否代缴残疾金，1是，2否' ,
`disabled_num`  int(10) NULL DEFAULT 0 COMMENT '残疾金代缴人数' ,
`disabled_fee`  decimal(10,2) NULL DEFAULT 0.00 COMMENT '残疾金收费标准（元 ／月）' ,
`disabled_invoice_proportion`  decimal(5,2) NULL DEFAULT 0.00 COMMENT '残疾金开票税金比例 ' ,
`total_fee`  decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '结算总费用' ,
`receive_unit`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款方单位名' ,
`receive_card_no`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款方银行卡号' ,
`receive_bankname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款方开户行' ,
`receive_contact`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款方联系方式' ,
PRIMARY KEY (`order_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `xb_tax_return` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`company_id`  int(11) NULL DEFAULT NULL COMMENT '所属公司' ,
`order_id`  bigint(26) NOT NULL COMMENT '订单号' ,
`tax`  decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '所交税额' ,
`tax_return_rate`  decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '返税比' ,
`fudou_rate`  decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '福豆兑换比' ,
`fudou`  int(11) NOT NULL DEFAULT 0 COMMENT '获得福豆数量' ,
`operator`  int(11) NULL DEFAULT NULL COMMENT '解冻操作人' ,
`thawable_at`  date NULL DEFAULT NULL COMMENT '可解冻时间' ,
`thaw_at`  timestamp NULL DEFAULT NULL COMMENT '解冻时间' ,
`status`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '1不可解冻，2可解冻，3已解冻' ,
`created_at`  timestamp NULL DEFAULT NULL COMMENT '返税时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;
ALTER 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`127.0.0.1` 
SQL SECURITY DEFINER 
VIEW `xb_view_order_pay_amount` AS 
select `xb_salary_pay`.`order_id` AS `order_id`,count(`xb_salary_pay`.`id`) AS `should_pay_num`,sum(`xb_salary_pay`.`salary`) AS `should_pay_salary`,sum(`xb_salary_pay`.`tax`) AS `should_pay_tax` from (`xb_salary_order` join `xb_salary_pay` on(((`xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`) and (`xb_salary_order`.`should_pay_salary` = 0) and (`xb_salary_order`.`should_pay_tax` = 0) and (`xb_salary_order`.`should_pay_num` = 0)))) group by `xb_salary_pay`.`order_id` ;
ALTER 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`127.0.0.1` 
SQL SECURITY DEFINER 
VIEW `xb_view_order_payed_amount` AS 
select `xb_salary_pay`.`order_id` AS `order_id`,count(`xb_salary_pay`.`id`) AS `payed_success_count`,sum(`xb_salary_pay`.`salary`) AS `payed_salary`,sum(`xb_salary_pay`.`tax`) AS `payed_tax` from (`xb_salary_order` join `xb_salary_pay` on(((`xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`) and (`xb_salary_order`.`status` = 4) and (`xb_salary_order`.`pay_status` = 4) and (`xb_salary_order`.`payed_statistics_status` = 0) and (`xb_salary_pay`.`result_status` = 0) and (`xb_salary_pay`.`process_status` = 0)))) group by `xb_salary_pay`.`order_id` ;
DROP PROCEDURE IF EXISTS `cal_time_usage`;
CREATE DEFINER = `root`@`127.0.0.1` PROCEDURE `cal_time_usage`(_in_order_id VARCHAR(50))
BEGIN
    DECLARE min_pay_at VARCHAR(50);
    DECLARE max_pay_at VARCHAR(50);
    DECLARE min_pay_id int(11);
    DECLARE max_pay_id int(11);
    DECLARE min_query_id int(11);
    DECLARE max_query_id int(11);

    DECLARE min_pay_log_at VARCHAR(50);
    DECLARE max_pay_log_at VARCHAR(50);

    DECLARE min_query_log_at VARCHAR(50);
    DECLARE max_query_log_at VARCHAR(50);

    DECLARE pay_usage int(11);
    DECLARE query_usage int(11);

    DECLARE time_usage int(11);
    
    DECLARE pay_req_usage int(11);
  DECLARE query_req_usage int(11);

  DECLARE PayItemsAmount int(11);
    
    SELECT
        min(pay_at),
        max(pay_at),
        min(pay_log_id),
        max(pay_log_id),
        min(query_log_id),
        max(query_log_id)
    INTO
        min_pay_at,
        max_pay_at,
        min_pay_id,
        max_pay_id,
        min_query_id,
        max_query_id
    FROM
        xb_salary_pay
    WHERE
        order_id = _in_order_id;

    SELECT
        count(DISTINCT pay_log_id),
        count(DISTINCT query_log_id) ,
        count(DISTINCT id) 
    INTO
        pay_req_usage,
        query_req_usage,
        PayItemsAmount
    FROM
        xb_salary_pay
    WHERE
        order_id = _in_order_id;
    SELECT created_at INTO min_pay_log_at FROM xb_fbsdk_log WHERE id = min_pay_id;
    SELECT created_at INTO max_pay_log_at FROM xb_fbsdk_log WHERE id = max_pay_id;
    SELECT created_at INTO min_query_log_at FROM xb_fbsdk_log WHERE id = min_query_id;
    SELECT created_at INTO max_query_log_at FROM xb_fbsdk_log WHERE id = max_query_id;
    SET pay_usage = TO_SECONDS(max_pay_log_at) - TO_SECONDS(min_pay_log_at);
    SET query_usage = TO_SECONDS(max_query_log_at) - TO_SECONDS(min_query_log_at);
    SET time_usage = TO_SECONDS(max_query_log_at) - TO_SECONDS(min_pay_log_at);
    SELECT 
        _in_order_id AS OrderId,
        PayItemsAmount,
        ROUND(time_usage /60, 2 )  AS AllTimeUsage , 
        ROUND(pay_usage /60, 2 )  AS PayTimeUsage , 
        ROUND(query_usage /60, 2 ) AS QueryTimeUsage,
        pay_req_usage  PayReqNum,
        query_req_usage QueryReqNum,
        ROUND(pay_usage / pay_req_usage, 2 )  AS payTimePerReqInSec,
        ROUND(query_usage / query_req_usage, 2 ) AS QueryTimePerReqInSec,
        min_pay_log_at;
END;
SET FOREIGN_KEY_CHECKS=1;