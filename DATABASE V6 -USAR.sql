-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: compras3
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-05-03 15:31:25.880201'),(2,'auth','0001_initial','2022-05-03 15:31:26.016529'),(3,'admin','0001_initial','2022-05-03 15:31:26.062382'),(4,'admin','0002_logentry_remove_auto_add','2022-05-03 15:31:26.066562'),(5,'admin','0003_logentry_add_action_flag_choices','2022-05-03 15:31:26.070359'),(6,'contenttypes','0002_remove_content_type_name','2022-05-03 15:31:26.093881'),(7,'auth','0002_alter_permission_name_max_length','2022-05-03 15:31:26.114126'),(8,'auth','0003_alter_user_email_max_length','2022-05-03 15:31:26.119429'),(9,'auth','0004_alter_user_username_opts','2022-05-03 15:31:26.123193'),(10,'auth','0005_alter_user_last_login_null','2022-05-03 15:31:26.134585'),(11,'auth','0006_require_contenttypes_0002','2022-05-03 15:31:26.135684'),(12,'auth','0007_alter_validators_add_error_messages','2022-05-03 15:31:26.140690'),(13,'auth','0008_alter_user_username_max_length','2022-05-03 15:31:26.156250'),(14,'auth','0009_alter_user_last_name_max_length','2022-05-03 15:31:26.179355'),(15,'auth','0010_alter_group_name_max_length','2022-05-03 15:31:26.185573'),(16,'auth','0011_update_proxy_permissions','2022-05-03 15:31:26.188844'),(17,'auth','0012_alter_user_first_name_max_length','2022-05-03 15:31:26.203699'),(18,'sessions','0001_initial','2022-05-03 15:31:26.215790');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('n8n898zmv8sgjaxtwb4h4rifoed1y519','e30:1nnqyP:DDhsXbbBm-9gSQlULNHXivnmjRKISs95jMH35zkm9Hs','2022-05-23 00:10:01.955807');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_categoria_producto`
--

DROP TABLE IF EXISTS `pro_categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_categoria_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `habilitada` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_categoria_producto`
--

