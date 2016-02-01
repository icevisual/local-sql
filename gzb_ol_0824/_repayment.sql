
DROP PROCEDURE IF EXISTS `__repayment`;
CREATE PROCEDURE `__repayment`() 
BEGIN 
	DECLARE _uid VARCHAR(50);
	DECLARE _area_id VARCHAR(50);
	DECLARE _company VARCHAR(50) character set 'utf8';
	DECLARE _orderid VARCHAR(50);
	DECLARE _name VARCHAR(50) character set 'utf8';
	DECLARE _identity VARCHAR(50);
	DECLARE _phone VARCHAR(50);
	DECLARE _playingTime VARCHAR(50);
	DECLARE _price VARCHAR(50);
	DECLARE _periods VARCHAR(50);
	DECLARE _payday VARCHAR(50);
	DECLARE _periods_price VARCHAR(50);
	DECLARE _shouldPayDay VARCHAR(50);
	DECLARE _tot_price VARCHAR(50);
	DECLARE _orderPayId VARCHAR(50);
	DECLARE _status VARCHAR(50);
	DECLARE _pay_price DECIMAL(9,2) ;
	DECLARE _early_price DECIMAL(9,2) ;
	DECLARE _dalay_price DECIMAL(9,2) ;
	DECLARE _realPayDay VARCHAR(50);
	DECLARE _payType VARCHAR(50);
	DECLARE _numericalorder VARCHAR(50);
	DECLARE _realMoney DECIMAL(9,2) ;
	DECLARE _deduction DECIMAL(9,2) ;
	DECLARE _payDifference DECIMAL(9,2) ;
	
	DECLARE _payTypeName VARCHAR(50) character set 'utf8';
	DECLARE _nowMonthNeedPay DECIMAL(9,2) ;
	DECLARE _overstay VARCHAR(50);
	DECLARE _difference DECIMAL(9,2) ;
	DECLARE _realPrincipalInterest DECIMAL(9,2) ;


	DECLARE fetchSeqOk BOOLEAN ;
	DECLARE _CURSOR CURSOR FOR 
			select `gzb_user_account`.`uid`
			, `gzb_user_address`.`area_id`
			, `gzb_user_info`.`company`
			, `gzb_order_main`.`orderid`
			, `gzb_user_info`.`name`
			, `gzb_user_info`.`identity`
			, `gzb_user_account`.`phone`
			, `gzb_order_main`.`pay_at` as `playingTime`
			, `gzb_order_periods`.`price`
			, `gzb_order_periods`.`periods`
			, `gzb_order_periods`.`payday`
			, `gzb_order_periods`.`periods_price`
			, `gzb_order_pay`.`pay_at` as `shouldPayDay`
			, `gzb_order_periods`.`tot_price`
			, `gzb_order_pay`.`id` as `orderPayId`
			, `gzb_order_pay`.`status`
			, `gzb_order_pay`.`pay_price`
			, `gzb_order_pay`.`early_price`
			, `gzb_order_pay`.`dalay_price`
			, `gzb_order_pay`.`payment_at` as `realPayDay`
			, `gzb_order_pay_task`.`pay_type` as `payType`
			, `gzb_order_pay_task`.`id` as `numericalorder`
			, `gzb_order_pay_task`.`pay_price` as `realMoney`
			, `gzb_order_pay_task`.`deduction_price` as `deduction`
			, `gzb_order_pay_task`.`difference` as `payDifference`
			from `gzb_order_pay` 
			inner join `gzb_user_account` on `gzb_user_account`.`uid` = `gzb_order_pay`.`uid` 
			inner join `gzb_order_main` on `gzb_order_main`.`orderid` = `gzb_order_pay`.`orderid` 
			inner join `gzb_order_periods` on `gzb_order_periods`.`orderid` = `gzb_order_main`.`orderid` 
			inner join `gzb_user_info` on `gzb_order_pay`.`uid` = `gzb_user_info`.`uid` 
			inner join `gzb_user_address` on `gzb_user_address`.`uid` = `gzb_user_info`.`uid` 
			left join `gzb_order_pay_task` on `gzb_order_pay_task`.`id` = `gzb_order_pay`.`pay_task_id` 
			where `gzb_user_address`.`type` = '1' 
			and `gzb_user_account`.`uid` not in 
			('1', '12', '28', '34', '85', '106', '170', '5468',
			'5478', '5795', '8482', '8525', '103887', '117273',
			'118124', '27653', '1133', '13', '108661', '130699', '168904'
			, '142667') 
			order by `gzb_order_main`.`orderid` asc , `gzb_order_pay`.`id` asc;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fetchSeqOk = true;#结束标识
	SET fetchSeqOk = FALSE;

	SET @ct = 0;
	OPEN _CURSOR;
	_CUR_LOOP:LOOP
		FETCH _CURSOR INTO 
			_uid,_area_id,_company,_orderid,_name,
			_identity,_phone,_playingTime,_price,_periods,
			_payday,_periods_price,_shouldPayDay,_tot_price,_orderPayId,
			_status,_pay_price,_early_price,_dalay_price,_realPayDay,
			_payType,_numericalorder,_realMoney,_deduction,_payDifference;
		IF fetchSeqOk = 1 THEN
			LEAVE _CUR_LOOP;
		ELSE
			IF _numericalorder = 0 THEN 
				SET _numericalorder = NULL;
			END IF;
			
			IF _status = 0 THEN
				SET _payTypeName = 'adsdsa';
			ELSE
				IF _payType = 0 THEN 
					SET _payTypeName = '支付宝';
				ELSEIF _payType = 1 THEN 
					SET _payTypeName = '一键支付';
				ELSEIF _payType = 2 THEN 
					SET _payTypeName = '代扣';
				ELSEIF _payType = 3 THEN 
					SET _payTypeName = '线下还款';
				ELSE
					SET _payTypeName = '未知';
				END IF;
			END IF;
			IF _status = 0 THEN 
				SET _nowMonthNeedPay = _early_price;
			ELSE	
				SET _nowMonthNeedPay = _pay_price;
			END IF;
			SET _periods_price = _pay_price;
			
			SET _overstay = 0 ;
			IF  _shouldPayDay < NOW() THEN
				IF _status = 0 THEN	
					SET _overstay = TO_DAYS(NOW()) - TO_DAYS(_shouldPayDay);
				ELSE
					SET _overstay = TO_DAYS(_realPayDay) - TO_DAYS(_shouldPayDay);
					IF _overstay < 0 THEN 
						SET _overstay = 0;
					END IF;
				END IF;
			END IF;
			
			SET _difference = _periods_price - _nowMonthNeedPay ;

			SET _realPrincipalInterest = 0;
			BEGIN
				declare done int;  
				declare __status int;
				declare __pay_price DECIMAL(9,2) ;
				declare __early_price DECIMAL(9,2) ;
				declare __deduction_price DECIMAL(9,2) ;
				declare cur_test CURSOR for 
					select 
						`gzb_order_pay`.`status`,
						`gzb_order_pay`.pay_price,
						`gzb_order_pay`.early_price,
						`gzb_order_pay_task`.`deduction_price` 
					from `gzb_order_pay` 
					left join `gzb_order_pay_task` on `gzb_order_pay_task`.`id` = `gzb_order_pay`.`pay_task_id` 
					where `gzb_order_pay`.`orderid` = _orderid 
					order by `gzb_order_pay`.`id` asc;
        declare continue handler FOR SQLSTATE '02000' SET done = 1;  
				OPEN cur_test;
				_cur_loop1:LOOP
					FETCH cur_test INTO __status,__pay_price,__early_price,__deduction_price;
					IF done = 1 THEN
						LEAVE _cur_loop1;
					ELSE
							IF __status = 2 THEN	
								SET _realPrincipalInterest = _realPrincipalInterest + __early_price;
							ELSE
								SET _realPrincipalInterest = _realPrincipalInterest + __pay_price;
							END IF;
					END IF;
				END LOOP;
				close cur_test;  
			END;
			   
		END IF;
	END LOOP;
	SELECT 
_uid,
_area_id,
_company,
_orderid,
_name,
_identity,
_phone,
_playingTime,
_price,
_periods,
_payday,
_periods_price,
_shouldPayDay,
_tot_price,
_orderPayId,
_status,
_pay_price,
_early_price,
_dalay_price,
_realPayDay,
_payType,
_numericalorder,
_realMoney,
_deduction,
_payDifference,
_realPrincipalInterest
;
END;


CALL __repayment();