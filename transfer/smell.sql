
SELECT * FROM sm_smell_pc 

upload/scent/

UPDATE sm_smell_pc SET thumb = CONCAT('upload/scent/',thumb)

ALTER TABLE sm_smell_pc ADD COLUMN  `height` smallint(5) DEFAULT '0' COMMENT 'height' AFTER thumb;
ALTER TABLE sm_smell_pc ADD COLUMN    `width` smallint(5) DEFAULT '0' COMMENT 'width' AFTER thumb;


SHOW CREATE TABLE renern_smell.sm_smell_pc

ALTER TABLE sm_smell_pc change column width  width1 ;
ALTER TABLE sm_smell_pc change column height  width ;
ALTER TABLE sm_smell_pc change column width1  height ;
ALTER TABLE sm_smell_pc

CREATE TABLE `sm_smell_pc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smell_id` mediumint(8) NOT NULL COMMENT '分类名称',
  `thumb` varchar(100) NOT NULL COMMENT '文件路径',
  `category_id` smallint(6) unsigned DEFAULT NULL COMMENT '分类id',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '创建人',
  `created_at` int(10) NOT NULL COMMENT '创建时间',
  `updated_at` int(10) NOT NULL COMMENT '更新时间',
  `deleted_at` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='气味分类管理'


SELECT * FROM renern_smell.sm_smell_pc


DROP TABLE IF EXISTS `sm_smell_pc`;
CREATE TABLE `sm_smell_pc` CHARSET=utf8
AS
SELECT 
id,
id AS smell_id,
localpath AS thumb,
0 AS category_id,
0 AS user_id,
UNIX_TIMESTAMP() AS created_at,
UNIX_TIMESTAMP() AS updated_at
FROM sm_smell_thumb ;


SELECT * FROM sm_smell_thumb 

SELECT UNIX_TIMESTAMP();

## 未有图片

SELECT
	s.id,
s.cn_name
FROM
	sm_smell s
LEFT JOIN sm_smell_thumb t ON t.id = s.id
WHERE
	t.id IS NULL



====================================
## 气味名字重复

DROP TABLE IF EXISTS __temp;
CREATE TABLE __temp 
AS
SELECT
	cn_name,
	COUNT(id) AS count
FROM
	sm_smell
GROUP BY
	cn_name
HAVING
	COUNT(id) > 1;

SELECT * FROM __temp;
SELECT SUM(count) FROM __temp;
DROP TABLE __temp;
=====================================

## 名字错误

SELECT COUNT(DISTINCT probably_name) FROM sm_smell_pc WHERE probably_name != '';

SELECT p.smell_id,s.cn_name,p.probably_name FROM sm_smell_pc_pass p JOIN sm_smell s on p.smell_id = s.id WHERE p.probably_name != '' GROUP BY p.probably_name

=====================================
## 未选择的图片链接




DROP TABLE IF EXISTS __temp1;
CREATE TABLE __temp1 
AS
SELECT
	p2.thumb
FROM
	sm_smell_pc_copy1 p2
LEFT JOIN sm_smell_pc_pass p1 ON p2.id = p1.id
WHERE
	p1.id IS NULL
AND p2.thumb != '';



SELECT * FROM __temp1;

DROP TABLE __temp;


=====================================

DROP TABLE IF EXISTS sm_smell_thumb1;
CREATE TABLE sm_smell_thumb1 
AS
SELECT * FROM sm_smell_thumb 
UNION 
SELECT * FROM sm_smell_thumb_copy ;


RENAME TABLE sm_smell_thumb to sm_smell_thumb_part02;

RENAME TABLE sm_smell_thumb1 to sm_smell_thumb;

=====================================

SHOW CREATE TABLE sm_smell_pc


DROP TABLE IF EXISTS `sm_smell_pc`;
CREATE TABLE `sm_smell_pc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smell_id` mediumint(8) NOT NULL COMMENT '分类名称',
  `probably_name` varchar(50) NOT NULL COMMENT '图片查询失败，可能正确的名字',
  `thumb` varchar(255) NOT NULL COMMENT '文件路径',
  `height` smallint(5) DEFAULT '0' COMMENT 'height',
  `width` smallint(5) DEFAULT '0' COMMENT 'width',
  `category_id` smallint(6) unsigned DEFAULT NULL COMMENT '分类id',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '创建人',
  `created_at` int(10) NOT NULL COMMENT '创建时间',
  `updated_at` int(10) NOT NULL COMMENT '更新时间',
  `deleted_at` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='气味分类管理'




SELECT COUNT(DISTINCT smell_id) FROM sm_smell_pc


SELECT COUNT(id) FROM sm_smell_pc


SELECT s.cn_name FROM sm_smell_pc p JOIN sm_smell s  on  s.id = p.smell_id WHERE p.thumb = '' GROUP BY s.cn_name


SELECT cn_name FROM sm_smell GROUP BY cn_name


SELECT p.smell_id,s.cn_name,p.probably_name FROM sm_smell_pc p JOIN sm_smell s on p.smell_id = s.id WHERE p.probably_name != '' GROUP BY p.probably_name





SELECT
	s.id,
	s.cn_name,
	p.thumb,
	GROUP_CONCAT(p.thumb, '#T#')
FROM
	sm_smell s
JOIN sm_smell_pc p ON s.id = p.smell_id
GROUP BY
	s.id
LIMIT 20



DROP TABLE IF EXISTS `sm_smell_thumb`;
CREATE TABLE `sm_smell_thumb` CHARSET=utf8
AS
SELECT
	s.id,
	s.cn_name,
	p.thumb,
  p.height,
  p.width
FROM
	sm_smell s
JOIN sm_smell_pc p ON s.id = p.smell_id
GROUP BY
	s.id;
## LIMIT 20;

ALTER TABLE `sm_smell_thumb` ADD COLUMN `localpath` VARCHAR(100) NULL COMMENT '本地地址' AFTER thumb;
ALTER TABLE `sm_smell_thumb` ADD COLUMN `down_status` TINYINT NOT NULL DEFAULT 0 COMMENT '下载状态0未处理1已下载，2下失败' AFTER localpath;

ALTER TABLE `sm_smell_thumb` ADD COLUMN `mime` VARCHAR(50) NOT NULL DEFAULT 0 COMMENT 'mime type' AFTER width;




SHOW CREATE TABLE sm_smell_thumb



SELECT COUNT(*) FROM sm_smell_thumb WHERE down_status = 0

CREATE TABLE `sm_smell_thumb` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cn_name` varchar(50) NOT NULL DEFAULT '' COMMENT '气味中文名',
  `thumb` varchar(255) NOT NULL COMMENT '文件路径',
  `localpath` varchar(100) DEFAULT NULL COMMENT '本地地址',
  `down_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '下载状态0未处理1已下载，2下失败',
  `height` smallint(5) DEFAULT '0' COMMENT 'height',
  `width` smallint(5) DEFAULT '0' COMMENT 'width'
) ENGINE=InnoDB DEFAULT CHARSET=utf8