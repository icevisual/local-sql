
DELETE FROM op_request_log WHERE `return` = 'null';


SHOW CREATE TABLE op_request_log;


CREATE TABLE `op_request_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `uri` varchar(100) DEFAULT NULL COMMENT '路由',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `return` varchar(255) DEFAULT NULL COMMENT '返回',
  `time_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '时间使用量S',
  `memory_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '内存使用量MB',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=648 DEFAULT CHARSET=utf8 COMMENT='请求日志'


ALTER TABLE op_request_log ADD COLUMN `sha1` VARCHAR(100) NULL COMMENT 'SHA1 of uri & params & return ' AFTER `RETURN`;




DROP TABLE IF EXISTS `op_request_params`;
CREATE TABLE `op_request_params` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) NOT NULL COMMENT '英文名',
  `name_zh` varchar(255) DEFAULT NULL COMMENT '中文名',
  `default` varchar(255) DEFAULT NULL COMMENT '默认值',
  `type` varchar(50) DEFAULT NULL COMMENT '类别',
  `sha1` varchar(255) DEFAULT NULL COMMENT 'SHA1',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='请求参数日志'



SELECT
	`name_zh`,
	COUNT(id) AS count
FROM
	`op_request_params`
WHERE
	`name_en` = 'email'
GROUP BY
	`name_zh`
ORDER BY
	count(id) DESC 
LIMIT 1

SELECT name_en,count(id) from op_request_params GROUP BY name_zh ORDER BY count(id) desc;


