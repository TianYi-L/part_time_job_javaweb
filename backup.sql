-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: part_time_job_recruit
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '申请表id',
  `user_id` int DEFAULT NULL COMMENT '应聘者id',
  `recruiter_id` int DEFAULT NULL COMMENT '招聘者id',
  `recruiter_name` varchar(100) DEFAULT NULL COMMENT '招聘者名字',
  `job_id` varchar(50) DEFAULT NULL COMMENT '职位id',
  `job_name` varchar(100) DEFAULT NULL COMMENT '职位名字',
  `job_type` varchar(50) DEFAULT NULL COMMENT '类型',
  `job_place` varchar(100) DEFAULT NULL COMMENT '地点',
  `job_personnum` int DEFAULT NULL COMMENT '所需人数',
  `job_information` text COMMENT '详情',
  `job_salary` varchar(50) DEFAULT NULL COMMENT '薪水',
  `contact` varchar(50) DEFAULT NULL COMMENT '联系方式',
  `status` tinyint DEFAULT '0' COMMENT '职位申请状态(0-待审核,1-已通过,2-已拒绝)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `createtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_recruiter_id` (`recruiter_id`),
  KEY `idx_status` (`status`),
  KEY `idx_create_time` (`create_time`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `application_ibfk_2` FOREIGN KEY (`recruiter_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,5,6,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-06-06 22:10:16','2025-06-06 14:10:17');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardimage`
--

DROP TABLE IF EXISTS `cardimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cardimage` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `identity_card_image_url` varchar(255) NOT NULL COMMENT '身份证图片URL',
  `image_url` varchar(255) NOT NULL COMMENT '图片URL',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态：0-待审核，1-已通过，2-已拒绝',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`) COMMENT '用户ID索引'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='证件图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardimage`
--

LOCK TABLES `cardimage` WRITE;
/*!40000 ALTER TABLE `cardimage` DISABLE KEYS */;
INSERT INTO `cardimage` VALUES (2,6,'/upload/a69980f1f8ed4aafa5fd27b47e5ed4a1.jpg','/upload/eaf5844376d34264b33fdfe3a30b51dc.jpg',0,'2025-06-06 11:48:03','2025-06-06 23:16:20'),(3,5,'/upload/1114d17ead2742bea75c3678980c6e90.png','',0,'2025-06-06 18:38:06','2025-06-06 18:38:43');
/*!40000 ALTER TABLE `cardimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(100) NOT NULL COMMENT '职位名称',
  `type` varchar(50) NOT NULL COMMENT '职位类型',
  `personnum` varchar(20) NOT NULL COMMENT '招聘人数',
  `place` varchar(100) NOT NULL COMMENT '工作地点',
  `information` text NOT NULL COMMENT '职位详情',
  `salary` varchar(50) NOT NULL COMMENT '薪资范围',
  `contact` varchar(50) NOT NULL COMMENT '联系方式',
  `user_id` int NOT NULL COMMENT '发布人ID',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '审核状态：0-通过，1-不通过',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='职位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (2,'外卖','Tutoring','3','longquanyi','123','12','12345678903',6,'2025-06-06 18:32:05',0);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `login_name` varchar(50) NOT NULL COMMENT '登录用户名',
  `login_ip` varchar(50) NOT NULL COMMENT '登录IP地址',
  `login_status` tinyint NOT NULL COMMENT '登录状态：0-失败，1-成功',
  `login_msg` varchar(255) DEFAULT NULL COMMENT '登录消息',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`),
  KEY `idx_login_name` (`login_name`),
  KEY `idx_login_time` (`login_time`),
  KEY `idx_login_status` (`login_status`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='登录信息日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (9,'cow','127.0.0.1',0,'登入成功','2025-06-06 10:51:22'),(10,'cow','127.0.0.1',0,'后台登入成功','2025-06-06 10:51:29'),(11,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 10:58:02'),(12,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 11:02:13'),(13,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 11:07:52'),(14,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 11:07:52'),(15,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 11:10:21'),(16,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 11:10:21'),(17,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 11:10:30'),(18,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 11:11:46'),(19,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 11:28:45'),(20,'cow','0:0:0:0:0:0:0:1',1,'后台登入失败，验证码错误','2025-06-06 11:28:55'),(21,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 11:29:02'),(22,'cow','127.0.0.1',1,'后台登入失败，验证码错误','2025-06-06 11:33:10'),(23,'cow','0:0:0:0:0:0:0:1',1,'后台登入失败，验证码错误','2025-06-06 11:33:12'),(24,'cow','127.0.0.1',0,'后台登入成功','2025-06-06 11:33:19'),(25,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 11:37:38'),(26,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 11:37:38'),(27,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 11:42:02'),(28,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 11:43:48'),(29,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 11:47:45'),(30,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 11:48:23'),(31,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 11:58:26'),(32,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 11:58:36'),(33,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 12:05:49'),(34,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 12:09:44'),(35,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 12:11:14'),(36,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 12:12:51'),(37,'dog','127.0.0.1',0,'登入成功','2025-06-06 12:17:12'),(38,'dog','0:0:0:0:0:0:0:1',1,'后台登入失败，验证码错误','2025-06-06 12:25:17'),(39,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 12:25:23'),(40,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 13:16:25'),(41,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 16:48:28'),(42,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 16:51:09'),(43,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 16:51:17'),(44,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 16:52:10'),(45,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 16:53:24'),(46,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 16:56:44'),(47,'dog','0:0:0:0:0:0:0:1',1,'后台登入失败，验证码错误','2025-06-06 17:06:38'),(48,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:06:41'),(49,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:08:01'),(50,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:09:45'),(51,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:12:47'),(52,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:14:04'),(53,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:16:36'),(54,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:20:33'),(55,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:20:33'),(56,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:32:08'),(57,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:32:48'),(58,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:39:52'),(59,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:40:53'),(60,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:43:14'),(61,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:43:14'),(62,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:51:39'),(63,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 17:56:37'),(64,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:01:11'),(65,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:04:41'),(66,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:06:20'),(67,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:10:55'),(68,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:12:13'),(69,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:15:23'),(70,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:17:05'),(71,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:17:06'),(72,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 18:18:07'),(73,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:18:25'),(74,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:26:41'),(75,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 18:27:29'),(76,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:28:03'),(77,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 18:31:48'),(78,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 18:36:54'),(79,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:37:04'),(80,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 18:37:50'),(81,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:38:20'),(82,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 18:40:25'),(83,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 18:40:50'),(84,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 22:04:26'),(85,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 22:04:38'),(86,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 22:05:21'),(87,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 22:05:49'),(88,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 22:05:49'),(89,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 22:07:55'),(90,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 22:10:13'),(91,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 22:10:27'),(92,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 22:21:37'),(93,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 22:26:12'),(94,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 22:26:33'),(95,'cow','127.0.0.1',0,'后台登入成功','2025-06-06 22:33:32'),(96,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 22:52:17'),(97,'dog','127.0.0.1',0,'后台登入成功','2025-06-06 22:58:16'),(98,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 23:00:31'),(99,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 23:08:26'),(100,'dog','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 23:15:56'),(101,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 23:18:18'),(102,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 23:18:32'),(103,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 23:18:42'),(104,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-06 23:18:58'),(105,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 23:25:45'),(106,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 23:26:54'),(107,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 23:27:46'),(108,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 23:33:15'),(109,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 23:38:06'),(110,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 23:55:32'),(111,'cow','0:0:0:0:0:0:0:1',0,'后台登入成功','2025-06-06 23:59:30'),(112,'cow','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-07 11:03:17'),(113,'dog','0:0:0:0:0:0:0:1',0,'登入成功','2025-06-07 11:11:38');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `title` varchar(50) NOT NULL COMMENT '菜单标题',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `href` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `pid` int DEFAULT NULL,
  `visible` int DEFAULT NULL,
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_pid` (`pid`),
  KEY `idx_visible` (`visible`),
  KEY `idx_sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (2,'123',NULL,NULL,NULL,0,0,1,'2025-06-06 17:52:00','2025-06-06 17:52:17'),(6,'朝花夕拾','fa fa-home','',NULL,5,0,2,'2025-06-06 23:59:53','2025-06-06 23:59:53');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `title` varchar(100) NOT NULL COMMENT '新闻标题',
  `content` text NOT NULL COMMENT '新闻内容',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='新闻信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume`
--

DROP TABLE IF EXISTS `resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resume` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '简历ID',
  `schoolname` varchar(100) NOT NULL COMMENT '学校名称',
  `starttime` varchar(20) NOT NULL COMMENT '入学时间',
  `endtime` varchar(20) NOT NULL COMMENT '毕业时间',
  `education` varchar(20) NOT NULL COMMENT '学历',
  `major` varchar(50) NOT NULL COMMENT '专业',
  `experience` text COMMENT '工作经验',
  `user_id` int NOT NULL COMMENT '用户ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户简历表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume`
--

LOCK TABLES `resume` WRITE;
/*!40000 ALTER TABLE `resume` DISABLE KEYS */;
INSERT INTO `resume` VALUES (1,'成都大学','2025-06-06','2025-06-06','本科','123','123',5,'2025-06-06 18:39:24','2025-06-06 18:39:24');
/*!40000 ALTER TABLE `resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (2,'应聘者','','2025-06-06 18:00:07','2025-06-06 22:07:13'),(3,'招聘者','','2025-06-06 18:00:07','2025-06-06 22:07:05');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_menu`
--

DROP TABLE IF EXISTS `role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_menu` (
  `menu_id` int NOT NULL COMMENT '菜单ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`,`role_id`),
  KEY `idx_menu_id` (`menu_id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menu`
--

LOCK TABLES `role_menu` WRITE;
/*!40000 ALTER TABLE `role_menu` DISABLE KEYS */;
INSERT INTO `role_menu` VALUES (2,2),(2,3);
/*!40000 ALTER TABLE `role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `role_id` int NOT NULL COMMENT '角色ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色用户关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (2,6),(3,5);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` tinyint DEFAULT '0' COMMENT '性别：0-男，1-女',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态：0-启用，1-禁用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `uk_email` (`email`),
  KEY `idx_status` (`status`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'cow','86e3360a73f74f901b1384dd02f9e8e6','young',0,'123321@123.com','12345678902',0,'2025-06-06 10:51:19','2025-06-06 10:51:19'),(6,'dog','86e3360a73f74f901b1384dd02f9e8e6','god',0,'1233214@123.com','12345678903',0,'2025-06-06 11:43:43','2025-06-06 11:43:43');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `role_id` int NOT NULL COMMENT '角色ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色用户关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (2,6),(3,5);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-07 11:28:32
