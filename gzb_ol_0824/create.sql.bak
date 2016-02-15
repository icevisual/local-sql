

DROP TABLE  IF EXISTS `gzb_user_ip`;
CREATE TABLE `gzb_user_ip` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(40) ,
    `ipaddr` varchar(40) ,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='';





##用户到每个公司都对应一个支付方式（银行卡）
DROP TABLE  IF EXISTS `xb_user_payway`;
CREATE TABLE `xb_user_payway` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `uid` int(11) NOT NULL COMMENT '用户账户ID',
    `card_no` varchar(40) DEFAULT '0' COMMENT '打款账户',
    `pay_name` varchar(40) DEFAULT '0' COMMENT '打款方式名称，银行名称',
    `pay_type` tinyint(2) DEFAULT 1 COMMENT '打款方式 0银行卡 1支付宝',
    `company_id` int(11) NOT NULL COMMENT '用户所属公司账户ID',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户支付方式表';


DROP TABLE  IF EXISTS `xb_user_company`;
CREATE TABLE `xb_user_company` (
    `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `user_no` VARCHAR(20) NULL COMMENT '员工编号',
    `status` TINYINT DEFAULT 0 COMMENT '在职状态状态',
    `company_id` varchar(50) DEFAULT NULL COMMENT '所属公司',
    `join_at` timestamp DEFAULT NULL COMMENT '入职时间',
    `quit_at`  timestamp DEFAULT NULL COMMENT '离职时间',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT uid_comp UNIQUE (uid,company_id),
    PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户公司表';


DROP TABLE  IF EXISTS `xb_user`;
CREATE TABLE `xb_user` (
    `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    #预留
    `password` varchar(70) NOT NULL COMMENT '密码',
    `salt` varchar(15) NOT NULL COMMENT '密码加密字符串，随机生成 8位',

    `username` varchar(30) DEFAULT NULL COMMENT '用户名',
    `phone` varchar(11) DEFAULT '0' COMMENT '电话',
    `identity` varchar(20) DEFAULT NULL COMMENT '身份证',

    `account_status` tinyint(2) unsigned DEFAULT '0' COMMENT '账户状态 0 启用 ，1 停用 ， 2 删除',  
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`uid`),
    UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户表';


DROP TABLE  IF EXISTS `xb_user_bill`;
CREATE TABLE `xb_user_bill` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `uid` int(11) NOT NULL COMMENT '账户ID',
    `inout_amount` decimal(11,2) DEFAULT '0.00' COMMENT '收入支出金额，收入为正数，支出为负数',
    `absolute_amount` decimal(11,2) DEFAULT '0.00' COMMENT '金额绝对值',
    `rest_amount` decimal(11,2) DEFAULT '0.00' COMMENT '余额',
    `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，0还款，1分享获得',
    `relation_id` int(11) NOT NULL COMMENT '账户ID',
    `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出0：支出，1.收入',
    `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '事件状态0：失败，1.成功',
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户账单表';



    `salary` decimal(11,2) DEFAULT '0.00' COMMENT '税前',
    `tax` decimal(11,2) DEFAULT '0.00' COMMENT '税',



DROP TABLE  IF EXISTS `xb_user_account`;
CREATE TABLE `xb_user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`uid` int(11) NOT NULL COMMENT '账户ID',
  `inout_amount` decimal(11,2) DEFAULT '0.00' COMMENT '收入支出金额，收入为正数，支出为负数',
  `absolute_amount` decimal(11,2) DEFAULT '0.00' COMMENT '金额绝对值',
  `rest_amount` decimal(11,2) DEFAULT '0.00' COMMENT '余额',
  `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，0还款，1分享获得',
  `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出0：支出，1.收入',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '事件状态0：失败，1.成功',

  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户还款现金';



