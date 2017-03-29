CREATE TABLE `bookclass` (
  `Bcid` varchar(20) NOT NULL,
  `Bid` varchar(16) NOT NULL,
  `State` tinyint(3) unsigned NOT NULL,
  `Clerk` varchar(30) NOT NULL,
  `EnterDate` datetime NOT NULL,
  `price` double(24,2) NOT NULL,
  `sk` smallint(5) DEFAULT NULL,
  `inForm` int(10) DEFAULT NULL,
  `Ddid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Bid`),
  UNIQUE KEY `PK__BookClass__Bid__0A7D9A4A` (`Bid`),
  KEY `Bcid` (`Bcid`),
  KEY `State` (`State`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
rename table bookclass to bkbookclass;
select count(*)
from bookclass;
rename table booklist to bkbooklist;
CREATE TABLE `catbooklist` (
  `ISBN` varchar(30) DEFAULT NULL,
  `BCid` varchar(20) DEFAULT NULL,
  `Title` varchar(80) DEFAULT NULL,
  `Writer` varchar(60) DEFAULT NULL,
  `Epitome` varchar(200) DEFAULT NULL,
  `Pages` int(10) DEFAULT NULL,
  `Price` double(24,2) DEFAULT NULL,
  `PublishDate` datetime DEFAULT NULL,
  `PageMode` varchar(30) DEFAULT NULL,
  `Version` varchar(8) DEFAULT NULL,
  `extName` varchar(70) DEFAULT NULL,
  `translator` varchar(40) DEFAULT NULL,
  `keyword` varchar(60) DEFAULT NULL,
  `PubID` varchar(13) DEFAULT NULL,
  `id` int(10) NOT NULL,
  `publish` varchar(80) DEFAULT NULL,
  `adds` varchar(20) DEFAULT NULL,
  `Caste` int(10) default NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PK__CatbookList__38996AB8` (`id`),
  KEY `BCid` (`BCid`),
  KEY `ISBN` (`ISBN`),
  KEY `keyword` (`keyword`),catbooklist
  KEY `PubID` (`PubID`),
  KEY `PublishDate` (`PublishDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
select count(*) 
from catbooklist;