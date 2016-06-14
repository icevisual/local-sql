


SHOW CREATE TABLE xb_salary_pay
CREATE TABLE `xb_salary_pay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `truename` varchar(60) NOT NULL COMMENT '真实姓名',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `order_id` bigint(26) NOT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL COMMENT '员工编号',
  `card_no` varchar(40) DEFAULT '0' COMMENT '银行卡号',
  `bank_name` varchar(40) DEFAULT '0' COMMENT '银行名称',
  `salary` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '薪资',
  `seperate_tag` int(11) NOT NULL DEFAULT '0' COMMENT '超5w分割标记',
  `salary_accumulated` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '本月累计预发放、已过审核，打款未失败',
  `tax_accumulated` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '本月已计税额，已过审核，打款未失败',
  `tax_expected` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '实际需要总税额，月收入合并计税',
  `tax` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '税',
  `taxation_point` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '个税起征点',
  `tax_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '税率',
  `quick_deduction` int(11) NOT NULL DEFAULT '0' COMMENT '速算扣除数',
  `result_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款结果，0成功 ，1失败',
  `process_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '处理状态，1未打款，2已打款，3等待结果，0得到结果',
  `api_type` smallint(2) NOT NULL DEFAULT '0' COMMENT '支付接口类别0代表直接支付，1代表网银贷记',
  `pay_log_id` int(11) DEFAULT NULL COMMENT 'xb_fbsdk_log ID ',
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
  KEY `process_status` (`process_status`),
  KEY `company_id` (`company_id`),
  KEY `result_status` (`result_status`)
) ENGINE=InnoDB AUTO_INCREMENT=347331 DEFAULT CHARSET=utf8 COMMENT='发放工资订单子表'

SET FOREIGN_KEY_CHECKS=0;


ALTER TABLE `xb_salary_pay` MODIFY COLUMN `tax`  decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '税' AFTER `salary`;
ALTER TABLE `xb_salary_pay` MODIFY COLUMN `taxation_point`  decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '个税起征点' AFTER `tax`;
ALTER TABLE `xb_salary_pay` MODIFY COLUMN `tax_rate`  decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT '税率' AFTER `taxation_point`;
ALTER TABLE `xb_salary_pay` MODIFY COLUMN `quick_deduction`  int(11) NOT NULL DEFAULT 0 COMMENT '速算扣除数' AFTER `tax_rate`;



DROP TABLE `xb_mcpay_detail`;
ALTER 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `xb_view_order_payed_amount` AS 
select `xb_salary_pay`.`order_id` AS `order_id`,count(`xb_salary_pay`.`id`) AS `payed_success_count`,sum(`xb_salary_pay`.`salary`) AS `payed_salary`,sum(`xb_salary_pay`.`tax`) AS `payed_tax` from (`xb_salary_order` join `xb_salary_pay` on(((`xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`) and (`xb_salary_order`.`status` = 4) and (`xb_salary_order`.`pay_status` = 4) and (`xb_salary_order`.`payed_statistics_status` = 0) and (`xb_salary_pay`.`result_status` = 0) and (`xb_salary_pay`.`process_status` = 0)))) group by `xb_salary_pay`.`order_id` ;
ALTER 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `xb_view_order_pay_amount` AS 
select `xb_salary_pay`.`order_id` AS `order_id`,count(`xb_salary_pay`.`id`) AS `should_pay_num`,sum(`xb_salary_pay`.`salary`) AS `should_pay_salary`,sum(`xb_salary_pay`.`tax`) AS `should_pay_tax` from (`xb_salary_order` join `xb_salary_pay` on(((`xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`) and (`xb_salary_order`.`should_pay_salary` = 0) and (`xb_salary_order`.`should_pay_tax` = 0) and (`xb_salary_order`.`should_pay_num` = 0)))) group by `xb_salary_pay`.`order_id` ;
DROP PROCEDURE IF EXISTS `cal_time_usage`;
CREATE DEFINER = `root`@`localhost` PROCEDURE `cal_time_usage`(_in_order_id VARCHAR(50))
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
		query_req_usage QueryReqNum;
END;
SET FOREIGN_KEY_CHECKS=1;