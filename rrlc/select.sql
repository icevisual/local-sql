







GRANT ALL PRIVILEGES ON rrlc.* TO 'rrlc'@'%' IDENTIFIED BY 'HnEwSiGNkib6Msjl';

FLUSH PRIVILEGES








/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : rrlc

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-01-07 09:18:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for think_admin
-- ----------------------------
DROP TABLE IF EXISTS `think_admin`;
CREATE TABLE `think_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '权限类型',
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `last_ip` varchar(20) DEFAULT NULL,
  `last_date` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for think_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group`;
CREATE TABLE `think_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Table structure for think_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group_access`;
CREATE TABLE `think_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Table structure for think_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_rule`;
CREATE TABLE `think_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Table structure for think_category
-- ----------------------------
DROP TABLE IF EXISTS `think_category`;
CREATE TABLE `think_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父栏目id',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '栏目类型：0 普通类型；1 外部链接',
  `catname` varchar(32) NOT NULL COMMENT '用于显示的栏目标题',
  `table` varchar(16) NOT NULL COMMENT 'content存储的数据表名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目的url，特别是当type为外部链接的时候有用',
  `check_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '审核类型：0，不审核；n，审核类型n',
  `list_tpl` varchar(16) NOT NULL DEFAULT '' COMMENT '列表页使用模板',
  `show_tpl` varchar(16) NOT NULL DEFAULT '' COMMENT '正文页使用模板',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '正常为0，其他数字用来控制不显示',
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `listorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='栏目信息';

-- ----------------------------
-- Table structure for think_collection_bill
-- ----------------------------
DROP TABLE IF EXISTS `think_collection_bill`;
CREATE TABLE `think_collection_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '投资人ID',
  `borrow_uid` int(11) NOT NULL COMMENT '借款人ID',
  `tender_id` int(11) NOT NULL COMMENT '标的ID',
  `period_number` int(11) NOT NULL COMMENT '期数，第几期',
  `expect_repayment` bigint(20) NOT NULL COMMENT '应收金额',
  `expect_principal` bigint(20) NOT NULL COMMENT '应还本金',
  `expect_interest` bigint(20) NOT NULL COMMENT '应还利息',
  `real_repayment` bigint(20) NOT NULL COMMENT '实际还款金额',
  `real_principal` bigint(20) NOT NULL COMMENT '实际还款本金',
  `real_interest` bigint(20) NOT NULL COMMENT '实际还款利息',
  `overdue_day` int(11) NOT NULL COMMENT '逾期天数',
  `overdue_interest` bigint(20) NOT NULL COMMENT '逾期还款罚息',
  `ahead_interest` bigint(20) NOT NULL COMMENT '提前还款罚息',
  `expect_repayment_time` bigint(20) NOT NULL COMMENT '应该还款时间',
  `real_repayment_time` int(11) NOT NULL COMMENT '实际还款时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `status` int(11) NOT NULL COMMENT '状态：0(未还款)/1(还款处理中)/2(正常还款)/3(逾期还款)/4(提前还款)',
  `comment` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8 COMMENT='收款明细';

-- ----------------------------
-- Table structure for think_config
-- ----------------------------
DROP TABLE IF EXISTS `think_config`;
CREATE TABLE `think_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 NOT NULL,
  `value` varchar(45) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for think_day_count
