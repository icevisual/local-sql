
ALTER TABLE `xb_company` ADD COLUMN `has_tax_return` TINYINT(1) NULL DEFAULT '2' COMMENT '个税返还状态，1返还，2不返还' AFTER `type`;
ALTER TABLE `xb_company` ADD COLUMN `service_fee` DECIMAL(10,2) NULL DEFAULT '0.00' COMMENT '服务费收费标准（元 / 人 / 次）' AFTER `has_tax_return`;
ALTER TABLE `xb_company` ADD COLUMN `tax_invoice_proportion` DECIMAL(5,2) NULL DEFAULT '0.00' COMMENT '开票税金比例 ' AFTER `service_fee`;
ALTER TABLE `xb_company` ADD COLUMN `has_insurance` TINYINT(1) NULL DEFAULT '2' COMMENT '是否有商保，1有，2无'  AFTER `tax_invoice_proportion`;
ALTER TABLE `xb_company` ADD COLUMN `insurance_fee` DECIMAL(10,2) NULL DEFAULT '0.00' COMMENT '商保收费标准（元 ／月）' AFTER `has_insurance`;

ALTER TABLE `xb_company` ADD COLUMN `has_disabled_gold` TINYINT(1) NULL DEFAULT '2' COMMENT '是否代缴残疾金，1是，2否' AFTER `insurance_fee`;
ALTER TABLE `xb_company` ADD COLUMN `disabled_invoice_proportion` DECIMAL(5,2) NULL DEFAULT '0.00' COMMENT '残疾金开票税金比例 ' AFTER `has_disabled_gold`;

ALTER TABLE `xb_company` ADD COLUMN `insurance_invoice_proportion` DECIMAL(5,2) NULL DEFAULT '0.00' COMMENT '商保开票税金比' AFTER `insurance_fee`;
ALTER TABLE `xb_company` ADD COLUMN `tax_return_rate` DECIMAL(5,2) NULL DEFAULT '0.00' COMMENT '个税返还比' AFTER `insurance_invoice_proportion`;


ALTER TABLE `xb_company` ADD COLUMN `fudou_avaliable` int(11) DEFAULT '0' COMMENT '可用福豆数量' AFTER `tax_return_rate`;
ALTER TABLE `xb_company` ADD COLUMN `fudou_can_thaw` int(11) DEFAULT '0' COMMENT '可解冻福豆数量' AFTER `fudou_avaliable`;
ALTER TABLE `xb_company` ADD COLUMN `fudou_frozen` int(11) DEFAULT '0' COMMENT '未解冻福豆数量' AFTER `fudou_can_thaw`;


ALTER TABLE `xb_salary_pay` ADD COLUMN `uid`  int(11) NOT NULL COMMENT '员工编号' AFTER `order_id`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `taxation_point` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '个税起征点' AFTER `tax`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `tax_rate` SMALLINT NOT NULL DEFAULT 0 COMMENT '税率' AFTER `taxation_point`;
ALTER TABLE `xb_salary_pay` ADD COLUMN `quick_deduction` int(11) NOT NULL DEFAULT 0 COMMENT '速算扣除数' AFTER `tax_rate`;

ALTER TABLE `xb_salary_pay` ADD COLUMN `seperate_tag` int(11) NOT NULL DEFAULT 0 COMMENT '超5w分割标记' AFTER `salary`;

ALTER TABLE `xb_salary_order` ADD COLUMN `order_type` TINYINT(1) DEFAULT 1 COMMENT '订单类型1无账户订单，2自主账户订单,参照company.type' AFTER `company_id`;


ALTER TABLE `xb_salary_order` MODIFY   `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计,2已计福豆';

ALTER TABLE `xb_company` ADD COLUMN `disabled_fee` DECIMAL(10,2) NULL DEFAULT '0.00' COMMENT '残疾金收费标准（元 ／月）' AFTER `has_disabled_gold`;

ALTER TABLE `xb_company` MODIFY COLUMN `regtime` date NOT NULL COMMENT '企业成立时间';
ALTER TABLE `xb_company` MODIFY COLUMN `has_tax_return` tinyint(1) DEFAULT '0' COMMENT '个税返还状态，1返还，2不返还';

DROP TABLE IF EXISTS `xb_config`;
CREATE TABLE `xb_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT '键',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `info` varchar(100) DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='配置表';


