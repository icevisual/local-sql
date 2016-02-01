18958057970


SELECT MIN(phone ) FROM gzb_user_account



DROP PROCEDURE IF EXISTS `delete_account`;
CREATE PROCEDURE delete_account(IN in_phone VARCHAR(20))  
BEGIN   
DECLARE uuid INT(11);   
SELECT uid INTO uuid FROM gzb_user_account WHERE phone = in_phone LIMIT 1;
IF uuid is not NULL THEN
	SELECT 'UID Not Found';
ELSE
	SELECT 'UID Not Found';
END IF;
END;


DROP PROCEDURE IF EXISTS `select_info`;
CREATE PROCEDURE select_info(IN in_phone VARCHAR(20))  
BEGIN   
	DECLARE uuid INT(11);   
	DECLARE umy_code VARCHAR(20);   
	DECLARE is_cheat VARCHAR(20);
	DECLARE ufrom_code VARCHAR(20);
	DECLARE ufrom_uid INT(11);
	SELECT uid INTO uuid FROM gzb_user_account WHERE phone = in_phone LIMIT 1;
	IF uuid is not NULL THEN
		SELECT phone INTO is_cheat FROM gzb_user_cheat WHERE phone = in_phone;
		IF is_cheat IS NOT NULL THEN
			SET is_cheat = 'YES';
		ELSE
			SET is_cheat = 'NO';
		END IF;
		SELECT my_code,from_code,from_uid INTO umy_code,ufrom_code,ufrom_uid  FROM gzb_user_redpacket_code WHERE uid = uuid;
		SELECT umy_code,ufrom_code,ufrom_uid;
	ELSE
		SELECT 'UID Not Found';
	END IF;
END;

SELECT * FROM gzb_user_cheat WHERE phone = '13295811997'
SELECT * FROM gzb_user_account WHERE  phone = '15014131501'
5478
02963	5468
SELECT * FROM gzb_user_redpacket_code WHERE uid = 5478
SELECT * FROM gzb_user_account WHERE  uid = 5468


15014131501









insert into `gzb_user_redpacket_withdraw`(`order_id`,`uid`,`status`,`amount`,`reason`,`info`,`created_at`)values('143691812558794342','55565','0','500','','','2015-07-08 09:20:25');

SELECT count(*) FROM gzb_user_redpacket_code WHERE uid is NOT NULL

SELECT * FROM gzb_user_redpacket_code WHERE my_code = '222222'

EXPLAIN SELECT * FROM gzb_user_redpacket_code WHERE my_code = '222222' 

UPDATE `gzb_user_redpacket_code` SET `uid` = '230399',`from_code` = '090152',`from_uid` = '414707'

explain  SELECT SQL_NO_CACHE t.*,c.my_code ,c.from_code 
FROM  gzb_user_redpacket_withdraw_task t 
INNER JOIN gzb_user_redpacket_code c on ( t.`status` = 1 and t.uid = c.uid and c.from_code = 34567 )
left JOIN gzb_user_redpacket r on (r.type = 2 and r.relation_id = t.uid )
WHERE  r.id is null
GROUP BY t.uid

 SELECT t.*,c.my_code ,c.from_code ,r.id
				FROM  gzb_user_redpacket_withdraw_task t 
				INNER JOIN gzb_user_redpacket_code c on (  t.uid = c.uid  )
				LEFT JOIN gzb_user_redpacket r on ( r.relation_id = t.uid  and r.type = 2 )
				WHERE	
					t.`status` = 1  
					and c.from_code = '15303'  
					and r.id is null 
				GROUP BY t.uid

explain SELECT SQL_NO_CACHE t.*,c.my_code ,c.from_code 
FROM  gzb_user_redpacket_withdraw_task t 
INNER JOIN gzb_user_redpacket_code c on (  t.uid = c.uid  )
left JOIN gzb_user_redpacket r on ( r.relation_id = t.uid )
WHERE  r.id is null  
	and t.`status` = 1  
	and c.from_code = 464119   
	and r.type = 2 
GROUP BY t.uid





SELECT RAND(),RAND();

UPDATE gzb_user_redpacket_code SET uid = null , from_code = null,from_uid = null

explain  SELECT SQL_NO_CACHE t.*,c.my_code ,c.from_code 
FROM  gzb_user_redpacket_withdraw_task t 
INNER JOIN gzb_user_redpacket_code c on c.uid = t.uid 
WHERE  not EXISTS (
	SELECT * FROM gzb_user_redpacket r WHERE  t.uid = r.relation_id AND r.type = 2 
) AND 
c.from_uid = 296 and t.`status` = 1  
GROUP BY t.uid

explain  SELECT SQL_NO_CACHE t.*,c.my_code ,c.from_code 
FROM  gzb_user_redpacket_withdraw_task t 
INNER JOIN gzb_user_redpacket_code c on c.uid = t.uid 
WHERE  not EXISTS (
	SELECT * FROM gzb_user_redpacket r WHERE  t.uid = r.relation_id AND r.type = 2 
) AND 
c.from_code = 69455 and t.`status` = 1  
GROUP BY t.uid











