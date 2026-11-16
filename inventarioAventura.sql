-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: inventarioAventura
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add perfil',7,'add_perfil'),(26,'Can change perfil',7,'change_perfil'),(27,'Can delete perfil',7,'delete_perfil'),(28,'Can view perfil',7,'view_perfil'),(29,'Can add categoria',8,'add_categoria'),(30,'Can change categoria',8,'change_categoria'),(31,'Can delete categoria',8,'delete_categoria'),(32,'Can view categoria',8,'view_categoria'),(33,'Can add experiencia',9,'add_experiencia'),(34,'Can change experiencia',9,'change_experiencia'),(35,'Can delete experiencia',9,'delete_experiencia'),(36,'Can view experiencia',9,'view_experiencia'),(37,'Can add inscripcion',10,'add_inscripcion'),(38,'Can change inscripcion',10,'change_inscripcion'),(39,'Can delete inscripcion',10,'delete_inscripcion'),(40,'Can view inscripcion',10,'view_inscripcion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$ppKBK8Jpen5hfDnogFtUlH$x/WZX1f28wbL6gAiuZmHMEhWmBnFKutSZSnKknzqTTg=','2026-11-15 00:38:31.241550',0,'Nemi','Nehemias','Venegas','n@gmail.com',0,1,'2026-11-15 00:38:16.881058'),(2,'pbkdf2_sha256$1000000$OKS9J2BVqsQvv44oE7SVD5$QoNQt58RwS7CrAWf73/4wELyypDtdsMAhx95AWrHQl8=','2026-11-15 00:45:31.627468',1,'admin','','','',1,1,'2026-11-15 00:45:07.835418'),(3,'pbkdf2_sha256$1000000$aCA5UEhvxmeWyMGQKtU5Dp$siHRQ4Dfha+kMa99E4oe0HgPHxKyRe+/KnvS0avo7aU=',NULL,0,'camila.rojas','Camila','Rojas','camila.rojas@aventurasdelsur.cl',0,1,'2026-11-14 21:48:36.462765'),(4,'pbkdf2_sha256$1000000$StI0tTcdQnTypPXBMRp3v1$vvEBKKCQ3b2wbo/r16QohUmYDfsgdwtcdYvOGyXvwiY=',NULL,0,'diego.fuentes','Diego','Fuentes','diego.fuentes@aventurasdelsur.cl',0,1,'2026-11-14 21:48:36.519652'),(5,'pbkdf2_sha256$1000000$7nCRF54UnmxcCNozuxzwpU$PIsaRCDwnBnaFKsc2pudieLCc73eqQceq2mXt3qu41I=',NULL,0,'turista1','Valentina','Soto','turista1@aventurasdelsur.cl',0,1,'2026-11-14 21:48:36.560935'),(6,'pbkdf2_sha256$1000000$fD0UlUbsdjH4eHI32znDDn$ikrysETWaAY7jIbcxPYCHF64oEqtlmy9GXr3FZh2PPI=',NULL,0,'turista2','Matías','Pérez','turista2@aventurasdelsur.cl',0,1,'2026-11-14 21:48:36.602478');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas_perfil`
--