INSERT INTO `xb_config` (`id`, `key`, `value`, `info`, `created_at`, `updated_at`) VALUES ('1', 'FUDOU_RETURN_RATE', '15', '个税返还比', '2016-05-09 11:34:32', '2016-05-09 11:35:40');
INSERT INTO `xb_config` (`id`, `key`, `value`, `info`, `created_at`, `updated_at`) VALUES ('2', 'FUDOU_RETURN_DAY', '30', '返还时间（日）', '2016-05-09 11:34:32', '2016-05-09 11:35:55');
INSERT INTO `xb_config` (`id`, `key`, `value`, `info`, `created_at`, `updated_at`) VALUES ('3', 'FUDOU_EXCHANGE_RATE', '1', '福豆人民币汇率', '2016-05-09 11:34:32', '2016-05-09 11:36:10');


INSERT INTO `xb_config` (`id`, `key`, `value`, `info`, `created_at`, `updated_at`) VALUES ('4', 'RECEIVE_BANKNAME', '中央银行', '收款方开户行', '2016-05-09 11:34:32', '2016-05-10 19:15:59');
INSERT INTO `xb_config` (`id`, `key`, `value`, `info`, `created_at`, `updated_at`) VALUES ('5', 'RECEIVE_CARD_NO', '66666666666666', '收款方银行卡号', '2016-05-09 11:34:32', '2016-05-10 19:16:02');
INSERT INTO `xb_config` (`id`, `key`, `value`, `info`, `created_at`, `updated_at`) VALUES ('6', 'RECEIVE_CONTACT', '1999999999', '收款方联系方式', '2016-05-09 11:34:32', '2016-05-10 19:16:06');
INSERT INTO `xb_config` (`id`, `key`, `value`, `info`, `created_at`, `updated_at`) VALUES ('7', 'RECEIVE_UNIT', '杭州仁仁科技', '收款方单位名', '2016-05-09 11:34:32', '2016-05-10 19:16:14');




