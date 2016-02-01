



CREATE DATABASE gzb_ol_0720


15952242538


DELETE FROM gzb_user_cheat where phone = '18667032400';
DELETE FROM gzb_user_cheat where phone = '15868880465';
15868880465


DELETE FROM gzb_user_cheat where phone = '18261196520';
DELETE FROM gzb_user_cheat where phone = '15951707483';
DELETE FROM gzb_user_cheat where phone = '15555065515';
DELETE FROM gzb_user_cheat where phone = '18827358271';
DELETE FROM gzb_user_cheat where phone = '18658196556';
DELETE FROM gzb_user_cheat where phone = '13716705321';
DELETE FROM gzb_user_cheat where phone = '18958027751';
DELETE FROM gzb_user_cheat where phone = '18667032400';
DELETE FROM gzb_user_cheat where phone = '18257105887';
DELETE FROM gzb_user_cheat where phone = '13003623146';
DELETE FROM gzb_user_cheat where phone = '15868880465';
DELETE FROM gzb_user_cheat where phone = '15814408725';
DELETE FROM gzb_user_cheat where phone = '13505818794';
DELETE FROM gzb_user_cheat where phone = '13612689893';
DELETE FROM gzb_user_cheat where phone = '13412187068';
DELETE FROM gzb_user_cheat where phone = '13480055066';
DELETE FROM gzb_user_cheat where phone = '13823839358';
DELETE FROM gzb_user_cheat where phone = '13627701989';
DELETE FROM gzb_user_cheat where phone = '18929405188';






{
    "resultcode": "200",
    "reason": "Return Successd!",
    "result": {
        "province": "浙江",
        "city": "杭州",
        "areacode": "0571",
        "zip": "310000",
        "company": "中国移动",
        "card": "移动动感地带卡"
    }
}

select `gzb_a`.`uid`, `phone` from `gzb_user_redpacket` as `gzb_r` inner join `gzb_user_account` as `gzb_a` on `gzb_a`.`uid` = `gzb_r`.`uid`


