ALTER TABLE xb_salary_order DROP COLUMN `payed_salary_amount` ;
ALTER TABLE xb_salary_order DROP COLUMN `payed_tax_amount` ;
ALTER TABLE xb_salary_order DROP COLUMN `payed_statistics_status` ;


CREATE INDEX process_status on xb_salary_pay(process_status)



CREATE VIEW `xb_view_order_pay_amount` AS SELECT
	xb_salary_pay.order_id,
	SUM(xb_salary_pay.salary) AS payed_salary,
	SUM(xb_salary_pay.tax) AS payed_tax
FROM
	xb_salary_order
JOIN xb_salary_pay ON xb_salary_order.order_id = xb_salary_pay.order_id
AND xb_salary_order.`status` = 4
AND xb_salary_order.`pay_status` = 4
AND xb_salary_order.`payed_statistics_status` = 0
AND xb_salary_pay.result_status = 0
AND xb_salary_pay.process_status = 0
GROUP BY
	xb_salary_pay.order_id;


ALTER TABLE xb_salary_order ADD COLUMN `payed_statistics_status` TINYINT(1) DEFAULT 0 COMMENT '成功发放统计状态0未统计，1已统计' AFTER `status`;
ALTER TABLE xb_salary_order ADD COLUMN `payed_salary_amount` decimal(20,2) DEFAULT 0.00 COMMENT '成功发放的税前金额' AFTER `status`;
ALTER TABLE xb_salary_order ADD COLUMN `payed_tax_amount` decimal(20,2) DEFAULT 0.00 COMMENT '成功发放的税总额' AFTER `status`;

UPDATE xb_salary_order
LEFT JOIN xb_view_order_pay_amount ON xb_view_order_pay_amount.order_id = xb_salary_order.order_id
SET 
 xb_salary_order.payed_salary_amount = IFNULL(xb_view_order_pay_amount.payed_salary,0),
 xb_salary_order.payed_tax_amount = IFNULL(xb_view_order_pay_amount.payed_tax,0),
 xb_salary_order.payed_statistics_status = 1
WHERE
	xb_salary_order.payed_statistics_status = 0
	AND xb_salary_order.`status` = 4
	AND xb_salary_order.`pay_status` = 4;

DROP INDEX result_status on xb_salary_pay

CREATE VIEW `xb_view_order_pay_amount` AS SELECT
	xb_salary_pay.order_id,
	SUM(xb_salary_pay.salary) AS payed_salary,
	SUM(xb_salary_pay.tax) AS payed_tax
FROM
	xb_salary_order
JOIN xb_salary_pay ON xb_salary_order.order_id = xb_salary_pay.order_id
AND xb_salary_order.`status` = 4
AND xb_salary_order.`pay_status` = 4
AND xb_salary_order.`payed_statistics_status` = 0
AND xb_salary_pay.result_status = 0
AND xb_salary_pay.process_status = 0
GROUP BY
	xb_salary_pay.order_id;

