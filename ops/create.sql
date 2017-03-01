-- ----------------------------
-- Date: 2017-02-23 15:13:21
-- ----------------------------

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for op_aliyun_ak
-- ----------------------------
DROP TABLE IF EXISTS `op_aliyun_ak`;
CREATE TABLE `op_aliyun_ak` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `AccessKeyId` varchar(255) DEFAULT NULL COMMENT 'AccessKeyId',
  `AccessKeySecret` varchar(255) DEFAULT NULL COMMENT 'AccessKeySecret',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='阿里云AK列表';

-- ----------------------------
-- Table structure for op_aliyun_api_request_log
-- ----------------------------
DROP TABLE IF EXISTS `op_aliyun_api_request_log`;
CREATE TABLE `op_aliyun_api_request_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL COMMENT '请求时间',
  `expired_at` timestamp NULL DEFAULT NULL COMMENT '过期时间',
  `request_api` varchar(100) NOT NULL COMMENT '请求 API',
  `params_sha1` varchar(100) NOT NULL COMMENT '请求 API SHA1',
  `paramaters` varchar(255) DEFAULT NULL COMMENT '请求参数',
  `RequestId` varchar(255) DEFAULT NULL COMMENT '返回信息',
  `error` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `exception` varchar(255) DEFAULT NULL COMMENT '异常信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='阿里云 API 请求日志';

-- ----------------------------
-- Table structure for op_describe_instances
-- ----------------------------
DROP TABLE IF EXISTS `op_describe_instances`;
CREATE TABLE `op_describe_instances` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` varchar(100) DEFAULT NULL COMMENT '请求 ID',
  `params_sha1` varchar(100) NOT NULL COMMENT '请求 API SHA1',
  `InstanceId` varchar(255) DEFAULT NULL COMMENT '实例 ID',
  `InstanceName` varchar(255) DEFAULT NULL COMMENT '实例的显示名称',
  `Description` varchar(255) DEFAULT NULL COMMENT '实例的描述',
  `ImageId` varchar(255) DEFAULT NULL COMMENT '镜像ID',
  `RegionId` varchar(255) DEFAULT NULL COMMENT '实例所属地域ID',
  `ZoneId` varchar(255) DEFAULT NULL COMMENT '实例所属可用区',
  `CPU` int(11) DEFAULT NULL COMMENT 'CPU 核数',
  `Memory` int(11) DEFAULT NULL COMMENT '内存大小，单位为 MB',
  `InstanceType` varchar(255) DEFAULT NULL COMMENT '实例资源规格',
  `InstanceTypeFamily` varchar(255) DEFAULT NULL COMMENT '实例规格族',
  `HostName` varchar(255) DEFAULT NULL COMMENT '实例机器名称',
  `SerialNumber` varchar(255) DEFAULT NULL COMMENT '实例机器的序列号',
  `Status` varchar(255) DEFAULT NULL COMMENT '实例状态',
  `SecurityGroupIds` varchar(255) DEFAULT NULL COMMENT '实例所属安全组的集合 SecurityGroupIdSetType。',
  `PublicIpAddress` varchar(255) DEFAULT NULL COMMENT '实例的公网 IP 地址，参见 IpAddressSetType',
  `InternetMaxBandwidthIn` int(11) DEFAULT NULL COMMENT '公网入带宽最大值',
  `InternetMaxBandwidthOut` int(11) DEFAULT NULL COMMENT '公网出带宽最大值',
  `InternetChargeType` varchar(255) DEFAULT NULL COMMENT '网络计费类型，PayByBandwidth | PayByTraffic两个值中的一个。预付费实例显示PayByBandwidth（按带宽计费）。PayByTraffic：按流量计费PayByBandwidth：按带宽计费',
  `CreationTime` varchar(255) DEFAULT NULL COMMENT '创建时间。按照ISO8601标准表示，并需要使用UTC时间。格式为：YYYY-MM-DDThh:mmZ',
  `VpcAttributes` varchar(255) DEFAULT NULL COMMENT 'VpcAttributesType类型',
  `EipAddress` varchar(255) DEFAULT NULL COMMENT 'EipAddressAssociateType类型',
  `InnerIpAddress` varchar(255) DEFAULT NULL COMMENT '实例的内网 IP 地址，参见 IpAddressSetType',
  `InstanceNetworkType` varchar(255) DEFAULT NULL COMMENT '实例网络类型，可选值Classic | Vpc',
  `OperationLocks` varchar(255) DEFAULT NULL COMMENT '锁定列表',
  `InstanceChargeType` varchar(255) DEFAULT NULL COMMENT '实例的付费方式。PrePaid：预付费，即包年包月PostPaid：后付费，即按量付费',
  `DeviceAvailable` varchar(255) DEFAULT NULL COMMENT '实例是否还可以挂载磁盘。 True | False',
  `IoOptimized` varchar(255) DEFAULT NULL COMMENT '是否是 IO 优化型实例 True | False',
  `ExpiredTime` varchar(255) DEFAULT NULL COMMENT '过期时间 按照ISO8601标准表示，并需要使用UTC时间。格式为： YYYY-MM-DDThh:mmZ',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='实例列表';

-- ----------------------------
-- Table structure for op_describe_regions
-- ----------------------------
DROP TABLE IF EXISTS `op_describe_regions`;
CREATE TABLE `op_describe_regions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
`request_id` varchar(100) DEFAULT NULL COMMENT '请求 ID',
  `params_sha1` varchar(100) NOT NULL COMMENT '请求 API SHA1',
  `RegionId` varchar(255) DEFAULT NULL COMMENT 'Region ID',
  `LocalName` varchar(255) DEFAULT NULL COMMENT 'Region名称',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='可用区域列表';

-- ----------------------------
-- Table structure for op_request_log
-- ----------------------------
DROP TABLE IF EXISTS `op_request_log`;
CREATE TABLE `op_request_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `uri` varchar(100) DEFAULT NULL COMMENT '路由',
  `method` varchar(30) NOT NULL COMMENT 'method',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `http_status` smallint(5) DEFAULT NULL COMMENT 'HTTP 状态码',
  `return` text COMMENT '返回',
  `sha1` varchar(100) DEFAULT NULL COMMENT 'SHA1 of uri & params & return ',
  `time_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '时间使用量S',
  `memory_usage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '内存使用量MB',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='请求日志';

-- ----------------------------
-- Table structure for op_request_params
-- ----------------------------
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请求参数日志';

