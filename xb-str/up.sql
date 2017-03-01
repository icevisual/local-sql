
SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE `xb_company` ADD COLUMN `business_type` TINYINT (2) NULL DEFAULT 1 COMMENT '业务列别，1不含员工福豆，2包含' AFTER `type`;

ALTER TABLE `xb_company` ADD COLUMN `has_tax_return` TINYINT (1) NULL DEFAULT 2 COMMENT '个税返还状态，1返还，2不返还' AFTER `is_limited`;

ALTER TABLE `xb_company` ADD COLUMN `service_fee` DECIMAL (10, 2) NULL DEFAULT 0.00 COMMENT '服务费收费标准（元 / 人 / 次）' AFTER `has_tax_return`;

ALTER TABLE `xb_company` ADD COLUMN `tax_invoice_proportion` DECIMAL (5, 2) NULL DEFAULT 0.00 COMMENT '开票税金比例 ' AFTER `service_fee`;

ALTER TABLE `xb_company` ADD COLUMN `has_insurance` TINYINT (1) NULL DEFAULT 2 COMMENT '是否有商保，1有，2无' AFTER `tax_invoice_proportion`;

ALTER TABLE `xb_company` ADD COLUMN `insurance_fee` DECIMAL (10, 2) NULL DEFAULT 0.00 COMMENT '商保收费标准（元 ／月）' AFTER `has_insurance`;

ALTER TABLE `xb_company` ADD COLUMN `insurance_invoice_proportion` DECIMAL (5, 2) NULL DEFAULT 0.00 COMMENT '商保开票税金比' AFTER `insurance_fee`;

ALTER TABLE `xb_company` ADD COLUMN `tax_return_rate` DECIMAL (5, 2) NULL DEFAULT 0.00 COMMENT '个税返还比' AFTER `insurance_invoice_proportion`;

ALTER TABLE `xb_company` ADD COLUMN `fudou_avaliable` INT (11) NULL DEFAULT 0 COMMENT '可用福豆数量' AFTER `tax_return_rate`;

ALTER TABLE `xb_company` ADD COLUMN `has_disabled_gold` TINYINT (1) NULL DEFAULT 2 COMMENT '是否代缴残疾金，1是，2否' AFTER `fudou_avaliable`;

ALTER TABLE `xb_company` ADD COLUMN `disabled_fee` DECIMAL (10, 2) NULL DEFAULT 0.00 COMMENT '残疾金收费标准（元 ／月）' AFTER `has_disabled_gold`;

ALTER TABLE `xb_company` ADD COLUMN `disabled_invoice_proportion` DECIMAL (5, 2) NULL DEFAULT 0.00 COMMENT '残疾金开票税金比例 ' AFTER `disabled_fee`;

ALTER TABLE `xb_company` MODIFY COLUMN `regtime` date NOT NULL COMMENT '企业成立时间' AFTER `address`;

ALTER TABLE `xb_salary_order` ADD COLUMN `order_type` TINYINT (1) NULL DEFAULT 2 COMMENT '订单类型1无账户订单，2自主账户订单,参照company.type' AFTER `company_id`;

ALTER TABLE `xb_salary_order` MODIFY COLUMN `payed_statistics_status` TINYINT (1) NULL DEFAULT 0 COMMENT '成功发放统计状态0未统计，1已统计,2已计福豆' AFTER `payed_salary_amount`;

ALTER TABLE `xb_salary_order` MODIFY COLUMN `created_at` TIMESTAMP NULL DEFAULT NULL COMMENT '创建时间' AFTER `lastedit_at`;

