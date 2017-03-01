CREATE TABLE `sm_smell` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `smell_sn` varchar(20) NOT NULL COMMENT '自定义气味编号',
  `en_name` varchar(50) NOT NULL DEFAULT '' COMMENT '气味英文名',
  `cn_name` varchar(50) NOT NULL DEFAULT '' COMMENT '气味中文名',
  `tags` varchar(50) NOT NULL DEFAULT '' COMMENT '标签id 冒号分隔',
  `source` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '气味来源 0:未知 1:配方 2:采购',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '气味关联id(配方表or采购材料表)',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='气味表';




{
    "message": "aGVsbG93b3JsZA==",
    "topic": "/23344127/#",
    "sign": "061397c0ec57664173a81c0345dbbba9",
    "messageId": 4,
    "appKey": "23344127"
}

{
    "message": "e3RlbToyMH0=",
    "topic": "/23344127/#",
    "sign": "8cd0279430a72e136769e9a9ce6d8a54",
    "messageId": 5,
    "deviceId": "0XX3zXOdQjOMAU5Rh"
}

CREATE DATABASE smell_open;

DROP TABLE IF EXISTS xb_topic_msg;
CREATE TABLE `xb_topic_msg` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL COMMENT 'message',
  `topic` varchar(255) DEFAULT NULL COMMENT 'topic',
  `sign` varchar(255) DEFAULT NULL COMMENT 'sign= md5_32(productKey+(message)+productSecret)',
  `messageId` varchar(255) DEFAULT NULL COMMENT 'messageId',
  `appKey` varchar(255) DEFAULT NULL COMMENT 'appKey',
  `deviceId` varchar(255) DEFAULT NULL COMMENT 'deviceId',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Topic消息';



















DROP TABLE IF EXISTS `NTIBCOPR`;
CREATE TABLE `NTIBCOPR` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
##request
  `YURREF` varchar(160) NOT NULL COMMENT '业务参考号',
  `ACCNBR` varchar(160) NOT NULL COMMENT '付方账号',
  `TRSAMT` varchar(160) NOT NULL COMMENT '金额',
  `CDTNAM` varchar(160) NOT NULL COMMENT '接收方用户名',
  `CDTEAC` varchar(160) NOT NULL COMMENT '接收方账户',
##request return
  `ERRCOD` varchar(160) NOT NULL COMMENT '错误码',
  `REQNBR` varchar(160) NOT NULL COMMENT '业务流水号',
  `REQSTS` varchar(160) NOT NULL COMMENT '处理状态',
  `SQRNBR` varchar(160) NOT NULL COMMENT '流水批次号',
##
  `ERRTXT` varchar(160) NOT NULL COMMENT '错误信息',
  `TRXNBR` varchar(160) NOT NULL COMMENT '用于1.3',
  `TRXSTS` varchar(160) NOT NULL COMMENT '处理状态',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='网银互联-2.0网银贷记'






CREATE TABLE `xb_mcpay_detail` (
  `log_id` int(11) NOT NULL COMMENT 'xb_fbsdk_log ID ',
  `FUNNAM` varchar(50) DEFAULT NULL COMMENT 'API名字',
  `YURREF` varchar(30) DEFAULT NULL COMMENT '业务参考号',
  `TRSAMT` decimal(11,2) DEFAULT NULL COMMENT '金额',
  `CRTSQN` varchar(20) DEFAULT NULL COMMENT '收方编号',
  `CDTNAM_CRTNAM` varchar(100) DEFAULT NULL COMMENT '收款人户名',
  `CDTEAC_CRTACC` varchar(35) DEFAULT NULL COMMENT '收款人账号',
  `CDTBRD` varchar(12) DEFAULT NULL COMMENT '收款行行号',
  `RTNFLG` varchar(2) DEFAULT NULL COMMENT '业务处理结果',
  `ERRTXT` varchar(100) DEFAULT NULL COMMENT '错误文本',
  `ERRCOD` varchar(10) DEFAULT NULL COMMENT '错误代码',
  `REQNBR` varchar(12) DEFAULT NULL COMMENT '流程实例号',
  `REQSTS` varchar(5) DEFAULT NULL COMMENT '请求状态',
  `RTNTIM` varchar(5) DEFAULT NULL COMMENT '等待时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付接口调用详情';




DROP TABLE IF EXISTS `NTIBCOPR`;
CREATE TABLE `NTIBCOPR` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,

  `YURREF` varchar(160) NOT NULL COMMENT '业务参考号',
  `TRSAMT` varchar(160) NOT NULL COMMENT '金额',
  `CDTNAM` varchar(160) NOT NULL COMMENT '接收方用户名',
  `CDTEAC` varchar(160) NOT NULL COMMENT '接收方账户',
  `REQNBR` varchar(160) NOT NULL COMMENT '业务流水号',

  `REQSTS` varchar(160) NOT NULL COMMENT '处理状态',、
  `ERRCOD` varchar(160) NOT NULL COMMENT '错误码',
  `ERRTXT` varchar(160) NOT NULL COMMENT '错误信息',
  
SQRNBR
TRXNBR
TRXSTS

  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='网银互联-2.0网银贷记'








        <YURREF>I16032209240011910540000</YURREF>
        <TRSAMT>0.01</TRSAMT>
        <CDTNAM>金燕林</CDTNAM>
        <CDTEAC>6228580699005714769</CDTEAC>
			  <REQNBR>0545742875</REQNBR>
				<SQRNBR>000000028</SQRNBR>



SHOW CREATE TABLE x_bill

SHOW TABLES ;


DROP TABLE IF EXISTS `x_bill`;
CREATE TABLE `x_bill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '姓名',
  `type` TINYINT NOT NULL COMMENT '金额类别，1需付，1已付', 
  `desc` varchar(160) NOT NULL COMMENT '描述',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户账单表'