LOCK TABLES `pro_categoria_producto` WRITE;
/*!40000 ALTER TABLE `pro_categoria_producto` DISABLE KEYS */;
INSERT INTO `pro_categoria_producto` VALUES (1,'categoria a','45',0);
/*!40000 ALTER TABLE `pro_categoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_marca`
--

DROP TABLE IF EXISTS `pro_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_marca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(200) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_marca`
--

LOCK TABLES `pro_marca` WRITE;
/*!40000 ALTER TABLE `pro_marca` DISABLE KEYS */;
INSERT INTO `pro_marca` VALUES (2,'x','x');
/*!40000 ALTER TABLE `pro_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_producto`
--

DROP TABLE IF EXISTS `pro_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca_id` int(11) DEFAULT NULL,
  `precio` decimal(10,0) NOT NULL,
  `caracteristica` text DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `utilidad` varchar(200) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `garantia` varchar(200) DEFAULT NULL,
  `url_imagen_producto` text DEFAULT NULL,
  `nombre` varchar(200) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marca_id` (`marca_id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `pro_producto_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `pro_marca` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pro_producto_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `pro_categoria_producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pro_producto_ibfk_3` FOREIGN KEY (`proveedor_id`) REFERENCES `prove_proveedor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_producto`
--

LOCK TABLES `pro_producto` WRITE;
/*!40000 ALTER TABLE `pro_producto` DISABLE KEYS */;
INSERT INTO `pro_producto` VALUES (1,2,45,'x','x','x','x','x','x','x',1,NULL);
/*!40000 ALTER TABLE `pro_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prove_evaluacion`
--

DROP TABLE IF EXISTS `prove_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prove_evaluacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `rubro_evaluacion_id` int(11) NOT NULL,
  `evaluacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rubro_evaluacion_id` (`rubro_evaluacion_id`),
  KEY `producto_id` (`producto_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `prove_evaluacion_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `pro_producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prove_evaluacion_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `prove_proveedor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prove_evaluacion_ibfk_3` FOREIGN KEY (`rubro_evaluacion_id`) REFERENCES `prove_rubro_evaluacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prove_evaluacion`
--

LOCK TABLES `prove_evaluacion` WRITE;
/*!40000 ALTER TABLE `prove_evaluacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `prove_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prove_personal`
--

DROP TABLE IF EXISTS `prove_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prove_personal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `tipo_personal` varchar(20) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `prove_personal_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `prove_proveedor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prove_personal`
--

LOCK TABLES `prove_personal` WRITE;
/*!40000 ALTER TABLE `prove_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `prove_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prove_personal_clave`
--

DROP TABLE IF EXISTS `prove_personal_clave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prove_personal_clave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) NOT NULL,
  `cargo` varchar(200) NOT NULL,
  `firma` varchar(200) DEFAULT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `prove_personal_clave_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `prove_proveedor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prove_personal_clave`
--

LOCK TABLES `prove_personal_clave` WRITE;
/*!40000 ALTER TABLE `prove_personal_clave` DISABLE KEYS */;
/*!40000 ALTER TABLE `prove_personal_clave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prove_proveedor`
--

DROP TABLE IF EXISTS `prove_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prove_proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(200) NOT NULL,
  `compania` varchar(200) NOT NULL,
  `representante_legal` varchar(200) NOT NULL,
  `direccion_organizacion` varchar(300) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `movil` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `tipo_organizacion_id` int(11) NOT NULL,
  `nit` varchar(100) NOT NULL,
  `nrc` varchar(100) DEFAULT NULL,
  `periodo_negocio` int(11) NOT NULL,
  `rubro_empresa_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `url_copia_autenticada` varchar(200) NOT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `calificacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_organizacion_id` (`tipo_organizacion_id`),
  KEY `rubro_empresa_id` (`rubro_empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prove_proveedor`
--

LOCK TABLES `prove_proveedor` WRITE;
/*!40000 ALTER TABLE `prove_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `prove_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prove_referencia`
--

DROP TABLE IF EXISTS `prove_referencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prove_referencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_referencia` varchar(200) NOT NULL,
  `tipo_referencia_id` int(11) NOT NULL,
  `nombre_contacto` varchar(200) NOT NULL,
  `telefono_contacto` varchar(20) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `valor` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_referencia_id` (`tipo_referencia_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `prove_referencia_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `prove_proveedor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prove_referencia_ibfk_2` FOREIGN KEY (`tipo_referencia_id`) REFERENCES `prove_tipo_referencia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prove_referencia`
--

LOCK TABLES `prove_referencia` WRITE;
/*!40000 ALTER TABLE `prove_referencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `prove_referencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prove_rubro_empresa`
--

DROP TABLE IF EXISTS `prove_rubro_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prove_rubro_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rubro` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prove_rubro_empresa`
--

LOCK TABLES `prove_rubro_empresa` WRITE;
/*!40000 ALTER TABLE `prove_rubro_empresa` DISABLE KEYS */;
INSERT INTO `prove_rubro_empresa` VALUES (2,'4'),(4,'dembo');
/*!40000 ALTER TABLE `prove_rubro_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prove_rubro_evaluacion`
--

DROP TABLE IF EXISTS `prove_rubro_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prove_rubro_evaluacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rubro` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prove_rubro_evaluacion`
--

LOCK TABLES `prove_rubro_evaluacion` WRITE;
/*!40000 ALTER TABLE `prove_rubro_evaluacion` DISABLE KEYS */;
INSERT INTO `prove_rubro_evaluacion` VALUES (1,'nivel de servicio postventa'),(2,'periodos de garantíaç'),(3,'imagen del producto'),(4,'proveedor en el mercado'),(5,'localización'),(6,'existencia de servicios de atención al cliente'),(7,'instalaciones'),(8,' fuerza técnica'),(9,'capacidad financiera'),(10,'nivel organizativo');
/*!40000 ALTER TABLE `prove_rubro_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prove_tipo_organizacion`
--

DROP TABLE IF EXISTS `prove_tipo_organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prove_tipo_organizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prove_tipo_organizacion`
--

LOCK TABLES `prove_tipo_organizacion` WRITE;
/*!40000 ALTER TABLE `prove_tipo_organizacion` DISABLE KEYS */;
INSERT INTO `prove_tipo_organizacion` VALUES (1,'Corporativa'),(2,'Sociedad'),(3,'Persona Natural');
/*!40000 ALTER TABLE `prove_tipo_organizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prove_tipo_referencia`
--

DROP TABLE IF EXISTS `prove_tipo_referencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prove_tipo_referencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prove_tipo_referencia`
--

LOCK TABLES `prove_tipo_referencia` WRITE;
/*!40000 ALTER TABLE `prove_tipo_referencia` DISABLE KEYS */;
INSERT INTO `prove_tipo_referencia` VALUES (1,'referencias comerciales'),(2,'referencias bancarias'),(3,'compañías en sus últimos cinco años');
/*!40000 ALTER TABLE `prove_tipo_referencia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-12  8:40:04


/* #####################  PROCEDIMIENTOS ALMACENADOS #####################  */

