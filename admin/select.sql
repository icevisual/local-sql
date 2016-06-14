INSERT INTO `admin`.`adm_actions` (
	`actionid`,
	`actionname`,
	`actioninfo`,
	`action`,
	`controller`,
	`directory`,
	`viewmode`,
	`parentid`,
	`secondid`,
	`linkmode`,
	`masterid`,
	`mastername`,
	`systemid`,
	`created_at`,
	`updated_at`
)
VALUES
	(
		'393',
		'数据字典管理',
		'',
		'config_ops',
		'common',
		'xjb',
		'1',
		'389',
		'393',
		'0',
		'59',
		'admin',
		'1',
		'2016-06-02 19:13:48',
		'2016-06-02 19:13:48'
	);







SELECT * FROM adm_actions a1 LEFT JOIN adm_actions a2 on a1.parentid = a2.actionid 
WHERE a2.actionid is NULL AND a1.parentid > 0 

DELETE FROM adm_actions WHERE actionid in (
366,
372,
373,
378,
379,
380,
381,
383,
384,
385
);
