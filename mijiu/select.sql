-- Add addtional config
INSERT INTO `mijiu`.`sp_shop_config` (`parent_id`, `code`, `type`, `store_range`, `store_dir`, `value`, `sort_order`) 
VALUES ('0', 'addtional_config', 'group', '', '', '', '1');
SELECT id INTO @addtional_config_id FROM sp_shop_config WHERE `code` = 'addtional_config';
SELECT @addtional_config_id;
INSERT INTO `mijiu`.`sp_shop_config` (`parent_id`, `code`, `type`, `store_range`, `store_dir`, `value`, `sort_order`) 
VALUES (@addtional_config_id, 'max_38_coupons_num', 'text', '', '', '200', '1')
,(@addtional_config_id, 'max_20_coupons_num', 'text', '', '', '5000', '1')
,(@addtional_config_id, 'max_20_coupons_num_peer', 'text', '', '', '20', '1')
,(@addtional_config_id, 'share_38_title', 'text', '', '', '您的好友赠送您一瓶江南米酒！', '1')
,(@addtional_config_id, 'share_38_desc', 'textarea', '', '', '颜值高，口感好，请点击免费领取。仅限前 200 名！', '1')
,(@addtional_config_id, 'share_20_title', 'text', '', '', '江南米酒 0 元试喝：颜值高，口感好！', '1')
,(@addtional_config_id, 'share_20_desc', 'textarea', '', '', '好酒不仅不要钱，分享再送 20 元', '1')
,(@addtional_config_id, 'share_no_title', 'text', '', '', '江南米酒：颜值高，口感好！', '1')
,(@addtional_config_id, 'share_no_desc', 'textarea', '', '', '好酒', '1');
-- Remove addtional config
SELECT id INTO @addtional_config_id FROM sp_shop_config WHERE `code` = 'addtional_config';
SELECT @addtional_config_id;
DELETE FROM sp_shop_config WHERE parent_id = @addtional_config_id;
DELETE FROM sp_shop_config WHERE id = @addtional_config_id;
-- END




DROP TABLE sp_debug_log;
CREATE TABLE `sp_debug_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `instance` varchar(50) DEFAULT NULL COMMENT '实例ID',
  `position` varchar(255) DEFAULT NULL COMMENT '记录位置',
  `info` text NOT NULL COMMENT '表单名称',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='DEBUG 日志表';



CALL delete_account('18555555555');
CALL delete_account('18666666666');
CALL delete_account('18777777777');
CALL delete_account('18888888888');
CALL delete_account('18999999999');
CALL delete_account('18767135775');
DELETE FROM sp_pay_log;
DELETE FROM sp_order_action;
DELETE FROM sp_order_goods;
DELETE FROM sp_order_info;
DELETE FROM sp_debug_log;



ALTER TABLE sp_debug_log ADD COLUMN instance VARCHAR(50) NULL COMMENT '实例ID' AFTER id;
ALTER TABLE sp_debug_log ADD COLUMN position VARCHAR(255) NULL COMMENT '记录位置' AFTER instance;


SELECT * 
FROM sp_share ss 
LEFT JOIN sp_users us ON us.user_id = ss.referrer WHERE us.user_id is NULL

SELECT * 
FROM sp_share ss 
LEFT JOIN sp_users us ON us.user_id = ss.recommended WHERE us.user_id is NULL

TRANSACTION BEGIN
START TRANSACTION

COMMIT 

SELECT COUNT(*) FROM sp_share





ALTER TABLE sp_coupons ADD COLUMN  `from_order_id` int(10) unsigned DEFAULT NULL COMMENT '来源订单id' AFTER order_id;



DROP TABLE IF EXISTS `sp_debug_log`;
CREATE TABLE `sp_debug_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `info` TEXT NOT NULL COMMENT '表单名称',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='DEBUG 日志表';



ALTER TABLE sp_sessions_data ADD COLUMN updated_at timestamp ON UPDATE CURRENT_TIMESTAMP AFTER data