DELIMITER $$

CREATE OR REPLACE PROCEDURE sp_INSERT_PERSONAL(IN p_nombre VARCHAR(200),
 IN p_tipo_personal VARCHAR(20), IN p_proveedor_id INT)

BEGIN

		DECLARE h_nombre CONDITION FOR SQLSTATE '45000';
		DECLARE h_tipo_personal CONDITION FOR SQLSTATE '45001';
		DECLARE h_proveedor_id CONDITION FOR SQLSTATE '45002';
	
		
		DECLARE EXIT HANDLER FOR h_nombre
		   BEGIN
         	SELECT 'El nombre del personal debe incluir de 5 a 200 caracteres y no contener números.' AS error_message;
    		END;
   
		
		DECLARE EXIT HANDLER FOR h_tipo_personal
			BEGIN
	         SELECT 'El puesto  debe incluir de 5 a 200 caracteres.' AS error_message;
	    	END;

		DECLARE EXIT HANDLER FOR h_proveedor_id
			BEGIN
	         SELECT 'Debe ingresar un proveedor existente en la base de datos.' AS error_message;
	    	END;					    	
		
	  IF ((p_nombre REGEXP '^([a-zA-ZÀ-ÿ\u00f1\u00d1[[:blank:]]){5,200}$') = 0) THEN			
			SIGNAL h_nombre;
		END IF;
		
		IF ((p_tipo_personal REGEXP '^([a-zA-ZÀ-ÿ\u00f1\u00d10-9[[:blank:]]){5,20}$') = 0) THEN			
			SIGNAL h_tipo_personal;
		END IF;
			
		IF(SELECT CASE
         WHEN EXISTS (SELECT 1
                      FROM   prove_proveedor AS pp
                      WHERE  pp.id = p_proveedor_id) THEN 1 ELSE 2 
				       	END) != 1 THEN
				SIGNAL h_proveedor_id;
		END IF;
		
     START TRANSACTION;

     INSERT INTO prove_personal(nombre,tipo_personal,proveedor_id) 
     VALUES (p_nombre,p_tipo_personal,p_proveedor_id);
     
	  COMMIT;

END $$

DELIMITER ;

DELIMITER $$

CREATE OR REPLACE PROCEDURE sp_UPDATE_PERSONAL(IN p_personal_id INT,IN p_nombre VARCHAR(200),
 IN p_tipo_personal VARCHAR(20))

BEGIN
		DECLARE h_personal_id CONDITION FOR SQLSTATE '45000';
		DECLARE h_nombre CONDITION FOR SQLSTATE '45001';
		DECLARE h_tipo_personal CONDITION FOR SQLSTATE '45002';	
	
			 
		DECLARE EXIT HANDLER FOR h_personal_id
			BEGIN
	         SELECT 'Debe actualizar un miembro de personal existente en la base de datos. ' AS error_message;
	    	END;
			 
		DECLARE EXIT HANDLER FOR h_nombre
			BEGIN
	         SELECT 'El nombre del personal debe incluir de 5 a 200 caracteres y no contener números.' AS error_message;
	    	END;		
	    	
	   DECLARE EXIT HANDLER FOR h_tipo_personal
			BEGIN
	         SELECT 'El puesto debe incluir de 5 a 20 caracteres.' AS error_message;
	    	END;	
	    	
	 
		IF(SELECT CASE
         WHEN EXISTS (SELECT 1
                      FROM   prove_personal AS pp
                      WHERE  pp.id = p_personal_id) THEN 1 ELSE 2 
				       	END) != 1 THEN
				SIGNAL h_personal_id;
		END IF;
	
	  IF ((p_nombre REGEXP '^([a-zA-ZÀ-ÿ\u00f1\u00d1[[:blank:]]){5,200}$') = 0) THEN			
			SIGNAL h_nombre;
		END IF;
		
		IF ((p_tipo_personal REGEXP '^([a-zA-ZÀ-ÿ\u00f1\u00d10-9[[:blank:]]){5,20}$') = 0) THEN			
			SIGNAL h_tipo_personal;
		END IF;
			
		
     START TRANSACTION;
     
     UPDATE prove_personal SET nombre = p_nombre, tipo_personal = p_tipo_personal
	   WHERE id = p_personal_id;
     
	  COMMIT;

