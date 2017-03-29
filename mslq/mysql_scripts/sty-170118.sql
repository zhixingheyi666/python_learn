select  *
from reader
order by depid;
truncate reader;
rename table lendwork to bklendwork;
drop table lendwork;
CREATE TABLE `lendwork` (
  `Rid` varchar(20) NOT NULL,
  `Bcid` varchar(20) NOT NULL,
  `LendDate` DATETIME NOT NULL ,
  `ReturnDate` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `BackDate` DATETIME NULL DEFAULT NULL,
  `loperator` varchar(30) NOT NULL,
  `boperator` varchar(30) DEFAULT NULL,
  `bid` varchar(16) NOT NULL,
  KEY `BackDate` (`BackDate`),
  KEY `Bcid1` (`Bcid`),
  KEY `bid` (`bid`),
  KEY `LendDate` (`LendDate`),
  KEY `ReturnDate` (`ReturnDate`),
  KEY `Rid` (`Rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
select count(*)
from lendwork;
truncate table lendwork;