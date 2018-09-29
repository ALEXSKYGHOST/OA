/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.41 : Database - oa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oa` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `oa`;

/*Table structure for table `bian` */

DROP TABLE IF EXISTS `bian`;

CREATE TABLE `bian` (
  `nid` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `ntime` varchar(200) DEFAULT NULL,
  `ncontent` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bian` */

insert  into `bian`(`nid`,`id`,`ntime`,`ncontent`) values (1,1,'11','111'),(11,1,'111','1111'),(1234567,1,'1234567','1234567'),(10,1,'2017','2017'),(6,1,'6','6'),(5,1,'5','5');

/*Table structure for table `contacts` */

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `sid` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `sname` varchar(200) DEFAULT NULL,
  `stel` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `FK_fk_10` (`id`),
  CONSTRAINT `FK_fk_10` FOREIGN KEY (`id`) REFERENCES `emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `contacts` */

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(200) DEFAULT NULL,
  `dept_des` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`did`,`dept_name`,`dept_des`) values (1,'财务部','负责公司财务方面'),(2,'人事部','负责公司人事管理'),(3,'研发部','负责产品研发'),(4,'执行部','负责公司行动');

/*Table structure for table `emp` */

DROP TABLE IF EXISTS `emp`;

CREATE TABLE `emp` (
  `id` int(11) NOT NULL,
  `did` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `pwd` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_01` (`did`),
  CONSTRAINT `FK_fk_01` FOREIGN KEY (`did`) REFERENCES `department` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emp` */

insert  into `emp`(`id`,`did`,`name`,`pwd`,`address`,`phone`,`birthday`,`status`) values (1,1,'123','123','222','13709107776','2018-07-06','实习'),(613,2,'吴彦祖','123','美国','13708167775','1974-09-30','实习'),(620,1,'马溢隆','123','陕西省咸阳市','13709108885','1996-08-15','实习'),(622,2,'李连杰','123','香港','13892077657','1964-04-26','实习');

/*Table structure for table `fk_12` */

DROP TABLE IF EXISTS `fk_12`;

CREATE TABLE `fk_12` (
  `pri_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`pri_id`,`role_id`),
  KEY `FK_fk_13` (`role_id`),
  CONSTRAINT `FK_fk_12` FOREIGN KEY (`pri_id`) REFERENCES `privilege` (`pri_id`),
  CONSTRAINT `FK_fk_13` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fk_12` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `gid` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `gname` varchar(200) DEFAULT NULL,
  `l_info` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `FK_fk_09` (`id`),
  CONSTRAINT `FK_fk_09` FOREIGN KEY (`id`) REFERENCES `emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

/*Table structure for table `lblank` */

DROP TABLE IF EXISTS `lblank`;

CREATE TABLE `lblank` (
  `lid` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `l_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `l_info` varchar(200) DEFAULT NULL,
  `h_status` varchar(20) DEFAULT NULL,
  `r_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `FK_fk_03` (`id`),
  CONSTRAINT `FK_fk_03` FOREIGN KEY (`id`) REFERENCES `emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lblank` */

/*Table structure for table `note` */

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `ntime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ncontent` varchar(200) DEFAULT NULL,
  KEY `FK_fk_05` (`id`),
  KEY `nid` (`nid`),
  CONSTRAINT `FK_fk_05` FOREIGN KEY (`id`) REFERENCES `emp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `note` */

insert  into `note`(`nid`,`id`,`ntime`,`ncontent`) values (9,613,'2018-07-18 10:19:59','	    明天上午公司进行项目研讨'),(10,613,'2018-07-18 10:20:35','	    对本次OA项目进行需求分析'),(11,620,'2018-07-18 10:21:54','	    公司下午进行OA项目功能整合'),(12,1,'2018-07-18 10:22:21','	    TEST');

/*Table structure for table `privilege` */

DROP TABLE IF EXISTS `privilege`;

CREATE TABLE `privilege` (
  `pri_id` int(11) NOT NULL,
  `pri_name` varchar(200) DEFAULT NULL,
  `pri_des` varchar(200) DEFAULT NULL,
  `pri_link` varchar(200) DEFAULT NULL,
  `pri_sup` varchar(200) DEFAULT NULL,
  `pri_target` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `privilege` */

/*Table structure for table `qian` */

DROP TABLE IF EXISTS `qian`;

CREATE TABLE `qian` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `ntime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `nid` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `qian` */

insert  into `qian`(`nid`,`id`,`ntime`) values (1,1,'2018-07-17 20:58:49'),(2,1,'2018-07-18 13:32:49');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(200) DEFAULT NULL,
  `role_des` varchar(200) DEFAULT NULL,
  `role_pri` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

/*Table structure for table `sign` */

DROP TABLE IF EXISTS `sign`;

CREATE TABLE `sign` (
  `qid` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `qdate` date DEFAULT NULL,
  `qstrtus` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`qid`),
  KEY `FK_fk_06` (`id`),
  CONSTRAINT `FK_fk_06` FOREIGN KEY (`id`) REFERENCES `emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sign` */

/*Table structure for table `watch` */

DROP TABLE IF EXISTS `watch`;

CREATE TABLE `watch` (
  `fid` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `filesize` varchar(200) DEFAULT NULL,
  `fileip` varchar(200) DEFAULT NULL,
  `filedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fid`),
  KEY `FK_fk_08` (`id`),
  CONSTRAINT `FK_fk_08` FOREIGN KEY (`id`) REFERENCES `emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `watch` */

/*Table structure for table `wblank` */

DROP TABLE IF EXISTS `wblank`;

CREATE TABLE `wblank` (
  `w_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `w_time` date DEFAULT NULL,
  `w_status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`w_id`),
  KEY `FK_fk_14` (`gid`),
  KEY `FK_fk_16` (`id`),
  CONSTRAINT `FK_fk_14` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`),
  CONSTRAINT `FK_fk_16` FOREIGN KEY (`id`) REFERENCES `emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wblank` */

/*Table structure for table `zblank` */

DROP TABLE IF EXISTS `zblank`;

CREATE TABLE `zblank` (
  `z_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `z_time` date DEFAULT NULL,
  `z_status` varchar(20) DEFAULT NULL,
  `z_info` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`z_id`),
  KEY `FK_fk_15` (`id`),
  CONSTRAINT `FK_fk_15` FOREIGN KEY (`id`) REFERENCES `emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zblank` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
