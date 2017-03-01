
DROP TABLE IF EXISTS xb_upload_log ;
CREATE TABLE `xb_upload_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IpRoleID` varchar(255) DEFAULT NULL COMMENT 'IpRoleID',
  `bizNo` varchar(255) DEFAULT NULL COMMENT 'bizNo',
  `full` varchar(255) DEFAULT NULL COMMENT '全路径',
  `count` int(11) DEFAULT '0' COMMENT '代发条数',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '代发总金额',
  `send_status` smallint(2) DEFAULT '0' COMMENT '发送状态1成功,2失败',
  `send_error` varchar(100) DEFAULT NULL COMMENT '错误信息',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态，1未上传，2已上传，3已请求确认',
  `result_status` varchar(20) DEFAULT '' COMMENT 'resultStatus',
  `result_code` varchar(20) DEFAULT '' COMMENT 'resultCode',
  `result_msg` varchar(100) DEFAULT '' COMMENT 'resultMsg',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网商银行文件上传日志';


SHOW CREATE TABLE xb_salary_pay ;

DROP TABLE IF EXISTS `xb_pay_job`;
CREATE TABLE `xb_pay_job` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
## 超5w 分割 
## 接口调用相关，时间，支付配置，接口类别
  `pay_id` int(11) NOT NULL COMMENT 'PAYID',
  `order_id` int(11) NOT NULL COMMENT 'PAYID',
  `payway_type` smallint(2) NOT NULL DEFAULT '1' COMMENT '支付方式类别1代表招商银行,2网商支付',## 与orderID相关，放到订单主表中
  `api_type` smallint(2) NOT NULL DEFAULT '1' COMMENT '支付接口类别1代发代扣，2代表网银贷记,3网商支付',
## 支付关键信息
  `truename` varchar(60) NOT NULL COMMENT '真实姓名',
  `card_no` varchar(40) DEFAULT '' COMMENT '银行卡号',
  `bank_name` varchar(40) DEFAULT '' COMMENT '银行名称',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '打款金额',
## 支付过程信息，关联批量
  `batch_no` varchar(40) DEFAULT '' COMMENT '批次号',

  `batch_no` varchar(40) DEFAULT '' COMMENT '批次号',


  `logid_pay` int(11) DEFAULT NULL COMMENT '支付请求的LOG ID',
  `logid_batch_query` int(11) DEFAULT NULL COMMENT '批量结果查询的LOG ID ',
  `logid_single_query` int(11) DEFAULT NULL COMMENT '单独查询的LOG ID ', ## 考虑到 此数据需到单条记录
## 处理、结果信息
  `process_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '处理状态，1未打款，2已打款，3等待结果，0得到结果',
  `result_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款结果，1无结果，1成功，2失败',
  `reason` varchar(50) DEFAULT NULL COMMENT '失败原因',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际支付时间',
  `result_at` timestamp NULL DEFAULT NULL COMMENT '获得结果的时间',

  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  PRIMARY KEY (`id`),
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='打款任务表';


DROP TABLE IF EXISTS `xb_batchpay_merchants`;
CREATE TABLE `xb_batchpay_merchants` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(40) DEFAULT '' COMMENT '批次号',
  `logid_pay` int(11) DEFAULT NULL COMMENT '支付请求的LOG ID',
  `logid_batch_query` int(11) DEFAULT NULL COMMENT '批量结果查询的LOG ID ',
  `logid_single_query` int(11) DEFAULT NULL COMMENT '单独查询的LOG ID ',
  `totalCount` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `totalAmount` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `YURREF` varchar(30) DEFAULT NULL COMMENT '业务参考号',
  `REQNBR` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',
  PRIMARY KEY (`id`),
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='打款任务表';


