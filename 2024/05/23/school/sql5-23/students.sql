/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.73-community : Database - student
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`students` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `students`;

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `Cno` char(6) NOT NULL,
  `Cname` varchar(20) NOT NULL,
  `Credit` tinyint(4) DEFAULT NULL,
  `Semster` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`Cno`,`Cname`,`Credit`,`Semster`) values ('C001','高等数学',4,1),('C002','大学英语',3,1),('C003','大学英语',3,2),('C004','计算机文化',2,2),('C005','VB',2,3),('C006','数据库基础',4,5),('C007','数据结构',4,4),('C008','计算机网络',4,4);

/*Table structure for table `sc` */

DROP TABLE IF EXISTS `sc`;

CREATE TABLE `sc` (
  `Sno` char(7) NOT NULL,
  `Cno` char(6) NOT NULL,
  `Grade` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Sno`,`Cno`),
  KEY `Cno` (`Cno`),
  CONSTRAINT `sc_ibfk_1` FOREIGN KEY (`Sno`) REFERENCES `student` (`Sno`),
  CONSTRAINT `sc_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sc` */

insert  into `sc`(`Sno`,`Cno`,`Grade`) values ('0611101','C001',96),('0611101','C002',80),('0611101','C003',84),('0611101','C005',62),('0611102','C001',92),('0611102','C002',90),('0611102','C004',84),('0621102','C001',76),('0621102','C004',85),('0621102','C005',73),('0621102','C007',NULL),('0621103','C001',50),('0621103','C004',80),('0631101','C001',50),('0631101','C004',80),('0631102','C007',NULL),('0631103','C004',78),('0631103','C005',65),('0631103','C007',NULL);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `Sno` char(7) NOT NULL,
  `Sname` char(5) NOT NULL,
  `Ssex` char(1) DEFAULT '男',
  `Sage` tinyint(4) DEFAULT NULL,
  `Sdept` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`Sno`,`Sname`,`Ssex`,`Sage`,`Sdept`) values ('0611101','李勇','男',21,'计算机系'),('0611102','刘勇','男',20,'计算机系'),('0611103','王敏','女',20,'计算机系'),('0611104','张小红','女',19,'计算机系'),('0621101','张立','男',20,'信息管理系'),('0621102','吴宾','女',19,'信息管理系'),('0621103','张海','男',20,'信息管理系'),('0631101','钱小平','女',21,'通信工程系'),('0631102','王大力','男',20,'通信工程系'),('0631103','张珊珊','女',19,'通信工程系');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
