



SELECT * FROM (
SELECT * FROM (
SELECT
	`sm_news`.`id`,
	`sm_news`.`title`,
	`sm_account`.`name` AS `username`,
	`dateline`,
	`sm_news_category`.`name` AS `categoryName`,
	`sm_news_place`.`name` AS `placeName`,
	`is_recommend` AS `recommend`,
	`sm_news`.`relevance`,
	`status`,
	`sm_news`.`updated_at`
FROM
	`sm_news`
LEFT JOIN `sm_news_category` ON `sm_news_category`.`id` = `sm_news`.`typeid`
LEFT JOIN `sm_news_place` ON `sm_news_category`.`place` = `sm_news_place`.`id`
LEFT JOIN `sm_account` ON `sm_account`.`id` = `sm_news`.`userid`
WHERE
	(`sm_news`.`language` = 1)
AND `sm_news`.`is_recommend` = 1
AND `sm_news`.`deleted_at` IS NULL
ORDER BY
	`sm_news`.`updated_at` DESC
) as A 
UNION
SELECT * FROM (
SELECT
	`sm_news`.`id`,
	`sm_news`.`title`,
	`sm_account`.`name` AS `username`,
	`dateline`,
	`sm_news_category`.`name` AS `categoryName`,
	`sm_news_place`.`name` AS `placeName`,
	`is_recommend` AS `recommend`,
	`sm_news`.`relevance`,
	`status`,
  `sm_news`.`updated_at`
FROM
	`sm_news`
LEFT JOIN `sm_news_category` ON `sm_news_category`.`id` = `sm_news`.`typeid`
LEFT JOIN `sm_news_place` ON `sm_news_category`.`place` = `sm_news_place`.`id`
LEFT JOIN `sm_account` ON `sm_account`.`id` = `sm_news`.`userid`
WHERE
	(`sm_news`.`language` = 1)
AND `sm_news`.`is_recommend` = 0
AND `sm_news`.`deleted_at` IS NULL
ORDER BY
	`sm_news`.`id` DESC
) as B
) AS C
LIMIT 10 OFFSET 0




ALTER TABLE sm_news MODIFY `updated_at` int(10) unsigned NOT NULL DEFAULT '0' ON UPDATE UNIX_TIMESTAMP() COMMENT '修改时间',
SHOW CREATE table  sm_news_place

CREATE TABLE `sm_news_place` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL,
  `created_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8


SHOW CREATE table  sm_news

CREATE TABLE `sm_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL COMMENT '所属分类',
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '标题',
  `thumb` varchar(100) DEFAULT NULL COMMENT '图片url',
  `keywords` varchar(100) DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `userid` smallint(5) unsigned NOT NULL COMMENT '用户id',
  `is_recommend` tinyint(2) DEFAULT '0' COMMENT '是否推荐',
  `dateline` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `deleted_at` int(10) DEFAULT NULL,
  `language` tinyint(1) NOT NULL DEFAULT '1' COMMENT '语言 1：简中2:繁中3：英语',
  `main_id` mediumint(8) DEFAULT '0' COMMENT '关联的主id',
  `relevance` int(11) DEFAULT NULL COMMENT '关联id',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`id`),
  KEY `listorder` (`catid`,`status`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8


SELECT
	`sm_schedule_script`.`many`,
	`sm_schedule_script`.`keep`,
FROM_UNIXTIME(`sm_schedule_script`.`many` + UNIX_TIMESTAMP()),
	`sm_schedule_script`.`sn`,
	CONCAT(
		sm_smell.cn_name,
		sm_smell.en_name
	) AS NAME,
	`sm_schedule_script`.`input`
FROM
	`sm_schedule_script`
LEFT JOIN `sm_smell` ON `sm_smell`.`id` = `sm_schedule_script`.`sn`
WHERE
	(
		`sm_schedule_script`.`sid` = 29
		AND `sm_schedule_script`.`is_del` = 0
	)


SELECT FROM_UNIXTIME(60,'yyyy-')
SELECT FROM_DAYS(UNIX_TIMESTAMP())

SELECT FROM_UNIXTIME(unix_timestamp)


SHOW CREATE TABLE sm_smell


ALTER TABLE sm_smell ADD COLUMN `type` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '气味类别0:未知 1:原料 2:香精 3:香基' AFTER cn_name;

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
) ENGINE=InnoDB AUTO_INCREMENT=5274 DEFAULT CHARSET=utf8 COMMENT='气味表'






