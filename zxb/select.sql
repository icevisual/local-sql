

SELECT count(*) FROM xb_transfer WHERE status = 0 

DROP TABLE IF EXISTS `xb_transfer`;
CREATE TABLE `xb_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL COMMENT 'contentuid',
  `eng` text DEFAULT NULL COMMENT '英原文',
  `chi` text DEFAULT NULL COMMENT '中译文',
  `status` tinyint(2) DEFAULT 0 NULL COMMENT '是否被翻译',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='';



DROP TABLE IF EXISTS `xb_fbsdk_log`;
CREATE TABLE `xb_fbsdk_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `func_name` varchar(50) DEFAULT NULL COMMENT 'API名字',
  `login_name` varchar(50) DEFAULT NULL COMMENT '登录账户名',
  `send_url` varchar(50) DEFAULT NULL COMMENT '发送的URL',
  `send_xml` text COMMENT '发送的XML',
  `send_status` smallint(2) DEFAULT '0' COMMENT '发送状态0失败，1成功',
  `send_error` varchar(100) DEFAULT NULL COMMENT '错误信息',
  `received_xml` text COMMENT '接收到的XML',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=645 DEFAULT CHARSET=utf8 COMMENT='fbsdk_log';




DROP TABLE IF EXISTS `xb_mcpay_detail`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='支付接口调用详情';