END $$

DELIMITER ;

DELIMITER $$

CREATE OR REPLACE PROCEDURE sp_INSERT_REFERENCIA(IN p_nombre_referencia VARCHAR(200), IN p_nombre_contacto VARCHAR(200),
 IN p_telefono_contacto VARCHAR(200), IN p_valor DECIMAL(10,0), IN p_tipo_referencia_id INT,IN p_proveedor_id INT)

BEGIN

		DECLARE h_referencia CONDITION FOR SQLSTATE '45000';
		DECLARE h_nombre CONDITION FOR SQLSTATE '45001';
		DECLARE h_telefono CONDITION FOR SQLSTATE '45002';
		DECLARE h_valor CONDITION FOR SQLSTATE '45003';
		DECLARE h_tipo CONDITION FOR SQLSTATE '45004';
		DECLARE h_proveedor CONDITION FOR SQLSTATE '45005';
	
		
		DECLARE EXIT HANDLER FOR h_referencia 
		   BEGIN
         	SELECT 'El nombre de la referencia debe incluir de 5 a 200 caracteres.' AS error_message;
    		END;
   
		
		DECLARE EXIT HANDLER FOR h_nombre
			BEGIN
	         SELECT 'El nombre del contacto debe incluir de 5 a 200 caracteres y no contener números.' AS error_message;
	    	END;
			 
		DECLARE EXIT HANDLER FOR h_telefono
			BEGIN
	         SELECT 'El formato de teléfono es inválido.' AS error_message;
	    	END;	
			 
		DECLARE EXIT HANDLER FOR h_valor
			BEGIN
	         SELECT 'Debe ingresar un valor númerico mayor a cero. ' AS error_message;
	    	END;		 		
			 
		DECLARE EXIT HANDLER FOR h_tipo
			BEGIN
	         SELECT 'Debe ingresar un tipo de referencia existente en la base de datos. ' AS error_message;
	    	END;	
			 
		DECLARE EXIT HANDLER FOR h_proveedor
			BEGIN
	         SELECT 'Debe ingresar un proveedor existente en la base de datos. ' AS error_message;
	    	END;	 		    	
		
		IF ((p_nombre_referencia REGEXP '^([a-zA-ZÀ-ÿ\u00f1\u00d10-9[[:blank:]]){5,200}$') = 0) THEN			
			SIGNAL h_referencia;
		END IF;
		
	
	   IF ((p_nombre_contacto REGEXP '^([a-zA-ZÀ-ÿ\u00f1\u00d1[[:blank:]]){5,200}$') = 0) THEN			
			SIGNAL h_nombre;
		END IF;
		
		IF ((p_telefono_contacto REGEXP '^[+]{1}([0-9]){6,14}$') = 0)THEN			
			SIGNAL h_telefono;
		END IF;
		
		IF ((p_valor REGEXP '^([0-9]{1,})$') = 0)THEN			
			SIGNAL h_valor;
		END IF;
		
		IF(SELECT CASE
         WHEN EXISTS (SELECT 1
                      FROM   prove_tipo_referencia AS ptr
                      WHERE  ptr.id = p_tipo_referencia_id) THEN 1 ELSE 2 
				       	END) != 1 THEN
				SIGNAL h_tipo;
		END IF;

		IF(SELECT CASE
         WHEN EXISTS (SELECT 1
                      FROM   prove_proveedor AS pp
                      WHERE  pp.id = p_proveedor_id) THEN 1 ELSE 2 
				       	END) != 1 THEN
				SIGNAL h_proveedor;
		END IF;
		
     START TRANSACTION;

     INSERT INTO prove_referencia(nombre_referencia,nombre_contacto,telefono_contacto,valor,tipo_referencia_id,proveedor_id) 
     VALUES (p_nombre_referencia,p_nombre_contacto,p_telefono_contacto,p_valor,p_tipo_referencia_id,p_proveedor_id);
     
	  COMMIT;