CREATE TABLE `gzb_phone_home` (
  `phone` 		varchar(50) NOT NULL COMMENT '手机',
	`province` 	varchar(20) DEFAULT NULL COMMENT '省',
	`city` 			varchar(20) DEFAULT NULL COMMENT '市',
	`areacode` 	varchar(20) DEFAULT NULL COMMENT '区',
	`zip` 			varchar(20) DEFAULT NULL COMMENT '邮编',
	`company` 	varchar(20) DEFAULT NULL COMMENT '运营商',
	`card` 			varchar(20) DEFAULT NULL COMMENT '卡类型',
  PRIMARY KEY (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机号码归属地';



select `phone` from `gzb_user_account` where `phone` is null and `city` is null limit 10















select * FROM gzb_user_cheat WHERE registered_at < '2015-07-01 00:00:00' AND area_id is null
desc gzb_user_account

e41c125c02b30f70735ee7ff9aa6468e	lqmMlEiP
UPDATE gzb_user_account SET password = 'e41c125c02b30f70735ee7ff9aa6468e',salt = 'lqmMlEiP';


SELECT a.uid ,a.phone
			FROM gzb_user_account a
			INNER JOIN gzb_order_main m on a.uid = m.uid
			INNER JOIN gzb_user_address addr on addr.uid= a.uid
			WHERE a.created_at < '2015-07-11 00:00:00'
			AND addr.type= 1
			AND addr.area_id in (26,27,28,29,30,31,32,3234,3235,3236,3237,3238,3239,33,34,37,39,41,43,47,3240,3241,3242,3243,48,49,50,51,52,53,54,3244,3245,3246,3247,55,56,57,58,59,60,3248,61,62,63,64,3249,65,66,67,68,3250,3251,69,70,71,72,3252,3253,3254,3255,3256,73,74,75,76,77,78,84,85,86,87,91,92,93,94,95,96,97,98,3257,99,100,101,102,103,104,105,106,3258,1772,1773,1774,1775,1776,1777,1778,1779,1780,1781,1782,1783,1784,1786,1787,1788,1789,1790,1791,1792,1793,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1807,1808,1809,1810,1811,1812,1813,1815,1816,1817,1818,1819,1820,1821,1822,1823,1824,1825,1827,1828,1829,1830,1831,1832,1833,1834,1836,1837,1838,1839,1840,1841,1842,1844,1845,1846,1847,1848,1849,1850,1851,1853,1854,1855,1856,1857,1858,1859,1860,1861,1863,1864,1865,1866,1867,1868,1869,1871,1872,1873,1874,1875,1876,1878,1879,1880,1881,1882,1883,1885,1886,1887,1888,1889,2741,2742,2743,2744,2745,2746,2747,2748,2749,2750,2751,2752,2753,2754,2755,2756,2757,2758,2759)
			GROUP BY a.uid



93054


SELECT t.*,c.my_code ,c.from_code ,r.id,r.type 
				FROM  gzb_user_redpacket_withdraw_task t 
				INNER JOIN gzb_user_redpacket_code c on (  t.uid = c.uid  )
				LEFT JOIN gzb_user_redpacket r on ( r.relation_id = t.uid	and r.type = 2  )
				WHERE  r.id is null  
					and t.`status` = 1  
					and c.from_code = '93054'   
				GROUP BY t.uid

SELECT t.*,c.my_code ,c.from_code ,r.id,r.type 
				FROM  gzb_user_redpacket_withdraw_task t 
				INNER JOIN gzb_user_redpacket_code c on (  t.uid = c.uid  )
				LEFT JOIN gzb_user_redpacket r on ( r.relation_id = t.uid	  )
				WHERE  r.id is null  
					and t.`status` = 1  
					and c.from_code = '93054'  
					and r.type = 2
				GROUP BY t.uid


CALL select_info('18698572586');


DROP PROCEDURE IF EXISTS `select_info`;
CREATE PROCEDURE select_info(IN in_phone VARCHAR(20))  
BEGIN   
	DECLARE uuid INT(11);   
	DECLARE umy_code VARCHAR(20);   
	DECLARE is_cheat VARCHAR(20);
	DECLARE is_black VARCHAR(20);
  DECLARE is_from_black VARCHAR(20);
	DECLARE is_from_cheat VARCHAR(20);
	DECLARE ufrom_code VARCHAR(20);
	DECLARE ufrom_uid INT(11);
	DECLARE ufrom_phone VARCHAR(20);
	SELECT uid INTO uuid FROM gzb_user_account WHERE phone = in_phone LIMIT 1;
	IF uuid is not NULL THEN
		#user cheat
		SELECT phone INTO is_cheat FROM gzb_user_cheat WHERE phone = in_phone;
		IF is_cheat IS NOT NULL THEN
			SET is_cheat = 'YES';
		ELSE
			SET is_cheat = 'NO';
		END IF;
		SELECT my_code,from_code,from_uid INTO umy_code,ufrom_code,ufrom_uid  FROM gzb_user_redpacket_code WHERE uid = uuid;
		SELECT credit_status INTO is_black FROM gzb_user_info WHERE uid = uuid;
		#from user cheat
		IF ufrom_code IS NOT NULL THEN
			SELECT phone INTO ufrom_phone FROM gzb_user_account WHERE  uid = ufrom_uid;
			SELECT phone INTO is_from_cheat FROM gzb_user_cheat WHERE phone = ufrom_phone;
			SELECT credit_status INTO is_from_black FROM gzb_user_info WHERE uid = ufrom_uid;
			IF is_from_cheat IS NOT NULL THEN
				SET is_from_cheat = 'YES';
			ELSE
				SET is_from_cheat = 'NO';
			END IF;
		
			IF is_from_black = 3 THEN
				SET is_from_black = 'YES';
			ELSE
				SET is_from_black = 'NO';
			END IF;
		END IF;
		IF is_black = 3 THEN
			SET is_black = 'YES';
		ELSE
			SET is_black = 'NO';
		END IF;

		SELECT 	in_phone  ,
						uuid      ,
						umy_code,
						is_cheat,
						is_black   ,
						ufrom_phone,
						ufrom_uid,
						ufrom_code,
						is_from_cheat,
						is_from_black;
	ELSE
		SELECT 'UID Not Found';
	END IF;
END;


SELECT * FROM gzb_user_cheat WHERE identity = '452130198802175116'

SELECT * FROM gzb_user_redpacket_code WHERE my_code = '04483'

230702198402040516

SELECT * FROM gzb_user_cheat WHERE phone = '13675163613'


SELECT count(*) FROM gzb_user_cheat

SELECT * FROM gzb_user_account WHERE phone = '13456788716'

SELECT * FROM gzb_order_main where uid  = 25

25
13456788716

SELECT * FROM gzb_user_address addr WHERE addr.address  like '浙江%' 

SELECT * FROM gzb_user_address addr WHERE addr.address not like '浙江%' or 
								addr.address not like '上海%' or
								addr.address not like '江苏%' 


SELECT a.phone,a.created_at registered_at,addr.area_id,addr.address,addr.tel,i.identity
			FROM gzb_user_account a
			LEFT JOIN gzb_order_main m on a.uid = m.uid
			LEFT JOIN gzb_user_address addr on addr.uid= a.uid
			LEFT JOIN gzb_user_info i on i.uid = a.uid
			WHERE a.created_at <'2015-07-13 23:59:59'
			AND ( 
					(m.uid is null)  
					or  (
						addr.uid is not null 
						and addr.type= 1 
						and
							( 
								addr.address not like '浙江%' or 
								addr.address not like '上海%' or
								addr.address not like '江苏%' 
							)
						) 
					or  (
					 	addr.uid is null
					)
					or (
						addr.uid is not null 
						and addr.type= 1 
						and addr.area_id is null
					)
				)
			GROUP BY a.uid



SELECT * FROM gzb_user_account WHERE phone = '13913743534'


SELECT count(*) FROM gzb_user_cheat 


WHERE phone = '13913743534'



5579

SELECT * FROM gzb_user_address WHERE uid = 5579


SELECT * FROM gzb_user_account WHERE uid = 168
SELECT * FROM gzb_user_cheat WHERE phone = '15868880465'
15868880465


SELECT * FROM gzb_user_address WHERE type = 0


SELECT * FROM gzb_user_address WHERE type = 1 AND area_id = 0

SELECT * FROM gzb_area WHERE cid in (	26,27,28,29,30,31,32,3234,3235,3236,3237,3238,3239,33,34,37,39,41,43,47,3240,3241,3242,3243,48,49,50,51,52,53,54,3244,3245,3246,3247,55,56,57,58,59,60,3248,61,62,63,64,3249,65,66,67,68,3250,3251,69,70,71,72,3252,3253,3254,3255,3256,73,74,75,76,77,78,84,85,86,87,91,92,93,94,95,96,97,98,3257,99,100,101,102,103,104,105,106,3258,1772,1773,1774,1775,1776,1777,1778,1779,1780,1781,1782,1783,1784,1786,1787,1788,1789,1790,1791,1792,1793,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1807,1808,1809,1810,1811,1812,1813,1815,1816,1817,1818,1819,1820,1821,1822,1823,1824,1825,1827,1828,1829,1830,1831,1832,1833,1834,1836,1837,1838,1839,1840,1841,1842,1844,1845,1846,1847,1848,1849,1850,1851,1853,1854,1855,1856,1857,1858,1859,1860,1861,1863,1864,1865,1866,1867,1868,1869,1871,1872,1873,1874,1875,1876,1878,1879,1880,1881,1882,1883,1885,1886,1887,1888,1889,2741,2742,2743,2744,2745,2746,2747,2748,2749,2750,2751,2752,2753,2754,2755,2756,2757,2758,2759
)



SELECT a.uid,a.phone,m.orderid,addr.* 
FROM gzb_user_account a 
INNER JOIN gzb_order_main m on a.uid = m.uid
INNER JOIN gzb_user_address addr on addr.uid= a.uid
WHERE a.created_at < '2015-07-10 00:00:00'
AND addr.type= 1
AND addr.area_id in (	26,27,28,29,30,31,32,3234,3235,3236,3237,3238,3239,33,34,37,39,41,43,47,3240,3241,3242,3243,48,49,50,51,52,53,54,3244,3245,3246,3247,55,56,57,58,59,60,3248,61,62,63,64,3249,65,66,67,68,3250,3251,69,70,71,72,3252,3253,3254,3255,3256,73,74,75,76,77,78,84,85,86,87,91,92,93,94,95,96,97,98,3257,99,100,101,102,103,104,105,106,3258,1772,1773,1774,1775,1776,1777,1778,1779,1780,1781,1782,1783,1784,1786,1787,1788,1789,1790,1791,1792,1793,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1807,1808,1809,1810,1811,1812,1813,1815,1816,1817,1818,1819,1820,1821,1822,1823,1824,1825,1827,1828,1829,1830,1831,1832,1833,1834,1836,1837,1838,1839,1840,1841,1842,1844,1845,1846,1847,1848,1849,1850,1851,1853,1854,1855,1856,1857,1858,1859,1860,1861,1863,1864,1865,1866,1867,1868,1869,1871,1872,1873,1874,1875,1876,1878,1879,1880,1881,1882,1883,1885,1886,1887,1888,1889,2741,2742,2743,2744,2745,2746,2747,2748,2749,2750,2751,2752,2753,2754,2755,2756,2757,2758,2759)
AND a.uid = ?
GROUP BY a.uid

SELECT a.uid,m.*
FROM gzb_user_account a 
INNER JOIN gzb_order_main m on a.uid = m.uid
INNER JOIN gzb_user_address addr on addr.uid= a.uid
WHERE a.created_at < '2015-07-10 00:00:00'

SELECT *
FROM gzb_user_account a 
WHERE a.created_at < '2015-07-10 00:00:00'

SELECT a.uid,a.phone,i.* FROM gzb_user_account a 
LEFT JOIN gzb_order_main m on a.uid = m.uid
LEFT JOIN gzb_user_info i on i.uid= a.uid
WHERE m.orderid is NULL



SELECT a.uid,a.phone,i.* FROM gzb_user_account a 
LEFT JOIN gzb_order_main m on a.uid = m.uid
LEFT JOIN gzb_user_info i on i.uid= a.uid
WHERE m.orderid is NULL AND i.uid is not NULL

CREATE TABLE `gzb_user_cheat` (
  `uid` int(11) unsigned NOT NULL COMMENT '账户ID',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `sex` tinyint(2) unsigned DEFAULT NULL COMMENT '性别 0 女性，1男性',
  `age` tinyint(3) unsigned DEFAULT NULL COMMENT '年龄',
  `qq` varchar(15) DEFAULT NULL COMMENT 'QQ号',
  `wechat` varchar(40) DEFAULT NULL COMMENT '微信',
  `email` varchar(40) DEFAULT NULL COMMENT '邮箱',
  `company` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `identity` varchar(20) DEFAULT NULL COMMENT '身份证',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `process_at` timestamp NULL DEFAULT NULL COMMENT '每次的处理时间',
  `audit_status` tinyint(2) DEFAULT NULL COMMENT '0：审核中 2：审核通过，3：审核失败',
  `credit_status` tinyint(2) unsigned DEFAULT NULL COMMENT '账户信用状态 0 无记录，1，信誉良好，2 有过逾期 ，3 黑名单 4，同盾可疑账户 5，四要素不一致',
  `credit_status_info` varchar(100) DEFAULT NULL COMMENT '四要素不通过原因',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `identity` (`identity`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户详细信息表';


