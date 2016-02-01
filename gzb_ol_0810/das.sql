


SELECT * FROM gzb_user_redpacket_withdraw_task WHERE order_id = 'RPT14394513756503970'

DROP TABLE IF EXISTS tmp;
CREATE TABLE tmp as
SELECT t.id tid,t.status t_status,r.id rid,r.status r_status
FROM gzb_user_redpacket_withdraw_task t
JOIN gzb_user_redpacket r ON r.withdraw_id = t.id
WHERE reason ='交易成功' AND t.`status` = 2;
UPDATE gzb_user_redpacket SET `status` = 2 WHERE id in (SELECT rid FROM tmp);
UPDATE gzb_user_redpacket_withdraw_task SET `status` = 1 WHERE id in (SELECT tid FROM tmp);
DROP TABLE tmp;



SELECT   
                M.orderid, 
                M.uid, 
                M.created_at, 
                M.STATUS as status, 
                M.pay_at, 
                M.updated_at, 
                M.order_task_id, 
                PE.price, 
                PE.tot_price, 
                PE.periods, 
                PE.periods_price, 
                PE.payday, 
                U.uid, 
                U. NAME as name, 
                U.identity, 
                U.company, 
                U.audit_status, 
                U.credit_status, 
                U.credit_status_info, 
                U.fraudmetrix_status, 
                AC.phone, 
                UA.area_id, 
                CRT.info,CRT.reason,OPT.poster
FROM (`gzb_order_main` M)
INNER JOIN `gzb_order_periods` PE ON `M`.`orderid`=`PE`.`orderid`
INNER JOIN `gzb_user_info` U ON `M`.`uid`=`U`.`uid`
INNER JOIN `gzb_user_address` UA ON `UA`.`uid`=`U`.`uid` AND UA.type=1
INNER JOIN `gzb_user_account` AC ON `AC`.`uid`=`U`.`uid`
LEFT JOIN `gzb_order_task` CRT ON `CRT`.`orderid`=`M`.`orderid` AND CRT.option="checkList"
LEFT JOIN (SELECT * FROM (`gzb_adm_options`) WHERE `option` = "order_option" GROUP BY `item_id`) OPT ON `OPT`.`item_id`=`M`.`orderid` ORDER BY M.created_at DESC LIMIT 0,50 



CALL select_info('13243241553');

SELECT * FROM gzb_user_account WHERE uid = 3405;


SELECT count(*) FROM gzb_user_redpacket_code

SELECT count(*),max(my_code) FROM gzb_user_redpacket_code WHERE uid is NULL
 
