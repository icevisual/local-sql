SELECT
	c.company_id,
	c.quit_at,
	c.updated_at,
	uc.*
FROM
	xb_company c
JOIN xb_user_company uc ON uc.company_id = c.company_id
WHERE
	c.`status` = 2
AND c.updated_at = uc.updated_at;

UPDATE xb_company c
JOIN xb_user_company uc ON uc.company_id = c.company_id
SET uc.`status` = 1,
 c.`status` = 1,
 uc.quit_at = NULL
WHERE
	c.`status` = 2
AND c.updated_at = uc.updated_at;