ALTER TABLE `xb_salary_order` MODIFY COLUMN `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' AFTER `created_at`;

ALTER TABLE `xb_salary_pay` ADD COLUMN `uid` INT (11) NOT NULL COMMENT '员工编号' AFTER `order_id`;

ALTER TABLE `xb_salary_pay` ADD COLUMN `seperate_tag` INT (11) NOT NULL DEFAULT 0 COMMENT '超5w分割标记' AFTER `salary`;

ALTER TABLE `xb_salary_pay` ADD COLUMN `salary_accumulated` DECIMAL (11, 2) NOT NULL DEFAULT 0.00 COMMENT '本月累计预发放、已过审核，打款未失败' AFTER `seperate_tag`;

ALTER TABLE `xb_salary_pay` ADD COLUMN `tax_accumulated` DECIMAL (11, 2) NOT NULL DEFAULT 0.00 COMMENT '本月已计税额，已过审核，打款未失败' AFTER `salary_accumulated`;

ALTER TABLE `xb_salary_pay` ADD COLUMN `tax_expected` DECIMAL (11, 2) NOT NULL DEFAULT 0.00 COMMENT '实际需要总税额，月收入合并计税' AFTER `tax_accumulated`;

ALTER TABLE `xb_salary_pay` ADD COLUMN `taxation_point` DECIMAL (11, 2) NOT NULL DEFAULT 0.00 COMMENT '个税起征点' AFTER `tax`;

ALTER TABLE `xb_salary_pay` ADD COLUMN `tax_rate` DECIMAL (5, 2) NOT NULL DEFAULT 0.00 COMMENT '税率' AFTER `taxation_point`;

ALTER TABLE `xb_salary_pay` ADD COLUMN `quick_deduction` INT (11) NOT NULL DEFAULT 0 COMMENT '速算扣除数' AFTER `tax_rate`;

CREATE TABLE `xb_config` (
	`id` INT (10) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR (100) NULL DEFAULT NULL COMMENT '备注',
	`fid` INT (10) NULL DEFAULT 0 COMMENT '上级ID',
	`key` VARCHAR (50) NULL DEFAULT NULL COMMENT '键',
	`value` VARCHAR (255) NULL DEFAULT NULL COMMENT '值',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `xb_department` (
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`company_id` INT (11) UNSIGNED NOT NULL COMMENT '所属公司',
	`department_name` VARCHAR (20) NULL DEFAULT NULL COMMENT '名称',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `xb_employee` (
	`uid` INT (11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
	`account` VARCHAR (30) NULL DEFAULT NULL COMMENT '用户登录账户名',
	`password` VARCHAR (30) NULL DEFAULT NULL COMMENT '用户密码',
	`truename` VARCHAR (60) NULL DEFAULT NULL COMMENT '用户姓名',
	`phone` VARCHAR (11) NULL DEFAULT '0' COMMENT '电话',
	`identity` VARCHAR (20) NULL DEFAULT NULL COMMENT '身份证',
	`fudou_avaliable` INT (11) NULL DEFAULT 0 COMMENT '可用福豆数量',
	`account_status` TINYINT (2) UNSIGNED NULL DEFAULT 0 COMMENT '账户状态 1 启用 ，2 停用 ， 3 删除',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`uid`),
	UNIQUE INDEX `phone` (`phone`) USING BTREE,
	UNIQUE INDEX `identity` (`identity`) USING BTREE
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `xb_employee_change_log` (
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`uid` INT (11) NOT NULL COMMENT '用户ID',
	`change_at` TIMESTAMP NULL DEFAULT NULL COMMENT '变更时间',
	`property` VARCHAR (60) NULL DEFAULT NULL COMMENT '变更属性',
	`before` VARCHAR (60) NULL DEFAULT NULL COMMENT '变更前',
	`after` VARCHAR (60) NULL DEFAULT NULL COMMENT '变更后',
	`type` TINYINT (4) NOT NULL DEFAULT 1 COMMENT '属性变更类别，1编辑,2批量上传',
	`operator` INT (11) NOT NULL COMMENT '操作人ID',
	PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `xb_employee_company` (
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`uid` INT (11) UNSIGNED NOT NULL COMMENT '用户ID',
	`company_id` INT (11) NULL DEFAULT NULL COMMENT '所属公司',
	`department_id` INT (11) NULL DEFAULT NULL COMMENT '部门ID',
	`quit_id` INT (11) NULL DEFAULT NULL COMMENT '最后一次离职的ID',
	`card_no` VARCHAR (40) NULL DEFAULT '0' COMMENT '打款账户',
	`bank_name` VARCHAR (40) NULL DEFAULT '0' COMMENT '银行名称',
	`user_no` VARCHAR (20) NULL DEFAULT NULL COMMENT '员工编号',
	`join_at` date NULL DEFAULT NULL COMMENT '入职时间',
	`quit_at` date NULL DEFAULT NULL COMMENT '离职时间',
	`status` TINYINT (4) NULL DEFAULT 1 COMMENT '在职状态状态1在职0离职',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `xb_employee_quit` (
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`uid` INT (11) UNSIGNED NOT NULL COMMENT '用户ID',
	`company_id` INT (11) NULL DEFAULT NULL COMMENT '所属公司',
	`department_id` INT (11) NULL DEFAULT NULL COMMENT '部门ID',
	`join_at` date NULL DEFAULT NULL COMMENT '入职时间',
	`quit_at` date NULL DEFAULT NULL COMMENT '离职时间',
	`user_no` VARCHAR (20) NULL DEFAULT NULL COMMENT '员工编号',
	`truename` VARCHAR (30) NULL DEFAULT NULL COMMENT '用户姓名',
	`identity` VARCHAR (20) NULL DEFAULT NULL COMMENT '身份证',
	`phone` VARCHAR (11) NULL DEFAULT NULL COMMENT '电话',
	`department_name` VARCHAR (20) NULL DEFAULT NULL COMMENT '名称',
	`card_no` VARCHAR (40) NULL DEFAULT NULL COMMENT '打款账户',
	`bank_name` VARCHAR (40) NULL DEFAULT NULL COMMENT '银行名称',
	PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `xb_fudou_bill` (
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`operator_id` INT (11) NOT NULL COMMENT '操作者',
	`operator_type` INT (11) NOT NULL COMMENT '操作者类型，1后台管理员，2企业账户，3企业操作员',
	`company_id` INT (11) NOT NULL COMMENT '企业账户ID',
	`amount` INT (11) NULL DEFAULT 0 COMMENT '数量',
	`inout` TINYINT (2) NOT NULL DEFAULT 0 COMMENT '收入支出1：收入，2.支出，3内转',
	`event_type` SMALLINT (5) NULL DEFAULT 0 COMMENT '事件类别，1返还福豆解冻，2商城消费，3后台扣除，4分配给员工',
	`event_name` VARCHAR (100) NULL DEFAULT NULL COMMENT '事件名称',
	`after_rest_amt` DECIMAL (30, 2) NULL DEFAULT 0.00 COMMENT '之后余额',
	`relation_id` BIGINT (26) NULL DEFAULT NULL COMMENT '事件关联ID',
	`created_at` TIMESTAMP NULL DEFAULT NULL COMMENT '时间',
	`comments` VARCHAR (200) NULL DEFAULT NULL COMMENT '备注信息',
	PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `xb_fudou_user_bill` (
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`uid` INT (11) NOT NULL COMMENT '账户ID',
	`amount` INT (11) NULL DEFAULT 0 COMMENT '数量',
	`inout` TINYINT (2) NOT NULL DEFAULT 0 COMMENT '收入支出1：收入，2.支出，3内转',
	`event_type` SMALLINT (5) NULL DEFAULT 0 COMMENT '事件类别，1分配获得福豆，2商城消费',
	`event_name` VARCHAR (100) NULL DEFAULT NULL COMMENT '事件名称',
	`after_rest_amt` DECIMAL (30, 2) NULL DEFAULT 0.00 COMMENT '之后余额',
	`relation_id` BIGINT (26) NULL DEFAULT NULL COMMENT '事件关联ID',
	`created_at` TIMESTAMP NULL DEFAULT NULL COMMENT '时间',
	PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `xb_operator` (
	`oid` MEDIUMINT (8) NOT NULL AUTO_INCREMENT,
	`company_id` INT (11) NULL DEFAULT NULL COMMENT '所属公司',
	`loginname` VARCHAR (30) NULL DEFAULT NULL COMMENT '管理员账号',
	`password` VARCHAR (100) NULL DEFAULT NULL COMMENT '密码',
	`truename` VARCHAR (30) NULL DEFAULT NULL COMMENT '真实姓名',
	`email` VARCHAR (100) NOT NULL COMMENT '邮箱',
	`roleid` TINYINT (1) NOT NULL COMMENT '所属角色',
	`authority` VARCHAR (100) NOT NULL COMMENT '权限',
	`remember_token` VARCHAR (62) NULL DEFAULT NULL,
	`single_token` VARCHAR (62) NULL DEFAULT NULL COMMENT '单人登录令牌',
	`lastlogin` TIMESTAMP NULL DEFAULT NULL COMMENT '最后登录时间',
	`prevlogin` TIMESTAMP NULL DEFAULT NULL COMMENT '上一次登录时间',
	`initial_pwd_flag` TINYINT (1) NOT NULL DEFAULT 1 COMMENT '是否为初始密码，1是，2不是',
	`status` TINYINT (1) NOT NULL DEFAULT 1 COMMENT '使用状态:1使用 2:停用 ',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`oid`)
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `xb_order_monitoring` (
	`id` INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`order_id` BIGINT (26) NOT NULL COMMENT '订单流水号',
	`type` SMALLINT (5) NULL DEFAULT 0 COMMENT '类别，1上传时间，2打款时间',
	`count` INT (11) NULL DEFAULT 0 COMMENT '数量',
	`time_usage` INT (11) NULL DEFAULT 0 COMMENT '用时，单位秒',
	`context` text NULL COMMENT '上下文',
	`created_at` TIMESTAMP NULL DEFAULT NULL COMMENT '创建时间',
	PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `xb_rate_adjustment` (
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`operator_id` INT (11) NOT NULL COMMENT '操作者',
	`company_id` INT (11) NOT NULL COMMENT '企业账户ID',
	`before` DECIMAL (30, 2) NULL DEFAULT 0.00 COMMENT '改动前',
	`after` DECIMAL (30, 2) NULL DEFAULT 0.00 COMMENT '改动后',
	`effected_at` TIMESTAMP NULL DEFAULT NULL COMMENT '生效时间',
	`status` TINYINT (4) NOT NULL DEFAULT 1 COMMENT '1:未生效，2已生效，3已取消',
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `xb_statement` (
	`order_id` BIGINT (26) NOT NULL COMMENT '订单流水号',
	`service_num` INT (10) NULL DEFAULT 0 COMMENT '服务人数',
	`service_fee` DECIMAL (10, 2) NULL DEFAULT 0.00 COMMENT '服务费收费标准（元 / 人 / 次）',
	`tax_invoice_proportion` DECIMAL (5, 2) NULL DEFAULT 0.00 COMMENT '开票税金比例 ',
	`has_insurance` TINYINT (1) NULL DEFAULT 2 COMMENT '是否有商保，1有，2无',
	`insurance_num` INT (10) NULL DEFAULT 0 COMMENT '商保代缴人数',
	`insurance_fee` DECIMAL (10, 2) NULL DEFAULT 0.00 COMMENT '商保收费标准（元 ／月）',
	`insurance_invoice_proportion` DECIMAL (5, 2) NULL DEFAULT 0.00 COMMENT '商保开票税金比',
	`has_disabled_gold` TINYINT (1) NULL DEFAULT 2 COMMENT '是否代缴残疾金，1是，2否',
	`disabled_num` INT (10) NULL DEFAULT 0 COMMENT '残疾金代缴人数',
	`disabled_fee` DECIMAL (10, 2) NULL DEFAULT 0.00 COMMENT '残疾金收费标准（元 ／月）',
	`disabled_invoice_proportion` DECIMAL (5, 2) NULL DEFAULT 0.00 COMMENT '残疾金开票税金比例 ',
	`total_fee` DECIMAL (11, 2) NOT NULL DEFAULT 0.00 COMMENT '结算总费用',
	`receive_unit` VARCHAR (100) NULL DEFAULT NULL COMMENT '收款方单位名',
	`receive_card_no` VARCHAR (30) NULL DEFAULT NULL COMMENT '收款方银行卡号',
	`receive_bankname` VARCHAR (50) NULL DEFAULT NULL COMMENT '收款方开户行',
	`receive_contact` VARCHAR (20) NULL DEFAULT NULL COMMENT '收款方联系方式',
	PRIMARY KEY (`order_id`)
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `xb_tax_return` (
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`company_id` INT (11) NULL DEFAULT NULL COMMENT '所属公司',
	`order_id` BIGINT (26) NOT NULL COMMENT '订单号',
	`tax` DECIMAL (11, 2) NOT NULL DEFAULT 0.00 COMMENT '所交税额',
	`tax_return_rate` DECIMAL (11, 2) NOT NULL DEFAULT 0.00 COMMENT '返税比',
	`fudou_rate` DECIMAL (11, 2) NOT NULL DEFAULT 0.00 COMMENT '福豆兑换比',
	`fudou` INT (11) NOT NULL DEFAULT 0 COMMENT '获得福豆数量',
	`operator` INT (11) NULL DEFAULT NULL COMMENT '解冻操作人',
	`thawable_at` date NULL DEFAULT NULL COMMENT '可解冻时间',
	`thaw_at` TIMESTAMP NULL DEFAULT NULL COMMENT '解冻时间',
	`status` TINYINT (4) NOT NULL DEFAULT 1 COMMENT '1不可解冻，2可解冻，3已解冻',
	`created_at` TIMESTAMP NULL DEFAULT NULL COMMENT '返税时间',
	PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


SET FOREIGN_KEY_CHECKS = 1;