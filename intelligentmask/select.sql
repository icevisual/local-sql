


SELECT TO_DAYS( NOW())


SELECT * FROM up_member_request WHERE `mode`=1 AND TO_DAYS(date)














desc up_member_equipment

SELECT * 
FROM (
select `up_member_account`.`mid`
, `up_member_account`.`mobile`
, `up_member_account`.`uname`
, `up_member_account`.`create_time` as `register_at`
, `up_member_account`.`update_time`
, `up_member_log`.`create_time` as `last_login_at`
, `up_member_log`.`last_ip`
, `up_member_request`.`create_time` as `first_use`
, `up_member_equipment`.`device_number` 
from `up_member_account` 
left join `up_member_equipment` on `up_member_account`.`mid` = `up_member_equipment`.`member_id` 
and `up_member_equipment`.`mode` = '1' 
left join `up_member_log` on `up_member_account`.`mid` = `up_member_log`.`member_id` 
and `up_member_log`.`mode` = '1' 
left join `up_member_request` on `up_member_account`.`mid` = `up_member_request`.`member_id` 
and `up_member_request`.`mode` = '1' order by `up_member_log`.`create_time` desc) AS aa GROUP BY aa.mid



SELECT * FROM (
SELECT
	a.mid,
	a.mobile,
	a.uname,
	a.create_time register_at,
	a.update_time,
	l.create_time last_login_at,
	l.last_ip,
	e.device_number
FROM
	up_member_account a
LEFT JOIN up_member_equipment e on a.mid = e.member_id AND e.`mode` = 1
LEFT JOIN up_member_log l ON a.mid = l.member_id AND l.`mode` = 1
LEFT JOIN up_member_request r on a.mid = r.member_id AND r.`mode` = 1
ORDER BY l.create_time DESC
) aa
GROUP BY aa.mid


CREATE TABLE `up_member_account` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '//id',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `passwd` char(64) NOT NULL COMMENT '密码',
  `uname` varchar(30) DEFAULT NULL COMMENT '用户名',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `level_id` int(5) DEFAULT '1' COMMENT '用户等级',
  `qq` varchar(15) DEFAULT NULL COMMENT 'QQ',
  `wx` varchar(10) DEFAULT NULL COMMENT '微信',
  `icon` varchar(255) DEFAULT NULL COMMENT '头像',
  `user_name` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `login_count` int(10) DEFAULT NULL COMMENT '登录次数',
  `last_ip` varchar(25) DEFAULT NULL COMMENT '最后登录IP',
  `money` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `access_token` varchar(100) DEFAULT NULL COMMENT '每次登录都更新',
  `is_state` int(1) DEFAULT '1' COMMENT '状态 1/开启 2/停止',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`mid`),
  KEY `mobile` (`mobile`),
  KEY `passwd` (`passwd`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户帐号表';


CREATE TABLE `up_member_equipment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `member_id` int(10) NOT NULL COMMENT '用户ID',
  `production_date` int(10) DEFAULT NULL COMMENT '生产日期',
  `device_number` varchar(255) DEFAULT NULL COMMENT '设备号',
  `system_version` varchar(50) DEFAULT NULL COMMENT '系统版本',
  `is_bound` int(1) DEFAULT '1' COMMENT '1/未绑定,2/已绑定',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `mode` int(1) DEFAULT '1' COMMENT 'pm2.5/1,',
  `token` varchar(50) DEFAULT NULL COMMENT '设备令牌',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户设备';

CREATE TABLE `up_member_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `mode` int(1) NOT NULL COMMENT '1/PM2.5上报',
  `member_id` int(10) NOT NULL COMMENT '用户ID',
  `latitude` varchar(50) DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `report_time` int(10) DEFAULT NULL COMMENT '报告时间',
  `city_name` varchar(20) DEFAULT NULL COMMENT '城市名称',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `report_ip` varchar(30) DEFAULT NULL,
  `val_data` varchar(50) DEFAULT NULL,
  `geohash` varchar(30) DEFAULT NULL COMMENT '经纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户请求';

CREATE TABLE `up_member_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '//id',
  `member_id` int(10) unsigned DEFAULT NULL COMMENT '用户ID',
  `mode` int(2) DEFAULT '1' COMMENT '1/登录  2/修改密码  3/修改资料 4/接口查询 5/短信限制数 ',
  `last_ip` varchar(35) DEFAULT NULL COMMENT '登录IP',
  `access_token` varchar(100) DEFAULT NULL COMMENT '每次登录都会更新,哈希加密',
  `access_region` text COMMENT '访问区域',
  `access_time` int(10) DEFAULT NULL COMMENT '访问URL',
  `notes` text COMMENT '备注',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `sms_phone` varchar(13) DEFAULT NULL COMMENT '手机号',
  `sms_verificationCode` varchar(10) DEFAULT NULL COMMENT '短信验证码',
  `sms_time` int(10) DEFAULT NULL,
  `sms_date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `mode` (`mode`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户操作日记表';