CREATE TABLE `xb_salary_order` (
  `order_id` bigint(26) NOT NULL COMMENT '订单流水号',
  `title` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `company_id` int(10) DEFAULT NULL COMMENT '公司的id',
  `payment_at` timestamp NULL DEFAULT NULL COMMENT '工资发放日',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打款状态，1未打款，2打款中，3完成打款，结果查询中，4完成结果查询',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态 0未提交，1已提交,未确认，2被拒绝，3待发放，4已发放，5发放中',
  `pay_num` int(10) NOT NULL DEFAULT '0' COMMENT '支付条目数',
  `submit_at` timestamp NULL DEFAULT NULL COMMENT '提交时间',
  `confirm_at` timestamp NULL DEFAULT NULL COMMENT '确认时间',
  `refuse_at` timestamp NULL DEFAULT NULL COMMENT '拒绝时间',
  `pay_at` timestamp NULL DEFAULT NULL COMMENT '实际打款时间',
  `refuse_reason` varchar(225) DEFAULT NULL COMMENT '拒绝理由',
  `operator_id` varchar(11) DEFAULT NULL COMMENT '最后操作人ID',
  `lastedit_at` timestamp NULL DEFAULT NULL COMMENT '最后操作时间',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  KEY `company_id` (`company_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发放工资订单主表'


SHOW CREATE table `xb_salary_order`

ALTER TABLE xb_salary_order DROP COLUMN `payed_amount` ;

ALTER TABLE xb_salary_order ADD COLUMN `payed_amount` decimal(11,2) DEFAULT NULL COMMENT '已发放金额', AFTER `status`;





DROP INDEX  `pay_at` ON `xb_salary_order`
CREATE INDEX `pay_at` ON `xb_salary_order`(`pay_at`) USING BTREE ;





CREATE DATABASE zxb_data

ALTER TABLE  xb_salary_order ADD COLUMN payed_amount  decimal(11,2) DEFAULT NULL COMMENT '已发放金额' AFTER pay_num

UPDATE xb_salary_order o 
JOIN xb_salary_pay p on p.order_id = o.order_id
SET payed_amount = sum(salary)
WHERE
	p.process_status = 0
AND p.result_status = 0
GROUP BY
	p.order_id



SELECT
	order_id,
	sum(salary) salary
FROM
	xb_salary_pay
WHERE
	process_status = 0
AND result_status = 0
GROUP BY
	order_id



ALTER TABLE xb_article MODIFY COLUMN publish_mode TINYINT NOT NULL DEFAULT 1 COMMENT '发布方式1立即发布，2定时发布，3不发布';
ALTER TABLE xb_article MODIFY COLUMN `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态1:未发布 2:已发布,3待发布';




ALTER TABLE xb_article MODIFY COLUMN publish_mode TINYINT NOT NULL DEFAULT 1 COMMENT '发布方式1立即发布，2定时发布' AFTER `status`



ALTER TABLE  xb_company_account ADD COLUMN single_token  varchar(62) DEFAULT NULL COMMENT '单人登录令牌' AFTER remember_token


ALTER TABLE  xb_company_account ADD COLUMN prevlogin  timestamp  NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'lastlogin' AFTER lastlogin


ALTER TABLE  xb_salary_order ADD COLUMN pay_num  int(10) NOT NULL DEFAULT 0 COMMENT '支付条目数' AFTER status



ALTER TABLE xb_article add COLUMN publish_mode TINYINT NOT NULL DEFAULT 1 COMMENT '发布方式1立即发布，2定时发布' AFTER `status`


ALTER TABLE xb_article add COLUMN publish_at timestamp NULL DEFAULT NULL COMMENT '预计发布时间时间' AFTER `status`

ALTER TABLE xb_article add COLUMN published_at timestamp NULL DEFAULT NULL COMMENT '发布时间时间' AFTER `status`


DROP TABLE IF EXISTS `xb_article`;
CREATE TABLE `xb_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `list_img` varchar(200) DEFAULT NULL COMMENT '列表图片',
  `describtion` varchar(255) NOT NULL COMMENT '描述',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `content` text NOT NULL COMMENT '内容',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态1:未发布 2:已发布',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章表';




DROP PROCEDURE IF EXISTS `cal_time_usage`;
CREATE PROCEDURE `cal_time_usage`(
	_in_order_id VARCHAR(50)
)
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
	
	DECLARE pay_req_usage int(11);
  DECLARE query_req_usage int(11);
	
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
		count(DISTINCT query_log_id) 
	INTO
		pay_req_usage,
		query_req_usage
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
	SELECT ROUND(pay_usage /60, 2 )  AS PayTimeUsage , ROUND(query_usage /60, 2 ) AS QueryTimeUsage,
pay_req_usage ,query_req_usage ;
END


ALTER TABLE  xb_company_account ADD COLUMN single_token  varchar(62) DEFAULT NULL COMMENT '单人登录令牌' AFTER remember_token


ALTER TABLE  xb_company_account ADD COLUMN prevlogin  timestamp  NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'lastlogin' AFTER lastlogin


ALTER TABLE  xb_salary_order ADD COLUMN pay_num  int(10) NOT NULL DEFAULT 0 COMMENT '支付条目数' AFTER status