DROP TABLE IF EXISTS `cuentas_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas_perfil` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rol` varchar(10) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `cuentas_perfil_user_id_38159a56_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas_perfil`
--

LOCK TABLES `cuentas_perfil` WRITE;
/*!40000 ALTER TABLE `cuentas_perfil` DISABLE KEYS */;
INSERT INTO `cuentas_perfil` VALUES (1,'turista',1),(2,'admin',2),(4,'guia',3),(5,'guia',4),(6,'turista',5),(7,'turista',6);
/*!40000 ALTER TABLE `cuentas_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'cuentas','perfil'),(8,'experiencias','categoria'),(9,'experiencias','experiencia'),(10,'experiencias','inscripcion'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-11-15 00:37:05.675995'),(2,'auth','0001_initial','2026-11-15 00:37:06.386433'),(3,'admin','0001_initial','2026-11-15 00:37:06.544137'),(4,'admin','0002_logentry_remove_auto_add','2026-11-15 00:37:06.551345'),(5,'admin','0003_logentry_add_action_flag_choices','2026-11-15 00:37:06.557402'),(6,'contenttypes','0002_remove_content_type_name','2026-11-15 00:37:06.738087'),(7,'auth','0002_alter_permission_name_max_length','2026-11-15 00:37:06.818126'),(8,'auth','0003_alter_user_email_max_length','2026-11-15 00:37:06.837705'),(9,'auth','0004_alter_user_username_opts','2026-11-15 00:37:06.844899'),(10,'auth','0005_alter_user_last_login_null','2026-11-15 00:37:06.907212'),(11,'auth','0006_require_contenttypes_0002','2026-11-15 00:37:06.911311'),(12,'auth','0007_alter_validators_add_error_messages','2026-11-15 00:37:06.917255'),(13,'auth','0008_alter_user_username_max_length','2026-11-15 00:37:06.993878'),(14,'auth','0009_alter_user_last_name_max_length','2026-11-15 00:37:07.067616'),(15,'auth','0010_alter_group_name_max_length','2026-11-15 00:37:07.086221'),(16,'auth','0011_update_proxy_permissions','2026-11-15 00:37:07.092822'),(17,'auth','0012_alter_user_first_name_max_length','2026-11-15 00:37:07.173708'),(18,'cuentas','0001_initial','2026-11-15 00:37:07.278730'),(19,'cuentas','0002_alter_perfil_id','2026-11-15 00:37:07.357213'),(20,'cuentas','0003_crear_perfiles_faltantes','2026-11-15 00:37:07.370895'),(21,'experiencias','0001_initial','2026-11-15 00:37:07.721294'),(22,'experiencias','0002_alter_categoria_id_alter_experiencia_id_and_more','2026-11-15 00:37:08.239576'),(23,'sessions','0001_initial','2026-11-15 00:37:08.280198');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('pc9lmqzxaulmk5f9k3lbquvxkckwkzbx','.eJxVjDsOwjAQRO_iGln-LbEp6TmDtfaucQA5UpxUiLuTSCmgG817M28RcV1qXDvPcSRxEUacfruE-cltB_TAdp9kntoyj0nuijxol7eJ-HU93L-Dir1uawsO2evkIDgfisngglE2edJlCwjAZBWgPTs1MBcGUIPWBZPBnIjE5wvEXjfG:1xSON9:xGf1eQ-azeIJvcnoqfZieikPPQtE2lt23z6appRCXqs','2026-11-29 00:45:31.631901');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_categoria`
--

DROP TABLE IF EXISTS `experiencias_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_categoria`
--

LOCK TABLES `experiencias_categoria` WRITE;
/*!40000 ALTER TABLE `experiencias_categoria` DISABLE KEYS */;
INSERT INTO `experiencias_categoria` VALUES (1,'Trekking','Caminatas guiadas por senderos del ecoparque.',1),(2,'Canopy','Circuitos de tirolesa entre las copas de los árboles.',1),(3,'Kayak','Navegación en kayak por aguas tranquilas.',1),(4,'Arriendo de equipos','Arriendo de equipamiento para actividades al aire libre.',1),(5,'Camping','Noches bajo las estrellas en zonas habilitadas y con guía.',1),(6,'Observación de fauna','Salidas para avistar aves y fauna nativa con guía especializado.',1);
/*!40000 ALTER TABLE `experiencias_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_experiencia`
--

DROP TABLE IF EXISTS `experiencias_experiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_experiencia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` int unsigned NOT NULL,
  `cupo_maximo` int unsigned NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `categoria_id` bigint NOT NULL,
  `creador_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiencias_experiencia_creador_id_70b19025_fk_auth_user_id` (`creador_id`),
  KEY `experiencias_experiencia_categoria_id_b03f452f_fk` (`categoria_id`),
  CONSTRAINT `experiencias_experiencia_categoria_id_b03f452f_fk` FOREIGN KEY (`categoria_id`) REFERENCES `experiencias_categoria` (`id`),
  CONSTRAINT `experiencias_experiencia_creador_id_70b19025_fk_auth_user_id` FOREIGN KEY (`creador_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `experiencias_experiencia_chk_1` CHECK ((`precio` >= 0)),
  CONSTRAINT `experiencias_experiencia_chk_2` CHECK ((`cupo_maximo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_experiencia`
--

LOCK TABLES `experiencias_experiencia` WRITE;
/*!40000 ALTER TABLE `experiencias_experiencia` DISABLE KEYS */;
INSERT INTO `experiencias_experiencia` VALUES (1,'Sendero del Alerce','Caminata de 4 horas por bosque nativo con mirador y picnic.',18000,12,'2026-11-18 13:00:00.000000',1,1,3),(2,'Cumbre Volcán Norte','Ascenso de dificultad media con guía de montaña. Incluye colación.',25000,8,'2026-11-20 13:00:00.000000',1,1,3),(3,'Canopy Bosque Nativo','Circuito de 8 líneas de tirolesa sobre el bosque.',32000,10,'2026-11-22 13:00:00.000000',1,2,3),(4,'Arriendo kit de camping','Carpa, saco de dormir y aislante por una noche.',15000,20,'2026-11-24 13:00:00.000000',1,4,3),(5,'Noche de camping bajo las estrellas','Pernoctación en zona de camping con fogata, cena liviana y charla astronómica.',22000,16,'2026-11-26 13:00:00.000000',1,5,3),(6,'Avistamiento de aves al amanecer','Caminata corta de 3 horas con binoculares y guía ornitólogo.',14000,10,'2026-11-28 13:00:00.000000',1,6,3),(7,'Kayak Lago Cristal','Salida guiada de 2 horas en kayak doble. Incluye chaleco y remo.',28000,10,'2026-11-19 13:00:00.000000',1,3,4),(8,'Kayak al Atardecer','Remada tranquila con vista al atardecer y bebida caliente.',30000,8,'2026-11-21 13:00:00.000000',1,3,4),(9,'Canopy Doble Línea','Circuito de tirolesa en pareja, pensado para principiantes.',29000,6,'2026-11-23 13:00:00.000000',1,2,4),(10,'Arriendo de bicicletas y cascos','Bicicleta de montaña, casco y mapa del parque por medio día.',12000,15,'2026-11-25 13:00:00.000000',1,4,4),(11,'Travesía de las cascadas','Trekking de dificultad media hasta tres cascadas, con parada para baño.',20000,12,'2026-11-27 13:00:00.000000',1,1,4),(12,'Safari fotográfico de fauna nativa','Recorrido en grupo reducido para fotografiar fauna con guía especializado.',19000,8,'2026-11-29 13:00:00.000000',1,6,4);
/*!40000 ALTER TABLE `experiencias_experiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_inscripcion`
--

DROP TABLE IF EXISTS `experiencias_inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_inscripcion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_inscripcion` datetime(6) NOT NULL,
  `estado_pago` varchar(10) NOT NULL,
  `experiencia_id` bigint NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiencias_inscripcion_usuario_id_9d6f5da2_fk_auth_user_id` (`usuario_id`),
  KEY `experiencias_inscripcion_experiencia_id_2fbecc6b_fk` (`experiencia_id`),
  CONSTRAINT `experiencias_inscripcion_experiencia_id_2fbecc6b_fk` FOREIGN KEY (`experiencia_id`) REFERENCES `experiencias_experiencia` (`id`),
  CONSTRAINT `experiencias_inscripcion_usuario_id_9d6f5da2_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_inscripcion`
--

LOCK TABLES `experiencias_inscripcion` WRITE;
/*!40000 ALTER TABLE `experiencias_inscripcion` DISABLE KEYS */;
INSERT INTO `experiencias_inscripcion` VALUES (1,'2026-11-15 00:51:57.553844','confirmado',1,5),(2,'2026-11-15 00:51:57.553844','pendiente',3,5),(3,'2026-11-15 00:51:57.553844','confirmado',7,5),(4,'2026-11-15 00:51:57.553844','pendiente',11,5),(5,'2026-11-15 00:51:57.553844','pendiente',2,6),(6,'2026-11-15 00:51:57.553844','confirmado',6,6),(7,'2026-11-15 00:51:57.553844','confirmado',8,6),(8,'2026-11-15 00:51:57.553844','pendiente',10,6);
/*!40000 ALTER TABLE `experiencias_inscripcion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-14 21:59:54
