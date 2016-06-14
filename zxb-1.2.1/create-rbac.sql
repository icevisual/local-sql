CREATE database `zxb-1.2.1`;

-- ----------------------------
-- Table structure for rbac_actions
-- ----------------------------
DROP TABLE IF EXISTS `rbac_actions`;
CREATE TABLE `rbac_actions` (
  `action_id` int(8) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(100) DEFAULT NULL COMMENT '权限名',
  `action_info` varchar(200) DEFAULT NULL COMMENT '权限描述',
  `route` varchar(30) DEFAULT NULL COMMENT '权限路由',
  `parentid` int(8) DEFAULT NULL COMMENT '0表示顶级，主要用来控制左侧菜单树形显示',
  `viewmode` tinyint(1) DEFAULT '0' COMMENT '0不可见1可见，默认0',
  `linkmode` tinyint(1) DEFAULT '1' COMMENT '0表示辅助功能权限，无具体操作，用来js控制树形，1表示实际可操作链接',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`actionid`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 COMMENT='权限表';


-- ----------------------------
-- Table structure for rbac_roles
-- ----------------------------
DROP TABLE IF EXISTS `rbac_roles`;
CREATE TABLE `rbac_roles` (
  `role_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) DEFAULT NULL COMMENT '角色名',
  `role_info` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `isuse` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 1:启用 2:停用',
	`allocation_limit` int(6) DEFAULT '0' COMMENT '被分配最大数量',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for rbac_actions_role
-- ----------------------------
DROP TABLE IF EXISTS `rbac_actions_role`;
CREATE TABLE `rbac_actions_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(8) DEFAULT NULL COMMENT '映射角色表',
  `action_id` int(8) DEFAULT NULL COMMENT '映射权限表',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20033 DEFAULT CHARSET=utf8 COMMENT='角色-权限映射表';

-- ----------------------------
-- Table structure for rbac_admins
-- ----------------------------
DROP TABLE IF EXISTS `rbac_user`;
CREATE TABLE `rbac_user` (
  `user_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(30) DEFAULT NULL COMMENT '管理员账号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `lastlogin` int(10) DEFAULT NULL COMMENT '最后登录时间',
  `truename` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `roleid` tinyint(1) NOT NULL COMMENT '所属角色',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '使用状态:使用 1:停用 ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Table structure for rbac_admins_options
-- ----------------------------
DROP TABLE IF EXISTS `rbac_admins_options`;
CREATE TABLE `rbac_admins_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poster` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员',
  `poster_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `option` varchar(50) NOT NULL DEFAULT '' COMMENT '操作类型',
  `item_id` bigint(26) NOT NULL DEFAULT '0' COMMENT '操作数据ID',
  `content` varchar(5000) NOT NULL DEFAULT '' COMMENT '注释',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poster_id` (`poster_id`) USING BTREE,
  KEY `type` (`option`) USING BTREE,
  KEY `item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5162 DEFAULT CHARSET=utf8 COMMENT='操作行为';


