SELECT
	*
FROM
	`op_aliyun_api_request_log`
WHERE
	`request_api` = 'DescribeInstances'
AND `expired_at` > '2017-02-23 16:17:20'
ORDER BY
	`created_at` DESC
LIMIT 1 [] []

SELECT COLUMN_NAME FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'op_describe_instances'


### 记录 API 请求结果（历史）

请求
  

时间、接口、参数、返回、错误、异常  

结果集合

请求ID、数据列

### 化作 系统可查询的记录结果（最新）



DROP TABLE IF EXISTS `op_aliyun_api_request_log`;
CREATE TABLE `op_aliyun_api_request_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_at` timestamp NULL DEFAULT NULL COMMENT '请求时间',
  `request_api` varchar(100) NOT NULL COMMENT '请求 API',
  `paramaters` varchar(100) DEFAULT NULL COMMENT '请求参数',
  `RequestId` varchar(255) DEFAULT NULL  COMMENT '返回信息',
  `error` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `exception` varchar(255) DEFAULT NULL COMMENT '异常信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='阿里云 API 请求日志';



DROP TABLE IF EXISTS `op_describe_instances`;
CREATE TABLE `op_describe_instances` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` int(11)  NULL COMMENT '请求 ID',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实例列表';















