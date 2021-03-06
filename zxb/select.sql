
UPDATE xb_salary_order
LEFT JOIN xb_view_order_payed_amount ON xb_view_order_payed_amount.order_id = xb_salary_order.order_id
SET 
 xb_salary_order.payed_salary_amount = IFNULL(xb_view_order_payed_amount.payed_salary,0),
 xb_salary_order.payed_tax_amount = IFNULL(xb_view_order_payed_amount.payed_tax,0),
 xb_salary_order.payed_success_count = IFNULL(xb_view_order_payed_amount.payed_success_count,0),
 xb_salary_order.payed_statistics_status = 1
WHERE
	xb_salary_order.payed_statistics_status = 0
	AND xb_salary_order.`status` = 4
	AND xb_salary_order.`pay_status` = 4;

CREATE INDEX payed_statistics_status on xb_salary_order(payed_statistics_status)

SHOW INDEX FROM xb_salary_order;
SHOW INDEX FROM xb_salary_pay;
SELECT
	xb_salary_pay.order_id,
	COUNT(xb_salary_pay.id) AS payed_success_count,
	SUM(xb_salary_pay.salary) AS payed_salary,
	SUM(xb_salary_pay.tax) AS payed_tax
FROM
	xb_salary_order
JOIN xb_salary_pay ON xb_salary_order.order_id = xb_salary_pay.order_id
AND xb_salary_pay.result_status = 0
AND xb_salary_pay.process_status = 0
AND xb_salary_order.`status` = 4
AND xb_salary_order.`pay_status` = 4
AND xb_salary_order.`payed_statistics_status` = 0
GROUP BY
	xb_salary_pay.order_id



SHOW CREATE TABLE mysql.slow_log;

SELECT * FROM  mysql.slow_log;

CREATE TABLE `slow_log` (
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `query_time` time NOT NULL,
  `lock_time` time NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumtext NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log'



show variables like 'log_slow_queries'; 

 show variables like 'long_query_time';

show variables like '%quer%';

DROP TABLE IF EXISTS `xb_request_log`;
CREATE TABLE `xb_request_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `uri` varchar(100) DEFAULT NULL COMMENT '路由',
  `params` text DEFAULT NULL COMMENT '参数',
  `time_usage` DECIMAL(10,4) NOT NULL DEFAULT '0.0000' COMMENT '时间使用量S',
  `memory_usage` DECIMAL(10,4) NOT NULL DEFAULT '0.0000' COMMENT '内存使用量MB',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='请求日志'


SHOW CREATE TABLE xb_article



CREATE TABLE `xb_change_pwd_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT '账号',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `mode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '更改方式1创2重3忘4主',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='密码更改日志表'

CREATE TABLE `xb_company_account` (
  `account_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '企业账号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `remember_token` varchar(62) DEFAULT NULL,
  `single_token` varchar(62) DEFAULT NULL COMMENT '单人登录令牌',
  `lastlogin` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `prevlogin` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'lastlogin',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '使用状态:使用 1:停用 ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='企业账号表'


DROP TABLE xb_change_pwd_log

SHOW CREATE TABLE xb_company_account 

ALTER TABLE xb_company_account ADD COLUMN `initial_pwd_flag` TINYINT(1) DEFAULT 1 NOT NULL COMMENT '是否为初始密码，1是，2不是' AFTER `status`;








SELECT
	`xb_salary_order`.`order_id`,
	`xb_salary_order`.`company_id`,
	`xb_salary_order`.`title`,
	`xb_company`.`name`,
	`xb_company`.`account_balance`,
	`xb_company`.`type`,
	`xb_salary_order`.`payment_at`,
	COUNT(xb_salary_pay.id) user_count,
	SUM(xb_salary_pay.salary) salary_amount,
	SUM(xb_salary_pay.tax) tax_amount,
	`xb_salary_order`.`status`,
	`xb_salary_order`.`pay_status`,
	SUM(
		xb_salary_pay.result_status
	) failed_count,
	`xb_salary_order`.`note`,
	`xb_salary_order`.`submit_at`,
	`xb_salary_order`.`operator_id`,
	`xb_salary_order`.`lastedit_at`
FROM
	`xb_salary_order`
 JOIN `xb_salary_pay` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id` AND `xb_salary_order`.`status` > 0
INNER JOIN `xb_company` ON `xb_salary_order`.`company_id` = `xb_company`.`company_id`
-- WHERE
-- 	`xb_salary_order`.`status` > 0 ## IN ('1', '2', '3', '4', '5')
GROUP BY
	`xb_salary_order`.`order_id`
ORDER BY
	`xb_salary_order`.`status` ASC,
	`xb_salary_order`.`submit_at` ASC
LIMIT 10 OFFSET 0 



SHOW CREATE TABLE xb_salary_order


SELECT
	`xb_salary_order`.`order_id`,
	`xb_salary_order`.`company_id`,
	`xb_salary_order`.`title`,
	`xb_company`.`name`,
	`xb_company`.`account_balance`,
	`xb_company`.`type`,
	`xb_salary_order`.`payment_at`,
	COUNT(xb_salary_pay.id) user_count,
	SUM(xb_salary_pay.salary) salary_amount,
	SUM(xb_salary_pay.tax) tax_amount,
	`xb_salary_order`.`status`,
	`xb_salary_order`.`pay_status`,
	SUM(
		xb_salary_pay.result_status
	) failed_count,
	`xb_salary_order`.`note`,
	`xb_salary_order`.`submit_at`,
	`xb_salary_order`.`operator_id`,
	`xb_salary_order`.`lastedit_at`
FROM
	`xb_salary_order`
LEFT JOIN `xb_salary_pay` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
INNER JOIN `xb_company` ON `xb_salary_order`.`company_id` = `xb_company`.`company_id`

GROUP BY
	`xb_salary_pay`.`order_id`
ORDER BY
	`xb_salary_order`.`status` ASC,
	`xb_salary_order`.`submit_at` ASC
LIMIT 10 OFFSET 0 


SHOW INDEX FROM xb_salary_pay



CREATE INDEX result_status on xb_salary_pay (`result_status`) USING BTREE

CREATE INDEX salary on xb_salary_pay (salary) USING BTREE

SHOW INDEX FROM xb_company


DROP INDEX company_id on xb_salary_pay 



delete  FROM xb_salary_pay WHERE company_id = 250





UPDATE xb_salary_order SET company_id=150 WHERE  company_id = 250;

UPDATE xb_salary_pay SET company_id=150 WHERE  company_id = 250;


CREATE DATABASE zxb_test


SELECT count(*) FROM xb_salary_pay WHERE created_at  >= '2016-04-05 17:30:00';


show index FROM xb_salary_pay 

delete  FROM xb_salary_order WHERE created_at  >= '2016-04-05 17:30:00';
delete  FROM xb_salary_pay WHERE created_at  >= '2016-04-05 17:30:00';





SELECT
	SUBSTR(xb_salary_order.pay_at, 1, 7) AS yearMonth,
	SUM(xb_salary_pay.salary) AS salary,
	SUM(xb_salary_pay.tax) AS tax,
FROM
	`xb_salary_order`
INNER JOIN `xb_salary_pay` ON `xb_salary_order`.`order_id` = `xb_salary_pay`.`order_id`
WHERE
	`xb_salary_order`.`company_id` = '150'
AND `xb_salary_order`.`status` = '4'
AND `xb_salary_order`.`pay_status` = '4'
AND `xb_salary_order`.`pay_at` >= '2015-01-01 00:00:01'
AND `xb_salary_order`.`pay_at` <= '2015-12-31 23:59:59'
GROUP BY
	`yearMonth`






