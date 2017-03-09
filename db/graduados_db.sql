-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 09, 2017 at 10:50 AM
-- Server version: 5.5.47-MariaDB-1ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `graduados_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(75) NOT NULL,
  `qualifiers` text NOT NULL,
  `response` varchar(75) NOT NULL,
  `response_vars` text NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user defined actions triggered by certain events' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `actions_log`
--

CREATE TABLE IF NOT EXISTS `actions_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `action_id` (`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores a log of triggered actions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE IF NOT EXISTS `alert` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `alert_type` tinyint(4) NOT NULL COMMENT '1 - MOBILE, 2 - EMAIL',
  `alert_recipient` varchar(200) DEFAULT NULL,
  `alert_code` varchar(30) DEFAULT NULL,
  `alert_confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `alert_lat` varchar(150) DEFAULT NULL,
  `alert_lon` varchar(150) DEFAULT NULL,
  `alert_radius` tinyint(4) NOT NULL DEFAULT '20',
  `alert_ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_alert_code` (`alert_code`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores alerts subscribers information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `alert_category`
--

CREATE TABLE IF NOT EXISTS `alert_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alert_id` (`alert_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores subscriber alert categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `alert_sent`
--

CREATE TABLE IF NOT EXISTS `alert_sent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `alert_id` bigint(20) unsigned NOT NULL,
  `alert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `alert_id` (`alert_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores a log of alerts sent out to subscribers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `api_banned`
--

CREATE TABLE IF NOT EXISTS `api_banned` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `banned_ipaddress` varchar(50) NOT NULL,
  `banned_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='For logging banned API IP addresses' AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `api_log`
--

CREATE TABLE IF NOT EXISTS `api_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_task` varchar(10) NOT NULL,
  `api_parameters` varchar(100) NOT NULL,
  `api_records` tinyint(11) NOT NULL,
  `api_ipaddress` varchar(50) NOT NULL,
  `api_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='For logging API activities' AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `api_settings`
--

CREATE TABLE IF NOT EXISTS `api_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_record_limit` int(11) NOT NULL DEFAULT '20',
  `max_record_limit` int(11) DEFAULT NULL,
  `max_requests_per_ip_address` int(11) DEFAULT NULL,
  `max_requests_quota_basis` int(11) DEFAULT NULL,
  `modification_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For storing API logging settings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `badge`
--

CREATE TABLE IF NOT EXISTS `badge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores description of badges to be assigned' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `badge_users`
--

CREATE TABLE IF NOT EXISTS `badge_users` (
  `user_id` int(11) unsigned NOT NULL,
  `badge_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`badge_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores assigned badge information';

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `category_position` tinyint(4) NOT NULL DEFAULT '0',
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  `category_color` varchar(20) DEFAULT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `category_image_thumb` varchar(255) DEFAULT NULL,
  `category_visible` tinyint(4) NOT NULL DEFAULT '1',
  `category_trusted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_visible` (`category_visible`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Holds information about categories defined for a deployment' AUTO_INCREMENT=149 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `type_id`, `locale`, `category_position`, `category_title`, `category_description`, `category_color`, `category_image`, `category_image_thumb`, `category_visible`, `category_trusted`) VALUES
(6, 0, 0, 'es_AR', 1, 'Ciencias Agropecuarias', 'Ciencias Agropecuarias', '00A13B', 'category_6_1466793114.png', 'category_6_1466793114_16x16.png', 1, 0),
(50, 15, 1, 'es_AR', 58, 'Farmacéutico', 'Farmacéutico', 'CBE450', NULL, NULL, 1, 0),
(4, 0, 0, 'en_US', 0, 'Verificados', 'Graduados verificados', '000000', NULL, NULL, 0, 1),
(8, 0, 0, 'es_AR', 3, 'Ciencias Económicas', 'Ciencias Económicas', 'FBD100', 'category_8_1466793140.png', 'category_8_1466793140_16x16.png', 1, 0),
(9, 0, 0, 'es_AR', 6, 'Ciencias de la Administración', 'Ciencias de la Administración', '3B6BA9', 'category_9_1466793175.png', 'category_9_1466793175_16x16.png', 1, 0),
(10, 0, 0, 'es_AR', 13, 'Ciencias de la Salud', 'Ciencias de la Salud', '44A1A0', 'category_10_1466793217.png', 'category_10_1466793217_16x16.png', 1, 0),
(11, 0, 0, 'es_AR', 20, 'Ciencias de la Educación', 'Ciencias de la Educación', 'E45279', 'category_11_1466793299.png', 'category_11_1466793299_16x16.png', 1, 0),
(12, 0, 0, 'es_AR', 41, 'Trabajo Social', 'Trabajo Social', 'C5252B', 'category_12_1466793323.png', 'category_12_1466793323_16x16.png', 1, 0),
(13, 0, 0, 'es_AR', 44, 'Ingeniería', 'Ingeniería', '45B9EE', 'category_13_1466793344.png', 'category_13_1466793344_16x16.png', 1, 0),
(14, 0, 0, 'es_AR', 49, 'Ciencias de la Alimentación', 'Ciencias de la Alimentación', 'EC8A1A', 'category_14_1466793427.png', 'category_14_1466793427_16x16.png', 1, 0),
(15, 0, 0, 'es_AR', 55, 'Bromatología', 'Bromatología', 'CBE450', 'category_15_1466793456.png', 'category_15_1466793456_16x16.png', 1, 0),
(16, 15, 1, 'es_AR', 56, 'Licenciado en Bromatología', 'Licenciado en Bromatología', 'CBE450', NULL, NULL, 1, 0),
(17, 15, 1, 'es_AR', 57, 'Licenciado en Nutrición', 'Licenciado en Nutrición', 'CBE450', NULL, NULL, 1, 0),
(60, 11, 1, 'es_AR', 27, 'Técnico en Comunicación Social', 'Técnico en Comunicación Social', 'E45279', NULL, NULL, 1, 0),
(18, 13, 2, 'es_AR', 45, 'Bioingeniero', 'Bioingeniero', '45B9EE', NULL, NULL, 1, 0),
(19, 13, 2, 'es_AR', 46, 'Licenciado en Bioinformática', 'Licenciado en Bioinformática', '45B9EE', NULL, NULL, 1, 0),
(20, 14, 0, 'es_AR', 51, 'Ingeniero en Mecatrónica', 'Ingeniero en Mecatrónica', 'EC8A1A', NULL, NULL, 1, 0),
(22, 14, 0, 'es_AR', 50, 'Ingeniero en Alimentos', 'Ingeniero en Alimentos', 'EC8A1A', NULL, NULL, 1, 0),
(23, 8, 2, 'es_AR', 4, 'Contador Público', 'Contador Público', 'FBD100', NULL, NULL, 1, 0),
(24, 9, 0, 'es_AR', 8, 'Licenciado en Ciencias de la Administración', 'Licenciado en Ciencias de la Administración', '3B6BA9', NULL, NULL, 1, 0),
(25, 9, 0, 'es_AR', 11, 'Profesor en Portugués', 'Profesor en Portugués', '3B6BA9', NULL, NULL, 1, 0),
(26, 9, 0, 'es_AR', 10, 'Licenciado en Sistemas', 'Licenciado en Sistemas', '3B6BA9', NULL, NULL, 1, 0),
(27, 9, 0, 'es_AR', 7, 'Licenciado en Turismo', 'Licenciado en Turismo', '3B6BA9', NULL, NULL, 1, 0),
(28, 9, 0, 'es_AR', 12, 'Profesor en Informática', 'Profesor en Informática', '3B6BA9', NULL, NULL, 1, 0),
(29, 8, 0, 'es_AR', 5, 'Profesor en Ciencias Económicas', 'Profesor en Ciencias Económicas', 'FBD100', NULL, NULL, 1, 0),
(97, 9, 2, 'es_AR', 84, 'Contador Público', 'Contador Público', '3B6BA9', NULL, NULL, 1, 0),
(34, 10, 0, 'es_AR', 15, 'Licenciado en Obstetricia', 'Licenciado en Obstetricia', '44A1A0', NULL, NULL, 1, 0),
(33, 10, 0, 'es_AR', 19, 'Médico', 'Médico', '44A1A0', NULL, NULL, 1, 0),
(35, 10, 0, 'es_AR', 18, 'Licenciado en Enfermería', 'Licenciado en Enfermería', '44A1A0', NULL, NULL, 1, 0),
(36, 10, 0, 'es_AR', 14, 'Licenciado en Kinesiología y fisioterapia', 'Licenciado en Kinesiología y fisioterapia', '44A1A0', NULL, NULL, 1, 0),
(37, 10, 0, 'es_AR', 17, 'Licenciado en Salud Ambiental', 'Licenciado en Salud Ambiental', '44A1A0', NULL, NULL, 1, 0),
(38, 10, 0, 'es_AR', 16, 'Licenciado en Instrumentación Quirúrgica', 'Licenciado en Instrumentación Quirúrgica', '44A1A0', NULL, NULL, 1, 0),
(39, 6, 2, 'es_AR', 2, 'Ingeniero Agrónomo', 'Ingeniero Agrónomo', '00A13B', NULL, NULL, 1, 0),
(40, 12, 0, 'es_AR', 42, 'Licenciado en Trabajo Social', 'Licenciado en Trabajo Social', 'C5252B', NULL, NULL, 1, 0),
(41, 12, 0, 'es_AR', 43, 'Licenciado en Ciencias Políticas', 'Licenciado en Ciencias Políticas', 'C5252B', NULL, NULL, 1, 0),
(42, 13, 2, 'es_AR', 47, 'Ingeniero en Transporte', 'Ingeniero en Transporte', '45B9EE', NULL, NULL, 1, 0),
(43, 13, 1, 'es_AR', 48, 'Técnico Universitario en Producción de Medicamentos', 'Técnico Universitario en Producción de Medicamentos', '45B9EE', NULL, NULL, 1, 0),
(44, 11, 2, 'es_AR', 21, 'Licenciado en Ciencias de la Educación', 'Licenciado en Ciencias de la Educación', 'E45279', NULL, NULL, 1, 0),
(45, 11, 0, 'es_AR', 22, 'Profesor en Ciencias de la Educación', 'Profesor en Ciencias de la Educación', 'E45279', NULL, NULL, 1, 0),
(46, 11, 0, 'es_AR', 23, 'Licenciado en Comunicación Social', 'Licenciado en Comunicación Social', 'E45279', NULL, NULL, 1, 0),
(47, 11, 0, 'es_AR', 24, 'Profesor en Comunicación Social', 'Profesor en Comunicación Social', 'E45279', NULL, NULL, 1, 0),
(48, 11, 0, 'es_AR', 25, 'Licenciado en Educación Primaria', 'Licenciado en Educación Primaria', 'E45279', NULL, NULL, 1, 0),
(49, 11, 0, 'es_AR', 26, 'Licenciado en Educación Inicial.', 'Licenciado en Educación Inicial.', 'E45279', NULL, NULL, 1, 0),
(51, 15, 0, 'es_AR', 59, 'Veterinario', 'Veterinario', 'CBE450', NULL, NULL, 1, 0),
(52, 15, 0, 'es_AR', 60, 'Tecnicatura en Control Bromatológico', 'Tecnicatura en Control Bromatológico', 'CBE450', NULL, NULL, 1, 0),
(53, 15, 0, 'es_AR', 61, 'Técnico Universitario en Química', 'Técnico Universitario en Química', 'CBE450', NULL, NULL, 1, 0),
(54, 15, 0, 'es_AR', 62, 'Técnico Universitario en Alimentación Animal', 'Técnico Universitario en Alimentación Animal', 'CBE450', NULL, NULL, 1, 0),
(55, 15, 0, 'es_AR', 63, 'Bioquímico', 'Bioquímico', 'CBE450', NULL, NULL, 1, 0),
(56, 15, 3, 'es_AR', 64, 'Especialista en Docencia en Salud y en Alimentación', 'Especialista en Docencia en Salud y en Alimentación', 'CBE450', NULL, NULL, 1, 0),
(57, 14, 0, 'es_AR', 52, 'Profesor Universitario en Matemática', 'Profesor Universitario en Matemática', 'EC8A1A', NULL, NULL, 1, 0),
(58, 14, 0, 'es_AR', 53, 'Profesorado Universitario en Química', 'Profesorado Universitario en Química', 'EC8A1A', NULL, NULL, 1, 0),
(59, 14, 0, 'es_AR', 54, 'Profesor en Ciencias y Tecnologías', 'Profesor en Ciencias y Tecnologías', 'EC8A1A', NULL, NULL, 1, 0),
(61, 11, 1, 'es_AR', 28, 'Técnico en Gestión Cultural', 'Técnico en Gestión Cultural', 'E45279', NULL, NULL, 1, 0),
(62, 11, 0, 'es_AR', 29, 'Técnico Universitario en Edición', 'Técnico Universitario en Edición', 'E45279', NULL, NULL, 1, 0),
(63, 11, 0, 'es_AR', 30, 'Magister en Educación', 'Magister en Educación', 'E45279', NULL, NULL, 1, 0),
(64, 11, 0, 'es_AR', 31, 'Magister en Portugués y Español como Lenguas Segundas y Extranjeras', 'Magister en Portugués y Español como Lenguas Segundas y Extranjeras', 'E45279', NULL, NULL, 1, 0),
(65, 11, 0, 'es_AR', 32, 'Doctor en Educación', 'Doctor en Educación', 'E45279', NULL, NULL, 1, 0),
(66, 11, 0, 'es_AR', 33, 'Especialista en Educación y Desarrollo Rural', 'Especialista en Educación y Desarrollo Rural', 'E45279', NULL, NULL, 1, 0),
(67, 11, 0, 'es_AR', 34, 'Magister En Educación Y Desarrollo Rural', 'Magister En Educación Y Desarrollo Rural', 'E45279', NULL, NULL, 1, 0),
(68, 11, 0, 'es_AR', 35, 'Especialista en Educación y Diversidad', 'Especialista en Educación y Diversidad', 'E45279', NULL, NULL, 1, 0),
(69, 11, 0, 'es_AR', 36, 'Especialista En Docencia Universitaria', 'Especialista En Docencia Universitaria', 'E45279', NULL, NULL, 1, 0),
(70, 11, 0, 'es_AR', 37, 'Magister en Pedagogía y Psicoanálisis', 'Magister en Pedagogía y Psicoanálisis', 'E45279', NULL, NULL, 1, 0),
(71, 11, 0, 'es_AR', 38, 'Especialista en Políticas de Infancias y Juventudes', 'Especialista en Políticas de Infancias y Juventudes', 'E45279', NULL, NULL, 1, 0),
(72, 11, 0, 'es_AR', 39, 'Magister en Docencia Universitaria', 'Magister en Docencia Universitaria', 'E45279', NULL, NULL, 1, 0),
(73, 11, 0, 'es_AR', 40, 'Magister en Comunicación', 'Magister en Comunicación', 'E45279', NULL, NULL, 1, 0),
(77, 6, 1, 'es_AR', 65, 'Técnico Universitario en Organización de Empresas Agropecuarias', 'Técnico Universitario en Organización de Empresas Agropecuarias', '00A13B', NULL, NULL, 1, 0),
(78, 6, 1, 'es_AR', 66, 'Técnico Universitario en Manejo de Granos y Semillas', 'Técnico Universitario en Manejo de Granos y Semillas', '00A13B', NULL, NULL, 1, 0),
(79, 6, 3, 'es_AR', 67, 'Magister en Agronegocios y Alimentos', 'Magister en Agronegocios y Alimentos', '00A13B', NULL, NULL, 1, 0),
(80, 6, 3, 'es_AR', 68, 'Especialista en Alta Dirección de Agronegocios y Alimentos', 'Especialista en Alta Dirección de Agronegocios y Alimentos', '00A13B', NULL, NULL, 1, 0),
(81, 8, 2, 'es_AR', 69, 'Licenciado en Economía', 'Licenciado en Economía', 'FBD100', NULL, NULL, 1, 0),
(82, 8, 1, 'es_AR', 70, 'Técnico Universitario en Seguros', 'Técnico Universitario en Seguros', 'FBD100', NULL, NULL, 1, 0),
(83, 8, 1, 'es_AR', 71, 'Técnico Universitario en Gestión de Negocios Internacionales', 'Técnico Universitario en Gestión de Negocios Internacionales', 'FBD100', NULL, NULL, 1, 0),
(84, 8, 1, 'es_AR', 72, 'Técnico Universitario en Gestión de Organizaciones Públicas de Salud', 'Técnico Universitario en Gestión de Organizaciones Públicas de Salud', 'FBD100', NULL, NULL, 1, 0),
(85, 8, 1, 'es_AR', 73, 'Técnico Universitario en Recursos Humanos', 'Técnico Universitario en Recursos Humanos', 'FBD100', NULL, NULL, 1, 0),
(86, 8, 3, 'es_AR', 74, 'Especialista en Tributación', 'Especialista en Tributación', 'FBD100', NULL, NULL, 1, 0),
(87, 8, 3, 'es_AR', 75, 'Especialista en Administración Financiera', 'Especialista en Administración Financiera', 'FBD100', NULL, NULL, 1, 0),
(88, 8, 1, 'es_AR', 76, 'Técnico Universitario en Gestión y Administración Pública', 'Técnico Universitario en Gestión y Administración Pública', 'FBD100', NULL, NULL, 1, 0),
(89, 8, 1, 'es_AR', 77, 'Técnico Universitario Administrativo Contable', 'Técnico Universitario Administrativo Contable', 'FBD100', NULL, NULL, 1, 0),
(90, 8, 3, 'es_AR', 78, 'Especialista en Sindicatura Concursal', 'Especialista en Sindicatura Concursal', 'FBD100', NULL, NULL, 1, 0),
(91, 8, 3, 'es_AR', 79, 'Especialista en Costos y Gestión Empresarial', 'Especialista en Costos y Gestión Empresarial', 'FBD100', NULL, NULL, 1, 0),
(92, 8, 3, 'es_AR', 80, 'Especialista en Contabilidad y Auditoria', 'Especialista en Contabilidad y Auditoria', 'FBD100', NULL, NULL, 1, 0),
(93, 8, 3, 'es_AR', 81, 'Especialista en Metodología de la Investigación', 'Especialista en Metodología de la Investigación', 'FBD100', NULL, NULL, 1, 0),
(94, 8, 3, 'es_AR', 82, 'Magister en Metodología de la Investigación Científica y Técnica', 'Magister en Metodología de la Investigación Científica y Técnica', 'FBD100', NULL, NULL, 1, 0),
(95, 8, 3, 'es_AR', 83, 'Especialista en Desarrollo Industrial Sustentable y Tecnología', 'Especialista en Desarrollo Industrial Sustentable y Tecnología', 'FBD100', NULL, NULL, 1, 0),
(96, 8, 3, 'es_AR', 84, 'Especialista en Métodos de Resolución y Transformación de Conflictos', 'Especialista en Métodos de Resolución y Transformación de Conflictos', 'FBD100', NULL, NULL, 1, 0),
(98, 9, 2, 'es_AR', 85, 'Profesor en Ciencias Económicas', 'Profesor en Ciencias Económicas', '3B6BA9', NULL, NULL, 1, 0),
(99, 9, 2, 'es_AR', 86, 'Licenciado en Gestión Foresto Industrial', 'Licenciado en Gestión Foresto Industrial', '3B6BA9', NULL, NULL, 1, 0),
(100, 9, 2, 'es_AR', 87, 'Profesor Universitario en Informática', 'Profesor Universitario en Informática', '3B6BA9', NULL, NULL, 1, 0),
(101, 9, 2, 'es_AR', 88, 'Profesor Universitario en Ciencias de la Administración', 'Profesor Universitario en Ciencias de la Administración', '3B6BA9', NULL, NULL, 1, 0),
(102, 9, 2, 'es_AR', 89, 'Programador de Sistemas', 'Programador de Sistemas', '3B6BA9', NULL, NULL, 1, 0),
(103, 9, 1, 'es_AR', 90, 'Técnico en Turismo', 'Técnico en Turismo', '3B6BA9', NULL, NULL, 1, 0),
(104, 9, 1, 'es_AR', 91, 'Técnico Universitario en Programación WEB', 'Técnico Universitario en Programación WEB', '3B6BA9', NULL, NULL, 1, 0),
(105, 9, 1, 'es_AR', 92, 'Técnico en Gestión y Administración Municipal', 'Técnico en Gestión y Administración Municipal', '3B6BA9', NULL, NULL, 1, 0),
(106, 9, 3, 'es_AR', 93, 'Especialista en Tributación para el Mercado Común del Mercosur', 'Especialista en Tributación para el Mercado Común del Mercosur', '3B6BA9', NULL, NULL, 1, 0),
(107, 9, 3, 'es_AR', 94, 'Especialista en Gestión de Pequeñas y Medianas Empresas', 'Especialista en Gestión de Pequeñas y Medianas Empresas', '3B6BA9', NULL, NULL, 1, 0),
(108, 9, 3, 'es_AR', 95, 'Especialista en Gestión de la Innovación y Vinculación Tecnológica', 'Especialista en Gestión de la Innovación y Vinculación Tecnológica', '3B6BA9', NULL, NULL, 1, 0),
(109, 8, 3, 'es_AR', 96, 'Especialista en Gestión de Organizaciones de Salud', 'Especialista en Gestión de Organizaciones de Salud', 'FBD100', NULL, NULL, 1, 0),
(110, 9, 3, 'es_AR', 97, 'Especialista en Impuestos', 'Especialista en Impuesto', '3B6BA9', NULL, NULL, 1, 0),
(111, 9, 3, 'es_AR', 98, 'Magister en Desarrollo Local y Sustentable', 'Magister en Desarrollo Local y Sustentable', '3B6BA9', NULL, NULL, 1, 0),
(112, 9, 3, 'es_AR', 99, 'Magister en Sistemas Informático', 'Magister en Sistemas Informático', '3B6BA9', NULL, NULL, 1, 0),
(113, 10, 1, 'es_AR', 100, 'Instrumentador Quirúrgico', 'Instrumentador Quirúrgico', '44A1A0', NULL, NULL, 1, 0),
(114, 10, 1, 'es_AR', 101, 'Enfermero', 'Enfermero', '44A1A0', NULL, NULL, 1, 0),
(115, 10, 1, 'es_AR', 102, 'Técnico Universitario en Promoción de la Salud', 'Técnico Universitario en Promoción de la Salud', '44A1A0', NULL, NULL, 1, 0),
(116, 10, 1, 'es_AR', 103, 'Técnico en Salud Ambiental', 'Técnico en Salud Ambiental', '44A1A0', NULL, NULL, 1, 0),
(117, 10, 1, 'es_AR', 104, 'Técnico en Diagnóstico por Imagen', 'Técnico en Diagnóstico por Imagen', '44A1A0', NULL, NULL, 1, 0),
(118, 10, 1, 'es_AR', 105, 'Técnico en Laboratorio de Análisis Clínicos', 'Técnico en Laboratorio de Análisis Clínicos', '44A1A0', NULL, NULL, 1, 0),
(119, 10, 3, 'es_AR', 106, 'Magister en Salud Familiar y Comunitaria', 'Magister en Salud Familiar y Comunitaria', '44A1A0', NULL, NULL, 1, 0),
(120, 10, 3, 'es_AR', 107, 'Especialista en Termalismo - Hidrología Médica', 'Especialista en Termalismo - Hidrología Médica', '44A1A0', NULL, NULL, 1, 0),
(121, 10, 3, 'es_AR', 108, 'Especialista en Salud Social y Comunitaria', 'Especialista en Salud Social y Comunitaria', '44A1A0', NULL, NULL, 1, 0),
(122, 10, 3, 'es_AR', 109, 'Especialista en Comunicación en Salud y Ambiente', 'Especialista en Comunicación en Salud y Ambiente', '44A1A0', NULL, NULL, 1, 0),
(123, 6, 3, 'es_AR', 110, 'Magister en Educación y Desarrollo Rural', 'Magister en Educación y Desarrollo Rural', '00A13B', NULL, NULL, 1, 0),
(124, 11, 3, 'es_AR', 111, 'Magister en Pedagogía y Psicoanálisis', 'Magister en Pedagogía y Psicoanálisis', 'E45279', NULL, NULL, 1, 0),
(125, 11, 3, 'es_AR', 112, 'Magíster en Políticas de Infancias y Juventudes', 'Magíster en Políticas de Infancias y Juventudes', 'E45279', NULL, NULL, 1, 0),
(126, 11, 3, 'es_AR', 113, 'Especialista en Producción de Contenidos y Ambientes Digitales', 'Especialista en Producción de Contenidos y Ambientes Digitales', 'E45279', NULL, NULL, 1, 0),
(127, 14, 1, 'es_AR', 114, 'Técnico Superior en tecnologías de Alimentos', 'Técnico Superior en tecnologías de Alimentos', 'EC8A1A', NULL, NULL, 1, 0),
(128, 14, 1, 'es_AR', 115, 'Técnico en Gestión Gastronómica', 'Técnico en Gestión Gastronómica', 'EC8A1A', NULL, NULL, 1, 0),
(129, 14, 1, 'es_AR', 116, 'Técnico Superior en Tecnología Avícola', 'Técnico Superior en Tecnología Avícola', 'EC8A1A', NULL, NULL, 1, 0),
(130, 14, 1, 'es_AR', 117, 'Técnico Superior en Tecnología Arrocera', 'Técnico Superior en Tecnología Arrocera', 'EC8A1A', NULL, NULL, 1, 0),
(131, 14, 1, 'es_AR', 118, 'Técnico Universitario en Mecatrónica', 'Técnico Universitario en Mecatrónica', 'EC8A1A', NULL, NULL, 1, 0),
(132, 14, 1, 'es_AR', 119, 'Técnico en Industrias en Procesos', 'Técnico en Industrias en Procesos', 'EC8A1A', NULL, NULL, 1, 0),
(133, 14, 1, 'es_AR', 120, 'Técnico en Programación', 'Técnico en Programación', 'EC8A1A', NULL, NULL, 1, 0),
(134, 14, 1, 'es_AR', 121, 'Técnico Universitario en Calidad e Inocuidad agroalimentaria', 'Técnico Universitario en Calidad e Inocuidad agroalimentaria', 'EC8A1A', NULL, NULL, 1, 0),
(135, 14, 3, 'es_AR', 122, 'Doctor en Bromatología y Salud Nutricional', 'Doctor en Bromatología y Salud Nutricional', 'EC8A1A', NULL, NULL, 1, 0),
(136, 13, 1, 'es_AR', 123, 'Técnico Universitario en medicina Nuclear', 'Técnico Universitario en medicina Nuclear', '45B9EE', NULL, NULL, 1, 0),
(137, 13, 3, 'es_AR', 124, 'Magister en Ingeniería Biomédica', 'Magister en Ingeniería Biomédica', '45B9EE', NULL, NULL, 1, 0),
(138, 13, 3, 'es_AR', 125, 'Magister en Telemedicina', 'Magister en Telemedicina', '45B9EE', NULL, NULL, 1, 0),
(139, 13, 3, 'es_AR', 126, 'Doctor en Ingeniería', 'Doctor en Ingeniería', '45B9EE', NULL, NULL, 1, 0),
(140, 13, 3, 'es_AR', 127, 'Especialista en Ingeniería Clínica', 'Especialista en Ingeniería Clínica', '45B9EE', NULL, NULL, 1, 0),
(141, 12, 1, 'es_AR', 127, 'Técnico Universitario en Administración de Instituciones Estatales', 'Técnico Universitario en Administración de Instituciones Estatales', 'C5252B', NULL, NULL, 1, 0),
(142, 12, 1, 'es_AR', 127, 'Interprete de Lengua de Señas Argentina - Español', 'Interprete de Lengua de Señas Argentina - Español', 'C5252B', NULL, NULL, 1, 0),
(143, 12, 3, 'es_AR', 127, 'Magister en Salud Mental', 'Magister en Salud Mental', 'C5252B', NULL, NULL, 1, 0),
(144, 12, 3, 'es_AR', 127, 'Magister en Trabajo Social', 'Magister en Trabajo Social', 'C5252B', NULL, NULL, 1, 0),
(145, 12, 3, 'es_AR', 127, 'Doctor en Ciencias Sociales', 'Doctor en Ciencias Sociales', 'C5252B', NULL, NULL, 1, 0),
(146, 12, 3, 'es_AR', 127, 'Especialista en Gerontología', 'Especialista en Gerontología', 'C5252B', NULL, NULL, 1, 0),
(147, 12, 3, 'es_AR', 127, 'Especialista en Políticas Públicas de Niñez, Adolescencia y Familia', 'Especialista en Políticas Públicas de Niñez, Adolescencia y Familia', 'C5252B', NULL, NULL, 1, 0),
(148, 12, 3, 'es_AR', 127, 'Magister en Evaluación de Políticas Públicas', 'Magister en Evaluación de Políticas Públicas', 'C5252B', NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_lang`
--

CREATE TABLE IF NOT EXISTS `category_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds translations for category titles and descriptions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `city_lat` varchar(150) DEFAULT NULL,
  `city_lon` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores cities of countries retrieved by user.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cluster`
--

CREATE TABLE IF NOT EXISTS `cluster` (
  `id` int(11) NOT NULL,
  `location_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `latitude_min` double NOT NULL,
  `longitude_min` double NOT NULL,
  `latitude_max` double NOT NULL,
  `longitude_max` double NOT NULL,
  `child_count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `left_side` int(11) NOT NULL,
  `right_side` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `incident_id` (`incident_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores information used for clustering of reports on the map.';

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT '0',
  `comment_author` varchar(100) DEFAULT NULL,
  `comment_email` varchar(120) DEFAULT NULL,
  `comment_description` text,
  `comment_ip` varchar(100) DEFAULT NULL,
  `comment_spam` tinyint(4) NOT NULL DEFAULT '0',
  `comment_active` tinyint(4) NOT NULL DEFAULT '0',
  `comment_date` datetime DEFAULT NULL,
  `comment_date_gmt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores comments made on reports' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `incident_id`, `user_id`, `comment_author`, `comment_email`, `comment_description`, `comment_ip`, `comment_spam`, `comment_active`, `comment_date`, `comment_date_gmt`) VALUES
(1, 5, 1, 'Administrator', 'graduados@uner.edu.ar', 'Prueba comentario', '152.170.17.194', 0, 0, '2016-08-04 19:06:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(10) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `capital` varchar(100) DEFAULT NULL,
  `cities` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores a list of all countries and their capital cities' AUTO_INCREMENT=250 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `iso`, `country`, `capital`, `cities`) VALUES
(1, 'AD', 'Andorra', 'Andorra la Vella', 0),
(2, 'AE', 'United Arab Emirates', 'Abu Dhabi', 0),
(3, 'AF', 'Afghanistan', 'Kabul', 0),
(4, 'AG', 'Antigua and Barbuda', 'St. John''s', 0),
(5, 'AI', 'Anguilla', 'The Valley', 0),
(6, 'AL', 'Albania', 'Tirana', 0),
(7, 'AM', 'Armenia', 'Yerevan', 0),
(8, 'AN', 'Netherlands Antilles', 'Willemstad', 0),
(9, 'AO', 'Angola', 'Luanda', 0),
(10, 'AQ', 'Antarctica', '', 0),
(11, 'AR', 'Argentina', 'Buenos Aires', 0),
(12, 'AS', 'American Samoa', 'Pago Pago', 0),
(13, 'AT', 'Austria', 'Vienna', 0),
(14, 'AU', 'Australia', 'Canberra', 0),
(15, 'AW', 'Aruba', 'Oranjestad', 0),
(16, 'AX', 'Aland Islands', 'Mariehamn', 0),
(17, 'AZ', 'Azerbaijan', 'Baku', 0),
(18, 'BA', 'Bosnia and Herzegovina', 'Sarajevo', 0),
(19, 'BB', 'Barbados', 'Bridgetown', 0),
(20, 'BD', 'Bangladesh', 'Dhaka', 0),
(21, 'BE', 'Belgium', 'Brussels', 0),
(22, 'BF', 'Burkina Faso', 'Ouagadougou', 0),
(23, 'BG', 'Bulgaria', 'Sofia', 0),
(24, 'BH', 'Bahrain', 'Manama', 0),
(25, 'BI', 'Burundi', 'Bujumbura', 0),
(26, 'BJ', 'Benin', 'Porto-Novo', 0),
(27, 'BL', 'Saint BarthÃ©lemy', 'Gustavia', 0),
(28, 'BM', 'Bermuda', 'Hamilton', 0),
(29, 'BN', 'Brunei', 'Bandar Seri Begawan', 0),
(30, 'BO', 'Bolivia', 'La Paz', 0),
(31, 'BR', 'Brazil', 'BrasÃ­lia', 0),
(32, 'BS', 'Bahamas', 'Nassau', 0),
(33, 'BT', 'Bhutan', 'Thimphu', 0),
(34, 'BV', 'Bouvet Island', '', 0),
(35, 'BW', 'Botswana', 'Gaborone', 0),
(36, 'BY', 'Belarus', 'Minsk', 0),
(37, 'BZ', 'Belize', 'Belmopan', 0),
(38, 'CA', 'Canada', 'Ottawa', 0),
(39, 'CC', 'Cocos Islands', 'West Island', 0),
(40, 'CD', 'Democratic Republic of the Congo', 'Kinshasa', 0),
(41, 'CF', 'Central African Republic', 'Bangui', 0),
(42, 'CG', 'Congo Brazzavile', 'Brazzaville', 0),
(43, 'CH', 'Switzerland', 'Berne', 0),
(44, 'CI', 'Ivory Coast', 'Yamoussoukro', 0),
(45, 'CK', 'Cook Islands', 'Avarua', 0),
(46, 'CL', 'Chile', 'Santiago', 0),
(47, 'CM', 'Cameroon', 'YaoundÃ©', 0),
(48, 'CN', 'China', 'Beijing', 0),
(49, 'CO', 'Colombia', 'BogotÃ¡', 0),
(50, 'CR', 'Costa Rica', 'San JosÃ©', 0),
(51, 'CS', 'Serbia and Montenegro', 'Belgrade', 0),
(52, 'CU', 'Cuba', 'Havana', 0),
(53, 'CV', 'Cape Verde', 'Praia', 0),
(54, 'CX', 'Christmas Island', 'Flying Fish Cove', 0),
(55, 'CY', 'Cyprus', 'Nicosia', 0),
(56, 'CZ', 'Czech Republic', 'Prague', 0),
(57, 'DE', 'Germany', 'Berlin', 0),
(58, 'DJ', 'Djibouti', 'Djibouti', 0),
(59, 'DK', 'Denmark', 'Copenhagen', 0),
(60, 'DM', 'Dominica', 'Roseau', 0),
(61, 'DO', 'Dominican Republic', 'Santo Domingo', 0),
(62, 'DZ', 'Algeria', 'Algiers', 0),
(63, 'EC', 'Ecuador', 'Quito', 0),
(64, 'EE', 'Estonia', 'Tallinn', 0),
(65, 'EG', 'Egypt', 'Cairo', 0),
(66, 'EH', 'Western Sahara', 'El-Aaiun', 0),
(67, 'ER', 'Eritrea', 'Asmara', 0),
(68, 'ES', 'Spain', 'Madrid', 0),
(69, 'ET', 'Ethiopia', 'Addis Ababa', 0),
(70, 'FI', 'Finland', 'Helsinki', 0),
(71, 'FJ', 'Fiji', 'Suva', 0),
(72, 'FK', 'Falkland Islands', 'Stanley', 0),
(73, 'FM', 'Micronesia', 'Palikir', 0),
(74, 'FO', 'Faroe Islands', 'TÃ³rshavn', 0),
(75, 'FR', 'France', 'Paris', 0),
(76, 'GA', 'Gabon', 'Libreville', 0),
(77, 'GB', 'United Kingdom', 'London', 0),
(78, 'GD', 'Grenada', 'St. George''s', 0),
(79, 'GE', 'Georgia', 'Tbilisi', 0),
(80, 'GF', 'French Guiana', 'Cayenne', 0),
(81, 'GG', 'Guernsey', 'St Peter Port', 0),
(82, 'GH', 'Ghana', 'Accra', 0),
(83, 'GI', 'Gibraltar', 'Gibraltar', 0),
(84, 'GL', 'Greenland', 'Nuuk', 0),
(85, 'GM', 'Gambia', 'Banjul', 0),
(86, 'GN', 'Guinea', 'Conakry', 0),
(87, 'GP', 'Guadeloupe', 'Basse-Terre', 0),
(88, 'GQ', 'Equatorial Guinea', 'Malabo', 0),
(89, 'GR', 'Greece', 'Athens', 0),
(90, 'GS', 'South Georgia and the South Sandwich Islands', 'Grytviken', 0),
(91, 'GT', 'Guatemala', 'Guatemala City', 0),
(92, 'GU', 'Guam', 'HagÃ¥tÃ±a', 0),
(93, 'GW', 'Guinea-Bissau', 'Bissau', 0),
(94, 'GY', 'Guyana', 'Georgetown', 0),
(95, 'HK', 'Hong Kong', 'Hong Kong', 0),
(96, 'HM', 'Heard Island and McDonald Islands', '', 0),
(97, 'HN', 'Honduras', 'Tegucigalpa', 0),
(98, 'HR', 'Croatia', 'Zagreb', 0),
(99, 'HT', 'Haiti', 'Port-au-Prince', 0),
(100, 'HU', 'Hungary', 'Budapest', 0),
(101, 'ID', 'Indonesia', 'Jakarta', 0),
(102, 'IE', 'Ireland', 'Dublin', 0),
(103, 'IL', 'Israel', 'Jerusalem', 0),
(104, 'IM', 'Isle of Man', 'Douglas, Isle of Man', 0),
(105, 'IN', 'India', 'New Delhi', 0),
(106, 'IO', 'British Indian Ocean Territory', 'Diego Garcia', 0),
(107, 'IQ', 'Iraq', 'Baghdad', 0),
(108, 'IR', 'Iran', 'Tehran', 0),
(109, 'IS', 'Iceland', 'ReykjavÃ­k', 0),
(110, 'IT', 'Italy', 'Rome', 0),
(111, 'JE', 'Jersey', 'Saint Helier', 0),
(112, 'JM', 'Jamaica', 'Kingston', 0),
(113, 'JO', 'Jordan', 'Amman', 0),
(114, 'JP', 'Japan', 'Tokyo', 0),
(115, 'KE', 'Kenya', 'Nairobi', 0),
(116, 'KG', 'Kyrgyzstan', 'Bishkek', 0),
(117, 'KH', 'Cambodia', 'Phnom Penh', 0),
(118, 'KI', 'Kiribati', 'South Tarawa', 0),
(119, 'KM', 'Comoros', 'Moroni', 0),
(120, 'KN', 'Saint Kitts and Nevis', 'Basseterre', 0),
(121, 'KP', 'North Korea', 'Pyongyang', 0),
(122, 'KR', 'South Korea', 'Seoul', 0),
(123, 'KW', 'Kuwait', 'Kuwait City', 0),
(124, 'KY', 'Cayman Islands', 'George Town', 0),
(125, 'KZ', 'Kazakhstan', 'Astana', 0),
(126, 'LA', 'Laos', 'Vientiane', 0),
(127, 'LB', 'Lebanon', 'Beirut', 0),
(128, 'LC', 'Saint Lucia', 'Castries', 0),
(129, 'LI', 'Liechtenstein', 'Vaduz', 0),
(130, 'LK', 'Sri Lanka', 'Colombo', 0),
(131, 'LR', 'Liberia', 'Monrovia', 0),
(132, 'LS', 'Lesotho', 'Maseru', 0),
(133, 'LT', 'Lithuania', 'Vilnius', 0),
(134, 'LU', 'Luxembourg', 'Luxembourg', 0),
(135, 'LV', 'Latvia', 'Riga', 0),
(136, 'LY', 'Libya', 'Tripolis', 0),
(137, 'MA', 'Morocco', 'Rabat', 0),
(138, 'MC', 'Monaco', 'Monaco', 0),
(139, 'MD', 'Moldova', 'Chi_in_u', 0),
(140, 'ME', 'Montenegro', 'Podgorica', 0),
(141, 'MF', 'Saint Martin', 'Marigot', 0),
(142, 'MG', 'Madagascar', 'Antananarivo', 0),
(143, 'MH', 'Marshall Islands', 'Uliga', 0),
(144, 'MK', 'Macedonia', 'Skopje', 0),
(145, 'ML', 'Mali', 'Bamako', 0),
(146, 'MM', 'Myanmar', 'Yangon', 0),
(147, 'MN', 'Mongolia', 'Ulan Bator', 0),
(148, 'MO', 'Macao', 'Macao', 0),
(149, 'MP', 'Northern Mariana Islands', 'Saipan', 0),
(150, 'MQ', 'Martinique', 'Fort-de-France', 0),
(151, 'MR', 'Mauritania', 'Nouakchott', 0),
(152, 'MS', 'Montserrat', 'Plymouth', 0),
(153, 'MT', 'Malta', 'Valletta', 0),
(154, 'MU', 'Mauritius', 'Port Louis', 0),
(155, 'MV', 'Maldives', 'MalÃ©', 0),
(156, 'MW', 'Malawi', 'Lilongwe', 0),
(157, 'MX', 'Mexico', 'Mexico City', 0),
(158, 'MY', 'Malaysia', 'Kuala Lumpur', 0),
(159, 'MZ', 'Mozambique', 'Maputo', 0),
(160, 'NA', 'Namibia', 'Windhoek', 0),
(161, 'NC', 'New Caledonia', 'NoumÃ©a', 0),
(162, 'NE', 'Niger', 'Niamey', 0),
(163, 'NF', 'Norfolk Island', 'Kingston', 0),
(164, 'NG', 'Nigeria', 'Abuja', 0),
(165, 'NI', 'Nicaragua', 'Managua', 0),
(166, 'NL', 'Netherlands', 'Amsterdam', 0),
(167, 'NO', 'Norway', 'Oslo', 0),
(168, 'NP', 'Nepal', 'Kathmandu', 0),
(169, 'NR', 'Nauru', 'Yaren', 0),
(170, 'NU', 'Niue', 'Alofi', 0),
(171, 'NZ', 'New Zealand', 'Wellington', 0),
(172, 'OM', 'Oman', 'Muscat', 0),
(173, 'PA', 'Panama', 'Panama City', 0),
(174, 'PE', 'Peru', 'Lima', 0),
(175, 'PF', 'French Polynesia', 'Papeete', 0),
(176, 'PG', 'Papua New Guinea', 'Port Moresby', 0),
(177, 'PH', 'Philippines', 'Manila', 0),
(178, 'PK', 'Pakistan', 'Islamabad', 0),
(179, 'PL', 'Poland', 'Warsaw', 0),
(180, 'PM', 'Saint Pierre and Miquelon', 'Saint-Pierre', 0),
(181, 'PN', 'Pitcairn', 'Adamstown', 0),
(182, 'PR', 'Puerto Rico', 'San Juan', 0),
(183, 'PS', 'Palestinian Territory', 'East Jerusalem', 0),
(184, 'PT', 'Portugal', 'Lisbon', 0),
(185, 'PW', 'Palau', 'Koror', 0),
(186, 'PY', 'Paraguay', 'AsunciÃ³n', 0),
(187, 'QA', 'Qatar', 'Doha', 0),
(188, 'RE', 'Reunion', 'Saint-Denis', 0),
(189, 'RO', 'Romania', 'Bucharest', 0),
(190, 'RS', 'Serbia', 'Belgrade', 0),
(191, 'RU', 'Russia', 'Moscow', 0),
(192, 'RW', 'Rwanda', 'Kigali', 0),
(193, 'SA', 'Saudi Arabia', 'Riyadh', 0),
(194, 'SB', 'Solomon Islands', 'Honiara', 0),
(195, 'SC', 'Seychelles', 'Victoria', 0),
(196, 'SD', 'Sudan', 'Khartoum', 0),
(197, 'SE', 'Sweden', 'Stockholm', 0),
(198, 'SG', 'Singapore', 'Singapur', 0),
(199, 'SH', 'Saint Helena', 'Jamestown', 0),
(200, 'SI', 'Slovenia', 'Ljubljana', 0),
(201, 'SJ', 'Svalbard and Jan Mayen', 'Longyearbyen', 0),
(202, 'SK', 'Slovakia', 'Bratislava', 0),
(203, 'SL', 'Sierra Leone', 'Freetown', 0),
(204, 'SM', 'San Marino', 'San Marino', 0),
(205, 'SN', 'Senegal', 'Dakar', 0),
(206, 'SO', 'Somalia', 'Mogadishu', 0),
(207, 'SR', 'Suriname', 'Paramaribo', 0),
(208, 'ST', 'Sao Tome and Principe', 'SÃ£o TomÃ©', 0),
(209, 'SV', 'El Salvador', 'San Salvador', 0),
(210, 'SY', 'Syria', 'Damascus', 0),
(211, 'SZ', 'Swaziland', 'Mbabane', 0),
(212, 'TC', 'Turks and Caicos Islands', 'Cockburn Town', 0),
(213, 'TD', 'Chad', 'N''Djamena', 0),
(214, 'TF', 'French Southern Territories', 'Martin-de-ViviÃ¨s', 0),
(215, 'TG', 'Togo', 'LomÃ©', 0),
(216, 'TH', 'Thailand', 'Bangkok', 0),
(217, 'TJ', 'Tajikistan', 'Dushanbe', 0),
(218, 'TK', 'Tokelau', '', 0),
(219, 'TL', 'East Timor', 'Dili', 0),
(220, 'TM', 'Turkmenistan', 'Ashgabat', 0),
(221, 'TN', 'Tunisia', 'Tunis', 0),
(222, 'TO', 'Tonga', 'Nuku''alofa', 0),
(223, 'TR', 'Turkey', 'Ankara', 0),
(224, 'TT', 'Trinidad and Tobago', 'Port of Spain', 0),
(225, 'TV', 'Tuvalu', 'Vaiaku', 0),
(226, 'TW', 'Taiwan', 'Taipei', 0),
(227, 'TZ', 'Tanzania', 'Dar es Salaam', 0),
(228, 'UA', 'Ukraine', 'Kiev', 0),
(229, 'UG', 'Uganda', 'Kampala', 0),
(230, 'UM', 'United States Minor Outlying Islands', '', 0),
(231, 'US', 'United States', 'Washington', 0),
(232, 'UY', 'Uruguay', 'Montevideo', 0),
(233, 'UZ', 'Uzbekistan', 'Tashkent', 0),
(234, 'VA', 'Vatican', 'Vatican City', 0),
(235, 'VC', 'Saint Vincent and the Grenadines', 'Kingstown', 0),
(236, 'VE', 'Venezuela', 'Caracas', 0),
(237, 'VG', 'British Virgin Islands', 'Road Town', 0),
(238, 'VI', 'U.S. Virgin Islands', 'Charlotte Amalie', 0),
(239, 'VN', 'Vietnam', 'Hanoi', 0),
(240, 'VU', 'Vanuatu', 'Port Vila', 0),
(241, 'WF', 'Wallis and Futuna', 'MatÃ¢''Utu', 0),
(242, 'WS', 'Samoa', 'Apia', 0),
(243, 'YE', 'Yemen', 'Sanâ€˜aâ€™', 0),
(244, 'YT', 'Mayotte', 'Mamoudzou', 0),
(245, 'ZA', 'South Africa', 'Pretoria', 0),
(246, 'ZM', 'Zambia', 'Lusaka', 0),
(247, 'ZW', 'Zimbabwe', 'Harare', 0),
(248, 'XK', 'Kosovo', 'Pristina', 0),
(249, 'SS', 'South Sudan', 'Juba', 0);

-- --------------------------------------------------------

--
-- Table structure for table `externalapp`
--

CREATE TABLE IF NOT EXISTS `externalapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Info on external apps(mobile) that work with your deployment' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `feed`
--

CREATE TABLE IF NOT EXISTS `feed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feed_name` varchar(255) DEFAULT NULL,
  `feed_url` varchar(255) DEFAULT NULL,
  `feed_cache` text,
  `feed_active` tinyint(4) DEFAULT '1',
  `feed_update` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Information about RSS Feeds a deployment subscribes to' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `feed`
--

INSERT INTO `feed` (`id`, `feed_name`, `feed_url`, `feed_cache`, `feed_active`, `feed_update`) VALUES
(1, 'Noticias UNER', 'http://www.graduados.uner.edu.ar/?q=rss.xml', NULL, 1, 1489065513);

-- --------------------------------------------------------

--
-- Table structure for table `feed_item`
--

CREATE TABLE IF NOT EXISTS `feed_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) unsigned NOT NULL,
  `location_id` bigint(20) unsigned DEFAULT '0',
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `item_title` varchar(255) DEFAULT NULL,
  `item_description` text,
  `item_link` varchar(255) DEFAULT NULL,
  `item_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_id` (`feed_id`),
  KEY `incident_id` (`incident_id`),
  KEY `location_id` (`location_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores feed items pulled from each RSS Feed' AUTO_INCREMENT=24 ;

--
-- Dumping data for table `feed_item`
--

INSERT INTO `feed_item` (`id`, `feed_id`, `location_id`, `incident_id`, `item_title`, `item_description`, `item_link`, `item_date`) VALUES
(1, 1, 0, 0, 'Jornadas de Contabilidad y Auditoría 2016', '<p>&nbsp;<span>La Facultad de Ciencias de la Administraci&oacute;n organiza las Jornadas de Contabilidad y Auditor&iacute;a 2016, para el 23 y 24 junio, con la iniciativa de generar un espacio en donde se pueda compartir y buscar soluciones a la problem&aacute;tica de las peque&ntilde;as y medianas empresas de la regi&oacute;n.&nbsp;</span><br style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Lora, serif; font-size: 18px; line-height: 20px;" /></p>\n<p><a href="http://www.graduados.uner.edu.ar/eventos/jornadas-de-contabilidad-y-auditoria-2016" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/eventos/jornadas-de-contabilidad-y-auditoria-2016', '2016-06-23 03:00:00'),
(2, 1, 0, 0, 'Taller de cocina molecular', '<div><img src="http://www.graduados.uner.edu.ar/userfiles/839489628993.jpg" width="700" height="389" alt="" /></div>\n<p>El viernes 3 de junio, desde las 9:00, la Facultad de Ciencias de la Alimentaci&oacute;n, conjuntamente con la Universidad de Quilmes presentar&aacute; para alumnos, graduados y socios de la Asociaci&oacute;n Hotelera Gastron&oacute;mica de Concordia, un Taller de cocina molecular, dise&ntilde;ada con distintas t&eacute;cnicas de gastronom&iacute;a molecular.</p>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/taller-de-cocina-molecular" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/taller-de-cocina-molecular', '2016-06-03 16:11:00'),
(3, 1, 0, 0, 'Graduados electos para Consejeros Superiores', '<p><span><img src="http://www.graduados.uner.edu.ar/userfiles/478840611697.jpg" width="700" height="389" alt="" /><br />\n</span>Los representantes de los graduados a Consejeros Superiores, titulares y suplentes, para el per&iacute;odo 2016-2018 fueron elegidos en Villaguay.</p>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/graduados-electos-para-consejeros-superiores" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/graduados-electos-para-consejeros-superiores', '2016-05-27 11:47:00'),
(4, 1, 0, 0, 'Segundo encuentro del Taller de Mediadores', '<div><span><br />\n</span></div>\n<p><span><img src="http://www.graduados.uner.edu.ar/userfiles/476091866032.jpg" width="700" height="389" alt="" /><br />\n</span><span><br />\nEs organizado por la Facultad de Ciencias Econ&oacute;micas, dirigido a mediadores y p&uacute;blico en general.</span><span></span></p>\n<p></p>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/segundo-encuentro-del-taller-de-mediadores" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/segundo-encuentro-del-taller-de-mediadores', '2016-05-24 11:43:00'),
(5, 1, 0, 0, 'INNOVAR', '<div><span><img src="http://www.graduados.uner.edu.ar/userfiles/logo_innovar1.png" width="363" height="103" alt="" /><br />\n</span></div>\n<p><span></span></p>\n<p></p>\n<div><span>Hasta el 15 de mayo estar&aacute; abierta la inscripci&oacute;n a la d&eacute;cimo segunda edici&oacute;n del Concurso Nacional de Innovaciones - INNOVAR 2016, organizado por el Ministerio de Ciencia, Tecnolog&iacute;a e Innovaci&oacute;n Productiva.</span></div>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/innovar" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/innovar', '2016-05-04 11:50:00'),
(6, 1, 0, 0, 'Programa Facultad &amp; Mundo Laboral', '<p>&nbsp;<img src="http://www.graduados.uner.edu.ar/userfiles/405056770506(3).jpg" width="700" height="389" alt="" /></p>\n<div><span>Se realizar&aacute; en la Facultad de Ciencias Econ&oacute;micas una reuni&oacute;n informativa sobre la apertura del Programa Facultad &amp; Mundo Laboral 2016. Ser&aacute; el viernes 15 desde las 18:00.</span><br style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Lora, serif; font-size: 18px; line-height: 20px;" /><br />\n&nbsp;</div>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/programa-facultad-mundo-laboral" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/programa-facultad-mundo-laboral', '2016-04-12 19:46:00'),
(7, 1, 0, 0, 'Disertación: Gerenciamiento y liderazgo del talento humano', '<p><span>Conferencia Gerenciamiento y Liderazgo del Talento Humano a cargo del Mg. Marcelo Agolti. Jueves 17/03 a las 19 hs.</span></p>\n<div><span><br />\n<img src="http://www.graduados.uner.edu.ar/userfiles/12801450_1044587332257986_5951000023503022859_n(2).jpg" width="279" height="395" alt="" /><br />\n</span></div><p><a href="http://www.graduados.uner.edu.ar/noticias/disertacion-gerenciamiento-y-liderazgo-del-talento-humano" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/disertacion-gerenciamiento-y-liderazgo-del-talento-humano', '2016-03-04 14:05:00'),
(8, 1, 0, 0, 'Jornada Gastronómica sobre pescados de río en la Facultad de Ciencias de la Alimentación', '<p><img src="http://www.graduados.uner.edu.ar/userfiles/12806077_10209054637706274_8850270452487067499_n-300x251.jpg" width="300" height="251" alt="" /><br />\n&nbsp;</p>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/jornada-gastronomica-sobre-pescados-de-rio-en-la-facultad-de-ciencias-de-la-alimentacion" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/jornada-gastronomica-sobre-pescados-de-rio-en-la-facultad-de-ciencias-de-la-alimentacion', '2016-03-03 09:57:00'),
(9, 1, 0, 0, 'XVIII Workshop de Investigadores en Ciencias de la Computación', '<div><img width="600" height="848" alt="" src="http://www.graduados.uner.edu.ar/userfiles/Wicc%20afiche.jpg" /></div>', 'http://www.graduados.uner.edu.ar/noticias/xviii-workshop-de-investigadores-en-ciencias-de-la-computacion', '2016-02-15 13:55:00'),
(10, 1, 0, 0, 'INEXA', '<p>6&deg; Jornadas de difusi&oacute;n de proyectos de investigaci&oacute;n, extensi&oacute;n y actividades acad&eacute;mcias de la UNER</p>\n<p><img width="405" height="355" alt="" src="http://www.graduados.uner.edu.ar/userfiles/tarjeta_INEXA.jpg" /></p>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/inexa" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/inexa', '2015-11-06 16:46:00'),
(11, 1, 0, 0, 'Tres cursos en el Aula Virtual', '<div><img src="http://www.graduados.uner.edu.ar/userfiles/229636617991.jpg" width="700" height="389" alt="" /><br />\nLa Escuela Virtual Internacional CAVILA es un espacio de formaci&oacute;n y perfeccionamiento en donde intervienen m&aacute;s de 14 universidades nacionales que ofrecen cursos intensivos en modalidad completamente virtual. <br />\n&nbsp;</div>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/tres-cursos-en-el-aula-virtual" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/tres-cursos-en-el-aula-virtual', '2016-06-07 15:21:00'),
(12, 1, 0, 0, 'Primeros egresados de la Tecnicatura Universitaria en Mecatrónica', '<div><img src="http://www.graduados.uner.edu.ar/userfiles/P1018567(4).jpg" width="700" height="489" alt="" /><br />\nSe realiz&oacute; el acto de jura y entrega de diplomas de 5 egresados de la primera Cohorte de la Tecnicatura Universitaria en Mecatr&oacute;nica y de 1 graduada en&nbsp;Ingenier&iacute;a en Alimentos por la Facultad de Ciencias de la Alimentaci&oacute;n de la&nbsp;Universidad Nacional de Entre R&iacute;os.<br />\n&nbsp;</div>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/primeros-egresados-de-la-tecnicatura-universitaria-en-mecatronica" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/primeros-egresados-de-la-tecnicatura-universitaria-en-mecatronica', '2016-06-14 14:40:00'),
(13, 1, 0, 0, 'Un Bioingeniero en la industria farmacéutica', '<p>&nbsp;<img src="http://www.graduados.uner.edu.ar/userfiles/Gonzalo-Simon_jpg_973718260(1).jpg" width="789" height="550" alt="" /></p>\n<p>Gonzalo Sim&oacute;n es el director de Investigaciones Cl&iacute;nicas de GSK Argentina, responsable de la coordinaci&oacute;n de los diversos estudios cl&iacute;nicos que lleva adelante la compa&ntilde;&iacute;a que anunci&oacute;, en la semana, una inversi&oacute;n en el pa&iacute;s por 1.000 millones de pesos en cinco a&ntilde;os.</p>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/un-bioingeniero-en-la-industria-farmaceutica" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/un-bioingeniero-en-la-industria-farmaceutica', '2016-06-10 13:04:00'),
(14, 1, 0, 0, 'Programa Gerenciamiento y liderazgo del talento humano', '<p>&nbsp;<img src="http://www.graduados.uner.edu.ar/userfiles/13537699_1120747047975347_2805475005062643405_n.jpg" width="279" height="395" alt="" /><br />\nCurso de posgrado de la Facultad de Ciencias Econ&oacute;micas en el mes de agosto.</p>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/programa-gerenciamiento-y-liderazgo-del-talento-humano" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/programa-gerenciamiento-y-liderazgo-del-talento-humano', '2016-06-27 16:58:00'),
(15, 1, 0, 0, 'Una moto con corazón universitario', '<p>&nbsp;</p>\n<div>\n<p><img src="http://www.graduados.uner.edu.ar/userfiles/335104242032.jpg" width="700" height="389" alt="" /></p>\n</div>\n<div>\n<div>\n<div><span>El bioingeniero Guillermo Gebhart, egresado de la Facultad de Ingenier&iacute;a, junto a su hermano Iv&aacute;n, crearon una supermoto totalmente el&eacute;ctrica.</span></div>\n<div><span><br type="_moz" /><br />\n</span></div>\n</div>\n</div>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/una-moto-con-corazon-universitario" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/una-moto-con-corazon-universitario', '2016-07-05 12:37:00'),
(16, 1, 0, 0, 'Ciclo de charlas en la Semana Institucional', '<p>&nbsp;</p>\n<div><img src="http://www.graduados.uner.edu.ar/userfiles/semana_institucional(1).png" width="500" height="332" alt="" />\n<p><span>En el marco del festejo de los 50 A&ntilde;os de la Facultad de Ciencias Econ&oacute;micas, se realizar&aacute; la Semana Institucional, organizada por el &aacute;rea Graduados de la Secretaria Acad&eacute;mica, el Centro de Estudiantes y el CIEFCE.</span></p>\n</div><p><a href="http://www.graduados.uner.edu.ar/noticias/ciclo-de-charlas-en-la-semana-institucional" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/ciclo-de-charlas-en-la-semana-institucional', '2016-09-09 11:44:00'),
(17, 1, 0, 0, 'Jornada de cultivos de verano', '<p>&nbsp;<img src="http://www.graduados.uner.edu.ar/userfiles/517592369373.jpg" width="550" height="306" alt="" /></p>\n<div>\n<span>El martes 13 de septiembre se desarrollar&aacute; la Jornada de Cultivos de Verano 2016, en el SUM de la Facultad de Ciencias Agropecuarias. Ser&aacute; a partir de las 14:00.<br />\n</span></div>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/jornada-de-cultivos-de-verano" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/jornada-de-cultivos-de-verano', '2016-09-09 14:10:00'),
(18, 1, 0, 0, 'Curso de posgrado Diseño de Instrumentos', '<p>&nbsp;<img src="http://www.graduados.uner.edu.ar/userfiles/512144561802.jpg" width="500" height="278" alt="" /></p>\n<div>\nSe encuentra abierta la inscripci&oacute;n, hasta el 7 de octubre, que se dictar&aacute; en la Facultad de Ciencias Econ&oacute;micas.<br />\n&nbsp;</div>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/curso-de-posgrado-diseno-de-instrumentos" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/curso-de-posgrado-diseno-de-instrumentos', '2016-09-15 16:41:00'),
(19, 1, 0, 0, 'Semana Nacional del Emprendedor Tecnológico', '<div><img src="http://www.graduados.uner.edu.ar/userfiles/164379410300.jpg" width="500" height="278" alt="" /><br />\n<br />\n<p></p>\n<div>Se realizar&aacute; entre el lunes 19 al viernes 23 de septiembre, en el Sal&oacute;n de Usos Multiples de la Facultad de Bromatolog&iacute;a.</div>\n<div>&nbsp;</div>\n</div>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/semana-nacional-del-emprendedor-tecnologico" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/semana-nacional-del-emprendedor-tecnologico', '2016-09-14 14:24:00'),
(20, 1, 0, 0, 'Seminario Abierto de Derechos Humanos', '<p>&nbsp;<img src="http://www.graduados.uner.edu.ar/userfiles/426268009888.jpg" width="500" height="278" alt="" /></p>\n<div>Se realizar&aacute; en Trabajo Social con tres ejes tem&aacute;ticos: Terrorismo de Estado, violencia de g&eacute;nero y violencia institucional.<br />\n&nbsp;</div>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/seminario-abierto-de-derechos-humanos" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/seminario-abierto-de-derechos-humanos', '2016-09-14 13:57:00'),
(21, 1, 0, 0, 'Congreso de Semiótica', '<p>&nbsp;<img src="http://www.graduados.uner.edu.ar/userfiles/822199016738.jpg" width="550" height="306" alt="" /></p>\n<div>\n<div><span>Ser&aacute; desde 15 al 17 de septiembre en la Facultad de Ciencias de la Educaci&oacute;n de nuestra Universidad y en las Facultades sedes de la UNL.</span></div>\n<div><span><br type="_moz" /><br />\n</span></div>\n</div>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/congreso-de-semiotica" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/congreso-de-semiotica', '2016-09-12 16:40:00'),
(22, 1, 0, 0, 'Charla sobre las aplicaciones del Polietileno', '<p>&nbsp;<img src="http://www.graduados.uner.edu.ar/userfiles/3169402224(1).jpg" width="550" height="306" alt="" /></p>\n<div>\n<div>Ser&aacute; en la Facultad de Bromatolog&iacute;a y a cargo de la Ingeniera Qu&iacute;mica Mar&iacute;a Luj&aacute;n Tricotti.</div>\n</div>\n<p><a href="http://www.graduados.uner.edu.ar/noticias/charla-sobre-las-aplicaciones-del-polietileno" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/charla-sobre-las-aplicaciones-del-polietileno', '2016-09-12 14:14:00'),
(23, 1, 0, 0, 'La Facultad de Ingeniería sede del Rally de Innovación', '<div><img src="http://www.graduados.uner.edu.ar/userfiles/829906442811(1).jpg" width="600" height="333" alt="" />\n<div>La competencia internacional se desarrollar&aacute; el 30 de septiembre y 1 de octubre.</div>\n</div><p><a href="http://www.graduados.uner.edu.ar/noticias/la-facultad-de-ingenieria-sede-del-rally-de-innovacion" target="_blank">leer más</a></p>', 'http://www.graduados.uner.edu.ar/noticias/la-facultad-de-ingenieria-sede-del-rally-de-innovacion', '2016-09-19 16:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `feed_item_category`
--

CREATE TABLE IF NOT EXISTS `feed_item_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_item_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `feed_item_category_ids` (`feed_item_id`,`category_id`),
  KEY `feed_item_id` (`feed_item_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores fetched feed items categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `findlocation_cache`
--

CREATE TABLE IF NOT EXISTS `findlocation_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `search_term` varchar(255) DEFAULT NULL,
  `result_name` varchar(255) DEFAULT NULL,
  `lat` double NOT NULL DEFAULT '0',
  `lon` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `findlocation_settings`
--

CREATE TABLE IF NOT EXISTS `findlocation_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_code` varchar(10) DEFAULT NULL,
  `append_to_google` varchar(255) DEFAULT NULL,
  `geonames_username` varchar(255) DEFAULT NULL,
  `n_w_lat` double NOT NULL DEFAULT '0',
  `n_w_lon` double NOT NULL DEFAULT '0',
  `s_e_lat` double NOT NULL DEFAULT '0',
  `s_e_lon` double NOT NULL DEFAULT '0',
  `fuzzy` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE IF NOT EXISTS `form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_title` varchar(200) NOT NULL,
  `form_description` text,
  `form_active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_title` (`form_title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores all report submission forms created(default+custom)' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`id`, `form_title`, `form_description`, `form_active`) VALUES
(1, 'Default Form', 'Default form, for report entry', 1);

-- --------------------------------------------------------

--
-- Table structure for table `form_field`
--

CREATE TABLE IF NOT EXISTS `form_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '1',
  `field_name` varchar(200) DEFAULT NULL,
  `field_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - TEXTFIELD, 2 - TEXTAREA (FREETEXT), 3 - DATE, 4 - PASSWORD, 5 - RADIO, 6 - CHECKBOX',
  `field_required` tinyint(4) DEFAULT '0',
  `field_position` tinyint(4) NOT NULL DEFAULT '0',
  `field_default` text,
  `field_maxlength` int(11) NOT NULL DEFAULT '0',
  `field_width` smallint(6) NOT NULL DEFAULT '0',
  `field_height` tinyint(4) DEFAULT '5',
  `field_isdate` tinyint(4) NOT NULL DEFAULT '0',
  `field_ispublic_visible` tinyint(4) NOT NULL DEFAULT '0',
  `field_ispublic_submit` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_name` (`field_name`,`form_id`),
  KEY `fk_form_id` (`form_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores all custom form fields created by users' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `form_field`
--

INSERT INTO `form_field` (`id`, `form_id`, `field_name`, `field_type`, `field_required`, `field_position`, `field_default`, `field_maxlength`, `field_width`, `field_height`, `field_isdate`, `field_ispublic_visible`, `field_ispublic_submit`) VALUES
(8, 1, 'Sector productivo a la que pertenece la empresa o institución donde trabaja', 6, 0, 3, 'Agropecuario, Industrial, Información, Salud, Servicios, Financiero, Comunicación, Cultura/educación, ONG, Otro', 0, 0, 5, 0, 0, 0),
(9, 1, 'Tipo de gestión de la institución o empresa donde trabaja', 6, 0, 4, 'Privada, Pública, No gubernamental, Otro', 0, 0, 5, 0, 0, 0),
(6, 1, 'Títulos en otras instituciones', 6, 0, 1, 'Grado, Pregrado, Especialista, Magister, Doctor', 0, 0, 5, 0, 0, 0),
(7, 1, 'Área disciplinar en la que se formó', 6, 0, 2, 'Ciencias Aplicadas, Ciencias Básicas, Ciencias de la Salud, Ciencias Humanas, Ciencias Sociales', 0, 0, 5, 0, 0, 0),
(12, 1, 'Conformidad del graduado', 6, 1, 5, 'Declaro que los datos proporcionados en el formulario son verdaderos y acepto que se publiquen en el Mapa de graduados de la UNER.', 0, 0, 5, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `form_field_option`
--

CREATE TABLE IF NOT EXISTS `form_field_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(200) DEFAULT NULL,
  `option_value` text,
  PRIMARY KEY (`id`),
  KEY `form_field_id` (`form_field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Options related to custom form fields' AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `form_response`
--

CREATE TABLE IF NOT EXISTS `form_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL,
  `incident_id` bigint(20) unsigned NOT NULL,
  `form_response` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_form_field_id` (`form_field_id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores responses to custom form fields' AUTO_INCREMENT=21 ;

--
-- Dumping data for table `form_response`
--

INSERT INTO `form_response` (`id`, `form_field_id`, `incident_id`, `form_response`) VALUES
(1, 6, 2, ''),
(2, 7, 2, 'Ciencias Aplicadas'),
(3, 8, 2, 'Agropecuario'),
(4, 9, 2, 'Privada'),
(5, 6, 3, ''),
(6, 7, 3, 'Ciencias Básicas'),
(7, 8, 3, 'Agropecuario'),
(8, 9, 3, 'Privada'),
(9, 6, 4, ''),
(10, 7, 4, ''),
(11, 8, 4, 'Agropecuario'),
(12, 9, 4, 'Privada'),
(13, 6, 5, ''),
(14, 7, 5, ''),
(15, 8, 5, 'Agropecuario'),
(16, 9, 5, 'No gubernamental'),
(17, 6, 6, ''),
(18, 7, 6, ''),
(19, 8, 6, 'Industrial'),
(20, 9, 6, 'Privada');

-- --------------------------------------------------------

--
-- Table structure for table `geometry`
--

CREATE TABLE IF NOT EXISTS `geometry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `geometry` geometry NOT NULL,
  `geometry_label` varchar(150) DEFAULT NULL,
  `geometry_comment` varchar(255) DEFAULT NULL,
  `geometry_color` varchar(20) DEFAULT NULL,
  `geometry_strokewidth` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  SPATIAL KEY `geometry` (`geometry`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores map geometries i.e polygons, lines etc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hidetime`
--

CREATE TABLE IF NOT EXISTS `hidetime` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE IF NOT EXISTS `incident` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned NOT NULL,
  `form_id` int(11) NOT NULL DEFAULT '1',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `user_id` int(11) unsigned DEFAULT NULL,
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_description` longtext,
  `incident_date` datetime DEFAULT NULL,
  `incident_mode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - WEB, 2 - SMS, 3 - EMAIL, 4 - TWITTER',
  `incident_active` tinyint(4) NOT NULL DEFAULT '0',
  `incident_verified` tinyint(4) NOT NULL DEFAULT '0',
  `incident_dateadd` datetime DEFAULT NULL,
  `incident_dateadd_gmt` datetime DEFAULT NULL,
  `incident_datemodify` datetime DEFAULT NULL,
  `incident_alert_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - Not Tagged for Sending, 1 - Tagged for Sending, 2 - Alerts Have Been Sent',
  `incident_zoom` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `incident_active` (`incident_active`),
  KEY `incident_date` (`incident_date`),
  KEY `form_id` (`form_id`),
  KEY `user_id` (`user_id`),
  KEY `incident_mode` (`incident_mode`),
  KEY `incident_verified` (`incident_verified`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores reports submitted' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`id`, `location_id`, `form_id`, `locale`, `user_id`, `incident_title`, `incident_description`, `incident_date`, `incident_mode`, `incident_active`, `incident_verified`, `incident_dateadd`, `incident_dateadd_gmt`, `incident_datemodify`, `incident_alert_status`, `incident_zoom`) VALUES
(2, 2, 1, 'en_US', 1, 'Ingeniero agrónomo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2016-06-24 19:19:00', 1, 1, 1, '2016-06-24 19:20:38', NULL, '2016-06-24 19:21:53', 2, 1),
(3, 3, 1, 'en_US', 1, 'Medico veterinario especialista en educación', 'Registro de prueba con grado y posgrado', '2016-06-27 21:35:00', 1, 1, 0, '2016-06-27 21:46:53', NULL, '2016-06-29 16:38:10', 2, 3),
(4, 4, 0, 'en_US', 1, 'Prueba carrera de grado', 'Esto es una prueba', '2016-06-29 17:05:00', 1, 1, 0, '2016-06-29 17:06:00', NULL, NULL, 2, 7),
(5, 5, 1, 'en_US', 1, 'Prueba carrera de posgrado', 'Esto es una prueba', '2016-06-29 17:06:00', 1, 1, 0, '2016-06-29 17:06:40', NULL, '2016-06-29 18:38:36', 2, 5),
(6, 6, 0, 'en_US', 1, 'Prueba carrera de pregrado', 'Esto es una prueba', '2016-06-29 17:06:00', 1, 1, 0, '2016-06-29 17:09:03', NULL, NULL, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `incident_category`
--

CREATE TABLE IF NOT EXISTS `incident_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `incident_category_ids` (`incident_id`,`category_id`),
  KEY `incident_id` (`incident_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores submitted reports categories' AUTO_INCREMENT=15 ;

--
-- Dumping data for table `incident_category`
--

INSERT INTO `incident_category` (`id`, `incident_id`, `category_id`) VALUES
(4, 2, 39),
(9, 3, 51),
(10, 3, 56),
(11, 4, 39),
(14, 5, 56),
(13, 6, 61);

-- --------------------------------------------------------

--
-- Table structure for table `incident_lang`
--

CREATE TABLE IF NOT EXISTS `incident_lang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_description` longtext,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds translations for report titles and descriptions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `incident_person`
--

CREATE TABLE IF NOT EXISTS `incident_person` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `person_first` varchar(200) DEFAULT NULL,
  `person_last` varchar(200) DEFAULT NULL,
  `person_email` varchar(120) DEFAULT NULL,
  `person_phone` varchar(60) DEFAULT NULL,
  `person_ip` varchar(50) DEFAULT NULL,
  `person_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Holds information provided by people who submit reports' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `incident_person`
--

INSERT INTO `incident_person` (`id`, `incident_id`, `person_first`, `person_last`, `person_email`, `person_phone`, `person_ip`, `person_date`) VALUES
(3, 2, 'Carlos', 'Sanchez', 'carlos.sanchez@mail.com', NULL, NULL, '2016-06-24 19:21:53'),
(6, 3, 'Juan', 'Alzamendi', '', NULL, NULL, '2016-06-29 16:38:10'),
(7, 4, '', '', '', NULL, NULL, '2016-06-29 17:06:00'),
(10, 5, '', '', '', NULL, NULL, '2016-06-29 18:38:36'),
(9, 6, '', '', '', NULL, NULL, '2016-06-29 17:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `layer`
--

CREATE TABLE IF NOT EXISTS `layer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layer_name` varchar(255) DEFAULT NULL,
  `layer_url` varchar(255) DEFAULT NULL,
  `layer_file` varchar(100) DEFAULT NULL,
  `layer_color` varchar(20) DEFAULT NULL,
  `layer_visible` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds static layer information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE IF NOT EXISTS `level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_title` varchar(200) DEFAULT NULL,
  `level_description` varchar(200) DEFAULT NULL,
  `level_weight` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores level of trust assigned to reporters of the platform' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `level_title`, `level_description`, `level_weight`) VALUES
(1, 'SPAM + Delete', 'SPAM + Delete', -2),
(2, 'SPAM', 'SPAM', -1),
(3, 'Untrusted', 'Untrusted', 0),
(4, 'Trusted', 'Trusted', 1),
(5, 'Trusted + Verify', 'Trusted + Verify', 2);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `location_visible` tinyint(4) NOT NULL DEFAULT '1',
  `location_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores location information' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `location_name`, `country_id`, `latitude`, `longitude`, `location_visible`, `location_date`) VALUES
(2, 'Belgrano, Municipio de Diamante, Distrito Costa Grande, Departamento Diamante, ER., Argentina', 11, -32.073506, -60.619803, 1, '2016-06-24 19:21:53'),
(3, 'Entre Rios, La Bianca, Concordia, Municipio de Concordia, Distrito Suburbios, Departamento Concordia, ER., 3200, Argentina', 11, -31.352966, -58.008784, 1, '2016-06-29 16:38:10'),
(4, 'Paraná, Municipio de Paraná, Distrito Sauce, Departamento Paraná, ER., Argentina', 11, -31.743261, -60.517197, 1, '2016-06-29 17:06:00'),
(5, 'Rosario, Municipio de Rosario, Departamento Rosario, Sta. Fe, S2000, Argentina', 11, -32.9595, -60.661541, 1, '2016-06-29 18:38:36'),
(6, 'Salto, 50000, Uruguay', 232, -31.38889, -57.960887, 1, '2016-06-29 17:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE IF NOT EXISTS `maintenance` (
  `allowed_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`allowed_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Puts a site in maintenance mode if data exists in this table';

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `message_id` bigint(20) unsigned DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `media_type` tinyint(4) DEFAULT NULL COMMENT '1 - IMAGES, 2 - VIDEO, 3 - AUDIO, 4 - NEWS, 5 - PODCAST',
  `media_title` varchar(255) DEFAULT NULL,
  `media_description` longtext,
  `media_link` varchar(255) DEFAULT NULL,
  `media_medium` varchar(255) DEFAULT NULL,
  `media_thumb` varchar(255) DEFAULT NULL,
  `media_date` datetime DEFAULT NULL,
  `media_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `location_id` (`location_id`),
  KEY `badge_id` (`badge_id`),
  KEY `message_id` (`message_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores any media submitted along with a report' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `location_id`, `incident_id`, `message_id`, `badge_id`, `media_type`, `media_title`, `media_description`, `media_link`, `media_medium`, `media_thumb`, `media_date`, `media_active`) VALUES
(1, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'banner_1460383671.gif', 'banner_1460383671_m.gif', 'banner_1460383671_t.gif', '2016-04-11 14:07:51', 1),
(2, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'banner_1464983117.gif', 'banner_1464983117_m.gif', 'banner_1464983117_t.gif', '2016-06-03 19:45:17', 1),
(3, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'default_map_all_1467063016.png', 'default_map_all_1467063016_m.png', 'default_map_all_1467063016_t.png', '2016-06-27 21:30:16', 1),
(5, 3, 3, NULL, NULL, 1, NULL, NULL, '3_1_1467218290.jpg', '3_1_1467218290.jpg', '3_1_1467218290_t.jpg', '2016-06-29 16:38:10', 1),
(6, 5, 5, NULL, NULL, 1, NULL, NULL, '5_1_1467225516.jpg', '5_1_1467225516.jpg', '5_1_1467225516_t.jpg', '2016-06-29 18:38:36', 1),
(7, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'banner_1470335133.jpg', 'banner_1470335133_m.jpg', 'banner_1470335133_t.jpg', '2016-08-04 18:25:33', 1),
(8, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'banner_1470335280.jpg', 'banner_1470335280_m.jpg', 'banner_1470335280_t.jpg', '2016-08-04 18:28:00', 1),
(9, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'banner_1470335434.jpg', 'banner_1470335434_m.jpg', 'banner_1470335434_t.jpg', '2016-08-04 18:30:34', 1),
(10, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'banner_1470335779.jpg', 'banner_1470335779_m.jpg', 'banner_1470335779_t.jpg', '2016-08-04 18:36:19', 1),
(11, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'banner_1470335939.jpg', 'banner_1470335939_m.jpg', 'banner_1470335939_t.jpg', '2016-08-04 18:38:59', 1),
(12, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'banner_1470336059.jpg', 'banner_1470336059_m.jpg', 'banner_1470336059_t.jpg', '2016-08-04 18:41:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT '0',
  `incident_id` bigint(20) unsigned DEFAULT '0',
  `user_id` int(11) unsigned DEFAULT '0',
  `reporter_id` bigint(20) unsigned DEFAULT NULL,
  `service_messageid` varchar(100) DEFAULT NULL,
  `message_from` varchar(100) DEFAULT NULL,
  `message_to` varchar(100) DEFAULT NULL,
  `message` text,
  `message_detail` text,
  `message_type` tinyint(4) DEFAULT '1' COMMENT '1 - INBOX, 2 - OUTBOX (From Admin), 3 - DELETED',
  `message_date` datetime DEFAULT NULL,
  `message_level` tinyint(4) DEFAULT '0' COMMENT '0 - UNREAD, 1 - READ, 99 - SPAM',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `incident_id` (`incident_id`),
  KEY `reporter_id` (`reporter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores tweets, emails and SMS messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openid`
--

CREATE TABLE IF NOT EXISTS `openid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `openid` varchar(255) NOT NULL,
  `openid_email` varchar(127) NOT NULL,
  `openid_server` varchar(255) NOT NULL,
  `openid_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores usersâ€™ openid information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `page_description` longtext,
  `page_tab` varchar(100) NOT NULL,
  `page_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores user created pages' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `page_title`, `page_description`, `page_tab`, `page_active`) VALUES
(1, 'El Mapa de Graduados', '<h5><span style="font-weight:normal;">Desde el Área de Graduados de la Secretaría Académica de la Universidad Nacional de Entre Ríos, decidimos impulsar la creación de una herramienta de georeferenciación que permita visibilizar la inserción laboral de nuestros graduados. A lo largo de su historia, la UNER posee mas de 19.000 graduados que se desempeñan profesionalmente en las distintas zonas del país y del mundo, aportando al desarrollo económico, social y académico. </span></h5><h5><span style="font-weight:normal;">Creemos que la confección de un Mapa de Graduados de la Universidad, donde se especifique la zona y el área o rama sonde se encuentra ejerciendo, puede fomentar la generación de vínculos profesionales entre los egresados, propiciando la creación de iniciativas conjuntas; a al vez, también puede ser un insumo para la búsqueda de las empresas que necesiten contratar personal.</span></h5><h5><span style="font-weight:normal;">Esperamos con esta iniciativa seguir acompañando y apoyando el crecimiento de nuestros graduados, fortaleciendo su identidad y sentido de pertenencia con la UNER.</span></h5><p><br /></p>', 'El Mapa de Graduados', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Stores permissions used for access control' AUTO_INCREMENT=21 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES
(1, 'reports_view'),
(2, 'reports_edit'),
(4, 'reports_comments'),
(5, 'reports_download'),
(6, 'reports_upload'),
(7, 'messages'),
(8, 'messages_reporters'),
(9, 'stats'),
(10, 'settings'),
(11, 'manage'),
(12, 'users'),
(13, 'manage_roles'),
(16, 'reports_verify'),
(17, 'reports_approve'),
(18, 'admin_ui'),
(19, 'member_ui'),
(20, 'delete_all_reports');

-- --------------------------------------------------------

--
-- Table structure for table `permissions_roles`
--

CREATE TABLE IF NOT EXISTS `permissions_roles` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Stores permissions assigned to roles';

--
-- Dumping data for table `permissions_roles`
--

INSERT INTO `permissions_roles` (`role_id`, `permission_id`) VALUES
(1, 14),
(2, 1),
(2, 2),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(3, 1),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 20),
(4, 19);

-- --------------------------------------------------------

--
-- Table structure for table `plugin`
--

CREATE TABLE IF NOT EXISTS `plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(100) NOT NULL,
  `plugin_url` varchar(250) DEFAULT NULL,
  `plugin_description` text,
  `plugin_priority` tinyint(4) DEFAULT '0',
  `plugin_active` tinyint(4) DEFAULT '0',
  `plugin_installed` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugin_name` (`plugin_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Holds a list of all plugins installed on a deployment' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `plugin`
--

INSERT INTO `plugin` (`id`, `plugin_name`, `plugin_url`, `plugin_description`, `plugin_priority`, `plugin_active`, `plugin_installed`) VALUES
(1, 'clickatell', NULL, NULL, 0, 0, 0),
(2, 'frontlinesms', NULL, NULL, 0, 0, 0),
(3, 'sharing', NULL, NULL, 0, 0, 0),
(4, 'smssync', NULL, NULL, 0, 0, 0),
(5, 'Ushahidi-Plugin-RGraph-Tree', NULL, NULL, 0, 0, 1),
(6, 'fullscreenmap', NULL, NULL, 0, 0, 1),
(8, 'categorycloud', NULL, NULL, 0, 0, 1),
(9, 'findlocation', NULL, NULL, 0, 0, 1),
(10, 'hidetime', NULL, NULL, 0, 0, 1),
(11, 'mapembed', NULL, NULL, 0, 0, 0),
(12, 'mobile', NULL, NULL, 0, 0, 1),
(15, 'heatmap', NULL, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `private_message`
--

CREATE TABLE IF NOT EXISTS `private_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL,
  `from_user_id` int(11) DEFAULT '0',
  `private_subject` varchar(255) NOT NULL,
  `private_message` text NOT NULL,
  `private_message_date` datetime NOT NULL,
  `private_message_new` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores private messages sent between Members' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `rating` tinyint(4) DEFAULT '0',
  `rating_ip` varchar(100) DEFAULT NULL,
  `rating_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `incident_id` (`incident_id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores credibility ratings for reports and comments' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `user_id`, `incident_id`, `comment_id`, `rating`, `rating_ip`, `rating_date`) VALUES
(1, 0, 5, NULL, -1, '200.61.248.126', '2016-07-29 14:04:46');

-- --------------------------------------------------------

--
-- Table structure for table `reporter`
--

CREATE TABLE IF NOT EXISTS `reporter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `service_id` int(10) unsigned DEFAULT NULL,
  `level_id` int(11) unsigned DEFAULT NULL,
  `service_account` varchar(255) DEFAULT NULL,
  `reporter_first` varchar(200) DEFAULT NULL,
  `reporter_last` varchar(200) DEFAULT NULL,
  `reporter_email` varchar(120) DEFAULT NULL,
  `reporter_phone` varchar(60) DEFAULT NULL,
  `reporter_ip` varchar(50) DEFAULT NULL,
  `reporter_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`),
  KEY `service_id` (`service_id`),
  KEY `level_id` (`level_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information on report submitters via email, twitter and sms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `access_level` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Defines user access levels and privileges on a deployment' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `access_level`) VALUES
(1, 'login', 'Login privileges, granted after account confirmation', 0),
(2, 'admin', 'Administrative user, has access to almost everything.', 90),
(3, 'superadmin', 'Super administrative user, has access to everything.', 100),
(4, 'member', 'Regular user with access only to the member area', 10);

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores roles assigned to users registered on a deployment';

--
-- Dumping data for table `roles_users`
--

INSERT INTO `roles_users` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `scheduler`
--

CREATE TABLE IF NOT EXISTS `scheduler` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_name` varchar(100) NOT NULL,
  `scheduler_last` int(10) unsigned NOT NULL DEFAULT '0',
  `scheduler_weekday` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_day` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_hour` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_minute` smallint(6) NOT NULL,
  `scheduler_controller` varchar(100) NOT NULL,
  `scheduler_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores schedules for cron jobs' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `scheduler`
--

INSERT INTO `scheduler` (`id`, `scheduler_name`, `scheduler_last`, `scheduler_weekday`, `scheduler_day`, `scheduler_hour`, `scheduler_minute`, `scheduler_controller`, `scheduler_active`) VALUES
(1, 'Feeds', 1489065513, -1, -1, -1, 0, 's_feeds', 1),
(2, 'Alerts', 1489066898, -1, -1, -1, -1, 's_alerts', 1),
(3, 'Email', 1489065513, -1, -1, -1, 0, 's_email', 1),
(4, 'Twitter', 1489065513, -1, -1, -1, 0, 's_twitter', 1),
(5, 'Cleanup', 1489065513, -1, -1, -1, 0, 's_cleanup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `scheduler_log`
--

CREATE TABLE IF NOT EXISTS `scheduler_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_id` int(10) unsigned NOT NULL,
  `scheduler_status` varchar(20) DEFAULT NULL,
  `scheduler_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scheduler_id` (`scheduler_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores a log of scheduler actions' AUTO_INCREMENT=1432 ;

--
-- Dumping data for table `scheduler_log`
--

INSERT INTO `scheduler_log` (`id`, `scheduler_id`, `scheduler_status`, `scheduler_date`) VALUES
(1, 1, '200', 1460126701),
(2, 2, '200', 1460126701),
(3, 3, '200', 1460126701),
(4, 4, '200', 1460126701),
(5, 5, '200', 1460126701),
(6, 2, '200', 1460126774),
(7, 2, '200', 1460126829),
(8, 2, '200', 1460126910),
(9, 2, '200', 1460126941),
(10, 2, '200', 1460127010),
(11, 2, '200', 1460127193),
(12, 2, '200', 1460127249),
(13, 2, '200', 1460127322),
(14, 2, '200', 1460127461),
(15, 1, '200', 1460373191),
(16, 2, '200', 1460373191),
(17, 3, '200', 1460373192),
(18, 4, '200', 1460373192),
(19, 5, '200', 1460373192),
(20, 2, '200', 1460375976),
(21, 1, '200', 1460376036),
(22, 2, '200', 1460376036),
(23, 3, '200', 1460376036),
(24, 4, '200', 1460376036),
(25, 5, '200', 1460376036),
(26, 2, '200', 1460378476),
(27, 2, '200', 1460378771),
(28, 1, '200', 1460380043),
(29, 2, '200', 1460380043),
(30, 3, '200', 1460380043),
(31, 4, '200', 1460380043),
(32, 5, '200', 1460380043),
(33, 2, '200', 1460381981),
(34, 2, '200', 1460382004),
(35, 2, '200', 1460382193),
(36, 2, '200', 1460382334),
(37, 2, '200', 1460382364),
(38, 2, '200', 1460382724),
(39, 2, '200', 1460382856),
(40, 2, '200', 1460382926),
(41, 2, '200', 1460382978),
(42, 2, '200', 1460383096),
(43, 2, '200', 1460383191),
(44, 1, '200', 1460383209),
(45, 2, '200', 1460383209),
(46, 3, '200', 1460383209),
(47, 4, '200', 1460383209),
(48, 5, '200', 1460383209),
(49, 2, '200', 1460383468),
(50, 2, '200', 1460383518),
(51, 2, '200', 1460383560),
(52, 2, '200', 1460383564),
(53, 2, '200', 1460383645),
(54, 2, '200', 1460383928),
(55, 2, '200', 1460383992),
(56, 2, '200', 1460384054),
(57, 2, '200', 1460384168),
(58, 2, '200', 1460384244),
(59, 2, '200', 1460384396),
(60, 2, '200', 1460384508),
(61, 2, '200', 1460384590),
(62, 2, '200', 1460384703),
(63, 2, '200', 1460385010),
(64, 2, '200', 1460385112),
(65, 1, '200', 1460483548),
(66, 2, '200', 1460483548),
(67, 3, '200', 1460483548),
(68, 4, '200', 1460483548),
(69, 5, '200', 1460483548),
(70, 1, '200', 1460484979),
(71, 2, '200', 1460484979),
(72, 3, '200', 1460484979),
(73, 4, '200', 1460484979),
(74, 5, '200', 1460484979),
(75, 1, '200', 1460550259),
(76, 2, '200', 1460550259),
(77, 3, '200', 1460550259),
(78, 4, '200', 1460550259),
(79, 5, '200', 1460550259),
(80, 2, '200', 1460550656),
(81, 1, '200', 1460554552),
(82, 2, '200', 1460554552),
(83, 3, '200', 1460554552),
(84, 4, '200', 1460554552),
(85, 5, '200', 1460554552),
(86, 1, '200', 1461152870),
(87, 2, '200', 1461152870),
(88, 3, '200', 1461152870),
(89, 4, '200', 1461152870),
(90, 5, '200', 1461152870),
(91, 1, '200', 1464617341),
(92, 2, '200', 1464617342),
(93, 3, '200', 1464617342),
(94, 4, '200', 1464617342),
(95, 5, '200', 1464617342),
(96, 1, '200', 1464979133),
(97, 2, '200', 1464979133),
(98, 3, '200', 1464979133),
(99, 4, '200', 1464979133),
(100, 5, '200', 1464979133),
(101, 2, '200', 1464979461),
(102, 2, '200', 1464979506),
(103, 2, '200', 1464979577),
(104, 1, '200', 1464980406),
(105, 2, '200', 1464980406),
(106, 3, '200', 1464980406),
(107, 4, '200', 1464980406),
(108, 5, '200', 1464980406),
(109, 2, '200', 1464980464),
(110, 2, '200', 1464980521),
(111, 2, '200', 1464980582),
(112, 2, '200', 1464980845),
(113, 2, '200', 1464983087),
(114, 2, '200', 1464983100),
(115, 2, '200', 1464983118),
(116, 2, '200', 1464983427),
(117, 2, '200', 1464983477),
(118, 2, '200', 1464983665),
(119, 2, '200', 1464983847),
(120, 2, '200', 1464983889),
(121, 2, '200', 1464983961),
(122, 1, '200', 1464984012),
(123, 2, '200', 1464984012),
(124, 3, '200', 1464984012),
(125, 4, '200', 1464984012),
(126, 5, '200', 1464984012),
(127, 2, '200', 1464984357),
(128, 2, '200', 1464984508),
(129, 2, '200', 1464984575),
(130, 2, '200', 1464984713),
(131, 2, '200', 1464984739),
(132, 2, '200', 1464984818),
(133, 2, '200', 1464984943),
(134, 2, '200', 1464984966),
(135, 2, '200', 1464985056),
(136, 2, '200', 1464985119),
(137, 2, '200', 1464985247),
(138, 2, '200', 1464985270),
(139, 2, '200', 1464985322),
(140, 2, '200', 1464985385),
(141, 2, '200', 1464985477),
(142, 2, '200', 1464985501),
(143, 2, '200', 1464985651),
(144, 2, '200', 1464985717),
(145, 1, '200', 1465212837),
(146, 2, '200', 1465212837),
(147, 3, '200', 1465212837),
(148, 4, '200', 1465212837),
(149, 5, '200', 1465212837),
(150, 2, '200', 1465213694),
(151, 2, '200', 1465213809),
(152, 2, '200', 1465213929),
(153, 2, '200', 1465214009),
(154, 2, '200', 1465214046),
(155, 1, '200', 1465214642),
(156, 2, '200', 1465214642),
(157, 3, '200', 1465214642),
(158, 4, '200', 1465214642),
(159, 5, '200', 1465214642),
(160, 2, '200', 1465214934),
(161, 2, '200', 1465215957),
(162, 2, '200', 1465216117),
(163, 2, '200', 1465216145),
(164, 2, '200', 1465216206),
(165, 2, '200', 1465216565),
(166, 2, '200', 1465216624),
(167, 2, '200', 1465216681),
(168, 2, '200', 1465216744),
(169, 2, '200', 1465216835),
(170, 2, '200', 1465216861),
(171, 2, '200', 1465216939),
(172, 2, '200', 1465217058),
(173, 2, '200', 1465217101),
(174, 2, '200', 1465217202),
(175, 2, '200', 1465217226),
(176, 2, '200', 1465217282),
(177, 2, '200', 1465217380),
(178, 2, '200', 1465217451),
(179, 2, '200', 1465217467),
(180, 2, '200', 1465217537),
(181, 2, '200', 1465217618),
(182, 2, '200', 1465217646),
(183, 1, '200', 1465218499),
(184, 2, '200', 1465218499),
(185, 3, '200', 1465218499),
(186, 4, '200', 1465218499),
(187, 5, '200', 1465218500),
(188, 2, '200', 1465219751),
(189, 2, '200', 1465219816),
(190, 2, '200', 1465220071),
(191, 2, '200', 1465220140),
(192, 2, '200', 1465220162),
(193, 2, '200', 1465220223),
(194, 2, '200', 1465220850),
(195, 2, '200', 1465221475),
(196, 1, '200', 1465221636),
(197, 2, '200', 1465221636),
(198, 3, '200', 1465221636),
(199, 4, '200', 1465221636),
(200, 5, '200', 1465221636),
(201, 2, '200', 1465221664),
(202, 1, '200', 1465248170),
(203, 2, '200', 1465248170),
(204, 3, '200', 1465248170),
(205, 4, '200', 1465248171),
(206, 5, '200', 1465248171),
(207, 2, '200', 1465248286),
(208, 2, '200', 1465248325),
(209, 2, '200', 1465249072),
(210, 1, '200', 1465250409),
(211, 2, '200', 1465250409),
(212, 3, '200', 1465250409),
(213, 4, '200', 1465250409),
(214, 5, '200', 1465250409),
(215, 2, '200', 1465250488),
(216, 2, '200', 1465250979),
(217, 2, '200', 1465251013),
(218, 2, '200', 1465251152),
(219, 2, '200', 1465251186),
(220, 2, '200', 1465251273),
(221, 2, '200', 1465251346),
(222, 2, '200', 1465251368),
(223, 1, '200', 1465322243),
(224, 2, '200', 1465322243),
(225, 3, '200', 1465322243),
(226, 4, '200', 1465322243),
(227, 5, '200', 1465322243),
(228, 1, '200', 1465323174),
(229, 2, '200', 1465323174),
(230, 3, '200', 1465323174),
(231, 4, '200', 1465323174),
(232, 5, '200', 1465323174),
(233, 2, '200', 1465323182),
(234, 2, '200', 1465323259),
(235, 2, '200', 1465323301),
(236, 2, '200', 1465323375),
(237, 2, '200', 1465323621),
(238, 2, '200', 1465323823),
(239, 2, '200', 1465323849),
(240, 2, '200', 1465324020),
(241, 2, '200', 1465324237),
(242, 2, '200', 1465324350),
(243, 2, '200', 1465324406),
(244, 2, '200', 1465324474),
(245, 2, '200', 1465324508),
(246, 2, '200', 1465324565),
(247, 1, '200', 1465390647),
(248, 2, '200', 1465390647),
(249, 3, '200', 1465390647),
(250, 4, '200', 1465390647),
(251, 5, '200', 1465390647),
(252, 1, '200', 1465391897),
(253, 2, '200', 1465391897),
(254, 3, '200', 1465391897),
(255, 4, '200', 1465391897),
(256, 5, '200', 1465391897),
(257, 1, '200', 1465396970),
(258, 2, '200', 1465396970),
(259, 3, '200', 1465396970),
(260, 4, '200', 1465396970),
(261, 5, '200', 1465396970),
(262, 2, '200', 1465396981),
(263, 2, '200', 1465397088),
(264, 2, '200', 1465397106),
(265, 2, '200', 1465397184),
(266, 2, '200', 1465397275),
(267, 2, '200', 1465397333),
(268, 2, '200', 1465397346),
(269, 1, '200', 1465412135),
(270, 2, '200', 1465412135),
(271, 3, '200', 1465412135),
(272, 4, '200', 1465412135),
(273, 5, '200', 1465412135),
(274, 2, '200', 1465412282),
(275, 1, '200', 1465413006),
(276, 2, '200', 1465413006),
(277, 3, '200', 1465413006),
(278, 4, '200', 1465413006),
(279, 5, '200', 1465413006),
(280, 2, '200', 1465413108),
(281, 2, '200', 1465413159),
(282, 2, '200', 1465413246),
(283, 2, '200', 1465413300),
(284, 1, '200', 1465418966),
(285, 2, '200', 1465418966),
(286, 3, '200', 1465418966),
(287, 4, '200', 1465418966),
(288, 5, '200', 1465418966),
(289, 1, '200', 1465420332),
(290, 2, '200', 1465420332),
(291, 3, '200', 1465420332),
(292, 4, '200', 1465420332),
(293, 5, '200', 1465420332),
(294, 1, '200', 1466790050),
(295, 2, '200', 1466790050),
(296, 3, '200', 1466790050),
(297, 4, '200', 1466790050),
(298, 5, '200', 1466790050),
(299, 2, '200', 1466790408),
(300, 2, '200', 1466790429),
(301, 2, '200', 1466791057),
(302, 2, '200', 1466791108),
(303, 1, '200', 1466791257),
(304, 2, '200', 1466791257),
(305, 3, '200', 1466791257),
(306, 4, '200', 1466791257),
(307, 5, '200', 1466791257),
(308, 2, '200', 1466791271),
(309, 2, '200', 1466791351),
(310, 2, '200', 1466791383),
(311, 2, '200', 1466791441),
(312, 2, '200', 1466791512),
(313, 2, '200', 1466791593),
(314, 2, '200', 1466791690),
(315, 2, '200', 1466792109),
(316, 2, '200', 1466793021),
(317, 2, '200', 1466793070),
(318, 2, '200', 1466793141),
(319, 2, '200', 1466793192),
(320, 2, '200', 1466793299),
(321, 2, '200', 1466793324),
(322, 2, '200', 1466793369),
(323, 2, '200', 1466793428),
(324, 2, '200', 1466794437),
(325, 2, '200', 1466794464),
(326, 2, '200', 1466794518),
(327, 2, '200', 1466794568),
(328, 1, '200', 1466795207),
(329, 2, '200', 1466795207),
(330, 3, '200', 1466795207),
(331, 4, '200', 1466795207),
(332, 5, '200', 1466795207),
(333, 2, '200', 1466795265),
(334, 2, '200', 1466795297),
(335, 2, '200', 1466795397),
(336, 2, '200', 1466795422),
(337, 2, '200', 1466795465),
(338, 2, '200', 1466795540),
(339, 2, '200', 1466795651),
(340, 2, '200', 1466795706),
(341, 2, '200', 1466795811),
(342, 2, '200', 1466795832),
(343, 2, '200', 1466795944),
(344, 2, '200', 1466796039),
(345, 2, '200', 1466796101),
(346, 2, '200', 1466796120),
(347, 2, '200', 1466796144),
(348, 2, '200', 1466796253),
(349, 1, '200', 1467032088),
(350, 2, '200', 1467032088),
(351, 3, '200', 1467032088),
(352, 4, '200', 1467032088),
(353, 5, '200', 1467032089),
(354, 1, '200', 1467032857),
(355, 2, '200', 1467032857),
(356, 3, '200', 1467032857),
(357, 4, '200', 1467032857),
(358, 5, '200', 1467032857),
(359, 2, '200', 1467032891),
(360, 2, '200', 1467033560),
(361, 2, '200', 1467035446),
(362, 2, '200', 1467035618),
(363, 1, '200', 1467036107),
(364, 2, '200', 1467036107),
(365, 3, '200', 1467036107),
(366, 4, '200', 1467036107),
(367, 5, '200', 1467036107),
(368, 2, '200', 1467036352),
(369, 2, '200', 1467036373),
(370, 2, '200', 1467036485),
(371, 2, '200', 1467036682),
(372, 2, '200', 1467036724),
(373, 2, '200', 1467037568),
(374, 2, '200', 1467037638),
(375, 2, '200', 1467037782),
(376, 2, '200', 1467038324),
(377, 2, '200', 1467038459),
(378, 2, '200', 1467038487),
(379, 2, '200', 1467038583),
(380, 2, '200', 1467038790),
(381, 2, '200', 1467038863),
(382, 2, '200', 1467038959),
(383, 2, '200', 1467039033),
(384, 2, '200', 1467039125),
(385, 2, '200', 1467039246),
(386, 2, '200', 1467039320),
(387, 2, '200', 1467039381),
(388, 2, '200', 1467039450),
(389, 1, '200', 1467039625),
(390, 2, '200', 1467039625),
(391, 3, '200', 1467039625),
(392, 4, '200', 1467039625),
(393, 5, '200', 1467039625),
(394, 2, '200', 1467039723),
(395, 2, '200', 1467040444),
(396, 1, '200', 1467062855),
(397, 2, '200', 1467062855),
(398, 3, '200', 1467062855),
(399, 4, '200', 1467062855),
(400, 5, '200', 1467062855),
(401, 2, '200', 1467062881),
(402, 2, '200', 1467062944),
(403, 2, '200', 1467063017),
(404, 2, '200', 1467063064),
(405, 2, '200', 1467063124),
(406, 2, '200', 1467063182),
(407, 2, '200', 1467063241),
(408, 2, '200', 1467063326),
(409, 2, '200', 1467063960),
(410, 2, '200', 1467063999),
(411, 2, '200', 1467064023),
(412, 2, '200', 1467064085),
(413, 2, '200', 1467064149),
(414, 1, '200', 1467064834),
(415, 2, '200', 1467064834),
(416, 3, '200', 1467064834),
(417, 4, '200', 1467064834),
(418, 5, '200', 1467064834),
(419, 1, '200', 1467133176),
(420, 2, '200', 1467133176),
(421, 3, '200', 1467133176),
(422, 4, '200', 1467133176),
(423, 5, '200', 1467133176),
(424, 1, '200', 1467135158),
(425, 2, '200', 1467135158),
(426, 3, '200', 1467135158),
(427, 4, '200', 1467135158),
(428, 5, '200', 1467135158),
(429, 2, '200', 1467135356),
(430, 2, '200', 1467135370),
(431, 2, '200', 1467136192),
(432, 1, '200', 1467136948),
(433, 2, '200', 1467136948),
(434, 3, '200', 1467136948),
(435, 4, '200', 1467136948),
(436, 5, '200', 1467136948),
(437, 2, '200', 1467137449),
(438, 2, '200', 1467137641),
(439, 2, '200', 1467137733),
(440, 2, '200', 1467137761),
(441, 2, '200', 1467137835),
(442, 2, '200', 1467137913),
(443, 2, '200', 1467137990),
(444, 2, '200', 1467138035),
(445, 2, '200', 1467138073),
(446, 2, '200', 1467138234),
(447, 2, '200', 1467138322),
(448, 2, '200', 1467138531),
(449, 2, '200', 1467138599),
(450, 2, '200', 1467138615),
(451, 2, '200', 1467138675),
(452, 2, '200', 1467138722),
(453, 2, '200', 1467138803),
(454, 2, '200', 1467138938),
(455, 2, '200', 1467139035),
(456, 2, '200', 1467139126),
(457, 2, '200', 1467139159),
(458, 2, '200', 1467139267),
(459, 2, '200', 1467139365),
(460, 2, '200', 1467139398),
(461, 2, '200', 1467139459),
(462, 2, '200', 1467139816),
(463, 2, '200', 1467139877),
(464, 2, '200', 1467140005),
(465, 2, '200', 1467140044),
(466, 2, '200', 1467140165),
(467, 1, '200', 1467141411),
(468, 2, '200', 1467141411),
(469, 3, '200', 1467141411),
(470, 4, '200', 1467141411),
(471, 5, '200', 1467141411),
(472, 2, '200', 1467141461),
(473, 2, '200', 1467141497),
(474, 2, '200', 1467141555),
(475, 2, '200', 1467141605),
(476, 2, '200', 1467142182),
(477, 2, '200', 1467142493),
(478, 2, '200', 1467142510),
(479, 2, '200', 1467142691),
(480, 2, '200', 1467142772),
(481, 2, '200', 1467142813),
(482, 2, '200', 1467142882),
(483, 2, '200', 1467142930),
(484, 2, '200', 1467142991),
(485, 1, '200', 1467200237),
(486, 2, '200', 1467200237),
(487, 3, '200', 1467200237),
(488, 4, '200', 1467200238),
(489, 5, '200', 1467200238),
(490, 2, '200', 1467200698),
(491, 2, '200', 1467200740),
(492, 2, '200', 1467200797),
(493, 2, '200', 1467201025),
(494, 2, '200', 1467201175),
(495, 2, '200', 1467201202),
(496, 2, '200', 1467201498),
(497, 1, '200', 1467201997),
(498, 2, '200', 1467201997),
(499, 3, '200', 1467201997),
(500, 4, '200', 1467201997),
(501, 5, '200', 1467201997),
(502, 2, '200', 1467202360),
(503, 2, '200', 1467202396),
(504, 2, '200', 1467202447),
(505, 2, '200', 1467202585),
(506, 2, '200', 1467202729),
(507, 2, '200', 1467202745),
(508, 2, '200', 1467202814),
(509, 2, '200', 1467203164),
(510, 2, '200', 1467204388),
(511, 2, '200', 1467204458),
(512, 2, '200', 1467204500),
(513, 2, '200', 1467204719),
(514, 2, '200', 1467204731),
(515, 2, '200', 1467204795),
(516, 2, '200', 1467204978),
(517, 1, '200', 1467205410),
(518, 2, '200', 1467205410),
(519, 3, '200', 1467205410),
(520, 4, '200', 1467205410),
(521, 5, '200', 1467205410),
(522, 2, '200', 1467205476),
(523, 2, '200', 1467205505),
(524, 2, '200', 1467205834),
(525, 2, '200', 1467206534),
(526, 2, '200', 1467206615),
(527, 2, '200', 1467206754),
(528, 2, '200', 1467206768),
(529, 2, '200', 1467207286),
(530, 2, '200', 1467207380),
(531, 2, '200', 1467207451),
(532, 2, '200', 1467208369),
(533, 2, '200', 1467208696),
(534, 2, '200', 1467208753),
(535, 1, '200', 1467208808),
(536, 2, '200', 1467208808),
(537, 3, '200', 1467208808),
(538, 4, '200', 1467208808),
(539, 5, '200', 1467208808),
(540, 2, '200', 1467208869),
(541, 2, '200', 1467209798),
(542, 2, '200', 1467209973),
(543, 2, '200', 1467210261),
(544, 2, '200', 1467210528),
(545, 2, '200', 1467210547),
(546, 2, '200', 1467210662),
(547, 2, '200', 1467210785),
(548, 2, '200', 1467210989),
(549, 2, '200', 1467212045),
(550, 2, '200', 1467212116),
(551, 2, '200', 1467212175),
(552, 2, '200', 1467212249),
(553, 1, '200', 1467217639),
(554, 2, '200', 1467217639),
(555, 3, '200', 1467217639),
(556, 4, '200', 1467217639),
(557, 5, '200', 1467217639),
(558, 2, '200', 1467218138),
(559, 2, '200', 1467218196),
(560, 2, '200', 1467218253),
(561, 2, '200', 1467218291),
(562, 2, '200', 1467218371),
(563, 2, '200', 1467218850),
(564, 2, '200', 1467219288),
(565, 2, '200', 1467219320),
(566, 2, '200', 1467219391),
(567, 2, '200', 1467219440),
(568, 1, '200', 1467219681),
(569, 2, '200', 1467219681),
(570, 3, '200', 1467219681),
(571, 4, '200', 1467219681),
(572, 5, '200', 1467219681),
(573, 2, '200', 1467219852),
(574, 2, '200', 1467219903),
(575, 2, '200', 1467219961),
(576, 2, '200', 1467220050),
(577, 2, '200', 1467220088),
(578, 2, '200', 1467220144),
(579, 2, '200', 1467220203),
(580, 2, '200', 1467220475),
(581, 2, '200', 1467220811),
(582, 2, '200', 1467220861),
(583, 2, '200', 1467220934),
(584, 2, '200', 1467220994),
(585, 2, '200', 1467221063),
(586, 2, '200', 1467221108),
(587, 2, '200', 1467221328),
(588, 2, '200', 1467221385),
(589, 2, '200', 1467221456),
(590, 2, '200', 1467221761),
(591, 2, '200', 1467221939),
(592, 2, '200', 1467222075),
(593, 2, '200', 1467222145),
(594, 2, '200', 1467222191),
(595, 2, '200', 1467222338),
(596, 2, '200', 1467222476),
(597, 2, '200', 1467222562),
(598, 2, '200', 1467222620),
(599, 2, '200', 1467222690),
(600, 2, '200', 1467222731),
(601, 2, '200', 1467222811),
(602, 2, '200', 1467223023),
(603, 2, '200', 1467223166),
(604, 1, '200', 1467223406),
(605, 2, '200', 1467223406),
(606, 3, '200', 1467223406),
(607, 4, '200', 1467223406),
(608, 5, '200', 1467223406),
(609, 2, '200', 1467223813),
(610, 2, '200', 1467223957),
(611, 2, '200', 1467224086),
(612, 2, '200', 1467224586),
(613, 2, '200', 1467224653),
(614, 2, '200', 1467224760),
(615, 2, '200', 1467224763),
(616, 2, '200', 1467224831),
(617, 2, '200', 1467224931),
(618, 2, '200', 1467224977),
(619, 2, '200', 1467225433),
(620, 2, '200', 1467225497),
(621, 2, '200', 1467225568),
(622, 2, '200', 1467225608),
(623, 2, '200', 1467226190),
(624, 2, '200', 1467226221),
(625, 2, '200', 1467226326),
(626, 2, '200', 1467226485),
(627, 2, '200', 1467226528),
(628, 2, '200', 1467226594),
(629, 2, '200', 1467226671),
(630, 2, '200', 1467226730),
(631, 2, '200', 1467226795),
(632, 1, '200', 1467226805),
(633, 2, '200', 1467226805),
(634, 3, '200', 1467226805),
(635, 4, '200', 1467226805),
(636, 5, '200', 1467226805),
(637, 2, '200', 1467226862),
(638, 2, '200', 1467226999),
(639, 2, '200', 1467227203),
(640, 2, '200', 1467227221),
(641, 2, '200', 1467227395),
(642, 2, '200', 1467228135),
(643, 2, '200', 1467228208),
(644, 2, '200', 1467228487),
(645, 2, '200', 1467228886),
(646, 2, '200', 1467229306),
(647, 2, '200', 1467229428),
(648, 2, '200', 1467229468),
(649, 1, '200', 1467290166),
(650, 2, '200', 1467290167),
(651, 3, '200', 1467290167),
(652, 4, '200', 1467290167),
(653, 5, '200', 1467290168),
(654, 1, '200', 1467568032),
(655, 2, '200', 1467568032),
(656, 3, '200', 1467568032),
(657, 4, '200', 1467568032),
(658, 5, '200', 1467568032),
(659, 1, '200', 1469717435),
(660, 2, '200', 1469717435),
(661, 3, '200', 1469717435),
(662, 4, '200', 1469717435),
(663, 5, '200', 1469717435),
(664, 2, '200', 1469717772),
(665, 1, '200', 1469718912),
(666, 2, '200', 1469718912),
(667, 3, '200', 1469718912),
(668, 4, '200', 1469718912),
(669, 5, '200', 1469718912),
(670, 2, '200', 1469718988),
(671, 2, '200', 1469719206),
(672, 2, '200', 1469719277),
(673, 2, '200', 1469719320),
(674, 2, '200', 1469719571),
(675, 2, '200', 1469719639),
(676, 2, '200', 1469719889),
(677, 2, '200', 1469719930),
(678, 2, '200', 1469720208),
(679, 2, '200', 1469720243),
(680, 2, '200', 1469720305),
(681, 2, '200', 1469720657),
(682, 2, '200', 1469720705),
(683, 2, '200', 1469720783),
(684, 2, '200', 1469721197),
(685, 2, '200', 1469721249),
(686, 2, '200', 1469721304),
(687, 2, '200', 1469721361),
(688, 2, '200', 1469721582),
(689, 1, '200', 1469721623),
(690, 2, '200', 1469721623),
(691, 3, '200', 1469721623),
(692, 4, '200', 1469721623),
(693, 5, '200', 1469721623),
(694, 2, '200', 1469721680),
(695, 2, '200', 1469721728),
(696, 2, '200', 1469721827),
(697, 2, '200', 1469721840),
(698, 2, '200', 1469721867),
(699, 2, '200', 1469721924),
(700, 2, '200', 1469722370),
(701, 2, '200', 1469722381),
(702, 2, '200', 1469722591),
(703, 2, '200', 1469722624),
(704, 2, '200', 1469722950),
(705, 2, '200', 1469723144),
(706, 2, '200', 1469723245),
(707, 2, '200', 1469723546),
(708, 1, '200', 1469729079),
(709, 2, '200', 1469729079),
(710, 3, '200', 1469729079),
(711, 4, '200', 1469729079),
(712, 5, '200', 1469729079),
(713, 2, '200', 1469729218),
(714, 1, '200', 1469790950),
(715, 2, '200', 1469790950),
(716, 3, '200', 1469790950),
(717, 4, '200', 1469790950),
(718, 5, '200', 1469790950),
(719, 2, '200', 1469793038),
(720, 2, '200', 1469793278),
(721, 1, '200', 1469794328),
(722, 2, '200', 1469794328),
(723, 3, '200', 1469794328),
(724, 4, '200', 1469794328),
(725, 5, '200', 1469794328),
(726, 1, '200', 1469800356),
(727, 2, '200', 1469800356),
(728, 3, '200', 1469800356),
(729, 4, '200', 1469800356),
(730, 5, '200', 1469800356),
(731, 2, '200', 1469800483),
(732, 2, '200', 1469800759),
(733, 1, '200', 1469800959),
(734, 2, '200', 1469800959),
(735, 3, '200', 1469800959),
(736, 4, '200', 1469800959),
(737, 5, '200', 1469800959),
(738, 2, '200', 1469800980),
(739, 2, '200', 1469801019),
(740, 2, '200', 1469801063),
(741, 2, '200', 1469801108),
(742, 2, '200', 1469801555),
(743, 2, '200', 1469802262),
(744, 2, '200', 1469802352),
(745, 2, '200', 1469802371),
(746, 2, '200', 1469802892),
(747, 1, '200', 1469805897),
(748, 2, '200', 1469805897),
(749, 3, '200', 1469805897),
(750, 4, '200', 1469805897),
(751, 5, '200', 1469805897),
(752, 2, '200', 1469806014),
(753, 2, '200', 1469806021),
(754, 2, '200', 1469806234),
(755, 2, '200', 1469807945),
(756, 1, '200', 1469808273),
(757, 2, '200', 1469808273),
(758, 3, '200', 1469808273),
(759, 4, '200', 1469808273),
(760, 5, '200', 1469808273),
(761, 1, '200', 1470334151),
(762, 2, '200', 1470334151),
(763, 3, '200', 1470334151),
(764, 4, '200', 1470334151),
(765, 5, '200', 1470334151),
(766, 2, '200', 1470334429),
(767, 2, '200', 1470334480),
(768, 2, '200', 1470334969),
(769, 2, '200', 1470335024),
(770, 2, '200', 1470335134),
(771, 2, '200', 1470335258),
(772, 2, '200', 1470335282),
(773, 2, '200', 1470335417),
(774, 2, '200', 1470335781),
(775, 2, '200', 1470335940),
(776, 2, '200', 1470335946),
(777, 2, '200', 1470336062),
(778, 2, '200', 1470336134),
(779, 2, '200', 1470336238),
(780, 2, '200', 1470336310),
(781, 2, '200', 1470336466),
(782, 2, '200', 1470336658),
(783, 2, '200', 1470336861),
(784, 2, '200', 1470337147),
(785, 1, '200', 1470337243),
(786, 2, '200', 1470337243),
(787, 3, '200', 1470337243),
(788, 4, '200', 1470337243),
(789, 5, '200', 1470337243),
(790, 2, '200', 1470337289),
(791, 2, '200', 1470337486),
(792, 2, '200', 1470337594),
(793, 2, '200', 1470337644),
(794, 2, '200', 1470337779),
(795, 2, '200', 1470337872),
(796, 2, '200', 1470337956),
(797, 2, '200', 1470338005),
(798, 2, '200', 1470338078),
(799, 2, '200', 1470338153),
(800, 2, '200', 1470338162),
(801, 2, '200', 1470338600),
(802, 2, '200', 1470338668),
(803, 2, '200', 1470338741),
(804, 2, '200', 1470338777),
(805, 2, '200', 1470339003),
(806, 2, '200', 1470339135),
(807, 1, '200', 1470342685),
(808, 2, '200', 1470342685),
(809, 3, '200', 1470342685),
(810, 4, '200', 1470342685),
(811, 5, '200', 1470342685),
(812, 2, '200', 1470342720),
(813, 2, '200', 1470342778),
(814, 2, '200', 1470342780),
(815, 2, '200', 1470342911),
(816, 2, '200', 1470342979),
(817, 2, '200', 1470343066),
(818, 2, '200', 1470343094),
(819, 1, '200', 1470397648),
(820, 2, '200', 1470397648),
(821, 3, '200', 1470397648),
(822, 4, '200', 1470397648),
(823, 5, '200', 1470397648),
(824, 2, '200', 1470397799),
(825, 1, '200', 1470427329),
(826, 2, '200', 1470427329),
(827, 3, '200', 1470427329),
(828, 4, '200', 1470427329),
(829, 5, '200', 1470427329),
(830, 1, '200', 1470663641),
(831, 2, '200', 1470663641),
(832, 3, '200', 1470663641),
(833, 4, '200', 1470663641),
(834, 5, '200', 1470663641),
(835, 2, '200', 1470663793),
(836, 2, '200', 1470664675),
(837, 1, '200', 1470664865),
(838, 2, '200', 1470664865),
(839, 3, '200', 1470664865),
(840, 4, '200', 1470664865),
(841, 5, '200', 1470664865),
(842, 2, '200', 1470665219),
(843, 2, '200', 1470665532),
(844, 2, '200', 1470665807),
(845, 2, '200', 1470665848),
(846, 2, '200', 1470665905),
(847, 2, '200', 1470665982),
(848, 2, '200', 1470666399),
(849, 2, '200', 1470666426),
(850, 2, '200', 1470666597),
(851, 2, '200', 1470666600),
(852, 2, '200', 1470666647),
(853, 2, '200', 1470666742),
(854, 2, '200', 1470666810),
(855, 2, '200', 1470666860),
(856, 2, '200', 1470666943),
(857, 2, '200', 1470667144),
(858, 2, '200', 1470667203),
(859, 2, '200', 1470668154),
(860, 2, '200', 1470668179),
(861, 2, '200', 1470668291),
(862, 2, '200', 1470668362),
(863, 1, '200', 1470668426),
(864, 2, '200', 1470668426),
(865, 3, '200', 1470668426),
(866, 4, '200', 1470668426),
(867, 5, '200', 1470668426),
(868, 2, '200', 1470668484),
(869, 2, '200', 1470668530),
(870, 2, '200', 1470668586),
(871, 2, '200', 1470668686),
(872, 2, '200', 1470668774),
(873, 2, '200', 1470668851),
(874, 2, '200', 1470668964),
(875, 2, '200', 1470671603),
(876, 1, '200', 1470674574),
(877, 2, '200', 1470674574),
(878, 3, '200', 1470674574),
(879, 4, '200', 1470674574),
(880, 5, '200', 1470674574),
(881, 1, '200', 1470676878),
(882, 2, '200', 1470676878),
(883, 3, '200', 1470676878),
(884, 4, '200', 1470676878),
(885, 5, '200', 1470676878),
(886, 2, '200', 1470676984),
(887, 2, '200', 1470677087),
(888, 2, '200', 1470677153),
(889, 2, '200', 1470677292),
(890, 2, '200', 1470677353),
(891, 2, '200', 1470677408),
(892, 2, '200', 1470677485),
(893, 2, '200', 1470677534),
(894, 2, '200', 1470677703),
(895, 2, '200', 1470677770),
(896, 2, '200', 1470677881),
(897, 2, '200', 1470678016),
(898, 2, '200', 1470678073),
(899, 2, '200', 1470678517),
(900, 2, '200', 1470678786),
(901, 2, '200', 1470679182),
(902, 1, '200', 1470679235),
(903, 2, '200', 1470679235),
(904, 3, '200', 1470679235),
(905, 4, '200', 1470679235),
(906, 5, '200', 1470679235),
(907, 2, '200', 1470679352),
(908, 2, '200', 1470679845),
(909, 2, '200', 1470679896),
(910, 2, '200', 1470680009),
(911, 2, '200', 1470680351),
(912, 2, '200', 1470680437),
(913, 2, '200', 1470680550),
(914, 2, '200', 1470680734),
(915, 2, '200', 1470680809),
(916, 2, '200', 1470681013),
(917, 2, '200', 1470681149),
(918, 2, '200', 1470681246),
(919, 2, '200', 1470681410),
(920, 2, '200', 1470681518),
(921, 2, '200', 1470681694),
(922, 2, '200', 1470681785),
(923, 2, '200', 1470681849),
(924, 2, '200', 1470681909),
(925, 2, '200', 1470681973),
(926, 2, '200', 1470682111),
(927, 2, '200', 1470682622),
(928, 2, '200', 1470682713),
(929, 2, '200', 1470682765),
(930, 1, '200', 1470682847),
(931, 2, '200', 1470682847),
(932, 3, '200', 1470682847),
(933, 4, '200', 1470682847),
(934, 5, '200', 1470682847),
(935, 2, '200', 1470682946),
(936, 2, '200', 1470683238),
(937, 2, '200', 1470683421),
(938, 2, '200', 1470683464),
(939, 2, '200', 1470683550),
(940, 2, '200', 1470683628),
(941, 2, '200', 1470683650),
(942, 2, '200', 1470683716),
(943, 2, '200', 1470683770),
(944, 2, '200', 1470683945),
(945, 2, '200', 1470684095),
(946, 2, '200', 1470684195),
(947, 2, '200', 1470684271),
(948, 2, '200', 1470684327),
(949, 2, '200', 1470684382),
(950, 2, '200', 1470684424),
(951, 2, '200', 1470684504),
(952, 2, '200', 1470684628),
(953, 2, '200', 1470684754),
(954, 2, '200', 1470684798),
(955, 1, '200', 1470699039),
(956, 2, '200', 1470699039),
(957, 3, '200', 1470699039),
(958, 4, '200', 1470699039),
(959, 5, '200', 1470699039),
(960, 2, '200', 1470699063),
(961, 2, '200', 1470699122),
(962, 1, '200', 1470754030),
(963, 2, '200', 1470754030),
(964, 3, '200', 1470754030),
(965, 4, '200', 1470754030),
(966, 5, '200', 1470754030),
(967, 1, '200', 1470765276),
(968, 2, '200', 1470765276),
(969, 3, '200', 1470765276),
(970, 4, '200', 1470765276),
(971, 5, '200', 1470765276),
(972, 1, '200', 1470766589),
(973, 2, '200', 1470766589),
(974, 3, '200', 1470766589),
(975, 4, '200', 1470766590),
(976, 5, '200', 1470766590),
(977, 2, '200', 1470766631),
(978, 1, '200', 1470770250),
(979, 2, '200', 1470770250),
(980, 3, '200', 1470770250),
(981, 4, '200', 1470770250),
(982, 5, '200', 1470770250),
(983, 2, '200', 1470770455),
(984, 2, '200', 1470770595),
(985, 2, '200', 1470770683),
(986, 2, '200', 1470770723),
(987, 2, '200', 1470770760),
(988, 2, '200', 1470770763),
(989, 2, '200', 1470771251),
(990, 2, '200', 1470771603),
(991, 2, '200', 1470771733),
(992, 1, '200', 1470832582),
(993, 2, '200', 1470832582),
(994, 3, '200', 1470832582),
(995, 4, '200', 1470832582),
(996, 5, '200', 1470832582),
(997, 1, '200', 1471009530),
(998, 2, '200', 1471009530),
(999, 3, '200', 1471009530),
(1000, 4, '200', 1471009530),
(1001, 5, '200', 1471009530),
(1002, 1, '200', 1472057699),
(1003, 2, '200', 1472057699),
(1004, 3, '200', 1472057699),
(1005, 4, '200', 1472057699),
(1006, 5, '200', 1472057699),
(1007, 2, '200', 1472057810),
(1008, 2, '200', 1472057824),
(1009, 2, '200', 1472057956),
(1010, 1, '200', 1473424385),
(1011, 2, '200', 1473424385),
(1012, 3, '200', 1473424385),
(1013, 4, '200', 1473424385),
(1014, 5, '200', 1473424385),
(1015, 1, '200', 1473427275),
(1016, 2, '200', 1473427275),
(1017, 3, '200', 1473427276),
(1018, 4, '200', 1473427276),
(1019, 5, '200', 1473427276),
(1020, 1, '200', 1473431061),
(1021, 2, '200', 1473431061),
(1022, 3, '200', 1473431061),
(1023, 4, '200', 1473431061),
(1024, 5, '200', 1473431061),
(1025, 2, '200', 1473431157),
(1026, 2, '200', 1473432428),
(1027, 1, '200', 1473685275),
(1028, 2, '200', 1473685275),
(1029, 3, '200', 1473685275),
(1030, 4, '200', 1473685275),
(1031, 5, '200', 1473685275),
(1032, 2, '200', 1473685391),
(1033, 2, '200', 1473685535),
(1034, 2, '200', 1473685568),
(1035, 2, '200', 1473685949),
(1036, 2, '200', 1473686321),
(1037, 2, '200', 1473686699),
(1038, 2, '200', 1473686702),
(1039, 1, '200', 1473958531),
(1040, 2, '200', 1473958531),
(1041, 3, '200', 1473958531),
(1042, 4, '200', 1473958531),
(1043, 5, '200', 1473958531),
(1044, 2, '200', 1473958591),
(1045, 2, '200', 1473958710),
(1046, 1, '200', 1473958804),
(1047, 2, '200', 1473958804),
(1048, 3, '200', 1473958804),
(1049, 4, '200', 1473958804),
(1050, 5, '200', 1473958804),
(1051, 2, '200', 1473958988),
(1052, 2, '200', 1473959062),
(1053, 2, '200', 1473959244),
(1054, 2, '200', 1473959545),
(1055, 2, '200', 1473959621),
(1056, 2, '200', 1473959752),
(1057, 2, '200', 1473959762),
(1058, 2, '200', 1473959843),
(1059, 2, '200', 1473959920),
(1060, 2, '200', 1473960079),
(1061, 2, '200', 1473960144),
(1062, 2, '200', 1473960216),
(1063, 2, '200', 1473960277),
(1064, 2, '200', 1473960303),
(1065, 2, '200', 1473960441),
(1066, 1, '200', 1474024749),
(1067, 2, '200', 1474024749),
(1068, 3, '200', 1474024749),
(1069, 4, '200', 1474024749),
(1070, 5, '200', 1474024750),
(1071, 1, '200', 1474028234),
(1072, 2, '200', 1474028234),
(1073, 3, '200', 1474028234),
(1074, 4, '200', 1474028234),
(1075, 5, '200', 1474028234),
(1076, 1, '200', 1474300924),
(1077, 2, '200', 1474300924),
(1078, 3, '200', 1474300924),
(1079, 4, '200', 1474300924),
(1080, 5, '200', 1474300924),
(1081, 2, '200', 1474301113),
(1082, 2, '200', 1474302226),
(1083, 2, '200', 1474302249),
(1084, 2, '200', 1474302400),
(1085, 2, '200', 1474302718),
(1086, 2, '200', 1474302725),
(1087, 2, '200', 1474303040),
(1088, 2, '200', 1474303400),
(1089, 2, '200', 1474303747),
(1090, 1, '200', 1474305825),
(1091, 2, '200', 1474305825),
(1092, 3, '200', 1474305825),
(1093, 4, '200', 1474305825),
(1094, 5, '200', 1474305825),
(1095, 1, '200', 1474371253),
(1096, 2, '200', 1474371253),
(1097, 3, '200', 1474371253),
(1098, 4, '200', 1474371253),
(1099, 5, '200', 1474371253),
(1100, 1, '200', 1474544127),
(1101, 2, '200', 1474544127),
(1102, 3, '200', 1474544127),
(1103, 4, '200', 1474544127),
(1104, 5, '200', 1474544127),
(1105, 1, '200', 1475504206),
(1106, 2, '200', 1475504206),
(1107, 3, '200', 1475504206),
(1108, 4, '200', 1475504206),
(1109, 5, '200', 1475504206),
(1110, 2, '200', 1475504257),
(1111, 2, '200', 1475504764),
(1112, 2, '200', 1475505658),
(1113, 2, '200', 1475505729),
(1114, 2, '200', 1475505854),
(1115, 1, '200', 1475601380),
(1116, 2, '200', 1475601380),
(1117, 3, '200', 1475601380),
(1118, 4, '200', 1475601380),
(1119, 5, '200', 1475601380),
(1120, 2, '200', 1475601422),
(1121, 1, '200', 1476290940),
(1122, 2, '200', 1476290940),
(1123, 3, '200', 1476290940),
(1124, 4, '200', 1476290940),
(1125, 5, '200', 1476290940),
(1126, 2, '200', 1476291062),
(1127, 2, '200', 1476291151),
(1128, 2, '200', 1476291185),
(1129, 2, '200', 1476291412),
(1130, 1, '200', 1476377609),
(1131, 2, '200', 1476377609),
(1132, 3, '200', 1476377609),
(1133, 4, '200', 1476377609),
(1134, 5, '200', 1476377609),
(1135, 2, '200', 1476377652),
(1136, 2, '200', 1476377707),
(1137, 1, '200', 1476378103),
(1138, 2, '200', 1476378103),
(1139, 3, '200', 1476378104),
(1140, 4, '200', 1476378104),
(1141, 5, '200', 1476378104),
(1142, 2, '200', 1476379093),
(1143, 2, '200', 1476379180),
(1144, 2, '200', 1476379796),
(1145, 2, '200', 1476379816),
(1146, 2, '200', 1476380362),
(1147, 1, '200', 1476386053),
(1148, 2, '200', 1476386053),
(1149, 3, '200', 1476386053),
(1150, 4, '200', 1476386053),
(1151, 5, '200', 1476386053),
(1152, 2, '200', 1476386178),
(1153, 2, '200', 1476386418),
(1154, 1, '200', 1476711629),
(1155, 2, '200', 1476711629),
(1156, 3, '200', 1476711629),
(1157, 4, '200', 1476711629),
(1158, 5, '200', 1476711629),
(1159, 2, '200', 1476711689),
(1160, 2, '200', 1476711952),
(1161, 2, '200', 1476712044),
(1162, 2, '200', 1476712687),
(1163, 1, '200', 1476713062),
(1164, 2, '200', 1476713062),
(1165, 3, '200', 1476713062),
(1166, 4, '200', 1476713062),
(1167, 5, '200', 1476713062),
(1168, 2, '200', 1476713368),
(1169, 2, '200', 1476715834),
(1170, 2, '200', 1476715864),
(1171, 1, '200', 1476724164),
(1172, 2, '200', 1476724164),
(1173, 3, '200', 1476724164),
(1174, 4, '200', 1476724164),
(1175, 5, '200', 1476724164),
(1176, 2, '200', 1476724209),
(1177, 2, '200', 1476724270),
(1178, 2, '200', 1476724354),
(1179, 2, '200', 1476724382),
(1180, 2, '200', 1476724472),
(1181, 2, '200', 1476724501),
(1182, 1, '200', 1477318227),
(1183, 2, '200', 1477318227),
(1184, 3, '200', 1477318227),
(1185, 4, '200', 1477318227),
(1186, 5, '200', 1477318227),
(1187, 2, '200', 1477318271),
(1188, 1, '200', 1477495629),
(1189, 2, '200', 1477495629),
(1190, 3, '200', 1477495629),
(1191, 4, '200', 1477495629),
(1192, 5, '200', 1477495629),
(1193, 1, '200', 1477920425),
(1194, 2, '200', 1477920425),
(1195, 3, '200', 1477920425),
(1196, 4, '200', 1477920425),
(1197, 5, '200', 1477920425),
(1198, 2, '200', 1477921281),
(1199, 2, '200', 1477921711),
(1200, 1, '200', 1477923814),
(1201, 2, '200', 1477923814),
(1202, 3, '200', 1477923814),
(1203, 4, '200', 1477923814),
(1204, 5, '200', 1477923814),
(1205, 2, '200', 1477924848),
(1206, 2, '200', 1477924870),
(1207, 2, '200', 1477925069),
(1208, 2, '200', 1477925314),
(1209, 2, '200', 1477925899),
(1210, 1, '200', 1477926286),
(1211, 2, '200', 1477926286),
(1212, 3, '200', 1477926286),
(1213, 4, '200', 1477926286),
(1214, 5, '200', 1477926286),
(1215, 2, '200', 1477926316),
(1216, 2, '200', 1477926689),
(1217, 2, '200', 1477928283),
(1218, 1, '200', 1477931911),
(1219, 2, '200', 1477931911),
(1220, 3, '200', 1477931911),
(1221, 4, '200', 1477931911),
(1222, 5, '200', 1477931911),
(1223, 2, '200', 1477931951),
(1224, 1, '200', 1477938871),
(1225, 2, '200', 1477938871),
(1226, 3, '200', 1477938871),
(1227, 4, '200', 1477938871),
(1228, 5, '200', 1477938871),
(1229, 1, '200', 1478694691),
(1230, 2, '200', 1478694691),
(1231, 3, '200', 1478694691),
(1232, 4, '200', 1478694691),
(1233, 5, '200', 1478694691),
(1234, 2, '200', 1478694723),
(1235, 2, '200', 1478694780),
(1236, 2, '200', 1478694781),
(1237, 2, '200', 1478694867),
(1238, 2, '200', 1478694938),
(1239, 2, '200', 1478694961),
(1240, 2, '200', 1478695205),
(1241, 2, '200', 1478695743),
(1242, 1, '200', 1478697665),
(1243, 2, '200', 1478697665),
(1244, 3, '200', 1478697665),
(1245, 4, '200', 1478697665),
(1246, 5, '200', 1478697665),
(1247, 2, '200', 1478697742),
(1248, 2, '200', 1478697782),
(1249, 1, '200', 1478705015),
(1250, 2, '200', 1478705015),
(1251, 3, '200', 1478705015),
(1252, 4, '200', 1478705015),
(1253, 5, '200', 1478705015),
(1254, 1, '200', 1486398138),
(1255, 2, '200', 1486398138),
(1256, 3, '200', 1486398138),
(1257, 4, '200', 1486398138),
(1258, 5, '200', 1486398138),
(1259, 1, '200', 1486987219),
(1260, 2, '200', 1486987219),
(1261, 3, '200', 1486987219),
(1262, 4, '200', 1486987220),
(1263, 5, '200', 1486987220),
(1264, 2, '200', 1486987463),
(1265, 2, '200', 1486989678),
(1266, 2, '200', 1486989725),
(1267, 2, '200', 1486989839),
(1268, 2, '200', 1486989852),
(1269, 2, '200', 1486990699),
(1270, 2, '200', 1486990777),
(1271, 1, '200', 1486990885),
(1272, 2, '200', 1486990885),
(1273, 3, '200', 1486990885),
(1274, 4, '200', 1486990885),
(1275, 5, '200', 1486990885),
(1276, 2, '200', 1486991037),
(1277, 1, '200', 1487000034),
(1278, 2, '200', 1487000034),
(1279, 3, '200', 1487000034),
(1280, 4, '200', 1487000034),
(1281, 5, '200', 1487000034),
(1282, 2, '200', 1487001338),
(1283, 2, '200', 1487001483),
(1284, 2, '200', 1487001549),
(1285, 1, '200', 1487001603),
(1286, 2, '200', 1487001603),
(1287, 3, '200', 1487001603),
(1288, 4, '200', 1487001603),
(1289, 5, '200', 1487001603),
(1290, 2, '200', 1487001720),
(1291, 2, '200', 1487001902),
(1292, 2, '200', 1487002336),
(1293, 2, '200', 1487003234),
(1294, 2, '200', 1487003281),
(1295, 2, '200', 1487003534),
(1296, 2, '200', 1487004052),
(1297, 2, '200', 1487004089),
(1298, 2, '200', 1487004220),
(1299, 2, '200', 1487004283),
(1300, 2, '200', 1487004473),
(1301, 2, '200', 1487004561),
(1302, 1, '200', 1487074018),
(1303, 2, '200', 1487074018),
(1304, 3, '200', 1487074018),
(1305, 4, '200', 1487074018),
(1306, 5, '200', 1487074018),
(1307, 2, '200', 1487074026),
(1308, 2, '200', 1487074240),
(1309, 2, '200', 1487074275),
(1310, 2, '200', 1487074346),
(1311, 2, '200', 1487074394),
(1312, 2, '200', 1487074449),
(1313, 2, '200', 1487074541),
(1314, 2, '200', 1487074672),
(1315, 2, '200', 1487074700),
(1316, 2, '200', 1487074770),
(1317, 2, '200', 1487074805),
(1318, 2, '200', 1487074877),
(1319, 2, '200', 1487075212),
(1320, 2, '200', 1487075261),
(1321, 2, '200', 1487075312),
(1322, 2, '200', 1487075355),
(1323, 1, '200', 1487078397),
(1324, 2, '200', 1487078397),
(1325, 3, '200', 1487078397),
(1326, 4, '200', 1487078397),
(1327, 5, '200', 1487078397),
(1328, 1, '200', 1487082173),
(1329, 2, '200', 1487082173),
(1330, 3, '200', 1487082173),
(1331, 4, '200', 1487082173),
(1332, 5, '200', 1487082173),
(1333, 1, '200', 1488541094),
(1334, 2, '200', 1488541094),
(1335, 3, '200', 1488541094),
(1336, 4, '200', 1488541094),
(1337, 5, '200', 1488541094),
(1338, 2, '200', 1488541183),
(1339, 2, '200', 1488541218),
(1340, 2, '200', 1488541416),
(1341, 1, '200', 1488547105),
(1342, 2, '200', 1488547105),
(1343, 3, '200', 1488547105),
(1344, 4, '200', 1488547105),
(1345, 5, '200', 1488547105),
(1346, 2, '200', 1488547172),
(1347, 2, '200', 1488547209),
(1348, 2, '200', 1488547381),
(1349, 2, '200', 1488547447),
(1350, 2, '200', 1488547518),
(1351, 2, '200', 1488547799),
(1352, 2, '200', 1488547848),
(1353, 2, '200', 1488548017),
(1354, 2, '200', 1488548050),
(1355, 2, '200', 1488548106),
(1356, 2, '200', 1488548831),
(1357, 2, '200', 1488548920),
(1358, 1, '200', 1488987851),
(1359, 2, '200', 1488987851),
(1360, 3, '200', 1488987851),
(1361, 4, '200', 1488987851),
(1362, 5, '200', 1488987851),
(1363, 2, '200', 1488988044),
(1364, 2, '200', 1488988190),
(1365, 2, '200', 1488988230),
(1366, 2, '200', 1488988278),
(1367, 2, '200', 1488988326),
(1368, 1, '200', 1488990041),
(1369, 2, '200', 1488990041),
(1370, 3, '200', 1488990041),
(1371, 4, '200', 1488990041),
(1372, 5, '200', 1488990041),
(1373, 2, '200', 1488990080),
(1374, 2, '200', 1488990145),
(1375, 2, '200', 1488990180),
(1376, 2, '200', 1488990698),
(1377, 2, '200', 1488990745),
(1378, 2, '200', 1488990793),
(1379, 2, '200', 1488990876),
(1380, 1, '200', 1488992521),
(1381, 2, '200', 1488992521),
(1382, 3, '200', 1488992521),
(1383, 4, '200', 1488992521),
(1384, 5, '200', 1488992521),
(1385, 2, '200', 1488992701),
(1386, 2, '200', 1488992767),
(1387, 2, '200', 1488992847),
(1388, 2, '200', 1488992886),
(1389, 2, '200', 1488993354),
(1390, 2, '200', 1488993403),
(1391, 2, '200', 1488993458),
(1392, 2, '200', 1488994029),
(1393, 1, '200', 1489058768),
(1394, 2, '200', 1489058768),
(1395, 3, '200', 1489058768),
(1396, 4, '200', 1489058768),
(1397, 5, '200', 1489058768),
(1398, 2, '200', 1489059127),
(1399, 1, '200', 1489061418),
(1400, 2, '200', 1489061418),
(1401, 3, '200', 1489061418),
(1402, 4, '200', 1489061419),
(1403, 5, '200', 1489061419),
(1404, 2, '200', 1489061503),
(1405, 2, '200', 1489061535),
(1406, 2, '200', 1489061597),
(1407, 2, '200', 1489061643),
(1408, 2, '200', 1489062457),
(1409, 2, '200', 1489062495),
(1410, 2, '200', 1489062569),
(1411, 2, '200', 1489062633),
(1412, 2, '200', 1489062661),
(1413, 2, '200', 1489062790),
(1414, 2, '200', 1489064147),
(1415, 1, '200', 1489065513),
(1416, 2, '200', 1489065513),
(1417, 3, '200', 1489065513),
(1418, 4, '200', 1489065513),
(1419, 5, '200', 1489065513),
(1420, 2, '200', 1489065751),
(1421, 2, '200', 1489065864),
(1422, 2, '200', 1489065903),
(1423, 2, '200', 1489065961),
(1424, 2, '200', 1489066022),
(1425, 2, '200', 1489066088),
(1426, 2, '200', 1489066377),
(1427, 2, '200', 1489066440),
(1428, 2, '200', 1489066607),
(1429, 2, '200', 1489066692),
(1430, 2, '200', 1489066766),
(1431, 2, '200', 1489066898);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) DEFAULT NULL,
  `service_description` varchar(255) DEFAULT NULL,
  `service_url` varchar(255) DEFAULT NULL,
  `service_api` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Info on input sources i.e SMS, Email, Twitter' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `service_name`, `service_description`, `service_url`, `service_api`) VALUES
(1, 'SMS', 'Text messages from phones', NULL, NULL),
(2, 'Email', 'Email messages sent to your deployment', NULL, NULL),
(3, 'Twitter', 'Tweets tweets tweets', 'http://twitter.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(127) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores session information';

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `last_activity`, `data`) VALUES
('4q2nsf13r8r7fdubsj3dnblb17', 1489066795, '89eAqYshbO9uk9IlzsSNmUgMrKJmVyUGcri9cCHRcRUHwmZwQvwhKL5uKwvMbl3BM1lxKn0OOnR1qxvKYe2/o2NWO1IlQA5/UVARUzXmHuAH1AQvvMRnDgqYedvdGWJaix1ZQkbRtTicjsNMbLR5t74YXsbrgFs6ipp4R6ZDErHMy8kMRl+s+V8LSCEmCrWzR7hKgLn3VKM+W9iRBrXRV4WzsQ6iOFYqILT1nzBXMn9EPIPRqah50QgVpwlr0Zn3bBSu4EhOF8Yoz7rrlKNjEV3578YGVaMvx4cEcZoznGoTi5LZw52OcecAI1TqBV0JcXHnQzz5R2lCIssbvtSHbmJqT0+bnpZkGz5n+QIy4nlucLcwK7IW6vCI0yd4zsLd1/zD/1r1oV65lnM+U39bwxxMNHysI/QwTcVrZFVjXQOMWzdjJA2jr17jvHiDMVlGrUaH6td3/cvv7nkV5Hujk47O6XC167B/MVIozl9yiaK8IjIH2qtxLVewHe1ipSklzqUhPmRA2PInTRdLINceoHP8EEVkh2GxSvwvEglUYaAt+ogG03eIHCpHqcRRiOwwhJ5fGII5f0ETLL7OFG1pxTBW18nBZl1CKfsOVoS7DpdcDNPpT79LuH2JyocZI2rJB5kX+2LxaFrm+Fqn8DHs2c4yzO3CgNmU8DK5gU6BExbDiUrngjUM+ECwltnxI3cAPgjg5V+aM/m5n1swhkPcUiVXFBDhaTKDGbXLiNF9k2vIEVokT1VBp8q6klxYuz8sA80I1CyFEqCyewi4nJfYKAJ5YA9WSAsrFIp4GQsjd774WMdkbpwvTZ0ni3SYoALPXP3ybPTFGdZoPgwZfABJWEWAfKwJFE0+ixSLcNtcSHfoUeZz5KQGpjExmxaC9O9Wg35uAWIAZdhgLyU4AZXnP7WnEdUBjP3JZ6H7rUBZTMdv7p0OOuXSZns74qZ+RM8gqpVYmxilW2yglKfFawpR9SxKqLURnNq3C6cartGdP5bVfpKTQKdtCxpBWchxbOlHxLhytQSdWpzNREhK4iZRygOvi/zW/PLgNkXj/dYM8ltTxiGsJB/LvIJCVEtamGEMElCsrS05rtXjGRzpZQvVeEmgyFWPb1hyKJoxuu4xv06bSgtaJUeuQ14UpL4Jmckm5KihuT5bW6jneYc+d9OIzpZcrwgPy56AZpWxFbp840/jOOaYDCtry39y9LWzOswHbw5AkJ4I6B6WwrIjyMoIU0oIRJi5TODNnwIWcT6m+2cYe44dOT92VRLwrRvcfLKoe9rERHubC7w10HvnwgWlmO9DiyjQe0B4pnjRmXYhHZBKYTPjPRXmCDbNEkXN'),
('61cqpk4u738keg4u625bn2gpv5', 1489066898, 'mDjvulBS2xgGbfqWcuewNpnjFeCJSOOKkh6ID+17mSYs6yPzUXD/BdtrGp0NkhuEpiXX3u/LKivXg4lntsaGHupylkavCGEyLwMcOwVtaMyoP36aSlai0q9uPNR2D0DM2xXCQDjx3gN5jdPdCtATRrOSpSjWm8GaCXT8nvGnaMJLA3yGONdXWD8lHRnZXZZGczRWXpIuwWgtDQ9q/1Js/Th74I7EO8j4WVawDHv8UgdQBTw4LW5go1CwMvP8yUKMKo9uqfJYwfqwWZq5fOPUc5l/iRwu85gkcJE8oDUi3ERuvuOmyeABWqdepE/lxlx6Zxzo1/tNAiDzR8eDlR2bAFNx29d+Z/dOZW54ZjIL3DTzI9rZGzmm0amZiBEid8jbvItporXnOYpmJRI8KlAOqL+AANCihLeilfq4IPwQWm5D4YSicr6H0xb7GIvIs4bZfafCy9BKy12VSvxH2Y6e+gzAzJZ1lR8yaQokQDCLE+rHb8isZw22/CChJUjU6wkFekQBHsVXx1zOZuNLwuziDd3yJl4PQk0z4UzVd2LplM9Bs8CVGyNI27sGlNFMmnxqQdejBfQvC/WWl3bvFL/5khhTMKIAylLbfs30VJLkZVoeGo0u8HOp7manaxYF3gMD4U2fBTloPolyfNIo+IqOzBIsU26VQufLvKpErEDkQO1HKdG0CxQTkooHgU8sRpgHH22vY6J/de6MXuzPIIBjy1U7FeoVQvCuHpkj34WsYMq1spLWfSg6ftHLRljOeBGINnyJOOrjitqswXeRPs0LKgz0JHrgQ8qSJ9mzFHEDdvwgAwnQ/1g5zunsu2umuz7ouL/4REKBknlTG9UYCrIGUmtNVwWFZWPq/WSt/y+vX4SSTtPklIk9tqw8eKb81AfO+x5uPEhC3uZAmGNnphQgeCozOC5Wht2/CKnzUkhVA+6kGtAYi93V0hA5EobCKceK7Rfs4JGHuHjFyHi1ArARhRLJ/vH/EbztGKCgt4g4RSUFXwwk5d7jleXmGV/PnhAjPL4C7A1Yzyi1vg7ExbudvnaQjd2iDnTKEPOd4LsSk3X0k6vz0y6ZEjaF2DvjyXfV7gscokJY1EHf3+McOiPnY+LNPwdtsEcslkp2DUEzIMXbCdK9Y253GZhIMIkjuImDrygnTLHxlMIPUM+5XB5+G5zaZDVHs7YG6lt4cc7juonm+pcIhJly30kuZPGlDptu4qudMhtrEZoYGWHYTW4vOsuisSsarsM3H8nHWQhMr7I5kOVjCJkwnUn0SQrPwTPbTXXPWyMOKzeSF4O6Iri1A7/2/SboPVvixQylRsSFBn0LlmH8ei9Nm95d5h4iFlBjKpKp2wRYpIJdhLFLkbeT85HyK7u1EBLNW/EvdxnBYleGpdEvg1imQeDO6T+2gZOiS0KIJWA1ITgtOxlknlh2VWRsmIvT4A1ad+bWTWBplLSBRlkPEpOL75HdKoLjm/X7HRAJx8CyJL5WsweiBjmTkABsz0qSRrzjBqF4bjkvfKoSHV6EHPHQCR1IXyPB004ufTN0NF7anq9F3eDy');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL DEFAULT '' COMMENT 'Unique identifier for the configuration parameter',
  `value` text COMMENT 'Value for the settings parameter',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_settings_key` (`key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'site_name', 'Mapa del Graduado UNER'),
(2, 'site_tagline', 'UNER - Universidad Nacional de Entre RÃ­os - Argentina'),
(3, 'site_banner_id', '12'),
(4, 'site_email', 'graduados@uner.edu.ar'),
(5, 'site_key', NULL),
(6, 'site_language', 'es_AR'),
(7, 'site_style', 'uner'),
(8, 'site_timezone', '0'),
(9, 'site_contact_page', '1'),
(10, 'site_help_page', '1'),
(11, 'site_message', ''),
(12, 'site_copyright_statement', 'Eva Peron 24 - Concepcion del Uruguay - Entre Rios\nTelefono: 54-03442-42-1500'),
(13, 'site_submit_report_message', ''),
(14, 'allow_reports', '1'),
(15, 'allow_comments', '2'),
(16, 'allow_feed', '0'),
(17, 'allow_stat_sharing', '1'),
(18, 'allow_clustering', '1'),
(19, 'cache_pages', '0'),
(20, 'cache_pages_lifetime', '1800'),
(21, 'private_deployment', '0'),
(22, 'default_map', 'osm_mapnik'),
(23, 'default_map_all', '000000'),
(24, 'default_map_all_icon_id', '3'),
(25, 'api_google', ''),
(26, 'api_live', 'Apumcka0uPOF2lKLorq8aeo4nuqfVVeNRqJjqOcLMJ9iMCTsnMsNd9_OvpA8gR0i'),
(27, 'api_akismet', ''),
(28, 'default_country', '11'),
(29, 'multi_country', '1'),
(30, 'default_city', 'nairobi'),
(31, 'default_lat', '-31.284592036465725'),
(32, 'default_lon', '-59.04635949999999'),
(33, 'default_zoom', '7'),
(34, 'items_per_page', '10'),
(35, 'items_per_page_admin', '20'),
(36, 'sms_provider', ''),
(37, 'sms_no1', NULL),
(38, 'sms_no2', NULL),
(39, 'sms_no3', NULL),
(40, 'google_analytics', ''),
(41, 'twitter_hashtags', NULL),
(42, 'blocks', 'reports_block|news_block'),
(43, 'blocks_per_row', '2'),
(44, 'date_modify', '2016-08-08 14:34:31'),
(45, 'stat_id', '72308'),
(46, 'stat_key', '18fccb50377d6ee272045671556882'),
(47, 'email_username', NULL),
(48, 'email_password', NULL),
(49, 'email_port', NULL),
(50, 'email_host', NULL),
(51, 'email_servertype', NULL),
(52, 'email_ssl', NULL),
(53, 'ftp_server', NULL),
(54, 'ftp_user_name', NULL),
(55, 'alerts_email', 'marianodnegro@gmail.com'),
(57, 'facebook_appid', 'https://www.facebook.com/AreadeGraduadosUNER/?ref=aymt_homepage_panel'),
(58, 'facebook_appsecret', ''),
(59, 'db_version', '119'),
(60, 'ushahidi_version', '2.7.4'),
(61, 'allow_alerts', '0'),
(62, 'require_email_confirmation', '0'),
(63, 'manually_approve_users', '0'),
(64, 'enable_timeline', '0'),
(65, 'feed_geolocation_user', ''),
(66, 'allow_feed_category', '0'),
(67, 'max_upload_size', '10'),
(68, 'forgot_password_secret', 'T94$RIrsw0b(wK(8IM+`l@{YOjCM7O{i8UNIls7]p{yW82.M{T*qyuM2HaqMlw~q'),
(69, 'scheduler_lock', '0'),
(70, 'timeline_graph', 'line'),
(71, 'timeline_point_label', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `riverid` varchar(128) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(127) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` char(50) NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flag incase admin opts in for email notifications',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `color` varchar(6) NOT NULL DEFAULT 'FF0000',
  `code` varchar(30) DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `public_profile` tinyint(1) NOT NULL DEFAULT '1',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `needinfo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores registered usersâ€™ information' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `riverid`, `name`, `email`, `username`, `password`, `logins`, `last_login`, `notify`, `updated`, `color`, `code`, `confirmed`, `public_profile`, `approved`, `needinfo`) VALUES
(1, '', 'Administrator', 'graduados@uner.edu.ar', 'admin', 'c31d9e5390b0ae0aea0affe70348112f8ee9461db10f7181cf', 44, 1489062491, 0, '2017-03-09 12:28:11', 'FF0000', NULL, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_tokens`
--

CREATE TABLE IF NOT EXISTS `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(64) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores browser tokens assigned to users' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `user_id`, `user_agent`, `token`, `created`, `expires`) VALUES
(1, 1, '69b376dd4588977189b9141b332c0974e8c6418a', 'iXyRCzxVb8MFmYOpfbjmUcoUYgUOMbGJ', 1460126773, 1461336373),
(2, 1, '58094984ed2e8187261d35016e7997a1a98e2b75', 'IoDzuH7DVYsHGMgKxHa8G06yMpwz8dkg', 1464980403, 1466190003),
(3, 1, '58094984ed2e8187261d35016e7997a1a98e2b75', 'dXMeTSueypsdsFZZaXXPlekoOb8LvSZT', 1465323172, 1466532772),
(4, 1, '3628ed27e34fdc54e674d6a3b4a24c71208a600d', 'HC4me4oswfLnLexKMyNhzyESQYFB22PG', 1466790406, 1468000006),
(5, 1, '3628ed27e34fdc54e674d6a3b4a24c71208a600d', 'x9pyBcjjLaeT3uKKRI7Qe9o7iPWRUsC5', 1469717769, 1470927369),
(6, 1, '02a98f243abb1005e7fcc53c5bbc48ade8b89ae4', 'DWQJeR0DpoOp4U0Brm28cFTl4Rjq6heT', 1473958587, 1475168187),
(7, 1, '9413061305ae25c7dc96396993c34e4c6bf44378', 'lWmgOOA1qwf2QuPuxotVxX7ESc3kenaI', 1476713364, 1477922964),
(8, 1, 'e62a35503738b8e7e6fafd032520fc3fcd810ed6', 'RwfXIxwW1qUiovUURbXY1IQeCDZNYnIT', 1476715822, 1477925422),
(9, 1, 'e62a35503738b8e7e6fafd032520fc3fcd810ed6', 'XuJGPO66tLRgGz9AFPCKtubrO1lczgPs', 1486398134, 1487607734),
(10, 1, 'edd0c5457821155c9d3e8ebe2b1cf93b2d2611c9', 'm8X037rDrBlPLdvrwpUTnnmcmIDn4O9c', 1487074272, 1488283872),
(11, 1, 'e62a35503738b8e7e6fafd032520fc3fcd810ed6', 'uofplb2ZNtGPgYP0TSycQzeycJhUy5K6', 1488541088, 1489750688),
(12, 1, 'edd0c5457821155c9d3e8ebe2b1cf93b2d2611c9', 'ikAh9SI8JrA5RvkOlCeUjqyCiMkroCAJ', 1489062491, 1490272091);

-- --------------------------------------------------------

--
-- Table structure for table `verified`
--

CREATE TABLE IF NOT EXISTS `verified` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `verified_date` datetime DEFAULT NULL,
  `verified_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores all verified reports' AUTO_INCREMENT=15 ;

--
-- Dumping data for table `verified`
--

INSERT INTO `verified` (`id`, `incident_id`, `user_id`, `verified_date`, `verified_status`) VALUES
(1, 2, 1, '2016-06-24 19:21:40', 0),
(2, 2, 1, '2016-06-24 19:21:53', 1),
(3, 3, 1, '2016-06-27 21:47:32', 1),
(4, 2, 1, '2016-06-28 18:32:01', 2),
(5, 3, 1, '2016-06-29 16:36:35', 1),
(6, 3, 1, '2016-06-29 16:38:10', 1),
(7, 5, 1, '2016-06-29 17:09:28', 1),
(8, 6, 1, '2016-06-29 17:09:28', 1),
(9, 4, 1, '2016-06-29 17:09:28', 1),
(10, 3, 1, '2016-06-29 17:09:36', 0),
(11, 2, 1, '2016-06-29 17:09:36', 2),
(12, 5, 1, '2016-06-29 18:38:36', 1),
(13, 3, 1, '2016-08-09 18:16:45', 1),
(14, 2, 1, '2016-08-09 18:16:51', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
