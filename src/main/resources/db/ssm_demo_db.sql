/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.44 : Database - artcweb
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`artcweb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `artcweb`;

/*Table structure for table `admin_message` */

DROP TABLE IF EXISTS `admin_message`;

CREATE TABLE `admin_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(40) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `demands` varchar(200) DEFAULT NULL COMMENT '咨询项目',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `admin_message` */

insert  into `admin_message`(`id`,`user_name`,`mobile`,`demands`,`create_date`,`update_date`) values (1,'zhuzeqing','1353761255','111','2019-09-23 23:12:46','2019-09-25 23:12:49'),(2,'Z','12','22','2019-09-25 00:43:38','2019-09-25 00:43:40'),(3,'as','xsa','xxas','2019-10-14 00:37:09','2019-10-14 00:37:13'),(4,'xsa','swq',NULL,'2019-10-14 00:37:42','2019-10-14 00:38:15'),(5,'xsa','swq','e32','2019-10-14 01:37:45','2019-10-14 00:38:14'),(6,'asx','swq','d3','2019-10-14 00:37:48','2019-10-14 00:38:12'),(7,'xas','swq','dwe','2019-10-14 00:37:49','2019-10-14 00:38:11'),(8,'xas','swq','dew','2019-10-14 00:37:51','2019-10-14 00:38:09'),(9,'xas','sqw','dew','2019-10-14 00:37:52','2019-10-14 00:38:07'),(10,'swq','sqw','dew','2019-10-14 00:37:54','2019-10-14 00:38:06'),(11,'xas','swq','dwed','2019-10-14 00:37:55','2019-10-14 00:38:04'),(12,'swq','swq','dew','2019-10-14 00:37:57','2019-10-14 00:38:03');

/*Table structure for table `admin_user` */

DROP TABLE IF EXISTS `admin_user`;

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `come_from` varchar(20) DEFAULT NULL COMMENT '来源',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `admin_user` */

insert  into `admin_user`(`id`,`name`,`password`,`come_from`,`create_date`,`update_date`) values (1,'admin','admin','pc','2019-09-08 15:08:17','2019-09-08 23:05:07'),(2,'admin1','admin1','pc','2019-09-08 15:13:12','2019-09-08 15:13:12');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