-- ----------------------------
DROP TABLE IF EXISTS `think_day_count`;
CREATE TABLE `think_day_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for think_day_count_field
-- ----------------------------
DROP TABLE IF EXISTS `think_day_count_field`;
CREATE TABLE `think_day_count_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_count_id` int(11) NOT NULL,
  `name` char(20) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for think_day_count_template
-- ----------------------------
DROP TABLE IF EXISTS `think_day_count_template`;
CREATE TABLE `think_day_count_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql_str` text NOT NULL,
  `name` char(25) NOT NULL,
  `field_list` varchar(255) NOT NULL,
  `comment` char(25) NOT NULL,
  `start_date` date NOT NULL COMMENT '统计开始日期',
  `end_date` date NOT NULL COMMENT '统计结束日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for think_deposit
-- ----------------------------
DROP TABLE IF EXISTS `think_deposit`;
CREATE TABLE `think_deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '		',
  `uid` int(11) NOT NULL,
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '余额',
  `freeze` int(11) NOT NULL DEFAULT '0' COMMENT '冻结金额',
  `available` int(11) NOT NULL DEFAULT '0' COMMENT '可用金额',
  `withdraw` int(11) NOT NULL COMMENT '正在提现的金额',
  `lend` int(11) NOT NULL DEFAULT '0' COMMENT '理财（出借）金额',
  `borrow` int(11) NOT NULL DEFAULT '0' COMMENT '借款（负载）金额',
  `borrow_limit` int(11) NOT NULL COMMENT '借款额度',
  `used_borrow_limit` int(11) NOT NULL COMMENT '已使用的借款额度',
  `history_recharge` int(11) NOT NULL DEFAULT '0' COMMENT '历史（总）充值金额',
  `history_withdraw` int(11) NOT NULL DEFAULT '0' COMMENT '历史（总）提现金额',
  `history_lend` int(11) NOT NULL DEFAULT '0' COMMENT '历史（总）理财（出借）金额',
  `history_borrow` int(11) NOT NULL DEFAULT '0' COMMENT '历史（总）借款（负载）金额',
  `create_date` int(10) unsigned DEFAULT NULL,
  `update_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='账户表';

-- ----------------------------
-- Table structure for think_deposit_bill
-- ----------------------------
DROP TABLE IF EXISTS `think_deposit_bill`;
CREATE TABLE `think_deposit_bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `tender_id` int(11) DEFAULT NULL COMMENT '跟账单相关的标ID，充值、提现操作，该值为空',
  `balance_change` int(11) NOT NULL DEFAULT '0' COMMENT '余额变动数量，正数为增加',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '变动后的余额',
  `freeze_change` int(11) NOT NULL DEFAULT '0' COMMENT '冻结金额的变动数量',
  `freeze` int(11) NOT NULL DEFAULT '0' COMMENT '变动后的冻结金额	',
  `available_change` int(11) NOT NULL DEFAULT '0' COMMENT '可用金额的变动数量',
  `available` int(11) NOT NULL DEFAULT '0' COMMENT '变动后的可用金额',
  `lend_change` int(11) NOT NULL DEFAULT '0' COMMENT '变动的出借金额',
  `lend` int(11) NOT NULL DEFAULT '0' COMMENT '变动后的出借金额',
  `borrow_change` int(11) NOT NULL DEFAULT '0' COMMENT '借款金额的变动数量',
  `borrow` int(11) NOT NULL DEFAULT '0' COMMENT '变动后的借款金额',
  `history_recharge` int(11) NOT NULL DEFAULT '0' COMMENT '变动后的历史充值金额',
  `history_withdraw` int(11) NOT NULL DEFAULT '0' COMMENT '变动后的历史提现金额',
  `history_lend` int(11) NOT NULL DEFAULT '0' COMMENT '变动后的历史出借金额',
  `history_borrow` int(11) NOT NULL DEFAULT '0' COMMENT '变动后的历史借款金额',
  `type` varchar(45) NOT NULL COMMENT 'recharge(充值)/withdraw(提现)/tender(投标)/lend(出借、投标成功)/borrow(借款成功)/repayment(还款)/collection(收款)',
  `create_date` int(10) unsigned NOT NULL,
  `comment` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `index_uid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=474 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for think_message
-- ----------------------------
DROP TABLE IF EXISTS `think_message`;
CREATE TABLE `think_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `title` char(25) NOT NULL COMMENT '标题',
  `content` varchar(255) NOT NULL COMMENT '消息内容',
  `create_time` int(11) NOT NULL,
  `read_time` int(11) NOT NULL COMMENT '阅读时间',
  `delete_time` int(11) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for think_mobile_code
-- ----------------------------
DROP TABLE IF EXISTS `think_mobile_code`;
CREATE TABLE `think_mobile_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) DEFAULT NULL,
  `mobile_code` varchar(10) DEFAULT NULL,
  `operation` varchar(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for think_news
-- ----------------------------
DROP TABLE IF EXISTS `think_news`;
CREATE TABLE `think_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL COMMENT '栏目id',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `createdate` int(11) NOT NULL COMMENT '创建日期',
  `updatedate` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '正常为0；1不显示',
  `hits` int(11) DEFAULT '0',
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文章';