CREATE TABLE `gzb_user_repayment_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '账户ID',
  `inout_amount` decimal(11,2) DEFAULT '0.00' COMMENT '收入支出金额，收入为正数，支出为负数',
  `absolute_amount` decimal(11,2) DEFAULT '0.00' COMMENT '金额绝对值',
  `rest_amount` decimal(11,2) DEFAULT '0.00' COMMENT '余额',
  `event_type` smallint(5) DEFAULT '0' COMMENT '事件类别，0还款，1分享获得',
  `inout` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收入支出0：支出，1.收入',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '事件状态0：失败，1.成功',

  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户还款现金';





-----------------------------------------------------




CREATE TABLE `gzb_user_account` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(30) DEFAULT NULL COMMENT '用户名',
  `phone` varchar(11) DEFAULT '0' COMMENT '电话',
  `password` varchar(70) NOT NULL COMMENT '密码',
  `salt` varchar(15) NOT NULL COMMENT '密码加密字符串，随机生成 8位',
  `account_status` tinyint(2) unsigned DEFAULT '0' COMMENT '账户状态 0 启用 ，1 停用 ， 2 删除',
  `from_type` tinyint(2) DEFAULT '0' COMMENT '账号来源，0国众宝，1p2p',
  `province` varchar(20) DEFAULT NULL COMMENT '手机归属地 省',
  `city` varchar(30) DEFAULT NULL COMMENT '手机归属地 市',
  `areacode` varchar(30) DEFAULT NULL COMMENT '手机归属地 区ID',
  `zip` varchar(10) DEFAULT NULL COMMENT '邮编',
  `company` varchar(30) DEFAULT NULL COMMENT '运营商',
  `card` varchar(30) DEFAULT NULL COMMENT '手机卡类型',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=165730 DEFAULT CHARSET=utf8 COMMENT='用户账户表';





CREATE TABLE `gzb_user_info` (
  `uid` int(11) unsigned NOT NULL COMMENT '账户ID',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `sex` tinyint(2) unsigned DEFAULT '0' COMMENT '性别 0 女性，1男性',
  `age` tinyint(3) unsigned DEFAULT '0' COMMENT '年龄',
  `qq` varchar(15) DEFAULT NULL COMMENT 'QQ号',
  `wechat` varchar(40) DEFAULT NULL COMMENT '微信',
  `email` varchar(40) DEFAULT NULL COMMENT '邮箱',
  `emergency_contact` varchar(20) DEFAULT NULL COMMENT '紧急联系人手机',
  `company` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `join_at` varchar(50) DEFAULT NULL COMMENT '入职时间',
  `identity` varchar(20) DEFAULT NULL COMMENT '身份证',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `process_at` timestamp NULL DEFAULT NULL COMMENT '每次的处理时间',
  `audit_status` tinyint(2) DEFAULT '0' COMMENT '0：审核中 1：自动生成，无用户数据 2：审核通过，3：审核失败',
  `credit_status` tinyint(2) unsigned DEFAULT '0' COMMENT '账户信用状态 0 无记录，1，信誉良好，2 有过逾期 ，3 黑名单 4，同盾可疑账户 5，四要素不一致',
  `fraudmetrix_status` tinyint(10) DEFAULT NULL COMMENT '0 检测通过 , 1 可疑设备 ，2 被拒绝的设备 3，未知的设备',
  `credit_status_info` varchar(100) DEFAULT '0' COMMENT '四要素不通过原因',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`) USING BTREE,
  UNIQUE KEY `identity` (`identity`) USING BTREE,
  KEY `created_at` (`created_at`) USING BTREE,
  KEY `updated_at` (`updated_at`) USING BTREE,
  KEY `fraudmetrix_status` (`fraudmetrix_status`) USING BTREE,
  KEY `credit_status` (`credit_status`) USING HASH,
  KEY `userinfo` (`name`,`company`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户详细信息表';












DROP TABLE  IF EXISTS `gzb_activity_renren_goods`;
CREATE TABLE `gzb_activity_renren_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `goods_name` varchar(100) DEFAULT NULL COMMENT '商品名',
  `goods_name_en` varchar(100) DEFAULT NULL,
  `goods_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_stock` int(11) DEFAULT '0' COMMENT '商品库存',
  `goods_status` tinyint(2) DEFAULT '1' COMMENT '商品状态,0下架，1上架',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='线下销存商品表';

DROP TABLE  IF EXISTS `gzb_activity_renren_order`;
CREATE TABLE `gzb_activity_renren_order` (
  `orderid` bigint(26) NOT NULL COMMENT '订单流水号',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名',
  `goods_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `pay_type` tinyint(2) DEFAULT '0' COMMENT '支付类别 1 微信，2线下',
  `pay_task_id` varchar(255) DEFAULT NULL COMMENT '支付流水号',
  `order_status` tinyint(2) DEFAULT '0' COMMENT '订单状态,0未确认，1未发货，2,已发货，3取消',
  `pay_status` tinyint(2) DEFAULT '0' COMMENT '支付状态，0未支付，1支付中，2支付成功，3支付失败',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `pay_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '偿还数额',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `confirm_at` timestamp NULL DEFAULT NULL COMMENT '确认时间',
  `cancel_at` timestamp NULL DEFAULT NULL COMMENT '取消时间',
  `deliver_at` timestamp NULL DEFAULT NULL COMMENT '发货时间',
  `delivery_goods_serial` varchar(255) DEFAULT NULL COMMENT '发货-商品序列',
  `delivery_id` varchar(255) DEFAULT NULL COMMENT '发货-快递单号',
  `delivery_name` varchar(255) DEFAULT NULL COMMENT '发货-快递类别',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下单时间',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='线下销存订单表';



INSERT INTO `gzb_activity_renren_goods` (`goods_id`, `goods_name`, `goods_name_en`, `goods_price`, `goods_stock`, `goods_status`, `created_at`, `updated_at`) VALUES ('1', 'OPPO X9070 Find 7 联通4G 黑色', 'OPPO X9070 Find 7 Unicom 4G Black', '0.01', '1', '1', '2015-11-05 18:55:56', '2015-11-11 14:57:24');
INSERT INTO `gzb_activity_renren_goods` (`goods_id`, `goods_name`, `goods_name_en`, `goods_price`, `goods_stock`, `goods_status`, `created_at`, `updated_at`) VALUES ('2', 'OPPO X9070 Find 7 联通4G 白色', 'OPPO X9070 Find 7 Unicom 4G White', '2468.00', '2', '1', '2015-11-05 18:55:56', '2015-11-11 14:57:26');
INSERT INTO `gzb_activity_renren_goods` (`goods_id`, `goods_name`, `goods_name_en`, `goods_price`, `goods_stock`, `goods_status`, `created_at`, `updated_at`) VALUES ('3', 'OPPO R831S 移动4G 白色', 'OPPO R831S Mobile 4G White', '850.00', '5', '1', '2015-11-05 18:55:56', '2015-11-11 14:56:40');
INSERT INTO `gzb_activity_renren_goods` (`goods_id`, `goods_name`, `goods_name_en`, `goods_price`, `goods_stock`, `goods_status`, `created_at`, `updated_at`) VALUES ('4', 'OPPO X9077 Find 7 移动4G 白色', 'OPPO X9077 Find 7 Mobile 4G White', '2468.00', '1', '1', '2015-11-05 18:55:56', '2015-11-11 14:56:44');
INSERT INTO `gzb_activity_renren_goods` (`goods_id`, `goods_name`, `goods_name_en`, `goods_price`, `goods_stock`, `goods_status`, `created_at`, `updated_at`) VALUES ('5', '美图2 16G 联通3G 月光白', 'Meitu 2 16G Unicom 3G White', '1688.00', '5', '1', '2015-11-05 18:55:56', '2015-11-11 14:56:48');
INSERT INTO `gzb_activity_renren_goods` (`goods_id`, `goods_name`, `goods_name_en`, `goods_price`, `goods_stock`, `goods_status`, `created_at`, `updated_at`) VALUES ('6', '三星 TAB ST700 WIFI 炫目白', 'Sumsung TAB ST700 WIFI White', '2100.00', '2', '1', '2015-11-05 18:55:56', '2015-11-11 14:56:52');
INSERT INTO `gzb_activity_renren_goods` (`goods_id`, `goods_name`, `goods_name_en`, `goods_price`, `goods_stock`, `goods_status`, `created_at`, `updated_at`) VALUES ('7', '小米 16G 纯白色', 'Xiaomi 16G White', '1188.00', '1', '1', '2015-11-05 18:55:56', '2015-11-11 14:56:55');
INSERT INTO `gzb_activity_renren_goods` (`goods_id`, `goods_name`, `goods_name_en`, `goods_price`, `goods_stock`, `goods_status`, `created_at`, `updated_at`) VALUES ('8', '小米 16G 淡粉色', 'Xiaomi 16G Pink', '1188.00', '12', '1', '2015-11-05 18:55:56', '2015-11-11 14:56:58');
INSERT INTO `gzb_activity_renren_goods` (`goods_id`, `goods_name`, `goods_name_en`, `goods_price`, `goods_stock`, `goods_status`, `created_at`, `updated_at`) VALUES ('9', '小米 16G 柠檬黄', 'Xiaomi 16G Yellow', '1188.00', '1', '1', '2015-11-05 18:55:56', '2015-11-11 14:57:02');
INSERT INTO `gzb_activity_renren_goods` (`goods_id`, `goods_name`, `goods_name_en`, `goods_price`, `goods_stock`, `goods_status`, `created_at`, `updated_at`) VALUES ('10', '小米 16G 浅绿色', 'Xiaomi 16G Green', '1188.00', '7', '1', '2015-11-05 18:55:56', '2015-11-11 14:57:05');
INSERT INTO `gzb_activity_renren_goods` (`goods_id`, `goods_name`, `goods_name_en`, `goods_price`, `goods_stock`, `goods_status`, `created_at`, `updated_at`) VALUES ('11', '小米 64G 淡粉色', 'Xiaomi 64G LightPink', '1388.00', '4', '1', '2015-11-05 18:55:56', '2015-11-11 14:57:08');






DROP TABLE  IF EXISTS `gzb_activity_order`;
CREATE TABLE `gzb_activity_order` (
  `orderid` bigint(26) NOT NULL COMMENT '订单流水号',
	`name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `goods_id` int(11) not NULL COMMENT '商品ID',
	`goods_name` varchar(255) DEFAULT NULL COMMENT '商品名',
	`goods_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
	`pay_type` tinyint(2) DEFAULT '0' COMMENT '支付类别 1 微信，2线下',
	`pay_task_id` varchar(255) NULL COMMENT '支付流水号',

	`order_status` tinyint(2) DEFAULT '0' COMMENT '订单状态,0未确认，1未发货，2,已发货，3取消',
	`pay_status` tinyint(2) DEFAULT '0' COMMENT '支付状态，0未支付，1支付中，2支付成功，3支付失败',
	`note`  varchar(255) DEFAULT NULL COMMENT '备注',	
	`pay_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '偿还数额',
	`pay_at` timestamp NULL COMMENT '支付时间',
	`confirm_at` timestamp NULL COMMENT '确认时间',
	`cancel_at` timestamp NULL COMMENT '取消时间',

	`deliver_at` timestamp NULL COMMENT '发货时间',
	`delivery_goods_serial` varchar(255) DEFAULT NULL COMMENT '发货-商品序列',
	`delivery_id` varchar(255) DEFAULT NULL COMMENT '发货-快递单号',
	`delivery_name` varchar(255) DEFAULT NULL COMMENT '发货-快递类别',
	
	`created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下单时间',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='线下销存订单表';

DROP TABLE  IF EXISTS `gzb_activity_goods`;
CREATE TABLE `gzb_activity_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
	`goods_name` varchar(255) DEFAULT NULL COMMENT '商品名',
	`goods_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
	`goods_stock` int(11) DEFAULT 0 COMMENT '商品库存',
	`goods_status` tinyint(2) DEFAULT '1' COMMENT '商品状态,0下架，1上架',
	`created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='线下销存商品表';

INSERT INTO `gzb_activity_goods` ( `goods_name`, `goods_price`, `goods_stock`, `goods_status`, `created_at`, `updated_at`) 
VALUES 
('OPPO X9070 Find 7 联通4G 黑色', '2468.00', '1', '1', now(),now()),
('OPPO X9070 Find 7 联通4G 白色', '2468.00', '2', '1', now(),now()),
('OPPO X9077 Find 7 移动4G 白色', '2468.00', '1', '1', now(),now()),
('OPPO R8315 移动4G 白色', '850.00', '5', '1', now(),now()),
('美图2 16G 联通3G 月光白', '1688.00', '5', '1', now(),now()),
('三星 TAB ST700 WIFI 炫目白', '2100.00', '2', '1', now(),now()),
('小米 16G 纯白色', '1188.00', '1', '1', now(),now()),
('小米 16G 淡粉色', '1188.00', '12', '1', now(),now()),
('小米 16G 柠檬黄', '1188.00', '1', '1', now(),now()),
('小米 16G 浅绿色', '1188.00', '7', '1', now(),now()),
('小米 64G 淡粉色', '1388.00', '4', '1', now(),now());