END $$

DELIMITER ;

DELIMITER $$

CREATE OR REPLACE PROCEDURE sp_UPDATE_REFERENCIA(IN p_referencia_id INT,IN p_nombre_referencia VARCHAR(200), IN p_nombre_contacto VARCHAR(200),
 IN p_telefono_contacto VARCHAR(200), IN p_valor DECIMAL(10,0),IN p_tipo_referencia_id INT)

BEGIN

		DECLARE h_referencia CONDITION FOR SQLSTATE '45000';
		DECLARE h_nombre CONDITION FOR SQLSTATE '45001';
		DECLARE h_telefono CONDITION FOR SQLSTATE '45002';
		DECLARE h_valor CONDITION FOR SQLSTATE '45003';
		DECLARE h_referencia_id CONDITION FOR SQLSTATE '45004';
		DECLARE h_tipo CONDITION FOR SQLSTATE '45005';	
	
		
		DECLARE EXIT HANDLER FOR h_referencia
		   BEGIN
         	SELECT 'El nombre de la referencia debe incluir de 5 a 200 caracteres.' AS error_message;
    		END;
   
		
		DECLARE EXIT HANDLER FOR h_nombre
			BEGIN
	         SELECT 'El nombre del contacto debe incluir de 5 a 200 caracteres y no contener números.' AS error_message;
	    	END;
			 
		DECLARE EXIT HANDLER FOR h_telefono
			BEGIN
	         SELECT 'El formato de teléfono es inválido.' AS error_message;
	    	END;	
			 
		DECLARE EXIT HANDLER FOR h_valor
			BEGIN
	         SELECT 'Debe ingresar un valor númerico mayor a cero. ' AS error_message;
	    	END;		 
			 
		DECLARE EXIT HANDLER FOR h_referencia_id
			BEGIN
	         SELECT 'Debe actualizar una referencia existente en la base de datos. ' AS error_message;
	    	END;		
	    	
	   DECLARE EXIT HANDLER FOR h_tipo
			BEGIN
	         SELECT 'Debe ingresar un tipo de referencia existente en la base de datos. ' AS error_message;
	    	END;	
			 
		
		IF ((p_nombre_referencia REGEXP '^([a-zA-ZÀ-ÿ\u00f1\u00d10-9[[:blank:]]){5,200}$') = 0) THEN			
			SIGNAL h_referencia;
		END IF;
		
	
	   IF ((p_nombre_contacto REGEXP '^([a-zA-ZÀ-ÿ\u00f1\u00d1[[:blank:]]){5,200}$') = 0) THEN			
			SIGNAL h_nombre;
		END IF;
		
		IF ((p_telefono_contacto REGEXP '^[+]{1}([0-9]){6,14}$') = 0)THEN			
			SIGNAL h_telefono;
		END IF;
		
		IF ((p_valor REGEXP '^([0-9]{1,})$') = 0)THEN			
			SIGNAL h_valor;
		END IF;
		
		IF(SELECT CASE
         WHEN EXISTS (SELECT 1
                      FROM   prove_referencia AS pr
                      WHERE  pr.id = p_referencia_id) THEN 1 ELSE 2 
				       	END) != 1 THEN
				SIGNAL h_referencia_id;
		END IF;
		
		IF(SELECT CASE
         WHEN EXISTS (SELECT 1
                      FROM   prove_tipo_referencia AS ptr
                      WHERE  ptr.id = p_tipo_referencia_id) THEN 1 ELSE 2 
				       	END) != 1 THEN
				SIGNAL h_tipo;
		END IF;
		
     START TRANSACTION;
     
     UPDATE prove_referencia SET nombre_referencia = p_nombre_referencia, nombre_contacto = p_nombre_contacto,
     telefono_contacto = p_telefono_contacto, valor = p_valor, tipo_referencia_id = p_tipo_referencia_id WHERE id = p_referencia_id;
     
	  COMMIT;

END $$

DELIMITER ;




/* #####################  PROCEDIMIENTOS ALMACENADOS #####################  */