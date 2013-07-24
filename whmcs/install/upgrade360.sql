CREATE TABLE IF NOT EXISTS `tbladminroles` (  `id` int(1) NOT NULL auto_increment,  `name` text COLLATE utf8_general_ci NOT NULL,  `systememails` int(1) NOT NULL,  `accountemails` int(1) NOT NULL,  `supportemails` int(1) NOT NULL,  PRIMARY KEY  (`id`)) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
INSERT INTO `tbladminroles` (`id`, `name`, `systememails`, `accountemails`, `supportemails`) VALUES(1, 'Full Administrator', 1, 1, 1);
INSERT INTO `tbladminroles` (`id`, `name`, `systememails`, `accountemails`, `supportemails`) VALUES(2, 'Sales Operator', 0, 1, 1);
INSERT INTO `tbladminroles` (`id`, `name`, `systememails`, `accountemails`, `supportemails`) VALUES(3, 'Support Operator', 0, 0, 1);
CREATE TABLE IF NOT EXISTS `tbladminperms` (  `roleid` int(1) NOT NULL,  `permid` int(1) NOT NULL) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
INSERT INTO `tbladminperms` (`roleid`, `permid`) VALUES(1, 1),(1, 2),(1, 3),(1, 4),(1, 5),(1, 6),(1, 7),(1, 8),(1, 9),(1, 10),(1, 11),(1, 12),(1, 13),(1, 14),(1, 15),(1, 16),(1, 17),(1, 18),(1, 19),(1, 20),(1, 21),(1, 22),(1, 23),(1, 24),(1, 25),(1, 26),(1, 27),(1, 28),(1, 29),(1, 30),(1, 31),(1, 32),(1, 33),(1, 34),(1, 35),(1, 36),(1, 37),(1, 38),(1, 39),(1, 40),(1, 41),(1, 42),(1, 43),(1, 44),(1, 45),(1, 46),(1, 47),(1, 48),(1, 49),(1, 50),(1, 51),(1, 52),(1, 53),(1, 54),(1, 55),(1, 56),(1, 57),(1, 58),(1, 59),(1, 60),(1, 61),(1, 62),(1, 63),(1, 64),(1, 65),(1, 66),(1, 67),(1, 68),(1, 69),(1, 70),(1, 71),(1, 72),(1, 73),(1, 74),(1, 75),(1, 76),(1, 77),(1, 78),(1, 79),(1, 80),(1, 81),(1, 82),(1, 83),(2, 1),(2, 2),(2, 3),(2, 4),(2, 5),(2, 6),(2, 7),(2, 8),(2, 9),(2, 10),(2, 11),(2, 12),(2, 13),(2, 14),(2, 15),(2, 16),(2, 17),(2, 18),(2, 19),(2, 20),(2, 21),(2, 22),(2, 23),(2, 24),(2, 25),(2, 26),(2, 27),(2, 28),(2, 29),(2, 30),(2, 31),(2, 32),(2, 33),(2, 34),(2, 35),(2, 36),(2, 37),(2, 38),(2, 39),(2, 40),(2, 41),(2, 42),(2, 43),(2, 44),(2, 45),(2, 46),(2, 47),(2, 48),(2, 49),(2, 50),(2, 51),(2, 52),(3, 38),(3, 39),(3, 40),(3, 41),(3, 42),(3, 43),(3, 44),(3, 50);
ALTER TABLE `tbladmins` ADD `roleid` INT( 1 ) NOT NULL AFTER `id` ;
ALTER TABLE `tblticketdepartments` ADD `noautoresponder` TEXT NOT NULL AFTER `clientsonly` ;
UPDATE `tblconfiguration` SET `setting`='CaptchaSetting' WHERE `setting`='DisableCapatcha';
INSERT INTO `tblconfiguration` (`setting`, `value`) VALUES ('DisableClientDropdown', '');
INSERT INTO `tblemailtemplates` (`type`, `name`, `subject`, `message`, `fromname`, `fromemail`, `disabled`, `custom`, `language`, `copyto`, `plaintext`) VALUES('general', 'Credit Card Expiring Soon', 'Credit Card Expiring Soon', '<p>Dear [CustomerName], </p><p>This is a notice to inform you that your [CCType] credit card ending with [CCLastFour] will be expiring next month on [CCExpiryDate]. Please login to update your credit card information as soon as possible and prevent any interuptions in service at [ClientAreaLink]<br /><br />If you have any questions regarding your account, please open a support ticket from the client area.</p><p>[Signature]</p>', '', '', '', '', '', '', 0);
CREATE TABLE IF NOT EXISTS `tbllinks` (`id` INT( 1 ) NOT NULL AUTO_INCREMENT PRIMARY KEY ,`name` TEXT COLLATE utf8_general_ci NOT NULL ,`link` TEXT COLLATE utf8_general_ci NOT NULL ,`clicks` INT( 1 ) NOT NULL ,`conversions` INT( 1 ) NOT NULL ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
UPDATE tbladmins SET roleid='1' WHERE userlevel='3';
UPDATE tbladmins SET roleid='2' WHERE userlevel='2';
UPDATE tbladmins SET roleid='3' WHERE userlevel='1';
ALTER TABLE `tbladmins` DROP `userlevel` ;
ALTER TABLE `tbladmins` DROP `ordernotifications` ;
INSERT INTO `tblconfiguration` (`setting` ,`value` )VALUES ('CCProcessDaysBefore', '0');
INSERT INTO `tblconfiguration` (`setting` ,`value` )VALUES ('CCAttemptOnlyOnce', '');
INSERT INTO `tblconfiguration` (`setting` ,`value` )VALUES ('CCDaySendExpiryNotices', '25');
UPDATE tblclients SET country = 'SH' WHERE country = 'AC';
UPDATE tblclients SET country = 'TL' WHERE country = 'TP';
UPDATE tblclients SET country = 'GQ' WHERE country = 'GC';
UPDATE tblclients SET country = 'FR' WHERE country = 'FX';
UPDATE tblclients SET country = 'GH' WHERE country = 'GA';
UPDATE tblclients SET country = 'GI' WHERE country = 'BI';
UPDATE tblclients SET country = 'IM' WHERE country = 'GB4';
UPDATE tblclients SET country = 'JE' WHERE country = 'JR';
UPDATE tblclients SET country = 'GB' WHERE country = 'UK';
UPDATE tblclients SET country = 'RS' WHERE country = 'YU';
UPDATE tblclients SET country = 'CD' WHERE country = 'ZR';
UPDATE tbltax SET country = 'SH' WHERE country = 'AC';
UPDATE tbltax SET country = 'TL' WHERE country = 'TP';
UPDATE tbltax SET country = 'GQ' WHERE country = 'GC';
UPDATE tbltax SET country = 'FR' WHERE country = 'FX';
UPDATE tbltax SET country = 'GH' WHERE country = 'GA';
UPDATE tbltax SET country = 'GI' WHERE country = 'BI';
UPDATE tbltax SET country = 'IM' WHERE country = 'GB4';
UPDATE tbltax SET country = 'JE' WHERE country = 'JR';
UPDATE tbltax SET country = 'GB' WHERE country = 'UK';
UPDATE tbltax SET country = 'RS' WHERE country = 'YU';
UPDATE tbltax SET country = 'CD' WHERE country = 'ZR';
CREATE TABLE IF NOT EXISTS `tblaffiliateswithdrawals` (`id` INT( 1 ) NOT NULL AUTO_INCREMENT PRIMARY KEY ,`affiliateid` INT( 3 ) NOT NULL ,`date` DATE NOT NULL ,`description` TEXT NOT NULL ,`amount` DECIMAL( 10, 2 ) NOT NULL );
UPDATE tblinvoiceitems SET type='LateFee' WHERE description LIKE 'Late Fee%';
UPDATE tblconfiguration SET value='3.6.0' WHERE setting='Version';