DROP TABLE IF EXISTS `xb_department`;
CREATE TABLE `xb_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL COMMENT '所属公司',
  `department_name` varchar(20) DEFAULT NULL COMMENT '名称',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='企业部门表';

DROP TABLE IF EXISTS `xb_employee_quit`;
CREATE TABLE `xb_employee_quit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `join_at` date NULL DEFAULT NULL COMMENT '入职时间',
  `quit_at` date NULL DEFAULT NULL COMMENT '离职时间',
  `user_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `truename` varchar(30) DEFAULT NULL COMMENT '用户姓名',
  `identity` varchar(20) DEFAULT NULL COMMENT '身份证',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `department_name` varchar(20) DEFAULT NULL COMMENT '名称',
  `card_no` varchar(40) DEFAULT NULL COMMENT '打款账户',
  `bank_name` varchar(40) DEFAULT NULL COMMENT '银行名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='员工离职日志';


DROP TABLE IF EXISTS `xb_employee_change_log`;
CREATE TABLE `xb_employee_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `change_at` timestamp NULL DEFAULT NULL COMMENT '变更时间',
  `property` varchar(60) DEFAULT NULL COMMENT '变更属性',
  `before` varchar(60) DEFAULT NULL COMMENT '变更前',
  `after` varchar(60) DEFAULT NULL COMMENT '变更后',
	`type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '属性变更类别，1编辑,2批量上传',
	`operator` int(11) NOT NULL COMMENT '操作人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='员工信息变更日志';

DROP TABLE IF EXISTS `xb_employee`;
CREATE TABLE `xb_employee` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account` varchar(30) DEFAULT NULL COMMENT '用户登录账户名',
  `password` varchar(30) DEFAULT NULL COMMENT '用户密码',
  `truename` varchar(60) DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(11) DEFAULT '0' COMMENT '电话',
  `identity` varchar(20) DEFAULT NULL COMMENT '身份证',
  `account_status` tinyint(2) unsigned DEFAULT '0' COMMENT '账户状态 1 启用 ，2 停用 ， 3 删除',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `identity` (`identity`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='员工表';


DROP TABLE IF EXISTS `xb_employee_company`;
CREATE TABLE `xb_employee_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `quit_id` int(11) DEFAULT NULL COMMENT '最后一次离职的ID',
  `card_no` varchar(40) DEFAULT '0' COMMENT '打款账户',
  `bank_name` varchar(40) DEFAULT '0' COMMENT '银行名称',
  `user_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `join_at` date NULL DEFAULT NULL COMMENT '入职时间',
  `quit_at` date NULL DEFAULT NULL COMMENT '离职时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '在职状态状态1在职0离职',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='员工企业关系信息表';



DROP TABLE IF EXISTS `xb_tax_return`;
CREATE TABLE `xb_tax_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `order_id` bigint(26) NOT NULL COMMENT '订单号',
  `tax` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '所交税额',
  `tax_return_rate` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '返税比',
  `fudou_rate` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '福豆兑换比',
  `fudou` int(11) NOT NULL DEFAULT '0' COMMENT '获得福豆数量',
  `operator` int(11) DEFAULT NULL COMMENT '解冻操作人',
  `thawable_at` timestamp NULL DEFAULT NULL COMMENT '可解冻时间',
  `thaw_at` timestamp NULL DEFAULT NULL COMMENT '解冻时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1不可解冻，2可解冻，3已解冻',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '返税时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业返税记录'



DROP TABLE IF EXISTS `xb_statement`;
CREATE TABLE `xb_statement`(
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `service_num` int(10) DEFAULT '0' COMMENT '服务人数',
  `service_fee` decimal(10,2) DEFAULT '0.00' COMMENT '服务费收费标准（元 / 人 / 次）',
  `tax_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '开票税金比例 ',
  `has_insurance` tinyint(1) DEFAULT '2' COMMENT '是否有商保，1有，2无',
  `insurance_num` int(10) DEFAULT '0' COMMENT '商保代缴人数',
  `insurance_fee` decimal(10,2) DEFAULT '0.00' COMMENT '商保收费标准（元 ／月）',
  `insurance_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '商保开票税金比',
  `has_disabled_gold` tinyint(1) DEFAULT '2' COMMENT '是否代缴残疾金，1是，2否',
  `disabled_num` int(10) DEFAULT '0' COMMENT '残疾金代缴人数',
  `disabled_fee` decimal(10,2) DEFAULT '0.00' COMMENT '残疾金收费标准（元 ／月）',
  `disabled_invoice_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '残疾金开票税金比例 ',
  `total_fee` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '结算总费用',
  `receive_unit` varchar(100) DEFAULT NULL COMMENT '收款方单位名',
  `receive_card_no` varchar(30) DEFAULT NULL COMMENT '收款方银行卡号',
  `receive_bankname` varchar(50) DEFAULT NULL COMMENT '收款方开户行',
  `receive_contact` varchar(20) DEFAULT NULL COMMENT '收款方联系方式',
  PRIMARY KEY (`order_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算表'



DROP TABLE IF EXISTS `xb_operator`;
CREATE TABLE `xb_operator` (
  `oid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `loginname` varchar(30) DEFAULT NULL COMMENT '管理员账号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `truename` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `roleid` tinyint(1) NOT NULL COMMENT '所属角色',
  `authority` varchar(100) NOT NULL COMMENT '权限',
  `remember_token` varchar(62) DEFAULT NULL,
  `single_token` varchar(62) DEFAULT NULL COMMENT '单人登录令牌',
  `lastlogin` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `prevlogin` timestamp NULL DEFAULT NULL COMMENT '上一次登录时间',
  `initial_pwd_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否为初始密码，1是，2不是',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '使用状态:1使用 2:停用 ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COMMENT='管理员表';


## 如何描述谁扣除的

## + 行为表
##　后台管理员解冻福豆、后台扣除、企业操作员分配福豆
## 这个是账单，描述的是账目的变化
## 1返还福豆解冻，（谁，admin 给company解冻）2 relation = return_tax id
## 2商城消费，（company 消费了 订单id） relation = order_id
## 3后台扣除，（谁，备注，admin 由于 原因 给company扣除）2 
## 4分配给员工（谁，company operator 给 uid 福豆）2 总量 user bill relation = this.id
## 
##　　　谁在什么时候对谁做了什么事情，造成了什么影响
## 1.【后台管理员】对【某个公司的可解冻福豆】解冻。使【某个公司的可用福豆】增加了
	管理员id 企业id 福豆数量
## 2.【企业（企业账户、操作员）】对【某个公司的可用福豆】进行了消费，使【某个公司的可用福豆】减少了
	企业id 操作人id 操作人类别（企业账户、企业操作人） 福豆数量
## 3.【后台管理员】对【某个公司的可用福豆】进行扣除，使【某个公司的可用福豆】减少了
  管理员id 企业id 福豆数量
## 4.【企业（企业账户、操作员）】对【某个公司的可用福豆】进行了分配，使【某个公司的可用福豆】减少了
	企业id 操作人id 操作人类别（企业账户、企业操作人） 福豆数量



管理员id 
企业id 
操作人id 
操作人类别（企业账户、企业操作人） 
福豆数量


## 1.【员工】受【某个公司的可用福豆】的分配，使【个人可用福豆】增加了
## 2.【员工】对【个人可用福豆】进行了消费，使【个人可用福豆】减少了



DROP TABLE IF EXISTS `xb_fudou_bill`;
CREATE TABLE `xb_fudou_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL COMMENT '操作者',
  `operator_type` int(11) NOT NULL COMMENT '操作者类型，1后台管理员，2企业账户，3企业操作员',
  `company_id` int(11) NOT NULL COMMENT '企业账户ID',
  `amount` decimal(30,2) DEFAULT '0.00' COMMENT '金额',
  `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出1：收入，2.支出，3内转',
  `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，1返还福豆解冻，2商城消费，3后台扣除，4分配给员工',
  `event_name` varchar(100) DEFAULT NULL COMMENT '事件名称',
  `after_rest_amt` decimal(30,2) DEFAULT '0.00' COMMENT '之后余额',
  `relation_id` bigint(26) DEFAULT NULL COMMENT '事件关联ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='企业可用福豆变动表';






DROP TABLE IF EXISTS `xb_fudou_user_bill`;
CREATE TABLE `xb_user_fudou_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `amount` int(11) DEFAULT 0 COMMENT '金额',
  `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出1：收入，2.支出，3内转',
  `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，1分配获得福豆，2商城消费',
  `event_name` varchar(100) DEFAULT NULL COMMENT '事件名称',
  `after_rest_amt` decimal(30,2) DEFAULT '0.00' COMMENT '之后余额',
  `relation_id` bigint(26) DEFAULT NULL COMMENT '事件关联ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户福豆变动表';




ALTER TABLE xb_company DROP COLUMN fudou_can_thaw;
ALTER TABLE xb_company DROP COLUMN fudou_frozen;




ALTER TABLE `xb_employee` ADD COLUMN `fudou_avaliable` int DEFAULT 0 COMMENT '可用福豆数量' AFTER identity;


DROP TABLE IF EXISTS `xb_config`;
CREATE TABLE `xb_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '备注',
	`fid` int(10) DEFAULT 0 COMMENT '上级ID',
  `key` varchar(50) DEFAULT NULL COMMENT '键',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='配置表';

CREATE TABLE `xb_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '备注',
  `fid` int(10) DEFAULT '0' COMMENT '上级ID',
  `key` varchar(50) DEFAULT NULL COMMENT '键',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 COMMENT='配置表'



SHOW CREATE TABLE xb_config


INSERT INTO `xb_config` (`id`, `name`, `fid`, `key`, `value`, `created_at`, `updated_at`) VALUES ('1', '个税返还比', '0', 'FUDOU_RETURN_RATE', '15', '2016-05-09 11:34:32', '2016-05-30 19:22:22');
INSERT INTO `xb_config` (`id`, `name`, `fid`, `key`, `value`, `created_at`, `updated_at`) VALUES ('2', '返还时间（日）', '0', 'FUDOU_RETURN_DAY', '22', '2016-05-09 11:34:32', '2016-05-30 19:22:23');
INSERT INTO `xb_config` (`id`, `name`, `fid`, `key`, `value`, `created_at`, `updated_at`) VALUES ('3', '福豆人民币汇率', '0', 'FUDOU_EXCHANGE_RATE', '1', '2016-05-09 11:34:32', '2016-05-30 19:22:23');
INSERT INTO `xb_config` (`id`, `name`, `fid`, `key`, `value`, `created_at`, `updated_at`) VALUES ('4', '收款方开户行', '0', 'RECEIVE_BANKNAME', '中央银行', '2016-05-09 11:34:32', '2016-05-10 19:15:59');
INSERT INTO `xb_config` (`id`, `name`, `fid`, `key`, `value`, `created_at`, `updated_at`) VALUES ('5', '收款方银行卡号', '0', 'RECEIVE_CARD_NO', '66666666666666', '2016-05-09 11:34:32', '2016-05-10 19:16:02');
INSERT INTO `xb_config` (`id`, `name`, `fid`, `key`, `value`, `created_at`, `updated_at`) VALUES ('6', '收款方联系方式', '0', 'RECEIVE_CONTACT', '1999999999', '2016-05-09 11:34:32', '2016-05-10 19:16:06');
INSERT INTO `xb_config` (`id`, `name`, `fid`, `key`, `value`, `created_at`, `updated_at`) VALUES ('7', '收款方单位名', '0', 'RECEIVE_UNIT', '杭州仁仁科技', '2016-05-09 11:34:32', '2016-05-10 19:16:14');






ALTER TABLE xb_config ADD COLUMN 	`fid` int(10) DEFAULT 0 COMMENT '上级ID' AFTER `name`


