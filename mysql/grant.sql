

oap

CREATE DATABASE ops;
GRANT ALL privileges ON ops.* TO 'ops'@'%' IDENTIFIED BY 'ops';
FLUSH PRIVILEGES;



CREATE DATABASE mijiu


CREATE DATABASE auto

GRANT ALL privileges ON auto.* TO 'automation'@'%' IDENTIFIED BY 'automation';
FLUSH PRIVILEGES;

CREATE DATABASE automation;
GRANT ALL privileges ON automation.* TO 'automation'@'%' IDENTIFIED BY 'automation';
FLUSH PRIVILEGES;


GRANT ALL privileges ON transfer.* TO 'transfer'@'%' IDENTIFIED BY 'transfer';
GRANT ALL privileges ON transfer.* TO 'transfer'@'localhost' IDENTIFIED BY 'transfer';

GRANT ALL privileges ON admin.* TO 'xb_admin'@'%' IDENTIFIED BY 'xb_admin';
FLUSH PRIVILEGES

CREATE DATABASE `intelligentMask` DEFAULT CHARSET=utf8




GRANT ALL privileges ON intelligentMask.* TO 'intelligentMask'@'localhost' IDENTIFIED BY '123456';


FLUSH PRIVILEGES



GRANT ALL privileges ON smell_open.* TO 'smell_open'@'%' IDENTIFIED BY 'smell_open';

GRANT SELECT ON renern_smell.sm_smell_device TO 'smell_open'@'%' IDENTIFIED BY 'smell_open';
FLUSH PRIVILEGES