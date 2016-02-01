CREATE TABLE `users`(

	id int(11) not null AUTO_INCREMENT,
	name VARCHAR(100) DEFAULT NULL,
	nick VARCHAR(200) DEFAULT NULL,
	age SMALLINT DEFAULT 0,
	PRIMARY KEY (`id`)

)

CREATE TABLE `gzb_adm_admins` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `lastlogin` int(10) DEFAULT NULL,
  `bdate` int(10) DEFAULT NULL,
  `truename` varchar(30) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `roleid` tinyint(1) NOT NULL COMMENT '所属角色',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '使用状态1:使用 2:停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