-- ----------------------------
-- Table structure for think_news_detail
-- ----------------------------
DROP TABLE IF EXISTS `think_news_detail`;
CREATE TABLE `think_news_detail` (
  `id` int(11) unsigned NOT NULL,
  `content` mediumtext NOT NULL COMMENT '正文内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文章附表';

-- ----------------------------
-- Table structure for think_pay_account_yee
-- ----------------------------
DROP TABLE IF EXISTS `think_pay_account_yee`;
CREATE TABLE `think_pay_account_yee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `nickname` char(20) CHARACTER SET utf8 NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for think_pay_bill_yee
-- ----------------------------
DROP TABLE IF EXISTS `think_pay_bill_yee`;
CREATE TABLE `think_pay_bill_yee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `mode` char(20) CHARACTER SET utf8 NOT NULL COMMENT '交易类型：充值recharge，提现withdrawal，交易trade',
  `amount` int(11) NOT NULL COMMENT '交易金额',
  `fee` int(11) NOT NULL DEFAULT '0' COMMENT '手续费',
  `request_no` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户唯一流水号',
  `tender_id` int(11) DEFAULT NULL,
  `status` char(15) DEFAULT '' COMMENT '状态',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `code` smallint(6) NOT NULL COMMENT '返回码 -1为未返回',
  PRIMARY KEY (`id`),
  UNIQUE KEY `request_no_status` (`request_no`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=787 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for think_pay_log_yee
-- ----------------------------
DROP TABLE IF EXISTS `think_pay_log_yee`;
CREATE TABLE `think_pay_log_yee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `content` text,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3915 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for think_picture
-- ----------------------------
DROP TABLE IF EXISTS `think_picture`;
CREATE TABLE `think_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `path` varchar(100) NOT NULL,
  `link` varchar(110) NOT NULL,
  `pic_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for think_repayment_bill
-- ----------------------------
DROP TABLE IF EXISTS `think_repayment_bill`;
CREATE TABLE `think_repayment_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '借款人ID',
  `tender_id` int(11) NOT NULL COMMENT '标的ID',
  `period_number` int(11) NOT NULL COMMENT '期数，第几期',
  `expect_repayment` bigint(20) NOT NULL COMMENT '应收金额',
  `expect_principal` bigint(20) NOT NULL COMMENT '应还本金',
  `expect_interest` bigint(20) NOT NULL COMMENT '应还利息',
  `real_repayment` bigint(20) NOT NULL COMMENT '实际还款金额',
  `real_principal` bigint(20) NOT NULL COMMENT '实际还款本金',
  `real_interest` bigint(20) NOT NULL COMMENT '实际还款利息',
  `fee` bigint(20) NOT NULL COMMENT '平台抽成费用',
  `overdue_day` int(11) NOT NULL COMMENT '逾期天数',
  `overdue_interest` bigint(20) NOT NULL COMMENT '逾期还款罚息',
  `ahead_interest` bigint(20) NOT NULL COMMENT '提前还款罚息',
  `expect_repayment_time` bigint(20) NOT NULL COMMENT '应该还款时间',
  `real_repayment_time` bigint(20) NOT NULL COMMENT '实际还款时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `status` int(11) NOT NULL COMMENT '状态：0(未还款)/1(还款处理中)/2(正常还款)/3(逾期还款)/4(提前还款)',
  `comment` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COMMENT='借款人还款明细';

-- ----------------------------
-- Table structure for think_suggest
-- ----------------------------
DROP TABLE IF EXISTS `think_suggest`;
CREATE TABLE `think_suggest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `titile` char(25) NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户反馈建议';

-- ----------------------------
-- Table structure for think_tender
-- ----------------------------
DROP TABLE IF EXISTS `think_tender`;
CREATE TABLE `think_tender` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '借款用户id',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '标的类型',
  `purpose_type` tinyint(2) NOT NULL COMMENT '借款用途类型',
  `purpose_description` varchar(45) NOT NULL DEFAULT '短期周转' COMMENT '借款资金用途',
  `flag` int(2) NOT NULL COMMENT '标记： 0(无)/1(新手标)/2(热门标)',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `description` text NOT NULL COMMENT '描述',
  `safety_measure` text NOT NULL COMMENT '安全措施',
  `create_date` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `update_date` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '标的前台显示状态。0为正常显示',
  `process` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '处理阶段。10补充申请资料；20待审核；21审核失败；30资金筹集状态；31流标；50放款中；60放款成功，还款状态；61还款异常；80结束',
  `level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '信用等级',
  `amount` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '借款数',
  `raise_amount` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '已筹集款数',
  `lend_total` int(11) NOT NULL DEFAULT '0' COMMENT '投资人数',
  `min_lend_amount` int(11) NOT NULL DEFAULT '5000' COMMENT '起购金额',
  `cardinal_amount` int(11) NOT NULL DEFAULT '5000' COMMENT '购买基数，购买金额必须为该基数的整数倍',
  `year_rate` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '年化利率',
  `year_fee_rate` mediumint(11) DEFAULT NULL COMMENT '平台抽成年化费率',
  `verify_pass_time` int(11) NOT NULL COMMENT '审核通过时间',
  `lend_end_time` int(11) NOT NULL COMMENT '投标截止时间',
  `loan_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '放款时间',
  `period` mediumint(9) NOT NULL DEFAULT '1' COMMENT '贷款周期（单位为月）',
  `rest_period` mediumint(255) NOT NULL DEFAULT '0' COMMENT '剩余期数',
  `next_repayment_time` int(11) NOT NULL COMMENT '下一期还款时间',
  `to_repayment` bigint(20) NOT NULL DEFAULT '0' COMMENT '待还本息',
  `to_repayment_principal` bigint(20) NOT NULL COMMENT '待还本金',
  `to_repayment_interest` bigint(20) NOT NULL COMMENT '待还利息',
  `fee` bigint(20) NOT NULL COMMENT '平台收取费用',
  `repaymented` bigint(20) NOT NULL DEFAULT '0' COMMENT '已还款金额',
  `repaymented_principal` bigint(20) NOT NULL COMMENT '已还本金',
  `repaymented_interest` bigint(20) NOT NULL COMMENT '已还利息',
  `overdue_interest` bigint(20) NOT NULL COMMENT '逾期还款罚息',
  `ahead_interest` bigint(20) NOT NULL COMMENT '提前还款罚息',
  `borrow_address` varchar(255) NOT NULL COMMENT '借款地址',
  `collateral_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '抵押物id',
  `collateral_type` char(20) NOT NULL COMMENT '抵押类型  car/house',
  `collateral_description` text NOT NULL COMMENT '抵押物品描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='标的';

-- ----------------------------
-- Table structure for think_trade
-- ----------------------------
DROP TABLE IF EXISTS `think_trade`;
CREATE TABLE `think_trade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `tender_id` int(10) unsigned NOT NULL COMMENT '标的id',
  `amount` int(10) unsigned NOT NULL COMMENT '金额。使用int型，单位为分',
  `create_date` int(10) unsigned NOT NULL COMMENT '投标时间',
  `update_date` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态: 0(等待中，已冻结款项)/1(取消投资，已退还冻结金额)/2(失败，已退还冻结款项)/3(成功，已扣除冻结款项)',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `tid` (`tender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='投标交易';

-- ----------------------------
-- Table structure for think_user
-- ----------------------------
DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` char(32) NOT NULL,
  `mobile` char(15) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL COMMENT '用户等级 0(HR)/1(E)/2(D)/3(C)/4(B)/5(A)/6(AA)',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL DEFAULT '',
  `trade_password` char(32) NOT NULL COMMENT '交易密码',
  `trade_encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL DEFAULT '',
  `name` char(12) NOT NULL COMMENT '姓名',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册时的IP',
  `reg_date` int(10) NOT NULL DEFAULT '0',
  `last_ip` char(15) NOT NULL DEFAULT '',
  `last_date` int(10) NOT NULL DEFAULT '0',
  `groupid` tinyint(3) NOT NULL DEFAULT '0' COMMENT '用户组：未认证、已认证等，配合用户组权限表',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户主表，经常需要查询的信息放在此表';

-- ----------------------------
-- Table structure for think_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `think_user_detail`;
CREATE TABLE `think_user_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idcard` char(18) DEFAULT '' COMMENT '身份证',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未知；1male；2female',
  `age` tinyint(3) NOT NULL DEFAULT '0',
  `degree` tinyint(2) NOT NULL DEFAULT '0' COMMENT '学历：10文盲；20小学；30初中；40中专；50高中；60大专；70本科；80硕士；90博士',
  `school` char(20) NOT NULL DEFAULT '' COMMENT '毕业院校',
  `marriage` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未知；1未婚；2已婚',
  `trade` char(16) NOT NULL DEFAULT '' COMMENT '行业',
  `company` varchar(32) NOT NULL DEFAULT '',
  `company_scale` mediumint(6) NOT NULL DEFAULT '0',
  `job_title` varchar(32) NOT NULL DEFAULT '' COMMENT '岗位职位',
  `working_years` tinyint(2) NOT NULL DEFAULT '0' COMMENT '工作时间',
  `income_range` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0：未知；2：0-5；4：5-10；6：10-20；8：20-40；10：40-60；12：60-100；14：100+',
  `house` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '-1：未知；0：无房产；n：n套房产',
  `house_loan` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '-1：未知；0：无房贷；1：有房贷',
  `car` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '-1：未知；0：无；n：n辆车',
  `car_loan` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '-1：未知；0：无车贷；1：有车贷',
  `idcard_cert_file` varchar(255) DEFAULT NULL,
  `idcard_verify_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0(未上传完全)/1(等待审核中)/2(审核失败)/3(审核成功)',
  `idcard_verify_pass_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户详情表，不常访问的信息放在此标，精简主表，提高查询效率';

-- ----------------------------
-- Table structure for think_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `think_withdraw`;
CREATE TABLE `think_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `amount` int(11) NOT NULL COMMENT '提现金额',
  `content` varchar(255) NOT NULL COMMENT '提现信息',
  `admin_uid` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态：0(等待审核)/1(审核拒绝)/2(审核通过)',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
