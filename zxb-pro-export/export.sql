SELECT company_id, truename,bank_name,card_no,YURREF,pay_log_id,query_log_id FROM xb_salary_pay WHERE reason = '其他';


SELECT company_id,truename,bank_name,card_no,YURREF,pay_log_id,query_log_id,result_status,reason FROM xb_salary_pay WHERE bank_name = '中国建设银行';

SELECT company_id,truename,bank_name,card_no,YURREF,pay_log_id,query_log_id FROM xb_salary_pay WHERE reason = '其他' AND created_at < '20160616';

SELECT company_id,truename,bank_name,card_no,YURREF,pay_log_id,query_log_id,result_status,reason ,created_at FROM xb_salary_pay WHERE truename = '高飞';


仝玉良	I2016061517570010120360025	8879,8905,8903
高飞		I2016061522280010150160008	8967,8976,8974
李均均	I2016061522280010160220020	8978,8981,8979
郑纪现	I2016061610500010030050012	9023,9197,9029

仝玉良	中国建设银行	6217002260000023996 储蓄卡
李均均	中国农业银行	6228482081383476114 储蓄卡
高飞	中国农业银行	6228481331937948915

SELECT * FROM xb_fbsdk_log WHERE func_name = 'NTQNPEBP' and id BETWEEN 8879 and 8905 

SELECT * FROM xb_fbsdk_log WHERE func_name = 'NTQNPEBP' and id BETWEEN 6236		 and 6250 


SELECT * FROM xb_fbsdk_log WHERE id in (6236	, 6250,6250 )

select reason ,api_type FROM xb_salary_pay GROUP BY reason

SELECT truename,YURREF,pay_log_id,query_log_id FROM xb_salary_pay WHERE reason = '连接主机失败，请联系技术人员';