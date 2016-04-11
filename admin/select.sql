

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