DROP TABLE IF EXISTS `xb_batchpay_ants`;
CREATE TABLE `xb_batchpay_ants` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(40) DEFAULT '' COMMENT '批次号',
  `logid_pay` int(11) DEFAULT NULL COMMENT '支付请求的LOG ID',
  `logid_batch_query` int(11) DEFAULT NULL COMMENT '批量结果查询的LOG ID ',
  `totalCount` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `totalAmount` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `bizNo` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `fileName` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `smsCode` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `batchTransNo` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `resultMd5` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `verify_status` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `result_status` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `result_code` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `result_msg` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  PRIMARY KEY (`id`),
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='打款任务表';


  `pay_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `group_query_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `query_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `YURREF` varchar(30) DEFAULT NULL COMMENT '业务参考号',
  `REQNBR` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',

  `bizNo` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `fileName` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `smsCode` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `batchTransNo` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `resultMd5` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `verify_status` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `result_status` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `result_code` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `result_msg` varchar(10) DEFAULT NULL COMMENT '流程实例号',
bizNo
fileName
smsCode
batchTransNo
resultMd5

verify_status
result_status
result_code
result_msg


DROP PROCEDURE IF EXISTS db_data_length;
CREATE PROCEDURE db_data_length(
	in _in_table_name VARCHAR(100)
)
BEGIN 
	IF _in_table_name = '' THEN 
		SELECT
			TABLE_NAME,
			concat(round(sum(DATA_LENGTH/1024/1024),4),'MB') as data_mb,
			DATA_LENGTH,
			INDEX_LENGTH,
			DATA_LENGTH + INDEX_LENGTH as data_b,
			TABLE_ROWS
		FROM
			information_schema. TABLES
		WHERE
			TABLE_SCHEMA = DATABASE ()
		GROUP BY
			TABLE_NAME;
	ELSE
		SELECT
			TABLE_NAME,
			concat(round(sum(DATA_LENGTH/1024/1024),4),'MB') as data_mb,
			DATA_LENGTH,
			INDEX_LENGTH,
			DATA_LENGTH + INDEX_LENGTH as data_b,
			TABLE_ROWS
		FROM
			information_schema. TABLES
		WHERE
			TABLE_SCHEMA = DATABASE () AND TABLE_NAME = _in_table_name
		GROUP BY
			TABLE_NAME;
	END IF;
END;

CALL db_data_length('');



SHOW CREATE TABLE xb_salary_order

CREATE TABLE `xb_salary_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `title` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `year_month` date DEFAULT NULL COMMENT '工资单所属月份',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_type` tinyint(1) DEFAULT '2' COMMENT '订单类型1无账户订单，2自主账户订单,参照company.type',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '工资发放日',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款状态，1未打款，2打款中，3完成打款，结果查询中，4完成结果查询',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0未提交，1已提交,未确认，2被拒绝，3待发放，4已发放，5发放中',
  `should_pay_num` int(10) DEFAULT '0' COMMENT '需打款人数',
  `should_pay_time` int(10) DEFAULT '0' COMMENT '需打款次数',
  `should_pay_tax` decimal(20,2) DEFAULT '0.00' COMMENT '需付个税总金额',
  `should_pay_salary` decimal(20,2) DEFAULT '0.00' COMMENT '需付薪资总金额',
  `should_pay_amount` decimal(20,2) DEFAULT '0.00' COMMENT '应打款总金额',
  `payed_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税总额',
  `payed_salary_amount` decimal(20,2) DEFAULT '0.00' COMMENT '成功发放的税前金额',
  `payed_amount` decimal(20,2) DEFAULT '0.00' COMMENT '已打款总金额',
  `payed_statistics_status` tinyint(1) DEFAULT '0' COMMENT '成功发放统计状态0未统计，1已统计,2已计福豆',
  `payed_success_count` smallint(5) DEFAULT '0' COMMENT '打款成功数量',
  `submit_at` timestamp NULL DEFAULT NULL COMMENT '提交时间',
  `confirm_at` timestamp NULL DEFAULT NULL COMMENT '确认时间',
  `refuse_at` timestamp NULL DEFAULT NULL COMMENT '拒绝时间',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',
  `refuse_reason` varchar(225) DEFAULT NULL COMMENT '拒绝理由',
  `operator_id` varchar(11) DEFAULT NULL COMMENT '最后操作人ID',
  `lastedit_at` timestamp NULL DEFAULT NULL COMMENT '最后操作时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  KEY `company_id` (`company_id`),
  KEY `payed_statistics_status` (`payed_statistics_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发放工资订单主表'


CREATE TABLE `xb_salary_pay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `truename` varchar(60) NOT NULL COMMENT '真实姓名',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_id` bigint(26) NOT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL COMMENT '员工编号',
  `card_no` varchar(40) DEFAULT '0' COMMENT '银行卡号',
  `bank_name` varchar(40) DEFAULT '0' COMMENT '银行名称',
  `salary` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '薪资',
  `tax` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '税',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '打款金额',
  `seperate_tag` smallint(6) NOT NULL DEFAULT '0' COMMENT '分割FLAG',
  `result_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款结果，0成功 ，1失败',
  `process_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '处理状态，1未打款，2已打款，3等待结果，0得到结果',
  `api_type` smallint(2) NOT NULL DEFAULT '0' COMMENT '支付接口类别0代表直接支付，1代表网银贷记',
  `pay_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `group_query_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `query_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
  `YURREF` varchar(30) DEFAULT NULL COMMENT '业务参考号',
  `REQNBR` varchar(10) DEFAULT NULL COMMENT '流程实例号',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',
  `reason` varchar(50) DEFAULT NULL COMMENT '失败原因',
  `success_at` timestamp NULL DEFAULT NULL COMMENT '打款成功时间',
  `failed_at` timestamp NULL DEFAULT NULL COMMENT '打款失败时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '记录生成日期',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新日期',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `YURREF` (`YURREF`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `process_status` (`process_status`),
  KEY `result_status` (`result_status`)
) ENGINE=InnoDB AUTO_INCREMENT=18096 DEFAULT CHARSET=utf8 COMMENT='发放工资订单子表'







