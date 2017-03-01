
DROP TABLE IF EXISTS `chinese_col`;
CREATE TABLE `chinese_col` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`uid` int(11)  NOT NULL ,
	`email` varchar(255) NULL DEFAULT NULL COMMENT 'email',
	`昵称` varchar(255) NULL DEFAULT NULL COMMENT '昵称',
  `邮箱状态` varchar(255) NULL DEFAULT NULL COMMENT '邮箱状态',
  `视频认证` varchar(255) NULL DEFAULT NULL COMMENT '视频认证',
  `好友数` varchar(255) NULL DEFAULT NULL COMMENT '好友数',
  `回帖数` varchar(255) NULL DEFAULT NULL COMMENT '回帖数',
  `主题数` varchar(255) NULL DEFAULT NULL COMMENT '主题数',
  `性别` varchar(255) NULL DEFAULT NULL COMMENT '性别',
  `学历` varchar(255) NULL DEFAULT NULL COMMENT '学历',
  `管理组` varchar(255) NULL DEFAULT NULL COMMENT '管理组',
  `用户组` varchar(255) NULL DEFAULT NULL COMMENT '用户组',
  `在线时间` varchar(255) NULL DEFAULT NULL COMMENT '在线时间',
  `注册时间` varchar(255) NULL DEFAULT NULL COMMENT '注册时间',
  `最后访问` varchar(255) NULL DEFAULT NULL COMMENT '最后访问',
  `上次活动时间` varchar(255) NULL DEFAULT NULL COMMENT '上次活动时间',
  `上次发表时间` varchar(255) NULL DEFAULT NULL COMMENT '上次发表时间',
  `所在时区` varchar(255) NULL DEFAULT NULL COMMENT '所在时区',
  `已用空间` varchar(255) NULL DEFAULT NULL COMMENT '已用空间',
  `积分` varchar(255) NULL DEFAULT NULL COMMENT '积分',
  `威望` varchar(255) NULL DEFAULT NULL COMMENT '威望',
  `U币` varchar(255) NULL DEFAULT NULL COMMENT 'U币',
  `贡献` varchar(255) NULL DEFAULT NULL COMMENT '贡献',
  `个人签名` varchar(255) NULL DEFAULT NULL COMMENT '个人签名',
  `个人主页` varchar(255) NULL DEFAULT NULL COMMENT '个人主页',
  `扩展用户组` varchar(255) NULL DEFAULT NULL COMMENT '扩展用户组',
  `星座` varchar(255) NULL DEFAULT NULL COMMENT '星座',
  `出生地` varchar(255) NULL DEFAULT NULL COMMENT '出生地',
  `居住地` varchar(255) NULL DEFAULT NULL COMMENT '居住地',
  `公司` varchar(255) NULL DEFAULT NULL COMMENT '公司',
  `真实姓名` varchar(255) NULL DEFAULT NULL COMMENT '真实姓名',
  `职业` varchar(255) NULL DEFAULT NULL COMMENT '职业',
  `职位` varchar(255) NULL DEFAULT NULL COMMENT '职位',
  `交友目的` varchar(255) NULL DEFAULT NULL COMMENT '交友目的',
	`毕业学校` varchar(255) NULL DEFAULT NULL COMMENT '毕业学校',
	`兴趣爱好` varchar(255) NULL DEFAULT NULL COMMENT '兴趣爱好',
	`自定义头衔` varchar(255) NULL DEFAULT NULL COMMENT '自定义头衔',
	`注册 IP` varchar(255) NULL DEFAULT NULL COMMENT '注册 IP',

	`上次访问 IP` varchar(255) NULL DEFAULT NULL COMMENT '上次访问 IP',


  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户账单表';



SELECT COUNT(DISTINCT uid) FROM chinese_col;

SHOW PROCESSLIST 