SELECT
	`sm_smell`.`id`,
	`sm_smell`.`smell_sn`,
	`sm_smell`.`en_name`,
	`sm_smell`.`cn_name`,
	`sm_smell`.`type`,
	(
		CASE sm_smell.type
		WHEN 0 THEN
			'未知'
		WHEN 1 THEN
			'香精'
		ELSE
			'香基'
		END
	) AS type_desc,
	`sm_smell`.`source`,
	`sm_smell`.`source_id`,
	`sm_smell`.`tags`,
	count(sm_smell_pc.smell_id) AS has_pic
FROM
	`sm_smell`
LEFT JOIN `sm_smell_pc` ON `sm_smell_pc`.`smell_id` = `sm_smell`.`id`
WHERE
	(
		`sm_smell`.`en_name` LIKE '%玫瑰%'
		OR `sm_smell`.`cn_name` LIKE '%玫瑰%'
	)
AND `sm_smell`.`deleted_at` IS NULL
GROUP BY
	`sm_smell`.`id`
ORDER BY
	`sm_smell`.`id` DESC
LIMIT 100 OFFSET 0



SELECT sm_smell_pc.* FROM sm_smell RIGHT JOIN sm_smell_pc on sm_smell.id = sm_smell_pc.smell_id WHERE sm_smell.id is null 

SELECT COUNT(*) FROM sm_smell;
SELECT COUNT(*) FROM sm_smell_pc;

SELECT sm_smell.* FROM sm_smell LEFT JOIN sm_smell_pc on sm_smell.id = sm_smell_pc.smell_id WHERE sm_smell_pc.id is null 


SELECT sm_smell.*,count(sm_smell.id) FROM sm_smell JOIN sm_smell_pc on sm_smell.id = sm_smell_pc.smell_id 
GROUP BY sm_smell.id HAVING count(sm_smell.id) > 1


SELECT
	`sm_smell`.`id`,
	`sm_smell`.`smell_sn`,
	`sm_smell`.`en_name`,
	`sm_smell`.`cn_name`,
	`sm_smell`.`source`,
	`sm_smell`.`source_id`,
	`sm_smell`.`tags`
FROM
	`sm_smell`
LEFT JOIN `sm_smell_pc` ON `sm_smell_pc`.`smell_id` = `sm_smell`.`id`
WHERE
	(
		`sm_smell`.`en_name` LIKE '%玫瑰%'
		OR `sm_smell`.`cn_name` LIKE '%玫瑰%'
	)
AND `sm_smell`.`deleted_at` IS NULL
ORDER BY
	`sm_smell`.`id` DESC
LIMIT 100 OFFSET 0


SHOW CREATE TABLE sm_smell_device;



ALTER TABLE sm_smell_device ADD COLUMN `access_key` varchar(100) DEFAULT NULL COMMENT '连接 emq 所需的 access key' AFTER `spec`;
ALTER TABLE sm_smell_device ADD COLUMN `secret_key` varchar(100) DEFAULT NULL COMMENT '连接 emq 所需的 secret key' AFTER `access_key`;



  `access_key` varchar(100) DEFAULT NULL COMMENT '连接 emq 所需的 access key',
  

CREATE TABLE `sm_smell_device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(30) NOT NULL COMMENT '设备编号',
  `alias` varchar(30) NOT NULL COMMENT '设备别名',
  `spec` varchar(30) NOT NULL COMMENT '设备规格',
  `bottle_num` tinyint(3) unsigned NOT NULL COMMENT '气味瓶数量',
  `production_date` int(11) NOT NULL DEFAULT '0' COMMENT '生产日期',
  `used_counter` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '使用次数',
  `used_times` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '使用时长 / 小时',
  `last_use_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次使用时间',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='气味设备表'

