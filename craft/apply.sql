-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Mrz 2020 um 16:12
-- Server-Version: 10.4.8-MariaDB
-- PHP-Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `apply`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `assets`
--

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(16, 1, 1, 1, 'background.jpg', 'image', 1920, 1080, 591669, NULL, 0, 0, '2020-03-05 10:13:27', '2020-03-05 10:13:27', '2020-03-05 10:13:27', '349ba0e0-4c1f-4243-99c7-52c3f89e4255'),
(18, 1, 1, 1, 'passat.jpg', 'image', 2560, 1440, 1073022, NULL, 0, 0, '2020-03-05 10:17:52', '2020-03-05 10:17:52', '2020-03-05 10:17:52', '3ccc5526-f5e0-4b65-9b4a-ba2d77c94171'),
(19, 1, 1, 1, 'register.jpg', 'image', 1486, 675, 387991, NULL, NULL, NULL, '2020-03-05 10:25:57', '2020-03-05 10:25:58', '2020-03-05 10:25:58', '75aae500-d352-495b-97fa-ad5a270d9628');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 'fieldLayoutId', '2020-03-05 10:13:09', 0, 1),
(2, 1, 'title', '2020-02-26 09:43:23', 0, 1),
(35, 1, 'title', '2020-03-06 14:21:36', 0, 1),
(35, 1, 'uri', '2020-03-06 14:22:25', 0, 1),
(42, 1, 'uri', '2020-03-06 14:26:34', 0, 1),
(49, 1, 'fieldLayoutId', '2020-03-06 14:57:44', 0, 1),
(52, 1, 'fieldLayoutId', '2020-03-06 14:57:45', 0, 1),
(55, 1, 'fieldLayoutId', '2020-03-06 14:57:45', 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 2, '2020-03-05 10:36:40', 0, 1),
(2, 1, 3, '2020-03-05 10:26:12', 0, 1),
(2, 1, 5, '2020-03-06 08:18:12', 0, 1),
(2, 1, 6, '2020-03-06 08:18:12', 0, 1),
(49, 1, 2, '2020-03-06 14:58:16', 0, 1),
(49, 1, 3, '2020-03-06 14:57:44', 0, 1),
(52, 1, 2, '2020-03-06 15:00:39', 0, 1),
(52, 1, 3, '2020-03-06 14:57:45', 0, 1),
(55, 1, 2, '2020-03-06 15:00:32', 0, 1),
(55, 1, 3, '2020-03-06 14:57:45', 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_percentage` text DEFAULT NULL,
  `field_text` text DEFAULT NULL,
  `field_fpWidth` smallint(3) DEFAULT NULL,
  `field_fpHeight` smallint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_percentage`, `field_text`, `field_fpWidth`, `field_fpHeight`) VALUES
(1, 1, 1, NULL, '2020-02-25 13:38:34', '2020-02-25 13:38:34', '89db6acf-9a72-4935-b439-7fb2e9338870', NULL, NULL, NULL, NULL),
(2, 2, 1, 'Home', '2020-02-25 14:35:20', '2020-03-06 08:18:12', '18984534-db7d-4501-abe2-d807e25bd8ce', NULL, '<p>Text Text Text</p>', 40, 50),
(3, 3, 1, 'home', '2020-02-25 14:35:20', '2020-02-25 14:35:20', 'b53e09b1-79d7-4496-a99e-8214460be153', NULL, NULL, NULL, NULL),
(4, 4, 1, 'home', '2020-02-25 14:36:25', '2020-02-25 14:36:25', '727e7a6b-c73b-4a97-83ab-9c3982ec1af2', NULL, NULL, NULL, NULL),
(5, 5, 1, 'home', '2020-02-25 14:45:02', '2020-02-25 14:45:02', '50957375-28d5-4d57-8884-79fa9f429282', NULL, NULL, NULL, NULL),
(6, 6, 1, 'home', '2020-02-25 14:45:03', '2020-02-25 14:45:03', '584be783-66e0-4734-926d-33485b568cf8', NULL, NULL, NULL, NULL),
(7, 7, 1, 'home', '2020-02-25 14:46:01', '2020-02-25 14:46:01', '6fd2bc9c-dbb9-46dd-8b94-1d5afcffbf8d', NULL, NULL, NULL, NULL),
(8, 8, 1, 'home', '2020-02-25 14:47:40', '2020-02-25 14:47:40', 'f6b2d3f4-e1a5-4c6a-8b9b-6c110942f577', NULL, NULL, NULL, NULL),
(9, 9, 1, 'Home', '2020-02-26 09:43:23', '2020-02-26 09:43:23', '42a212da-6f01-4ec9-a9e6-19347a0701b1', NULL, NULL, NULL, NULL),
(10, 10, 1, 'Home', '2020-02-26 09:43:23', '2020-02-26 09:43:23', 'fc3c9fb5-7229-451e-86de-583ec2934859', NULL, NULL, NULL, NULL),
(11, 11, 1, NULL, '2020-03-02 15:43:41', '2020-03-02 15:43:41', '036fe14d-0ab9-473c-9d36-b3204235e494', NULL, NULL, NULL, NULL),
(13, 13, 1, 'PHP', '2020-03-02 15:48:55', '2020-03-02 15:48:55', '59d451ec-f012-4665-80bf-c72a566d45d7', NULL, NULL, NULL, NULL),
(14, 14, 1, 'PHP', '2020-03-02 15:48:55', '2020-03-02 15:48:55', 'b46d7e8f-92d3-452a-ba48-ff4c39f0f8a7', NULL, NULL, NULL, NULL),
(15, 15, 1, 'Home', '2020-03-05 10:13:09', '2020-03-05 10:13:09', '15c68f87-7d98-405e-9fae-f92208e473c4', NULL, NULL, NULL, NULL),
(16, 16, 1, 'Background', '2020-03-05 10:13:27', '2020-03-05 10:13:27', '28d60758-1e17-49bd-a495-5f8ce662565e', NULL, NULL, NULL, NULL),
(17, 17, 1, 'Home', '2020-03-05 10:13:45', '2020-03-05 10:13:45', '741f3f5c-f469-4b2d-9311-b10024a262af', NULL, '<p>Ich bin ein Beispieltext</p>', NULL, NULL),
(18, 18, 1, 'Passat', '2020-03-05 10:17:51', '2020-03-05 10:20:12', '23382d54-b8a2-4b77-8a14-d4ce8ea2e48a', NULL, NULL, NULL, NULL),
(19, 19, 1, 'Register', '2020-03-05 10:25:57', '2020-03-05 10:25:57', '7c74e348-754d-44ac-9362-c8c08b45609d', NULL, NULL, NULL, NULL),
(20, 20, 1, 'Home', '2020-03-05 10:26:12', '2020-03-05 10:26:12', 'a6cdf05a-8d8b-4c6e-b64c-bfc31a75bcd0', NULL, '<p>Ich bin ein Beispieltext</p>', NULL, NULL),
(21, 21, 1, 'Home', '2020-03-05 10:29:00', '2020-03-05 10:29:00', 'd49baad4-566d-4839-9c33-388ce088f439', NULL, '', NULL, NULL),
(22, 22, 1, 'Home', '2020-03-05 10:36:40', '2020-03-05 10:36:40', '5882b3e6-df40-49b5-ac00-3fc2f9e23f3b', NULL, '<p>Text Text Text</p>', NULL, NULL),
(23, 23, 1, 'Home', '2020-03-05 14:02:11', '2020-03-05 14:02:11', '24875292-23a6-4c44-9bb3-35b6d2451193', NULL, '<p>Text Text Text</p>', NULL, NULL),
(24, 24, 1, 'Home', '2020-03-05 14:02:34', '2020-03-05 14:02:34', 'c4244b9e-2600-41ed-a697-cc12dc943408', NULL, '<p>Text Text Text</p>', NULL, NULL),
(25, 25, 1, 'Home', '2020-03-05 14:02:55', '2020-03-05 14:02:55', 'f683cc2b-7c1d-46d0-8700-9cef73720a4b', NULL, '<p>Text Text Text</p>', NULL, NULL),
(26, 26, 1, 'Home', '2020-03-05 14:52:22', '2020-03-05 14:52:22', 'e5215d00-2fc0-4327-b2a8-989df7d51a62', NULL, '<p>Text Text Text</p>', NULL, NULL),
(27, 27, 1, 'Home', '2020-03-05 14:52:54', '2020-03-05 14:52:54', 'adb4d91b-349a-422c-b447-866d880cd6e6', NULL, '<p>Text Text Text</p>', 60, 80),
(28, 28, 1, 'Home', '2020-03-05 14:54:11', '2020-03-05 14:54:11', 'e7032e30-8f86-43bb-8165-35998a19cdb8', NULL, '<p>Text Text Text</p>', 20, 20),
(29, 29, 1, 'Home', '2020-03-05 14:54:32', '2020-03-05 14:54:32', 'e50de7af-e26c-4b44-ab3a-e7436eb7ad77', NULL, '<p>Text Text Text</p>', 20, 80),
(30, 30, 1, 'Home', '2020-03-05 14:57:50', '2020-03-05 14:57:50', 'cd3e5978-7ef8-487e-b232-763e42b76e19', NULL, '<p>Text Text Text</p>', 20, 80),
(31, 31, 1, 'Home', '2020-03-05 15:00:34', '2020-03-05 15:00:34', '846e3a4b-ff47-4d66-b7fb-a780bee38656', NULL, '<p>Text Text Text</p>', 80, 80),
(32, 32, 1, 'Home', '2020-03-05 15:03:39', '2020-03-05 15:03:39', '0d6fb396-9be2-4612-b28a-f04fc350e92e', NULL, '<p>Text Text Text</p>', 80, 60),
(33, 33, 1, 'Home', '2020-03-05 15:09:58', '2020-03-05 15:09:58', '3f6d5eb5-1d7c-46b8-933d-5dd165c4c300', NULL, '<p>Text Text Text</p>', 90, 10),
(34, 34, 1, 'Home', '2020-03-06 08:18:12', '2020-03-06 08:18:12', '4615f375-3bc9-411e-b4a5-beb31f988eaa', NULL, '<p>Text Text Text</p>', 40, 50),
(35, 35, 1, 'About Me', '2020-03-06 14:21:25', '2020-03-06 14:22:26', 'ebd34c31-5b40-4437-a9f1-e7c4816e0c00', NULL, NULL, NULL, NULL),
(36, 36, 1, 'AboutMe', '2020-03-06 14:21:25', '2020-03-06 14:21:25', 'a0c4dcec-a603-48d0-aae3-52cedbf5b2b4', NULL, NULL, NULL, NULL),
(37, 37, 1, 'About Me', '2020-03-06 14:21:36', '2020-03-06 14:21:36', 'a63d5d72-a9ef-4203-a9dc-bee05dfd8af5', NULL, NULL, NULL, NULL),
(38, 38, 1, 'About Me', '2020-03-06 14:22:25', '2020-03-06 14:22:25', '29349aa4-4ff0-47c5-974f-06236e5f6b5a', NULL, NULL, NULL, NULL),
(39, 39, 1, 'About Me', '2020-03-06 14:22:25', '2020-03-06 14:22:25', 'b52acbe2-2c67-4151-801f-b11562898193', NULL, NULL, NULL, NULL),
(40, 40, 1, 'Kontakt', '2020-03-06 14:23:15', '2020-03-06 14:23:15', 'c99d6e76-a24c-4b85-98ef-fb3bfc6ff38a', NULL, NULL, NULL, NULL),
(41, 41, 1, 'Kontakt', '2020-03-06 14:23:15', '2020-03-06 14:23:15', '04cd0e09-9526-4604-85dd-81422e031af7', NULL, NULL, NULL, NULL),
(42, 42, 1, 'Lebenslauf', '2020-03-06 14:25:28', '2020-03-06 14:26:35', '24ba5fc9-7b80-4527-8525-7a0d33792b2e', NULL, NULL, NULL, NULL),
(43, 43, 1, 'Lebenslauf', '2020-03-06 14:25:28', '2020-03-06 14:25:28', 'fc29ca97-282c-4dfc-9137-49ccb016f722', NULL, NULL, NULL, NULL),
(44, 44, 1, 'Lebenslauf', '2020-03-06 14:26:34', '2020-03-06 14:26:34', 'ea101d26-bd5c-47c9-9db5-5ac5d4012185', NULL, NULL, NULL, NULL),
(45, 45, 1, 'Lebenslauf', '2020-03-06 14:26:34', '2020-03-06 14:26:34', '65766237-8eb9-40ae-9a9e-bc0101214d24', NULL, NULL, NULL, NULL),
(46, 46, 1, 'Projekte', '2020-03-06 14:31:24', '2020-03-06 14:31:24', 'e58fe749-0450-4d54-a636-1b32c728bafe', NULL, NULL, NULL, NULL),
(47, 47, 1, 'Projekte', '2020-03-06 14:31:24', '2020-03-06 14:31:24', 'd34a530b-dfea-44f8-9737-8158b2cc7d7f', NULL, NULL, NULL, NULL),
(49, 49, 1, 'Impressum', '2020-03-06 14:42:17', '2020-03-06 14:58:53', '92a7f5fa-acff-4de1-844a-fbafe2ebfa00', NULL, '<h2>Impressum</h2>', NULL, NULL),
(50, 50, 1, 'Impressum', '2020-03-06 14:42:17', '2020-03-06 14:42:17', 'd31c8de6-62de-4ce6-b22e-b4d26bf1b15d', NULL, NULL, NULL, NULL),
(52, 52, 1, 'Datenschutz', '2020-03-06 14:42:25', '2020-03-06 15:00:39', '62a2c014-5b1b-4481-bac5-e54af6c902d9', NULL, '<h2>Datenschutz</h2>', NULL, NULL),
(53, 53, 1, 'Datenschutz', '2020-03-06 14:42:25', '2020-03-06 14:42:25', 'a693f43d-67ac-4023-a368-ece688d12b52', NULL, NULL, NULL, NULL),
(55, 55, 1, 'Sonstiges', '2020-03-06 14:43:03', '2020-03-06 15:00:31', 'c00ad189-783c-4942-80d7-4546b6d30b39', NULL, '<h2>Sonstiges</h2>', NULL, NULL),
(56, 56, 1, 'Sonstiges', '2020-03-06 14:43:03', '2020-03-06 14:43:03', '85e9c209-0aa1-478f-bf56-991b0ba9704c', NULL, NULL, NULL, NULL),
(57, 57, 1, 'Impressum', '2020-03-06 14:58:16', '2020-03-06 14:58:16', 'b535eaa1-e511-4ed1-9779-b7c69ebd81ea', NULL, '<h2>Impressum</h2>', NULL, NULL),
(58, 58, 1, 'Impressum', '2020-03-06 14:58:36', '2020-03-06 14:58:36', 'c7e27d10-5b98-4a00-958e-5290293d82c6', NULL, '<h2>Impressum</h2>', NULL, NULL),
(59, 59, 1, 'Impressum', '2020-03-06 14:58:53', '2020-03-06 14:58:53', '0585f4f9-6528-4c6b-ad76-5659abdd63d4', NULL, '<h2>Impressum</h2>', NULL, NULL),
(60, 60, 1, 'Datenschutz', '2020-03-06 15:00:11', '2020-03-06 15:00:11', '9be28a55-2d85-4a08-9028-c6cdce133ad1', NULL, '<p>Datenschutz</p>', NULL, NULL),
(61, 61, 1, 'Sonstiges', '2020-03-06 15:00:31', '2020-03-06 15:00:31', '3c66dccd-d37b-4c71-b382-baad948489ce', NULL, '<h2>Sonstiges</h2>', NULL, NULL),
(62, 62, 1, 'Datenschutz', '2020-03-06 15:00:39', '2020-03-06 15:00:39', '6e0353cd-90cf-494f-97e3-8c5bc1696916', NULL, '<h2>Datenschutz</h2>', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `drafts`
--

INSERT INTO `drafts` (`id`, `sourceId`, `creatorId`, `name`, `notes`, `trackChanges`, `dateLastMerged`) VALUES
(1, NULL, 1, 'First draft', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `elements`
--

INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2020-02-25 13:38:34', '2020-02-25 13:38:34', NULL, 'aab07044-6c15-4cd1-9751-9e35925c8cd1'),
(2, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-02-25 14:35:20', '2020-03-06 08:18:12', NULL, '8718a679-04ae-4fda-943d-5b07baf389d9'),
(3, NULL, 1, NULL, 'craft\\elements\\Entry', 1, 0, '2020-02-25 14:35:20', '2020-02-25 14:35:20', NULL, '2f2064a3-5fe7-457c-8741-07138c243170'),
(4, NULL, 2, NULL, 'craft\\elements\\Entry', 1, 0, '2020-02-25 14:36:25', '2020-02-25 14:36:25', NULL, 'e722f04a-0fc0-4d03-94cb-f6af77e83ec0'),
(5, NULL, 3, NULL, 'craft\\elements\\Entry', 1, 0, '2020-02-25 14:45:02', '2020-02-25 14:45:02', NULL, 'c1c71bd3-d8e3-487e-8e22-9f8bb0d78dfa'),
(6, NULL, 4, NULL, 'craft\\elements\\Entry', 1, 0, '2020-02-25 14:45:03', '2020-02-25 14:45:03', NULL, '6e9b0d06-9404-45f8-8d2c-861b408f54a4'),
(7, NULL, 5, NULL, 'craft\\elements\\Entry', 1, 0, '2020-02-25 14:46:01', '2020-02-25 14:46:01', NULL, '80e0716d-2dee-4330-a98f-24dff415a437'),
(8, NULL, 6, NULL, 'craft\\elements\\Entry', 1, 0, '2020-02-25 14:47:40', '2020-02-25 14:47:40', NULL, 'b8852314-a78f-4532-93b7-5e9ce3117e99'),
(9, NULL, 7, NULL, 'craft\\elements\\Entry', 1, 0, '2020-02-26 09:43:22', '2020-02-26 09:43:22', NULL, '8268a0c6-738f-4f15-a11c-bea95fbfe9b1'),
(10, NULL, 8, NULL, 'craft\\elements\\Entry', 1, 0, '2020-02-26 09:43:23', '2020-02-26 09:43:23', NULL, '6ab36465-2e8f-4cc0-bf6f-2403b2ed6e61'),
(11, 1, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-02 15:43:41', '2020-03-02 15:43:41', NULL, 'de5b60f3-7bd2-42aa-ba19-9e38f123518f'),
(13, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2020-03-02 15:48:55', '2020-03-02 15:48:55', NULL, '311343f2-4b57-4b5b-a67a-6bf61acf4071'),
(14, NULL, 9, 1, 'craft\\elements\\Entry', 1, 0, '2020-03-02 15:48:55', '2020-03-02 15:48:55', NULL, '261f349a-430e-4141-9504-9b4a73be4fda'),
(15, NULL, 10, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 10:13:09', '2020-03-05 10:13:09', NULL, '932e356a-6341-4ce2-b2e4-053e7ad83c5b'),
(16, NULL, NULL, NULL, 'craft\\elements\\Asset', 1, 0, '2020-03-05 10:13:27', '2020-03-05 10:13:27', '2020-03-05 10:25:48', 'bf243bc8-c0ff-43bc-8567-c91b8b672ad9'),
(17, NULL, 11, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 10:13:45', '2020-03-05 10:13:45', NULL, 'b339ed1e-76e7-48fe-b648-0bd79aafbc3d'),
(18, NULL, NULL, NULL, 'craft\\elements\\Asset', 1, 0, '2020-03-05 10:17:51', '2020-03-05 10:20:12', '2020-03-05 10:25:52', '4a49ba5d-9dc9-4fe7-8f0b-93d02bf61067'),
(19, NULL, NULL, NULL, 'craft\\elements\\Asset', 1, 0, '2020-03-05 10:25:57', '2020-03-05 10:25:57', NULL, 'd15e5de3-c1d7-4063-965f-1454104a0d38'),
(20, NULL, 12, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 10:26:12', '2020-03-05 10:26:12', NULL, '75b2e150-147e-4dad-92fc-f597295445c4'),
(21, NULL, 13, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 10:29:00', '2020-03-05 10:29:00', NULL, '8e31403e-d07b-4ab1-8fe8-3ef964818c07'),
(22, NULL, 14, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 10:36:40', '2020-03-05 10:36:40', NULL, '88685ecf-ce19-4faf-8f3a-d7c14bf9912f'),
(23, NULL, 15, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 14:02:11', '2020-03-05 14:02:11', NULL, '93301943-4444-43d2-aa79-f5abdd50e41e'),
(24, NULL, 16, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 14:02:34', '2020-03-05 14:02:34', NULL, '576cc5ed-525c-48ed-905d-f1815ce342d3'),
(25, NULL, 17, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 14:02:55', '2020-03-05 14:02:55', NULL, 'db2a7a93-8aa3-4ab5-b8e4-469f81c8525a'),
(26, NULL, 18, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 14:52:21', '2020-03-05 14:52:21', NULL, 'e73474b3-66fb-4f0a-952d-74ef5a67334a'),
(27, NULL, 19, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 14:52:54', '2020-03-05 14:52:54', NULL, '77924b16-9c6d-49da-98e6-6fe97f68c54c'),
(28, NULL, 20, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 14:54:11', '2020-03-05 14:54:11', NULL, '9d4c0f97-8e35-44c7-802d-fb698a5f5570'),
(29, NULL, 21, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 14:54:32', '2020-03-05 14:54:32', NULL, 'f4f30555-a1df-4d21-aede-67ffbdfadacb'),
(30, NULL, 22, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 14:57:50', '2020-03-05 14:57:50', NULL, '06de2852-e270-4f9a-a7d9-7afe26cf40bd'),
(31, NULL, 23, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 15:00:34', '2020-03-05 15:00:34', NULL, 'c15d014f-facd-4000-bcde-cc00a8622cff'),
(32, NULL, 24, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 15:03:39', '2020-03-05 15:03:39', NULL, 'ae616f02-4a77-4017-9e20-7e68b06809e2'),
(33, NULL, 25, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-05 15:09:58', '2020-03-05 15:09:58', NULL, '48c9e3d6-8cd8-4478-9dde-d9383825f786'),
(34, NULL, 26, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-06 08:18:12', '2020-03-06 08:18:12', NULL, 'b0361a9c-f75a-4074-b4b3-5248063b21c8'),
(35, NULL, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:21:25', '2020-03-06 14:22:25', NULL, 'ab3dc808-3546-40cc-a7c4-3d9ebab53640'),
(36, NULL, 27, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:21:25', '2020-03-06 14:21:25', NULL, '83f03cf8-4dac-46c6-a441-da340190e4b3'),
(37, NULL, 28, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:21:36', '2020-03-06 14:21:36', NULL, 'a29584ef-86b9-43d6-93d0-dc9fc325c1b8'),
(38, NULL, 29, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:22:24', '2020-03-06 14:22:24', NULL, '7fef15c7-a05b-4f0f-bce8-99d3d2c7f2cc'),
(39, NULL, 30, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:22:25', '2020-03-06 14:22:25', NULL, '77ad702d-2168-4fa5-bd24-bce8e14ffdfe'),
(40, NULL, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:23:15', '2020-03-06 14:23:15', NULL, '07e56cdf-afab-414b-a6f6-7fb9cd399744'),
(41, NULL, 31, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:23:15', '2020-03-06 14:23:15', NULL, '6a2a55da-e2c2-4c68-bfd8-c03c57b8d965'),
(42, NULL, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:25:28', '2020-03-06 14:26:34', NULL, 'f61e7c44-c525-4a26-bc80-16ce93664600'),
(43, NULL, 32, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:25:28', '2020-03-06 14:25:28', NULL, 'd19653a3-3f7e-4426-a7f3-ee283125f4d6'),
(44, NULL, 33, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:26:33', '2020-03-06 14:26:33', NULL, 'd723cc1e-d440-4053-bfa7-40a028ca3405'),
(45, NULL, 34, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:26:34', '2020-03-06 14:26:34', NULL, 'af23dbc2-9e61-40ad-a9d2-9446c3ddec2c'),
(46, NULL, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:31:24', '2020-03-06 14:31:24', NULL, '7b7874be-7fbb-4234-9942-d11e90091630'),
(47, NULL, 35, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:31:24', '2020-03-06 14:31:24', NULL, '7ab1d44a-d651-47c4-ae17-10f49ae8ba72'),
(49, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:42:17', '2020-03-06 14:58:53', NULL, '6733ba2c-248c-4ad4-9894-a8c6d48e367d'),
(50, NULL, 36, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:42:17', '2020-03-06 14:42:17', NULL, '63a528ff-71e0-4416-9a30-f1d539616b84'),
(52, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:42:25', '2020-03-06 15:00:39', NULL, '0a4d228d-15f0-4f9f-9f18-93ce7af6d32a'),
(53, NULL, 37, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:42:25', '2020-03-06 14:42:25', NULL, 'f8ff9500-3c30-44f0-868c-4ecaa184b10c'),
(55, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:43:03', '2020-03-06 15:00:31', NULL, '73ad5343-7df2-45c0-8b75-7d5301e720f1'),
(56, NULL, 38, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:43:03', '2020-03-06 14:43:03', NULL, '061ddd9d-796e-4965-8d0f-2feee2258dcf'),
(57, NULL, 39, 3, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:58:16', '2020-03-06 14:58:16', NULL, 'b02f8936-a172-477d-b1b8-47570ea29f1f'),
(58, NULL, 40, 3, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:58:36', '2020-03-06 14:58:36', NULL, '051d59ae-330e-4d5e-8e46-099eb784cb9f'),
(59, NULL, 41, 3, 'craft\\elements\\Entry', 1, 0, '2020-03-06 14:58:53', '2020-03-06 14:58:53', NULL, '33563222-2dcb-411b-a572-a0f8afd5da1f'),
(60, NULL, 42, 3, 'craft\\elements\\Entry', 1, 0, '2020-03-06 15:00:11', '2020-03-06 15:00:11', NULL, '3815dae2-9c01-43ca-9d0a-a26fd3b58806'),
(61, NULL, 43, 3, 'craft\\elements\\Entry', 1, 0, '2020-03-06 15:00:31', '2020-03-06 15:00:31', NULL, '40e8fb88-1f0b-400b-bb3c-6c69221c6001'),
(62, NULL, 44, 3, 'craft\\elements\\Entry', 1, 0, '2020-03-06 15:00:39', '2020-03-06 15:00:39', NULL, 'd1553779-fc9b-4795-8ab0-b4b994375040');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2020-02-25 13:38:34', '2020-02-25 13:38:34', 'dba61e60-84ad-4f08-b19e-dc4a7c99bf1d'),
(2, 2, 1, 'home', '__home__', 1, '2020-02-25 14:35:20', '2020-02-25 14:35:20', 'efda6ab0-a646-4a69-b6de-a5def543d93f'),
(3, 3, 1, 'home', '__home__', 1, '2020-02-25 14:35:20', '2020-02-25 14:35:20', '218cdd75-f618-4f82-b57b-e86e08af24db'),
(4, 4, 1, 'home', '__home__', 1, '2020-02-25 14:36:25', '2020-02-25 14:36:25', 'eb9fee23-46cd-4cbf-8633-90f2f22d1c41'),
(5, 5, 1, 'home', '__home__', 1, '2020-02-25 14:45:02', '2020-02-25 14:45:02', 'bfea7287-ffa5-4256-8fce-88960859c664'),
(6, 6, 1, 'home', '__home__', 1, '2020-02-25 14:45:03', '2020-02-25 14:45:03', '4cb763bd-ce12-497a-abbf-e49179cc3684'),
(7, 7, 1, 'home', '__home__', 1, '2020-02-25 14:46:01', '2020-02-25 14:46:01', '8d70f273-975c-4cef-bf68-7ecb90c7cead'),
(8, 8, 1, 'home', '__home__', 1, '2020-02-25 14:47:40', '2020-02-25 14:47:40', '5653b96a-19a9-42bf-af3a-5a1859a93df0'),
(9, 9, 1, 'home', '__home__', 1, '2020-02-26 09:43:23', '2020-02-26 09:43:23', '82a7e1bb-43ab-41ce-a407-5a1ca40b8c08'),
(10, 10, 1, 'home', '__home__', 1, '2020-02-26 09:43:23', '2020-02-26 09:43:23', '34ff53f3-f22a-49a4-acf3-02ad4d91eca8'),
(11, 11, 1, '__temp_KjEp1t0O7euWYpJX7jB8zE2VNZYxu214SbaI', 'skills/__temp_KjEp1t0O7euWYpJX7jB8zE2VNZYxu214SbaI', 1, '2020-03-02 15:43:41', '2020-03-02 15:43:41', '944f82f1-2de1-4f83-9b34-3a3ae9ef53aa'),
(13, 13, 1, 'php', 'skills/php', 1, '2020-03-02 15:48:55', '2020-03-02 15:48:55', '8cc25519-7c39-4294-923b-4533e644a657'),
(14, 14, 1, 'php', 'skills/php', 1, '2020-03-02 15:48:55', '2020-03-02 15:48:55', '5265e342-bf2d-42bd-b8d1-55d2a4d5897f'),
(15, 15, 1, 'home', '__home__', 1, '2020-03-05 10:13:09', '2020-03-05 10:13:09', '3d4cb057-5ea6-4034-8404-12a27cd6bfa5'),
(16, 16, 1, NULL, NULL, 1, '2020-03-05 10:13:27', '2020-03-05 10:13:27', '819979ef-0288-45ad-9913-3d23076f6957'),
(17, 17, 1, 'home', '__home__', 1, '2020-03-05 10:13:45', '2020-03-05 10:13:45', 'e600499f-89b0-4932-be81-4e9aeffbf060'),
(18, 18, 1, NULL, NULL, 1, '2020-03-05 10:17:51', '2020-03-05 10:17:51', 'b144adea-4518-4afa-aef4-722d1b610c62'),
(19, 19, 1, NULL, NULL, 1, '2020-03-05 10:25:57', '2020-03-05 10:25:57', '7109c49d-2efe-4b5a-87de-eac943f97aff'),
(20, 20, 1, 'home', '__home__', 1, '2020-03-05 10:26:12', '2020-03-05 10:26:12', '6292576c-71c9-4d0e-a774-ea1229ec191a'),
(21, 21, 1, 'home', '__home__', 1, '2020-03-05 10:29:00', '2020-03-05 10:29:00', 'ae4ecd28-e8a5-4e15-82d7-07188162ba57'),
(22, 22, 1, 'home', '__home__', 1, '2020-03-05 10:36:40', '2020-03-05 10:36:40', '5b45f771-a006-445f-aca6-50e3450b38f4'),
(23, 23, 1, 'home', '__home__', 1, '2020-03-05 14:02:11', '2020-03-05 14:02:11', '88b8c2ed-c880-4973-be17-deccb3c71160'),
(24, 24, 1, 'home', '__home__', 1, '2020-03-05 14:02:34', '2020-03-05 14:02:34', 'b3c26a54-942d-4d29-812e-74f3061675cc'),
(25, 25, 1, 'home', '__home__', 1, '2020-03-05 14:02:55', '2020-03-05 14:02:55', 'f302e7f0-8361-4cae-a87a-90686386c718'),
(26, 26, 1, 'home', '__home__', 1, '2020-03-05 14:52:22', '2020-03-05 14:52:22', '30feb570-2d4f-4a0a-8d1f-2b408810a6c8'),
(27, 27, 1, 'home', '__home__', 1, '2020-03-05 14:52:54', '2020-03-05 14:52:54', '88586b3f-f81c-4c7e-ad67-f06968a7feff'),
(28, 28, 1, 'home', '__home__', 1, '2020-03-05 14:54:11', '2020-03-05 14:54:11', '4865705b-cedb-48c7-87f7-d617e404ed18'),
(29, 29, 1, 'home', '__home__', 1, '2020-03-05 14:54:32', '2020-03-05 14:54:32', '397eb296-603d-4d61-aadd-efabaf804a9c'),
(30, 30, 1, 'home', '__home__', 1, '2020-03-05 14:57:50', '2020-03-05 14:57:50', '2776557d-202c-492b-88e9-820609bf449c'),
(31, 31, 1, 'home', '__home__', 1, '2020-03-05 15:00:34', '2020-03-05 15:00:34', '9fddf2ab-06d3-4841-8c31-203672cb2d41'),
(32, 32, 1, 'home', '__home__', 1, '2020-03-05 15:03:39', '2020-03-05 15:03:39', '4bb999e0-6239-4cf8-9cd3-94180ce6f557'),
(33, 33, 1, 'home', '__home__', 1, '2020-03-05 15:09:58', '2020-03-05 15:09:58', '0e01c325-2bc6-456c-949f-e4452641cd00'),
(34, 34, 1, 'home', '__home__', 1, '2020-03-06 08:18:12', '2020-03-06 08:18:12', '36fb5067-c6cc-4c7d-b671-ea536a7c82f6'),
(35, 35, 1, 'aboutme', 'aboutme', 1, '2020-03-06 14:21:25', '2020-03-06 14:22:24', '3b54feae-ff77-47d6-a2f3-a9d75445f01e'),
(36, 36, 1, 'aboutme', 'about', 1, '2020-03-06 14:21:25', '2020-03-06 14:21:25', 'fa6f560a-e399-479a-aa80-d84109c1251b'),
(37, 37, 1, 'aboutme', 'about', 1, '2020-03-06 14:21:36', '2020-03-06 14:21:36', 'ed57b9f6-7a15-4954-b729-60bcb221619a'),
(38, 38, 1, 'aboutme', 'aboutme', 1, '2020-03-06 14:22:25', '2020-03-06 14:22:25', '90109c11-62d6-428d-9349-91efc3734672'),
(39, 39, 1, 'aboutme', 'aboutme', 1, '2020-03-06 14:22:25', '2020-03-06 14:22:25', '90157c10-27f0-44b5-b41b-f477114e507f'),
(40, 40, 1, 'kontakt', 'kontakt', 1, '2020-03-06 14:23:15', '2020-03-06 14:23:15', 'cf81815e-8485-4c29-998e-c39a03c2694a'),
(41, 41, 1, 'kontakt', 'kontakt', 1, '2020-03-06 14:23:15', '2020-03-06 14:23:15', '30f08084-3afa-4014-b205-5ce2ed2582b8'),
(42, 42, 1, 'lebenslauf', 'cv', 1, '2020-03-06 14:25:28', '2020-03-06 14:26:34', '6dcbddf9-740d-4d1a-b6ad-f11d9f8f60f7'),
(43, 43, 1, 'lebenslauf', 'lebenslauf', 1, '2020-03-06 14:25:28', '2020-03-06 14:25:28', 'd08eddc0-934e-4e74-adc2-a9d32c2f074e'),
(44, 44, 1, 'lebenslauf', 'cv', 1, '2020-03-06 14:26:34', '2020-03-06 14:26:34', 'fb7183d7-bc05-4dbd-9e55-6a05fbd90472'),
(45, 45, 1, 'lebenslauf', 'cv', 1, '2020-03-06 14:26:34', '2020-03-06 14:26:34', '74b63bb3-094c-4189-bf29-89f67d6164b1'),
(46, 46, 1, 'projekte', 'projekte', 1, '2020-03-06 14:31:24', '2020-03-06 14:31:24', 'f0a6cb01-edfa-4389-93f1-af57826711b4'),
(47, 47, 1, 'projekte', 'projekte', 1, '2020-03-06 14:31:24', '2020-03-06 14:31:24', '4cfeda5f-7e46-4eec-99d8-52196f3d47bd'),
(49, 49, 1, 'impressum', 'allgemeines/impressum', 1, '2020-03-06 14:42:17', '2020-03-06 14:42:19', '7dfa51ad-690a-494b-95d7-c3ded8ccbb6e'),
(50, 50, 1, 'impressum', 'allgemeines/impressum', 1, '2020-03-06 14:42:17', '2020-03-06 14:42:17', '18125454-b1ff-4836-adb4-20a1d9cbaa8d'),
(52, 52, 1, 'datenschutz', 'allgemeines/datenschutz', 1, '2020-03-06 14:42:25', '2020-03-06 14:42:27', '67f7045d-76bc-4c32-9283-ded8e2f44f92'),
(53, 53, 1, 'datenschutz', 'allgemeines/datenschutz', 1, '2020-03-06 14:42:25', '2020-03-06 14:42:25', 'da135ed2-7c16-47f2-b57e-48dc383b28f3'),
(55, 55, 1, 'sonstiges', 'allgemeines/sonstiges', 1, '2020-03-06 14:43:03', '2020-03-06 14:43:04', 'f592c81c-2177-416a-a856-64345b29580e'),
(56, 56, 1, 'sonstiges', 'allgemeines/sonstiges', 1, '2020-03-06 14:43:03', '2020-03-06 14:43:03', 'e8c58294-49bc-4092-99e1-16bebc9bb294'),
(57, 57, 1, 'impressum', 'allgemeines/impressum', 1, '2020-03-06 14:58:16', '2020-03-06 14:58:16', '092645b9-716f-4e69-93e4-01eabb413f8e'),
(58, 58, 1, 'impressum', 'allgemeines/impressum', 1, '2020-03-06 14:58:36', '2020-03-06 14:58:36', '4521922b-628a-4098-86c1-7392519f306b'),
(59, 59, 1, 'impressum', 'allgemeines/impressum', 1, '2020-03-06 14:58:53', '2020-03-06 14:58:53', '839665a1-4717-422d-856d-86211ab5ef55'),
(60, 60, 1, 'datenschutz', 'allgemeines/datenschutz', 1, '2020-03-06 15:00:11', '2020-03-06 15:00:11', '5b3ef170-18a7-4b38-b7a9-7cceb95599ec'),
(61, 61, 1, 'sonstiges', 'allgemeines/sonstiges', 1, '2020-03-06 15:00:31', '2020-03-06 15:00:31', 'c73a4f72-a084-42e6-8fe7-0a48f8b36cf4'),
(62, 62, 1, 'datenschutz', 'allgemeines/datenschutz', 1, '2020-03-06 15:00:39', '2020-03-06 15:00:39', '598a5edc-8552-4849-b711-6621f5c2c737');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-02-25 14:35:20', '2020-02-25 14:35:20', '16e1fa80-f2a9-4dbb-a68e-0d4e4bcd7260'),
(3, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-02-25 14:35:20', '2020-02-25 14:35:20', '5abd9c3f-53b2-4b12-9307-f68ee324ab11'),
(4, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-02-25 14:36:25', '2020-02-25 14:36:25', '1fcebee6-a92c-475e-b4e2-73db5dfefac0'),
(5, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-02-25 14:45:02', '2020-02-25 14:45:02', '38c319d8-3247-4a54-98c3-5af742ac0c17'),
(6, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-02-25 14:45:03', '2020-02-25 14:45:03', 'f9a30390-4922-453d-9c12-6b83812aee77'),
(7, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-02-25 14:46:01', '2020-02-25 14:46:01', 'a1cef930-46b0-4404-8aae-e8159c59979a'),
(8, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-02-25 14:47:40', '2020-02-25 14:47:40', '756814c7-7244-4841-b7ef-553ceb3c9e2d'),
(9, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-02-26 09:43:23', '2020-02-26 09:43:23', 'e2233dd2-a731-4d6b-8110-453348202f07'),
(10, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-02-26 09:43:23', '2020-02-26 09:43:23', 'd97115c5-9702-4a8b-9a82-33072f590603'),
(11, 2, NULL, 2, 1, '2020-03-02 15:43:00', NULL, NULL, '2020-03-02 15:43:41', '2020-03-02 15:43:41', 'cc0d1285-86c2-481a-ae31-678d92f4420a'),
(13, 2, NULL, 2, 1, '2020-03-02 15:48:00', NULL, NULL, '2020-03-02 15:48:55', '2020-03-02 15:48:55', '853fac83-8820-4ef4-b9e7-3c3bd44ea901'),
(14, 2, NULL, 2, 1, '2020-03-02 15:48:00', NULL, NULL, '2020-03-02 15:48:55', '2020-03-02 15:48:55', '26cae1d0-324f-4226-9090-299ca573ca2f'),
(15, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 10:13:09', '2020-03-05 10:13:09', '28d9d2b6-9614-4701-9033-024217988f7b'),
(17, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 10:13:45', '2020-03-05 10:13:45', '9426bad5-7738-4b06-b582-93e2bddf0516'),
(20, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 10:26:12', '2020-03-05 10:26:12', 'a022a785-3643-4604-95f8-2255dde81b52'),
(21, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 10:29:00', '2020-03-05 10:29:00', '96f7d96d-31ba-4c39-ac1f-6b52d6632b96'),
(22, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 10:36:40', '2020-03-05 10:36:40', 'cebd4abb-c283-47f9-9cc2-4061d878df88'),
(23, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 14:02:11', '2020-03-05 14:02:11', '30d20967-d454-41bd-a10f-a99e8fc96891'),
(24, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 14:02:34', '2020-03-05 14:02:34', '7c0448e4-74e5-4448-bb56-398053cf2b8b'),
(25, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 14:02:55', '2020-03-05 14:02:55', '5c26691c-3299-455f-9a49-26e5d9e407d7'),
(26, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 14:52:22', '2020-03-05 14:52:22', '6a0682bb-55c1-42ec-ac99-d04230a240d9'),
(27, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 14:52:54', '2020-03-05 14:52:54', '7b068c0d-3f00-4fdc-b6fb-56f82d243c81'),
(28, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 14:54:11', '2020-03-05 14:54:11', '58b3f5ff-08a8-46fa-b68f-128171af550e'),
(29, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 14:54:32', '2020-03-05 14:54:32', 'dcb61f7a-be95-49bb-92a6-68b8bc624279'),
(30, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 14:57:50', '2020-03-05 14:57:50', 'eacce59c-f0bd-4563-b4d9-477c8b3068e9'),
(31, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 15:00:34', '2020-03-05 15:00:34', '34b8fe0f-6b44-401f-ad47-4d1ab0761e3a'),
(32, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 15:03:39', '2020-03-05 15:03:39', '09862957-7467-4140-bea7-9ca186781845'),
(33, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-05 15:09:58', '2020-03-05 15:09:58', 'd57d8fa4-fca8-4f35-9b07-163584ef4e8a'),
(34, 1, NULL, 1, NULL, '2020-02-25 14:35:00', NULL, NULL, '2020-03-06 08:18:12', '2020-03-06 08:18:12', '9778e885-5518-413c-8716-7f1a0b6828ef'),
(35, 3, NULL, 3, NULL, '2020-03-06 14:21:00', NULL, NULL, '2020-03-06 14:21:25', '2020-03-06 14:21:25', '0634a7f1-1c2f-4765-b849-5ed3305dffc9'),
(36, 3, NULL, 3, NULL, '2020-03-06 14:21:00', NULL, NULL, '2020-03-06 14:21:25', '2020-03-06 14:21:25', '6db0b95d-991f-4db3-b008-ca731a799bd9'),
(37, 3, NULL, 3, NULL, '2020-03-06 14:21:00', NULL, NULL, '2020-03-06 14:21:36', '2020-03-06 14:21:36', 'e4721f77-92d8-432f-b1d0-9f15a4cfb708'),
(38, 3, NULL, 3, NULL, '2020-03-06 14:21:00', NULL, NULL, '2020-03-06 14:22:25', '2020-03-06 14:22:25', '875ae2ba-7e6a-46de-9791-5d0daf8880dc'),
(39, 3, NULL, 3, NULL, '2020-03-06 14:21:00', NULL, NULL, '2020-03-06 14:22:25', '2020-03-06 14:22:25', '5f935e1c-3d60-434d-bb7e-1224ef1d67da'),
(40, 4, NULL, 4, NULL, '2020-03-06 14:23:00', NULL, NULL, '2020-03-06 14:23:15', '2020-03-06 14:23:15', '318407d3-f4b0-4295-8748-af867f9193c6'),
(41, 4, NULL, 4, NULL, '2020-03-06 14:23:00', NULL, NULL, '2020-03-06 14:23:15', '2020-03-06 14:23:15', '2a64eea3-f602-4194-b808-e7763e18fe19'),
(42, 5, NULL, 5, NULL, '2020-03-06 14:25:00', NULL, NULL, '2020-03-06 14:25:28', '2020-03-06 14:25:28', 'e8f52d70-3f63-4a6f-9d2f-ac157c3c5423'),
(43, 5, NULL, 5, NULL, '2020-03-06 14:25:00', NULL, NULL, '2020-03-06 14:25:28', '2020-03-06 14:25:28', '0b5ede5f-58c6-41dd-80c1-b57d9e711ea5'),
(44, 5, NULL, 5, NULL, '2020-03-06 14:25:00', NULL, NULL, '2020-03-06 14:26:34', '2020-03-06 14:26:34', '503415c1-14c4-448c-858a-62f9dac048a7'),
(45, 5, NULL, 5, NULL, '2020-03-06 14:25:00', NULL, NULL, '2020-03-06 14:26:34', '2020-03-06 14:26:34', '75b5d8f0-128c-41ad-ab5e-aadc1376e030'),
(46, 6, NULL, 6, NULL, '2020-03-06 14:31:00', NULL, NULL, '2020-03-06 14:31:24', '2020-03-06 14:31:24', 'e0e0a1e7-c656-4d16-ace4-f9eefa4c2dd2'),
(47, 6, NULL, 6, NULL, '2020-03-06 14:31:00', NULL, NULL, '2020-03-06 14:31:24', '2020-03-06 14:31:24', '4f7750ac-c7a8-442d-8b5a-22831659b00e'),
(49, 7, NULL, 7, 1, '2020-03-06 14:42:00', NULL, NULL, '2020-03-06 14:42:17', '2020-03-06 14:42:17', 'a25866a3-f202-45d0-8940-abfd06d6bc7b'),
(50, 7, NULL, 7, 1, '2020-03-06 14:42:00', NULL, NULL, '2020-03-06 14:42:17', '2020-03-06 14:42:17', '9bf5fcf4-ce68-4ca5-b905-ef33f92ca726'),
(52, 7, NULL, 7, 1, '2020-03-06 14:42:00', NULL, NULL, '2020-03-06 14:42:25', '2020-03-06 14:42:25', 'ab1a2079-76e6-4c81-9502-37cf22115677'),
(53, 7, NULL, 7, 1, '2020-03-06 14:42:00', NULL, NULL, '2020-03-06 14:42:25', '2020-03-06 14:42:25', 'e282c62e-05ca-4429-b514-0d81a2dc9aa7'),
(55, 7, NULL, 7, 1, '2020-03-06 14:42:00', NULL, NULL, '2020-03-06 14:43:03', '2020-03-06 14:43:03', 'cc5e5331-ab9f-43ca-871d-9276a875ee92'),
(56, 7, NULL, 7, 1, '2020-03-06 14:42:00', NULL, NULL, '2020-03-06 14:43:03', '2020-03-06 14:43:03', '15d44792-3b06-45d9-b9c2-3ada6c836b4a'),
(57, 7, NULL, 7, 1, '2020-03-06 14:42:00', NULL, NULL, '2020-03-06 14:58:16', '2020-03-06 14:58:16', '9e6538d4-426f-4e60-a6f3-ce28a8134c40'),
(58, 7, NULL, 7, 1, '2020-03-06 14:42:00', NULL, NULL, '2020-03-06 14:58:36', '2020-03-06 14:58:36', 'b23c29b8-c840-4800-82fe-661a41f4e8b8'),
(59, 7, NULL, 7, 1, '2020-03-06 14:42:00', NULL, NULL, '2020-03-06 14:58:53', '2020-03-06 14:58:53', '6c1f5a9b-5e8f-42e0-929b-d5ce60e03113'),
(60, 7, NULL, 7, 1, '2020-03-06 14:42:00', NULL, NULL, '2020-03-06 15:00:11', '2020-03-06 15:00:11', '6e4d41ff-5480-4649-80b5-8c74c237eb45'),
(61, 7, NULL, 7, 1, '2020-03-06 14:42:00', NULL, NULL, '2020-03-06 15:00:31', '2020-03-06 15:00:31', 'b524404a-dd3d-4f2f-bdb3-37ef64d8f47f'),
(62, 7, NULL, 7, 1, '2020-03-06 14:42:00', NULL, NULL, '2020-03-06 15:00:39', '2020-03-06 15:00:39', '0b6459e3-6084-4fdf-82aa-e495bf484294');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 2, 'Home', 'home', 0, '', '{section.name|raw}', 1, '2020-02-25 14:35:20', '2020-03-05 10:13:08', NULL, '8e013b00-3109-4a45-9e9e-3eacf1d2d445'),
(2, 2, 1, 'Skills', 'skills', 1, 'Titel', '', 1, '2020-02-26 09:43:16', '2020-03-02 15:48:22', NULL, '25c059b4-f0bd-4f4d-a672-1d4dc924cd0b'),
(3, 3, NULL, 'About Me', 'aboutme', 0, NULL, '{section.name|raw}', 1, '2020-03-06 14:21:24', '2020-03-06 14:21:36', NULL, 'd938b921-0cd6-489e-ac3d-c5a0e29c0991'),
(4, 4, NULL, 'Kontakt', 'kontakt', 0, NULL, '{section.name|raw}', 1, '2020-03-06 14:23:15', '2020-03-06 14:23:15', NULL, '05c1db0b-f418-4f83-b19f-885601e1d4c6'),
(5, 5, NULL, 'Lebenslauf', 'lebenslauf', 0, NULL, '{section.name|raw}', 1, '2020-03-06 14:25:28', '2020-03-06 14:25:28', NULL, '0d9c0d9f-90fb-4b01-bc53-d7b2ca2a168b'),
(6, 6, NULL, 'Projekte', 'projekte', 0, NULL, '{section.name|raw}', 1, '2020-03-06 14:31:23', '2020-03-06 14:31:23', NULL, '33223768-3f3c-45c0-aa31-c368460021d6'),
(7, 7, 3, 'allgemeines', 'allgemeines', 1, 'Titel', '', 1, '2020-03-06 14:40:35', '2020-03-06 14:57:43', NULL, 'e9bdcf65-b630-4200-8a29-e32b5da0dbe4');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2020-02-25 13:38:34', '2020-02-25 13:38:34', '5398ea63-8bc0-48a5-b9bf-b15fbcdf5903'),
(2, 'skills', '2020-03-02 15:44:53', '2020-03-02 15:44:53', '6149bb01-6637-47de-a54d-477bec950027'),
(3, 'Focal Points', '2020-03-05 14:47:40', '2020-03-05 14:47:40', '67bb141f-9cac-431c-a2c3-be14cbc4b885');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 1, 2, 1, 0, 1, '2020-03-02 15:49:07', '2020-03-02 15:49:07', 'dc628178-4d11-409c-8300-de74642b6f1d'),
(4, 1, 2, 2, 0, 2, '2020-03-02 15:49:07', '2020-03-02 15:49:07', '130e8d44-eb8d-4f8a-9c75-e91ea2b7175a'),
(13, 2, 6, 5, 0, 4, '2020-03-05 14:52:21', '2020-03-05 14:52:21', 'dbe2ed3b-e847-4a0f-b9f5-ed2a6f2e0b66'),
(14, 2, 6, 3, 0, 1, '2020-03-05 14:52:21', '2020-03-05 14:52:21', 'd53c4729-22ce-4e59-abf1-1ecd28378cd3'),
(15, 2, 6, 2, 0, 2, '2020-03-05 14:52:21', '2020-03-05 14:52:21', '4d8268ba-2009-4a7e-8f38-453e22dad933'),
(16, 2, 6, 6, 0, 3, '2020-03-05 14:52:21', '2020-03-05 14:52:21', 'd8964b54-5318-424e-b78a-2a1ae94f7fbd'),
(17, 3, 7, 3, 0, 1, '2020-03-06 14:57:43', '2020-03-06 14:57:43', 'fe4ae879-5577-4623-a96d-bb76aa15c091'),
(18, 3, 7, 2, 0, 2, '2020-03-06 14:57:43', '2020-03-06 14:57:43', '3221a3ef-a7ab-42bd-b34b-dc02a93ad43f');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2020-03-02 15:48:22', '2020-03-02 15:48:22', NULL, 'b92668cf-1d6d-4877-8608-aa12bfc524fc'),
(2, 'craft\\elements\\Entry', '2020-03-05 10:13:08', '2020-03-05 10:13:08', NULL, '9077fae8-87f0-4d5a-b588-4db7b036352e'),
(3, 'craft\\elements\\Entry', '2020-03-06 14:57:43', '2020-03-06 14:57:43', NULL, '0d1c748b-8b92-4786-84c8-9cc6f404798b');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, 'skills', 1, '2020-03-02 15:49:07', '2020-03-02 15:49:07', 'e43231c0-af55-43dd-9e2d-c2da1b8051d7'),
(6, 2, 'Common', 1, '2020-03-05 14:52:21', '2020-03-05 14:52:21', 'be4216dc-dfad-439b-abed-3f93a2555e0e'),
(7, 3, 'Common', 1, '2020-03-06 14:57:43', '2020-03-06 14:57:43', 'e56ea49d-846d-4db0-94ec-f3dce11502a4');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 'percentage', 'percentage', 'global', 'Prozentsatz für den Skill', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}', '2020-02-26 09:48:51', '2020-03-02 15:45:01', '0c016a44-9a27-4b02-92e7-1ba9492a3636'),
(2, 1, 'text', 'text', 'global', 'Allgemeines Textfeld', 1, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false}', '2020-03-02 15:47:58', '2020-03-02 15:47:58', 'aa7bb16b-1e6e-427d-84ff-9645fb717787'),
(3, 1, 'image', 'image', 'global', 'Bild hinzufügen', 1, 'site', NULL, 'craft\\fields\\Assets', '{\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:be894bfb-aeb3-4b4e-aacf-986eb38cd557\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:be894bfb-aeb3-4b4e-aacf-986eb38cd557\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":\"\",\"viewMode\":\"list\"}', '2020-03-05 10:12:50', '2020-03-05 10:16:54', '61a976b4-01f6-4f29-86ab-84ff3f61607c'),
(5, 3, 'fp_width', 'fpWidth', 'global', 'Weite des Focal Points', 1, 'none', NULL, 'craft\\fields\\Number', '{\"decimals\":0,\"defaultValue\":\"50\",\"max\":\"100\",\"min\":\"0\",\"prefix\":\"\",\"size\":null,\"suffix\":\"\"}', '2020-03-05 14:48:16', '2020-03-05 14:48:16', '28b20017-b616-44b1-a8cd-0780f15f7b59'),
(6, 3, 'fp_height', 'fpHeight', 'global', 'Höhe des Focal Points', 1, 'none', NULL, 'craft\\fields\\Number', '{\"decimals\":0,\"defaultValue\":\"50\",\"max\":\"100\",\"min\":\"0\",\"prefix\":\"\",\"size\":null,\"suffix\":\"\"}', '2020-03-05 14:50:50', '2020-03-05 14:51:54', 'd18f873f-bfb3-4d77-95dc-6559da70099f');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configMap` mediumtext DEFAULT NULL,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configMap`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.4.8', '3.4.9', 0, '[]', 'XSMvwWXYv96e', '2020-02-25 13:38:34', '2020-03-06 15:10:29', 'ed48716a-a680-42d5-85d8-5f02bd4ea4ca');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `migrations`
--

INSERT INTO `migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'app', 'Install', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '859b7f78-bef8-4cc8-b88e-4ee15bfac958'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '9ed86099-20ba-40e0-9c7a-7b7a09a24099'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'c222c5bd-df93-4c22-bb8d-e36e9c7fb8c4'),
(4, NULL, 'app', 'm150403_184533_field_version', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '93ac2714-7bcc-4e57-a6d7-dd6003c6bf14'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'dc131e21-d761-495e-bc38-1faa2d511790'),
(6, NULL, 'app', 'm150403_185142_volumes', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'd905d394-562e-4495-bc53-b9e9abf7fdd1'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'aadd3875-0a98-4f4c-80d5-9a5483b57d4a'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'f47d08b4-b019-49e2-bfab-ae0af198e034'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '20e1c365-b65e-43b2-a4c2-8ff2ea3a358f'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'd63254bb-bef9-4415-bd9a-93471052e299'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '31d8073a-d05f-4a78-896f-8e3c2079fb3f'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '7bc60650-9552-4430-a146-6d5084177683'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '456f24c4-9ac0-402c-8a14-165a558248af'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '24d5e053-91b2-4c03-9bec-12158bdb9a84'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '4601d3fd-859f-45a9-a2bf-c02b587dc032'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '452451f2-ea95-4a53-a3ae-e829074fa2ed'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '983f1337-3631-4880-838e-c40eb4e7b09b'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'f68f0b76-2893-4447-ab3d-41859221608e'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '05d00be7-4329-4868-9f5a-0f8802ce350d'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2fc64365-54fd-4dc9-b96f-a9facb99e819'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'd6f27e88-3f74-4cd6-833a-55f26e3b91cf'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '3acaa455-9981-4bc8-acb4-ca2cbfdd6322'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'd7cc6193-f14d-4503-ab08-4ff494dda40d'),
(24, NULL, 'app', 'm160807_144858_sites', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'e98e4107-1571-443b-b940-1be3c49dcff2'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'd142ad9b-dfe8-4930-9b90-fb58ea210e5e'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'c196d79e-5a3d-4e18-a23d-4991c8bfc6a8'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '09121997-97f5-43e4-ab9e-570fa31e7d48'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '4d403537-63c8-44ed-b111-665c1ee20c1a'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '538f9402-0e38-4f5d-a45b-24963dc14653'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'b1adea44-8a5b-4f12-9e81-5c11d6ea8f03'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '098e357a-cfc0-49dd-8245-17b2073235ed'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'f5da1b97-5ccc-4cfc-9737-e4b80dbc16c6'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '1275fef4-06e4-4d06-8ef6-f36089385904'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '28216406-caa3-4e0a-9de2-1c38ed84d0b5'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'fb689943-49ab-437f-bc90-19a94737e969'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '9bf7c90d-1431-408d-8459-e9d15d744965'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '6b6d24f7-4c91-48df-9dcd-db22cf8d4405'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '0601213b-b7c2-44f0-9827-5f1a8b16c17b'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '57e6bb73-5937-4622-bffc-7eee63ac530e'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '30409226-d109-49e0-887f-a6d7c9a55348'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'c7ce5308-cc42-4214-888d-314f38d73465'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '0e0a1569-828d-402e-8ec8-ed9afc787c6f'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '64b12e0a-a547-4bb1-ac1d-da8631b7ceb1'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'cc46780f-65d8-43af-9e7f-e68638ff5777'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '0c42d592-de4c-47db-8b87-c16287d34474'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '897a3efa-00a8-4a67-8ccf-e472f3189005'),
(47, NULL, 'app', 'm170206_142126_system_name', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '90c2e03b-f6ab-4424-b4c6-ad07075eb56d'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '6eb2b853-192f-40f3-94c8-2da23a6cc8a4'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '68ab39ea-d668-44c1-b3ab-072a26d9ac68'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '0089204f-30aa-453e-872a-d3c338270aaa'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'b355740e-6de5-48dc-9c02-a99044ddd563'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '31ee5e61-4b73-408c-b728-a720ccf85c18'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'b53e735f-2cc7-491e-88e8-b1c6709357f8'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '40070f00-3886-436e-a120-254558251db1'),
(55, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '497de7be-2c31-494a-bdf8-a6a37dc825d0'),
(56, NULL, 'app', 'm170612_000000_route_index_shuffle', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '85ae84b9-aea3-4338-bfec-81d289438b7d'),
(57, NULL, 'app', 'm170621_195237_format_plugin_handles', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'e8ed4330-925b-4c2c-b17a-bd203a529519'),
(58, NULL, 'app', 'm170630_161027_deprecation_line_nullable', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '47a549b3-7fc5-4e9b-afa6-fa770a0b2b46'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '1ea088b1-c04f-47af-b588-22674873cbf5'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'e1da1407-a32f-4201-bdea-7af65db020d2'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '4e319f7b-0ac3-421e-89e7-61247a7b9f0d'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '3b2cabc1-7003-4a51-b426-e3dd119a2f3b'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'a9436925-421a-4dfa-a42c-829e5e85dba1'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'a834af69-526a-4f9a-a071-3fe65b564432'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '012e29db-8150-48ff-9ca9-bfc7c814b0aa'),
(66, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'b32cc75f-1893-41f2-a53b-9f196ca424a4'),
(67, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '98bed05e-ed40-4245-be68-2cf575b46ea9'),
(68, NULL, 'app', 'm171011_214115_site_groups', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'e0052054-4c0d-46ba-8df4-c315902abe55'),
(69, NULL, 'app', 'm171012_151440_primary_site', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '21874a20-f5bf-462c-8e6b-a86d6834edba'),
(70, NULL, 'app', 'm171013_142500_transform_interlace', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'b2de74e2-f95c-4a83-8389-8ceceae6014d'),
(71, NULL, 'app', 'm171016_092553_drop_position_select', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '935aff67-8f13-4918-9296-b124fbe62b8c'),
(72, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '00b6673d-42aa-46be-a486-27dfbecf1c2d'),
(73, NULL, 'app', 'm171107_000000_assign_group_permissions', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '0a17451e-e7ac-42d4-a2cd-c73e02f98b6b'),
(74, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '118c0942-6d63-45d8-adf3-c92e003091e7'),
(75, NULL, 'app', 'm171126_105927_disabled_plugins', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '5c7701a8-dea7-4ece-9686-962dcd18cd63'),
(76, NULL, 'app', 'm171130_214407_craftidtokens_table', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'd82d59f2-c3bc-420e-a995-c379f1980ffe'),
(77, NULL, 'app', 'm171202_004225_update_email_settings', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '5b981ed4-ab80-43bb-bbfe-6516e7dd30dc'),
(78, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'c2fa5cab-9df6-430c-a44a-87e76405ce23'),
(79, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '538d6c8a-dd25-409a-81e7-79f7b87567ae'),
(80, NULL, 'app', 'm171218_143135_longtext_query_column', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '75edf2d6-6347-47e3-8949-8585c2192d99'),
(81, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '4867410f-818f-45e1-85f1-8223edf007d0'),
(82, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '1dbfb157-d928-4827-9e1d-646719610407'),
(83, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'b4ee9b19-902a-48ee-95db-6f2da36cb8e4'),
(84, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'b50108df-16db-400b-8511-8807739f1ebc'),
(85, NULL, 'app', 'm180128_235202_set_tag_slugs', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '7b8f0436-3142-4293-b74d-e54a38d175be'),
(86, NULL, 'app', 'm180202_185551_fix_focal_points', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '6bb8e66b-6df7-4fbe-baca-73d44669d32c'),
(87, NULL, 'app', 'm180217_172123_tiny_ints', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '6dc69051-765d-4a52-a56c-6c957dc2c205'),
(88, NULL, 'app', 'm180321_233505_small_ints', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'eaeaf7f8-d611-4ee0-8dc4-5bf102a8d913'),
(89, NULL, 'app', 'm180328_115523_new_license_key_statuses', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '92d0c424-9d67-447b-b572-7da955d388a4'),
(90, NULL, 'app', 'm180404_182320_edition_changes', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '0c506435-3453-4346-b880-10bcab13de80'),
(91, NULL, 'app', 'm180411_102218_fix_db_routes', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '040ab995-491d-422e-a337-a264f270ed45'),
(92, NULL, 'app', 'm180416_205628_resourcepaths_table', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '92b12ec7-e0dc-4c6d-b14d-191c480619d1'),
(93, NULL, 'app', 'm180418_205713_widget_cleanup', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'a5dc66dd-f3b4-40e4-abc2-9f4560458624'),
(94, NULL, 'app', 'm180425_203349_searchable_fields', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'fa472e22-adbd-4fc4-93b3-9c287efb7cd1'),
(95, NULL, 'app', 'm180516_153000_uids_in_field_settings', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '6ee3c0cb-7d4f-4efe-9550-43699a1de8d7'),
(96, NULL, 'app', 'm180517_173000_user_photo_volume_to_uid', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '330ee71a-2875-4313-8548-1ed601f29ad9'),
(97, NULL, 'app', 'm180518_173000_permissions_to_uid', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '69fcce8b-f009-4c2b-9dfe-e8c046d10844'),
(98, NULL, 'app', 'm180520_173000_matrix_context_to_uids', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'fc716dc2-deac-4c0b-9c40-5696108f2168'),
(99, NULL, 'app', 'm180521_172900_project_config_table', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2eaf8e1f-7f2b-4885-bfbc-c14146f455e2'),
(100, NULL, 'app', 'm180521_173000_initial_yml_and_snapshot', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '167657ff-7c4e-4f5c-bd05-dc32d8401f6f'),
(101, NULL, 'app', 'm180731_162030_soft_delete_sites', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '1167bed7-2d5b-438b-896c-afed564004b9'),
(102, NULL, 'app', 'm180810_214427_soft_delete_field_layouts', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '9ca8bbab-9a14-4868-b230-ffd6997cb284'),
(103, NULL, 'app', 'm180810_214439_soft_delete_elements', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '319f36a2-2741-4f49-bb8e-08bb7e53c2ea'),
(104, NULL, 'app', 'm180824_193422_case_sensitivity_fixes', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'ed512d13-b5ad-4ba8-94c8-76fc4064c73a'),
(105, NULL, 'app', 'm180901_151639_fix_matrixcontent_tables', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '6c27ce23-f09a-49e4-91c8-c31172c8e6f3'),
(106, NULL, 'app', 'm180904_112109_permission_changes', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '3be6e590-771a-484f-8a98-b15dbf16968b'),
(107, NULL, 'app', 'm180910_142030_soft_delete_sitegroups', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '14f070b0-0753-432c-adfa-4b3f240d4514'),
(108, NULL, 'app', 'm181011_160000_soft_delete_asset_support', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2a6a8f26-628f-4b10-95c7-d12e1da7dd4e'),
(109, NULL, 'app', 'm181016_183648_set_default_user_settings', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'd6b641a1-2ef3-4156-841e-863fa52a43f6'),
(110, NULL, 'app', 'm181017_225222_system_config_settings', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '56fc4001-88c1-4c4d-8842-0f1eeb477a88'),
(111, NULL, 'app', 'm181018_222343_drop_userpermissions_from_config', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '60b95b9c-e117-41b2-bd48-515a39c57306'),
(112, NULL, 'app', 'm181029_130000_add_transforms_routes_to_config', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '43ff05d6-2237-4de4-af60-744bf7716160'),
(113, NULL, 'app', 'm181112_203955_sequences_table', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '89bf0b16-3796-4aa3-af5d-13673627d39c'),
(114, NULL, 'app', 'm181121_001712_cleanup_field_configs', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '27941f72-6906-4f87-9774-6a9ef19416f6'),
(115, NULL, 'app', 'm181128_193942_fix_project_config', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'e6f48c80-cd24-4704-8646-1ef59c7c6527'),
(116, NULL, 'app', 'm181130_143040_fix_schema_version', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '7471025f-a216-4c14-ad74-88b0bc17758c'),
(117, NULL, 'app', 'm181211_143040_fix_entry_type_uids', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '4d43c038-cf17-4f4e-b981-6b57de1ead69'),
(118, NULL, 'app', 'm181213_102500_config_map_aliases', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'bf31c88d-f14d-4fc1-a569-b2862f0f5684'),
(119, NULL, 'app', 'm181217_153000_fix_structure_uids', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '169d529b-60df-4a56-8066-9310e4ffda82'),
(120, NULL, 'app', 'm190104_152725_store_licensed_plugin_editions', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '21e31d38-39e6-49eb-bf20-b93452a3442f'),
(121, NULL, 'app', 'm190108_110000_cleanup_project_config', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '7d91c77e-356d-49d9-a78d-7e029289cdcd'),
(122, NULL, 'app', 'm190108_113000_asset_field_setting_change', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '8c15f245-7dbe-4b29-a62a-0bcdc8efa62d'),
(123, NULL, 'app', 'm190109_172845_fix_colspan', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '815d3fb6-78c7-4439-ada3-f351ab873cac'),
(124, NULL, 'app', 'm190110_150000_prune_nonexisting_sites', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'd6dad204-2066-40cd-a376-44f3b06450e9'),
(125, NULL, 'app', 'm190110_214819_soft_delete_volumes', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '7f400d49-58e5-4b82-9548-803e7338bb7e'),
(126, NULL, 'app', 'm190112_124737_fix_user_settings', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'b8955bde-aa47-4b17-9c50-ffb8677dd8c1'),
(127, NULL, 'app', 'm190112_131225_fix_field_layouts', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'b4e736e0-8e3b-4171-8357-e2429d03014a'),
(128, NULL, 'app', 'm190112_201010_more_soft_deletes', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '0549465c-edfc-4325-a0ab-981a9f8a17da'),
(129, NULL, 'app', 'm190114_143000_more_asset_field_setting_changes', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'd71d10b3-cd70-4ce3-b599-6d9a38570e0a'),
(130, NULL, 'app', 'm190121_120000_rich_text_config_setting', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '29bb014b-8083-4187-b2f4-e20c62719eed'),
(131, NULL, 'app', 'm190125_191628_fix_email_transport_password', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '80cb55af-d82f-4725-b20c-8ac5ef26befb'),
(132, NULL, 'app', 'm190128_181422_cleanup_volume_folders', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '6883376a-d0e9-4581-bca6-e28b8e1f11c9'),
(133, NULL, 'app', 'm190205_140000_fix_asset_soft_delete_index', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'd99fd17e-906f-4d32-8ae2-4784a0cc2aa0'),
(134, NULL, 'app', 'm190208_140000_reset_project_config_mapping', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '7653ff79-e66c-4f6e-a2cf-852d15a8bb9b'),
(135, NULL, 'app', 'm190218_143000_element_index_settings_uid', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '5ae23fb0-d267-4718-9063-551f0808a31a'),
(136, NULL, 'app', 'm190312_152740_element_revisions', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '165457a2-ce79-4a2b-bde1-989605b69f17'),
(137, NULL, 'app', 'm190327_235137_propagation_method', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '6636a592-e70f-4f64-a080-e28f6be70544'),
(138, NULL, 'app', 'm190401_223843_drop_old_indexes', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'cba99a63-cbcd-4f1d-95cf-ac380d10b4da'),
(139, NULL, 'app', 'm190416_014525_drop_unique_global_indexes', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'a0bbc2aa-7132-4154-9c2c-3ebc6a0b1b99'),
(140, NULL, 'app', 'm190417_085010_add_image_editor_permissions', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '9c6fadf2-2464-43e1-aaf6-f496bb928e73'),
(141, NULL, 'app', 'm190502_122019_store_default_user_group_uid', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '53300b22-da06-49c1-b27b-1a5a1e6da63f'),
(142, NULL, 'app', 'm190504_150349_preview_targets', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '5a87ee43-f8f9-40d5-b363-0612486f321b'),
(143, NULL, 'app', 'm190516_184711_job_progress_label', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'bd95aedc-738d-430b-9781-3f50b1a45b9b'),
(144, NULL, 'app', 'm190523_190303_optional_revision_creators', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '81e1dd03-6383-4ca7-a5ac-0954483d5e0f'),
(145, NULL, 'app', 'm190529_204501_fix_duplicate_uids', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'c6bff91e-0444-48e6-87c3-6135c96ca1a4'),
(146, NULL, 'app', 'm190605_223807_unsaved_drafts', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '64362800-8524-47d8-8b4a-fb2842d464ae'),
(147, NULL, 'app', 'm190607_230042_entry_revision_error_tables', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '11f63e30-11a4-4baa-9d8d-b6b0f43e1019'),
(148, NULL, 'app', 'm190608_033429_drop_elements_uid_idx', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'bb171ebb-fb72-4df7-ae72-6f389660c302'),
(149, NULL, 'app', 'm190617_164400_add_gqlschemas_table', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'c5b6cbb0-b93d-4faa-8829-ae2a64a97a11'),
(150, NULL, 'app', 'm190624_234204_matrix_propagation_method', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'f2dd0187-d51f-4bab-9264-690840c55192'),
(151, NULL, 'app', 'm190711_153020_drop_snapshots', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2c209224-8e37-4515-84b8-a4053ce263ae'),
(152, NULL, 'app', 'm190712_195914_no_draft_revisions', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'cdbed7ed-8ae4-4a07-b715-c702ecb29a20'),
(153, NULL, 'app', 'm190723_140314_fix_preview_targets_column', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'f9b94246-9492-4604-b787-5783e1ee414f'),
(154, NULL, 'app', 'm190820_003519_flush_compiled_templates', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '93e5f9bb-db93-4611-98c1-7778000841d1'),
(155, NULL, 'app', 'm190823_020339_optional_draft_creators', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'adb62a5a-cb34-4b4d-bc6f-005e479b0487'),
(156, NULL, 'app', 'm190913_152146_update_preview_targets', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'd1eb316f-de9f-4024-bf0f-daecc4d2af83'),
(157, NULL, 'app', 'm191107_122000_add_gql_project_config_support', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '6952b363-d55f-491c-8b52-8cf293ddea49'),
(158, NULL, 'app', 'm191204_085100_pack_savable_component_settings', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '014ec463-e556-409c-8038-80191f0796c9'),
(159, NULL, 'app', 'm191206_001148_change_tracking', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '018a2e3c-59cb-46f7-8b43-904c744689ff'),
(160, NULL, 'app', 'm191216_191635_asset_upload_tracking', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '67c24ab5-a346-4b69-923d-bfcbea9a1df7'),
(161, NULL, 'app', 'm191222_002848_peer_asset_permissions', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'aedbecb1-cb7d-4591-9efb-f530c7ec9c46'),
(162, NULL, 'app', 'm200127_172522_queue_channels', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '3554c20a-15cf-4416-b495-d26b218e17c4'),
(163, NULL, 'app', 'm200211_175048_truncate_element_query_cache', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', 'b19dbc4c-48b9-43a4-9247-a5bffc5a794e'),
(164, NULL, 'app', 'm200213_172522_new_elements_index', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-02-25 13:38:35', '9504511c-9d92-40a9-9560-5c48df81ee40'),
(165, 2, 'plugin', 'm180430_204710_remove_old_plugins', '2020-03-02 15:46:50', '2020-03-02 15:46:50', '2020-03-02 15:46:50', '5c42ecfd-6537-4f5a-a33e-99b01408c0d5'),
(166, 2, 'plugin', 'Install', '2020-03-02 15:46:50', '2020-03-02 15:46:50', '2020-03-02 15:46:50', '2cabb81a-8517-41b4-80e5-c4e6296f1fb9'),
(167, 2, 'plugin', 'm190225_003922_split_cleanup_html_settings', '2020-03-02 15:46:50', '2020-03-02 15:46:50', '2020-03-02 15:46:50', 'b168c63e-e065-464e-b783-20d246c1cfaa');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'bloggy', '1.0.0', '1.0.0', 'unknown', NULL, '2020-02-28 13:54:52', '2020-02-28 13:54:52', '2020-03-06 15:10:36', '8f4f0eeb-0567-454d-93d2-648592d2083f'),
(2, 'redactor', '2.6.0.1', '2.3.0', 'unknown', NULL, '2020-03-02 15:46:50', '2020-03-02 15:46:50', '2020-03-06 15:10:36', '651f1dd4-1391-437a-b4e9-5d58058b332d');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1583506663'),
('email.fromEmail', '\"l.schleyer@netzhaut.de\"'),
('email.fromName', '\"Craft 3 Application\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('fieldGroups.5398ea63-8bc0-48a5-b9bf-b15fbcdf5903.name', '\"Common\"'),
('fieldGroups.6149bb01-6637-47de-a54d-477bec950027.name', '\"skills\"'),
('fieldGroups.67bb141f-9cac-431c-a2c3-be14cbc4b885.name', '\"Focal Points\"'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.contentColumnType', '\"text\"'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.fieldGroup', '\"6149bb01-6637-47de-a54d-477bec950027\"'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.handle', '\"percentage\"'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.instructions', '\"Prozentsatz für den Skill\"'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.name', '\"percentage\"'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.searchable', 'true'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.settings.byteLimit', 'null'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.settings.charLimit', 'null'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.settings.code', '\"\"'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.settings.columnType', 'null'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.settings.initialRows', '\"4\"'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.settings.multiline', '\"\"'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.settings.placeholder', '\"\"'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.translationKeyFormat', 'null'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.translationMethod', '\"none\"'),
('fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.contentColumnType', '\"smallint(3)\"'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.fieldGroup', '\"67bb141f-9cac-431c-a2c3-be14cbc4b885\"'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.handle', '\"fpWidth\"'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.instructions', '\"Weite des Focal Points\"'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.name', '\"fp_width\"'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.searchable', 'true'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.settings.decimals', '0'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.settings.defaultValue', '\"50\"'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.settings.max', '\"100\"'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.settings.min', '\"0\"'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.settings.prefix', '\"\"'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.settings.size', 'null'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.settings.suffix', '\"\"'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.translationKeyFormat', 'null'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.translationMethod', '\"none\"'),
('fields.28b20017-b616-44b1-a8cd-0780f15f7b59.type', '\"craft\\\\fields\\\\Number\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.contentColumnType', '\"string\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.fieldGroup', '\"5398ea63-8bc0-48a5-b9bf-b15fbcdf5903\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.handle', '\"image\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.instructions', '\"Bild hinzufügen\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.name', '\"image\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.searchable', 'true'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.allowedKinds', 'null'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.defaultUploadLocationSource', '\"volume:be894bfb-aeb3-4b4e-aacf-986eb38cd557\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.defaultUploadLocationSubpath', '\"\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.limit', '\"\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.localizeRelations', 'false'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.restrictFiles', '\"\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.selectionLabel', '\"\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.showUnpermittedFiles', 'false'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.showUnpermittedVolumes', 'false'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.singleUploadLocationSource', '\"volume:be894bfb-aeb3-4b4e-aacf-986eb38cd557\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.singleUploadLocationSubpath', '\"\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.source', 'null'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.sources', '\"*\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.targetSiteId', 'null'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.useSingleFolder', 'false'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.validateRelatedElements', '\"\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.settings.viewMode', '\"list\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.translationKeyFormat', 'null'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.translationMethod', '\"site\"'),
('fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.contentColumnType', '\"text\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.fieldGroup', '\"5398ea63-8bc0-48a5-b9bf-b15fbcdf5903\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.handle', '\"text\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.instructions', '\"Allgemeines Textfeld\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.name', '\"text\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.searchable', 'true'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.settings.availableTransforms', '\"*\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.settings.availableVolumes', '\"*\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.settings.cleanupHtml', 'true'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.settings.columnType', '\"text\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.settings.purifierConfig', '\"\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.settings.purifyHtml', '\"1\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.settings.redactorConfig', '\"\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.settings.removeEmptyTags', '\"1\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.settings.removeInlineStyles', '\"1\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.settings.removeNbsp', '\"1\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.settings.showUnpermittedFiles', 'false'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.settings.showUnpermittedVolumes', 'false'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.translationKeyFormat', 'null'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.translationMethod', '\"none\"'),
('fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.type', '\"craft\\\\redactor\\\\Field\"'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.contentColumnType', '\"smallint(3)\"'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.fieldGroup', '\"67bb141f-9cac-431c-a2c3-be14cbc4b885\"'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.handle', '\"fpHeight\"'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.instructions', '\"Höhe des Focal Points\"'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.name', '\"fp_height\"'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.searchable', 'true'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.settings.decimals', '0'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.settings.defaultValue', '\"50\"'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.settings.max', '\"100\"'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.settings.min', '\"0\"'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.settings.prefix', '\"\"'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.settings.size', 'null'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.settings.suffix', '\"\"'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.translationKeyFormat', 'null'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.translationMethod', '\"none\"'),
('fields.d18f873f-bfb3-4d77-95dc-6559da70099f.type', '\"craft\\\\fields\\\\Number\"'),
('plugins.bloggy.edition', '\"standard\"'),
('plugins.bloggy.enabled', 'true'),
('plugins.bloggy.schemaVersion', '\"1.0.0\"'),
('plugins.bloggy.settings.bloggyEnabled', '\"1\"'),
('plugins.bloggy.settings.markdownText', '\"\"'),
('plugins.bloggy.settings.notificationEmail', '\"\"'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.enableVersioning', 'true'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.fieldLayouts.9077fae8-87f0-4d5a-b588-4db7b036352e.tabs.0.fields.28b20017-b616-44b1-a8cd-0780f15f7b59.required', 'false'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.fieldLayouts.9077fae8-87f0-4d5a-b588-4db7b036352e.tabs.0.fields.28b20017-b616-44b1-a8cd-0780f15f7b59.sortOrder', '4'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.fieldLayouts.9077fae8-87f0-4d5a-b588-4db7b036352e.tabs.0.fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.required', 'false'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.fieldLayouts.9077fae8-87f0-4d5a-b588-4db7b036352e.tabs.0.fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.sortOrder', '1'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.fieldLayouts.9077fae8-87f0-4d5a-b588-4db7b036352e.tabs.0.fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.required', 'false'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.fieldLayouts.9077fae8-87f0-4d5a-b588-4db7b036352e.tabs.0.fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.sortOrder', '2'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.fieldLayouts.9077fae8-87f0-4d5a-b588-4db7b036352e.tabs.0.fields.d18f873f-bfb3-4d77-95dc-6559da70099f.required', 'false'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.fieldLayouts.9077fae8-87f0-4d5a-b588-4db7b036352e.tabs.0.fields.d18f873f-bfb3-4d77-95dc-6559da70099f.sortOrder', '3'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.fieldLayouts.9077fae8-87f0-4d5a-b588-4db7b036352e.tabs.0.name', '\"Common\"'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.fieldLayouts.9077fae8-87f0-4d5a-b588-4db7b036352e.tabs.0.sortOrder', '1'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.handle', '\"home\"'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.hasTitleField', 'false'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.name', '\"Home\"'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.sortOrder', '1'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.titleFormat', '\"{section.name|raw}\"'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.entryTypes.8e013b00-3109-4a45-9e9e-3eacf1d2d445.titleLabel', '\"\"'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.handle', '\"home\"'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.name', '\"Home\"'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.propagationMethod', '\"all\"'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.enabledByDefault', 'true'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.hasUrls', 'true'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.template', '\"home/index\"'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.uriFormat', '\"__home__\"'),
('sections.2ef3bd94-a91b-45a1-8855-c6724033943e.type', '\"single\"'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.enableVersioning', 'true'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.entryTypes.33223768-3f3c-45c0-aa31-c368460021d6.handle', '\"projekte\"'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.entryTypes.33223768-3f3c-45c0-aa31-c368460021d6.hasTitleField', 'false'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.entryTypes.33223768-3f3c-45c0-aa31-c368460021d6.name', '\"Projekte\"'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.entryTypes.33223768-3f3c-45c0-aa31-c368460021d6.sortOrder', '1'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.entryTypes.33223768-3f3c-45c0-aa31-c368460021d6.titleFormat', '\"{section.name|raw}\"'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.entryTypes.33223768-3f3c-45c0-aa31-c368460021d6.titleLabel', 'null'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.handle', '\"projekte\"'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.name', '\"Projekte\"'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.propagationMethod', '\"all\"'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.enabledByDefault', 'true'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.hasUrls', 'true'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.template', '\"projekte/index\"'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.uriFormat', '\"projekte\"'),
('sections.4b1951b7-99bf-4121-9a2e-13044edfc900.type', '\"single\"'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.enableVersioning', 'true'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.entryTypes.e9bdcf65-b630-4200-8a29-e32b5da0dbe4.fieldLayouts.0d1c748b-8b92-4786-84c8-9cc6f404798b.tabs.0.fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.required', 'false'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.entryTypes.e9bdcf65-b630-4200-8a29-e32b5da0dbe4.fieldLayouts.0d1c748b-8b92-4786-84c8-9cc6f404798b.tabs.0.fields.61a976b4-01f6-4f29-86ab-84ff3f61607c.sortOrder', '1'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.entryTypes.e9bdcf65-b630-4200-8a29-e32b5da0dbe4.fieldLayouts.0d1c748b-8b92-4786-84c8-9cc6f404798b.tabs.0.fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.required', 'false'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.entryTypes.e9bdcf65-b630-4200-8a29-e32b5da0dbe4.fieldLayouts.0d1c748b-8b92-4786-84c8-9cc6f404798b.tabs.0.fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.sortOrder', '2'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.entryTypes.e9bdcf65-b630-4200-8a29-e32b5da0dbe4.fieldLayouts.0d1c748b-8b92-4786-84c8-9cc6f404798b.tabs.0.name', '\"Common\"'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.entryTypes.e9bdcf65-b630-4200-8a29-e32b5da0dbe4.fieldLayouts.0d1c748b-8b92-4786-84c8-9cc6f404798b.tabs.0.sortOrder', '1'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.entryTypes.e9bdcf65-b630-4200-8a29-e32b5da0dbe4.handle', '\"allgemeines\"'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.entryTypes.e9bdcf65-b630-4200-8a29-e32b5da0dbe4.hasTitleField', 'true'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.entryTypes.e9bdcf65-b630-4200-8a29-e32b5da0dbe4.name', '\"allgemeines\"'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.entryTypes.e9bdcf65-b630-4200-8a29-e32b5da0dbe4.sortOrder', '1'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.entryTypes.e9bdcf65-b630-4200-8a29-e32b5da0dbe4.titleFormat', '\"\"'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.entryTypes.e9bdcf65-b630-4200-8a29-e32b5da0dbe4.titleLabel', '\"Titel\"'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.handle', '\"allgemeines\"'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.name', '\"allgemeines\"'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.propagationMethod', '\"all\"'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.enabledByDefault', 'true'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.hasUrls', 'true'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.template', '\"singles/index\"'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.uriFormat', '\"allgemeines/{slug}\"'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.structure.maxLevels', 'null'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.structure.uid', '\"efe1a9e6-64ce-4064-a256-928f140e97b6\"'),
('sections.675244b2-d8df-434c-bd64-8fba03d1190f.type', '\"structure\"'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.enableVersioning', 'true'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.entryTypes.25c059b4-f0bd-4f4d-a672-1d4dc924cd0b.fieldLayouts.b92668cf-1d6d-4877-8608-aa12bfc524fc.tabs.0.fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.required', 'false'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.entryTypes.25c059b4-f0bd-4f4d-a672-1d4dc924cd0b.fieldLayouts.b92668cf-1d6d-4877-8608-aa12bfc524fc.tabs.0.fields.0c016a44-9a27-4b02-92e7-1ba9492a3636.sortOrder', '1'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.entryTypes.25c059b4-f0bd-4f4d-a672-1d4dc924cd0b.fieldLayouts.b92668cf-1d6d-4877-8608-aa12bfc524fc.tabs.0.fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.required', 'false'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.entryTypes.25c059b4-f0bd-4f4d-a672-1d4dc924cd0b.fieldLayouts.b92668cf-1d6d-4877-8608-aa12bfc524fc.tabs.0.fields.aa7bb16b-1e6e-427d-84ff-9645fb717787.sortOrder', '2'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.entryTypes.25c059b4-f0bd-4f4d-a672-1d4dc924cd0b.fieldLayouts.b92668cf-1d6d-4877-8608-aa12bfc524fc.tabs.0.name', '\"skills\"'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.entryTypes.25c059b4-f0bd-4f4d-a672-1d4dc924cd0b.fieldLayouts.b92668cf-1d6d-4877-8608-aa12bfc524fc.tabs.0.sortOrder', '1'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.entryTypes.25c059b4-f0bd-4f4d-a672-1d4dc924cd0b.handle', '\"skills\"'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.entryTypes.25c059b4-f0bd-4f4d-a672-1d4dc924cd0b.hasTitleField', 'true'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.entryTypes.25c059b4-f0bd-4f4d-a672-1d4dc924cd0b.name', '\"Skills\"'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.entryTypes.25c059b4-f0bd-4f4d-a672-1d4dc924cd0b.sortOrder', '1'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.entryTypes.25c059b4-f0bd-4f4d-a672-1d4dc924cd0b.titleFormat', '\"\"'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.entryTypes.25c059b4-f0bd-4f4d-a672-1d4dc924cd0b.titleLabel', '\"Titel\"'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.handle', '\"skills\"'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.name', '\"Skills\"'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.propagationMethod', '\"all\"'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.enabledByDefault', 'true'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.hasUrls', 'true'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.template', '\"\"'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.uriFormat', '\"skills/{slug}\"'),
('sections.696c58e1-bc65-4d64-ae28-a61c260c0d33.type', '\"channel\"'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.enableVersioning', 'true'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.entryTypes.0d9c0d9f-90fb-4b01-bc53-d7b2ca2a168b.handle', '\"lebenslauf\"'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.entryTypes.0d9c0d9f-90fb-4b01-bc53-d7b2ca2a168b.hasTitleField', 'false'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.entryTypes.0d9c0d9f-90fb-4b01-bc53-d7b2ca2a168b.name', '\"Lebenslauf\"'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.entryTypes.0d9c0d9f-90fb-4b01-bc53-d7b2ca2a168b.sortOrder', '1'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.entryTypes.0d9c0d9f-90fb-4b01-bc53-d7b2ca2a168b.titleFormat', '\"{section.name|raw}\"'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.entryTypes.0d9c0d9f-90fb-4b01-bc53-d7b2ca2a168b.titleLabel', 'null'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.handle', '\"lebenslauf\"'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.name', '\"Lebenslauf\"'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.propagationMethod', '\"all\"'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.enabledByDefault', 'true'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.hasUrls', 'true'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.template', '\"cv/index\"'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.uriFormat', '\"cv\"'),
('sections.88f9cb4a-6001-4dc4-ae28-04e039ea3f0a.type', '\"single\"'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.enableVersioning', 'true'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.entryTypes.05c1db0b-f418-4f83-b19f-885601e1d4c6.handle', '\"kontakt\"'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.entryTypes.05c1db0b-f418-4f83-b19f-885601e1d4c6.hasTitleField', 'false'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.entryTypes.05c1db0b-f418-4f83-b19f-885601e1d4c6.name', '\"Kontakt\"'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.entryTypes.05c1db0b-f418-4f83-b19f-885601e1d4c6.sortOrder', '1'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.entryTypes.05c1db0b-f418-4f83-b19f-885601e1d4c6.titleFormat', '\"{section.name|raw}\"'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.entryTypes.05c1db0b-f418-4f83-b19f-885601e1d4c6.titleLabel', 'null'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.handle', '\"kontakt\"'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.name', '\"Kontakt\"'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.propagationMethod', '\"all\"'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.enabledByDefault', 'true'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.hasUrls', 'true'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.template', '\"kontakt/index\"'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.uriFormat', '\"kontakt\"'),
('sections.8c8e72bc-51d9-4279-bda7-cf048a5b98c2.type', '\"single\"'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.enableVersioning', 'true'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.entryTypes.d938b921-0cd6-489e-ac3d-c5a0e29c0991.handle', '\"aboutme\"'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.entryTypes.d938b921-0cd6-489e-ac3d-c5a0e29c0991.hasTitleField', 'false'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.entryTypes.d938b921-0cd6-489e-ac3d-c5a0e29c0991.name', '\"About Me\"'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.entryTypes.d938b921-0cd6-489e-ac3d-c5a0e29c0991.sortOrder', '1'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.entryTypes.d938b921-0cd6-489e-ac3d-c5a0e29c0991.titleFormat', '\"{section.name|raw}\"'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.entryTypes.d938b921-0cd6-489e-ac3d-c5a0e29c0991.titleLabel', 'null'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.handle', '\"aboutme\"'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.name', '\"About Me\"'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.propagationMethod', '\"all\"'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.enabledByDefault', 'true'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.hasUrls', 'true'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.template', '\"about/index\"'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.siteSettings.8db6c153-c86a-47a4-9530-5df9b7f323cb.uriFormat', '\"aboutme\"'),
('sections.ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01.type', '\"single\"'),
('siteGroups.cb199a10-6741-4a44-8797-6e8aad6f6488.name', '\"Craft 3 Application\"'),
('sites.8db6c153-c86a-47a4-9530-5df9b7f323cb.baseUrl', '\"http://localhost/apply/craft/web/\"'),
('sites.8db6c153-c86a-47a4-9530-5df9b7f323cb.handle', '\"default\"'),
('sites.8db6c153-c86a-47a4-9530-5df9b7f323cb.hasUrls', 'true'),
('sites.8db6c153-c86a-47a4-9530-5df9b7f323cb.language', '\"ar\"'),
('sites.8db6c153-c86a-47a4-9530-5df9b7f323cb.name', '\"Craft 3 Application\"'),
('sites.8db6c153-c86a-47a4-9530-5df9b7f323cb.primary', 'true'),
('sites.8db6c153-c86a-47a4-9530-5df9b7f323cb.siteGroup', '\"cb199a10-6741-4a44-8797-6e8aad6f6488\"'),
('sites.8db6c153-c86a-47a4-9530-5df9b7f323cb.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"Craft 3 Application\"'),
('system.schemaVersion', '\"3.4.9\"'),
('system.timeZone', '\"Europe/Lisbon\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', '\"\"'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true'),
('volumes.be894bfb-aeb3-4b4e-aacf-986eb38cd557.handle', '\"images\"'),
('volumes.be894bfb-aeb3-4b4e-aacf-986eb38cd557.hasUrls', 'true'),
('volumes.be894bfb-aeb3-4b4e-aacf-986eb38cd557.name', '\"images\"'),
('volumes.be894bfb-aeb3-4b4e-aacf-986eb38cd557.settings.path', '\"C:/xampp/htdocs/apply/craft/web/images\"'),
('volumes.be894bfb-aeb3-4b4e-aacf-986eb38cd557.sortOrder', '1'),
('volumes.be894bfb-aeb3-4b4e-aacf-986eb38cd557.type', '\"craft\\\\volumes\\\\Local\"'),
('volumes.be894bfb-aeb3-4b4e-aacf-986eb38cd557.url', '\"http://localhost/apply/craft/web/images\"');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `relations`
--

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 3, 17, NULL, 16, 1, '2020-03-05 10:13:45', '2020-03-05 10:13:45', 'a44bf1d1-a12b-4db8-861d-66d65337fd91'),
(3, 3, 2, NULL, 19, 1, '2020-03-05 10:26:12', '2020-03-05 10:26:12', '0353296d-b022-4da8-b3e1-79c845b7d5c9'),
(4, 3, 20, NULL, 19, 1, '2020-03-05 10:26:12', '2020-03-05 10:26:12', '9d1b0cbf-e260-428b-8e6a-966e9b6c308b'),
(5, 3, 21, NULL, 19, 1, '2020-03-05 10:29:00', '2020-03-05 10:29:00', '2df05a6a-b4f6-4752-8c32-01518c4c3608'),
(6, 3, 22, NULL, 19, 1, '2020-03-05 10:36:40', '2020-03-05 10:36:40', 'cd98cc86-e336-43bf-8027-fade0d92e92e'),
(7, 3, 23, NULL, 19, 1, '2020-03-05 14:02:11', '2020-03-05 14:02:11', 'de51a566-dbe7-4a41-ab24-5b2f2aca6d33'),
(8, 3, 24, NULL, 19, 1, '2020-03-05 14:02:34', '2020-03-05 14:02:34', '8897cb82-7f63-4e06-94f8-26dc3c4f5ece'),
(9, 3, 25, NULL, 19, 1, '2020-03-05 14:02:55', '2020-03-05 14:02:55', '2fb29f42-b039-409f-899a-e5b157db626a'),
(10, 3, 26, NULL, 19, 1, '2020-03-05 14:52:22', '2020-03-05 14:52:22', '6747b8ba-49c2-4ff1-9612-3120f2c88df3'),
(11, 3, 27, NULL, 19, 1, '2020-03-05 14:52:54', '2020-03-05 14:52:54', '125bb88d-bea0-42c8-80d7-c23bb0436ad1'),
(12, 3, 28, NULL, 19, 1, '2020-03-05 14:54:11', '2020-03-05 14:54:11', '98fa8a0c-4ba7-4a4d-aa32-64a64c033dd1'),
(13, 3, 29, NULL, 19, 1, '2020-03-05 14:54:32', '2020-03-05 14:54:32', '94d09b58-31fa-4bc2-bf1a-fd3ecd9e9ec7'),
(14, 3, 30, NULL, 19, 1, '2020-03-05 14:57:50', '2020-03-05 14:57:50', '38c47922-206f-4516-9e0e-3e7eebbebcc0'),
(15, 3, 31, NULL, 19, 1, '2020-03-05 15:00:34', '2020-03-05 15:00:34', 'c232a112-9cb3-4c45-a682-857157834341'),
(16, 3, 32, NULL, 19, 1, '2020-03-05 15:03:39', '2020-03-05 15:03:39', '4a4bcc55-43d5-4a6e-b96c-0b94025efac4'),
(17, 3, 33, NULL, 19, 1, '2020-03-05 15:09:58', '2020-03-05 15:09:58', 'b6cc1a54-9390-44a9-8b5d-c641474f10ae'),
(18, 3, 34, NULL, 19, 1, '2020-03-06 08:18:12', '2020-03-06 08:18:12', '69faf4d0-7fd7-46e4-b9d2-06ecbb760ed7');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('144963a6', '@app/web/assets/editsection/dist'),
('18dc2c7b', '@app/web/assets/updater/dist'),
('1a03deb7', '@app/web/assets/admintable/dist'),
('1ff694b5', '@lib/element-resize-detector'),
('212168bc', '@app/web/assets/utilities/dist'),
('23f54264', '@lib/datepicker-i18n'),
('24d55694', '@lib/jquery.payment'),
('25f8ce00', '@vendor/craftcms/redactor/lib/redactor'),
('297d0e01', '@bower/jquery/dist'),
('2c40ca1c', '@app/web/assets/plugins/dist'),
('2d200437', '@app/web/assets/plugins/dist'),
('2d28641f', '@app/web/assets/edituser/dist'),
('2fcc7e6a', '@lib/d3'),
('303aa1f2', '@lib/xregexp'),
('36333c2a', '@app/web/assets/recententries/dist'),
('38f2f97c', '@lib/velocity'),
('3a56e578', '@lib/selectize'),
('3e04fe4e', '@app/web/assets/editsection/dist'),
('402f3769', '@app/web/assets/tablesettings/dist'),
('415ddfc0', '@app/web/assets/sites/dist'),
('42c1fa82', '@app/web/assets/fields/dist'),
('46762b15', '@lib/fabric'),
('49055936', '@app/web/assets/utilities/dist'),
('496f5dab', '@lib/velocity'),
('516781e5', '@lib/vue'),
('5330ff2b', '@lib/garnishjs'),
('5548f243', '@lib/jquery.payment'),
('5656ba65', '@app/web/assets/editentry/dist'),
('58a25380', '@craft/redactor/assets/field/dist'),
('58e0aad6', '@bower/jquery/dist'),
('5cbde58d', '@app/web/assets/dashboard/dist'),
('659713d1', '@lib/axios'),
('686d793f', '@app/web/assets/updates/dist'),
('698cf43e', '@lib/jquery-touch-events'),
('6b0afeb7', '@lib/prismjs'),
('6e28c8fc', '@lib/picturefill'),
('7197562b', '@app/web/assets/fields/dist'),
('765b62d9', '@lib/jquery-ui'),
('76c0c902', '@lib/fileupload'),
('76f07865', '@app/web/assets/dashboard/dist'),
('77700123', '@lib/element-resize-detector'),
('7c1b278d', '@app/web/assets/editentry/dist'),
('7c6c60e', '@lib/jquery-ui'),
('800817a4', '@app/web/assets/installer/dist'),
('8034bbd5', '@lib/selectize'),
('81d43410', '@lib/garnishjs'),
('82958ffe', '@app/web/assets/login/dist'),
('82ae3fdb', '@app/web/assets/generalsettings/dist'),
('873fcfde', '@app/web/assets/updater/dist'),
('8897e44', '@app/web/assets/updateswidget/dist'),
('8a58ff5f', '@lib/xregexp'),
('9492e02e', '@lib/fabric'),
('976a9de1', '@app/web/assets/updateswidget/dist'),
('9a987b9f', '@lib/vue'),
('9ed065ea', '@app/web/assets/cp/dist'),
('9faaab10', '@app/web/assets/updates/dist'),
('9fb0abc1', '@app/web/assets/cp/dist'),
('a0f504cd', '@lib/prismjs'),
('a2730e44', '@lib/jquery-touch-events'),
('a4240239', '@lib/fileupload'),
('a5d73286', '@lib/picturefill'),
('a8d81216', '@app/web/assets/login/dist'),
('a9d0df8f', '@app/web/assets/recententries/dist'),
('aef677e', '@lib/d3'),
('b1f89372', '@app/web/assets/generalsettings/dist'),
('b2692396', '@lib/d3'),
('b2d562e3', '@app/web/assets/craftsupport/dist'),
('b3b5acc8', '@app/web/assets/craftsupport/dist'),
('b6be8468', '@app/web/assets/pluginstore/dist'),
('b7de4a43', '@app/web/assets/pluginstore/dist'),
('bda498a3', '@lib/jquery-ui'),
('c1bbcea', '@app/web/assets/cp/dist'),
('c43a03fd', '@lib/timepicker'),
('cca297af', '@lib/fileupload'),
('cce67d97', '@app/web/assets/feed/dist'),
('cd125f8e', '@lib/element-resize-detector'),
('ce7a8551', '@app/web/assets/matrixsettings/dist'),
('d1fc24cd', '@app/web/assets/admintable/dist'),
('d3eeaa93', '@lib/jquery-touch-events'),
('d44a9651', '@lib/picturefill'),
('d6e6ba93', '@app/web/assets/utilities/dist'),
('dd115739', '@lib/axios'),
('dfccd4cc', '@app/web/assets/tablesettings/dist'),
('e282f47b', '@bower/jquery/dist'),
('e43718b9', '@app/web/assets/matrixsettings/dist'),
('e952a186', '@lib/garnishjs'),
('ef2aacee', '@lib/jquery.payment'),
('f111895f', '@lib/datepicker-i18n'),
('f1a91f02', '@lib/selectize'),
('f30d0306', '@lib/velocity'),
('f78e9a9a', '@app/web/assets/updates/dist'),
('f8324e2d', '@lib/axios'),
('fbc55b88', '@lib/xregexp'),
('fc1475b8', '@lib/fabric'),
('fc5f987', '@lib/timepicker'),
('ffb0d13e', '@app/web/assets/feed/dist');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `revisions`
--

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, NULL),
(2, 2, 1, 2, NULL),
(3, 2, 1, 3, NULL),
(4, 2, 1, 4, NULL),
(5, 2, 1, 5, NULL),
(6, 2, 1, 6, NULL),
(7, 2, 1, 7, NULL),
(8, 2, 1, 8, NULL),
(9, 13, 1, 1, NULL),
(10, 2, 1, 9, NULL),
(11, 2, 1, 10, NULL),
(12, 2, 1, 11, NULL),
(13, 2, 1, 12, NULL),
(14, 2, 1, 13, NULL),
(15, 2, 1, 14, NULL),
(16, 2, 1, 15, NULL),
(17, 2, 1, 16, NULL),
(18, 2, 1, 17, NULL),
(19, 2, 1, 18, NULL),
(20, 2, 1, 19, NULL),
(21, 2, 1, 20, NULL),
(22, 2, 1, 21, NULL),
(23, 2, 1, 22, NULL),
(24, 2, 1, 23, NULL),
(25, 2, 1, 24, NULL),
(26, 2, 1, 25, NULL),
(27, 35, 1, 1, NULL),
(28, 35, 1, 2, NULL),
(29, 35, 1, 3, NULL),
(30, 35, 1, 4, NULL),
(31, 40, 1, 1, NULL),
(32, 42, 1, 1, NULL),
(33, 42, 1, 2, NULL),
(34, 42, 1, 3, NULL),
(35, 46, 1, 1, NULL),
(36, 49, 1, 1, NULL),
(37, 52, 1, 1, NULL),
(38, 55, 1, 1, NULL),
(39, 49, 1, 2, NULL),
(40, 49, 1, 3, NULL),
(41, 49, 1, 4, NULL),
(42, 52, 1, 2, NULL),
(43, 55, 1, 2, NULL),
(44, 52, 1, 3, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' subbi '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' l schleyer netzhaut de '),
(1, 'slug', 0, 1, ''),
(2, 'title', 0, 1, ' home '),
(2, 'slug', 0, 1, ' home '),
(13, 'slug', 0, 1, ' php '),
(13, 'title', 0, 1, ' php '),
(13, 'field', 2, 1, ''),
(13, 'field', 1, 1, ''),
(16, 'filename', 0, 1, ' background jpg '),
(16, 'extension', 0, 1, ' jpg '),
(16, 'kind', 0, 1, ' image '),
(16, 'slug', 0, 1, ''),
(16, 'title', 0, 1, ' background '),
(2, 'field', 3, 1, ' register '),
(2, 'field', 2, 1, ' text text text '),
(18, 'kind', 0, 1, ' image '),
(18, 'extension', 0, 1, ' jpg '),
(18, 'filename', 0, 1, ' passat jpg '),
(18, 'slug', 0, 1, ''),
(18, 'title', 0, 1, ' passat '),
(19, 'filename', 0, 1, ' register jpg '),
(19, 'extension', 0, 1, ' jpg '),
(19, 'kind', 0, 1, ' image '),
(19, 'slug', 0, 1, ''),
(19, 'title', 0, 1, ' register '),
(2, 'field', 6, 1, ' 50 '),
(2, 'field', 5, 1, ' 40 '),
(35, 'slug', 0, 1, ' aboutme '),
(35, 'title', 0, 1, ' about me '),
(40, 'title', 0, 1, ' kontakt '),
(40, 'slug', 0, 1, ' kontakt '),
(42, 'title', 0, 1, ' lebenslauf '),
(42, 'slug', 0, 1, ' lebenslauf '),
(46, 'title', 0, 1, ' projekte '),
(46, 'slug', 0, 1, ' projekte '),
(49, 'title', 0, 1, ' impressum '),
(52, 'title', 0, 1, ' datenschutz '),
(55, 'title', 0, 1, ' sonstiges '),
(55, 'slug', 0, 1, ' sonstiges '),
(49, 'field', 2, 1, ' impressum '),
(49, 'slug', 0, 1, ' impressum '),
(52, 'slug', 0, 1, ' datenschutz '),
(55, 'field', 2, 1, ' sonstiges '),
(52, 'field', 2, 1, ' datenschutz ');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Home', 'home', 'single', 1, 'all', NULL, '2020-02-25 14:35:20', '2020-02-26 09:43:22', NULL, '2ef3bd94-a91b-45a1-8855-c6724033943e'),
(2, NULL, 'Skills', 'skills', 'channel', 1, 'all', NULL, '2020-02-26 09:43:16', '2020-02-26 09:43:16', NULL, '696c58e1-bc65-4d64-ae28-a61c260c0d33'),
(3, NULL, 'About Me', 'aboutme', 'single', 1, 'all', NULL, '2020-03-06 14:21:24', '2020-03-06 14:21:36', NULL, 'ead9e0ac-4b6e-4298-a7e1-8a9ba5c54e01'),
(4, NULL, 'Kontakt', 'kontakt', 'single', 1, 'all', NULL, '2020-03-06 14:23:15', '2020-03-06 14:23:15', NULL, '8c8e72bc-51d9-4279-bda7-cf048a5b98c2'),
(5, NULL, 'Lebenslauf', 'lebenslauf', 'single', 1, 'all', NULL, '2020-03-06 14:25:28', '2020-03-06 14:25:28', NULL, '88f9cb4a-6001-4dc4-ae28-04e039ea3f0a'),
(6, NULL, 'Projekte', 'projekte', 'single', 1, 'all', NULL, '2020-03-06 14:31:23', '2020-03-06 14:31:23', NULL, '4b1951b7-99bf-4121-9a2e-13044edfc900'),
(7, 1, 'allgemeines', 'allgemeines', 'structure', 1, 'all', NULL, '2020-03-06 14:40:35', '2020-03-06 14:40:35', NULL, '675244b2-d8df-434c-bd64-8fba03d1190f');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', 'home/index', 1, '2020-02-25 14:35:20', '2020-02-25 14:47:40', 'c0888279-eab7-4318-be97-c2bb88cea639'),
(2, 2, 1, 1, 'skills/{slug}', '', 1, '2020-02-26 09:43:16', '2020-02-26 09:43:16', 'd8622ace-e9fb-4bf0-bc16-ace7087ddc39'),
(3, 3, 1, 1, 'aboutme', 'about/index', 1, '2020-03-06 14:21:24', '2020-03-06 14:22:24', '0a0dc023-0706-43c0-b8d0-246bfdf9269d'),
(4, 4, 1, 1, 'kontakt', 'kontakt/index', 1, '2020-03-06 14:23:15', '2020-03-06 14:23:15', '36458a8e-120f-4525-875e-39700439cd89'),
(5, 5, 1, 1, 'cv', 'cv/index', 1, '2020-03-06 14:25:28', '2020-03-06 14:26:33', 'ce08b8ac-1c79-45e8-9966-99f71df7d7bf'),
(6, 6, 1, 1, 'projekte', 'projekte/index', 1, '2020-03-06 14:31:23', '2020-03-06 14:31:23', '98d52c46-a9f8-4612-8ada-c7aa8e3f2e8e'),
(7, 7, 1, 1, 'allgemeines/{slug}', 'singles/index', 1, '2020-03-06 14:40:35', '2020-03-06 14:40:35', 'a51babf1-72e9-4ddb-822d-da3b4e4bf288');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'izqPku6xbAEyqpf-Y_zZB42M8S3Di5nRZ3rn33uLVuoO4S8Ss8zUUz4Z-mfWvm2ZgmSKdnIuy_mKnd9f88CTEAxrdy2WyJ1qbiu9', '2020-02-25 13:39:14', '2020-02-25 14:46:02', '3af6b9ff-17b1-4090-93aa-b2817379f115'),
(2, 1, '16XxyBbXR3cs6tKAgIrUSgAtt_Y0a0NDm2FrGmpU5c2eBNc9YnoxY1bEHy85zf2fHT2gcwol-xSTS9X0tpd6yp0XaiYVryqGq6I6', '2020-02-25 14:47:31', '2020-02-25 14:47:41', '0a52a42e-cca7-47a4-b00b-b2b3d70ed67b'),
(3, 1, 'hUXfhp8rSrxKkPY2zR0DGI53lxN-MKN7zAB5pjN1ZX0eOExTgYbMr3P93SZeOD1xolIznCqKClLeGGo8vdGBaJkzmUDdE8ZxArVU', '2020-02-25 14:48:42', '2020-02-25 14:48:42', '4f57a17a-5621-46d8-ae05-aa8870ef4f05'),
(4, 1, 'nnJz_1qz92yYmrPTrYMXEVrQQ-4aEWXiSVhee5JqzNh6kaqyUDu9wB-APuuaivK2kJw0DsialewqhAN-0eyIz-LNCnHFqC_F57ZG', '2020-02-25 14:49:28', '2020-02-25 14:49:38', 'f004c008-e19a-4ce2-9a76-95348951c073'),
(5, 1, 'h5FKmny9_5IRK9cLxmG1n50ek-IQXXSOJ1AHcgDwiJIXNC7IpWYNauYPrkLvx7MUL4HOCRDSzNF1bbD5kNT4FE4Rm53DSttdO0uJ', '2020-02-25 14:50:29', '2020-02-25 14:50:29', 'bc446f4f-1980-4c5c-b8e6-a358a04bc679'),
(8, 1, 't977anqLKIbjlVRYGRLBmxI3jLcwI5qVpSYgOiUQCINBO_OGBl_KyAS_w0Ek0G-nn6WNxBsugm7jt9B9zhdg23CFN9GxgTuW2Vw5', '2020-02-28 13:36:19', '2020-02-28 14:59:40', '6049056c-8ff1-4215-a7f9-5351e126a466'),
(9, 1, 'xTolaifC33JvXWlAs7ndd6wr6oeha129DhPfq9EkP2m_5eah2_mpR2VGMc_Lhnya7hVwcspTyFYSLOQgWBoisGNph0ccldVVTdXb', '2020-03-02 15:43:16', '2020-03-02 15:51:07', 'bef9f091-0565-4b3b-95ee-698b444fcfc3'),
(10, 1, 'D7NY04-b1QhXDgjreGPfSt1GPy3xrk__pHAvENBtBCc6bUsu0Xxca5vaAEb8LEI5KzchhzRIlLI-FGzoytk2LPdVctPe3_JsBKY5', '2020-03-05 09:46:38', '2020-03-05 09:46:48', '46902282-5905-482e-b7b2-c00222bf75a9'),
(11, 1, 'Wr_Shiy2lqzLp8hrkG7zvbCu6CHS1ScNhtD3G0zWUxCsKo4FIgGnca-BvDdOWm_DyVgCrwXYz3VX3vL6Qeo2WkZBqzQrecfkKQUd', '2020-03-05 09:47:49', '2020-03-05 09:47:49', '66510fc6-3986-4b06-9e21-778adcd80680'),
(12, 1, 'kT2n1hWiDBfeZAdJKbDWlD9qr0sNE-PaXuT7yBtSQReBmIGRrS-1084nZJ5rZXFynjLObmWeHUtbTPSD_iwgWXdybvVgHIW_V6zX', '2020-03-05 09:48:49', '2020-03-05 09:48:49', 'e26020f8-1eef-4276-bf43-280d8f8e1bf2'),
(13, 1, '9jUxYxIAZ93nfWBzBYISH4qVxCxXkW0CETLpB-HzteyEEpr-9ZW5px66AKBlIwYQ2xk2HrpORiQ__Owro3PCO9mmp3KJ6RIW99kB', '2020-03-05 09:49:49', '2020-03-05 09:49:49', 'b9b8c610-e586-4fb5-ac7b-a0a35af54203'),
(17, 1, '8p46oyMXHN-wsjpu0SHlNGkW8QUOW4JBLrCAhoQcDrRzI3AS6AjIaXiWwMhyic5xvFrYQ5I1rFJWwBxYV31KgL-2meuCiv_9TUHo', '2020-03-06 14:19:42', '2020-03-06 15:10:36', '4c16b9db-0072-4a99-8d1e-1031aac0ab73');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Craft 3 Application', '2020-02-25 13:38:34', '2020-02-25 13:38:34', NULL, 'cb199a10-6741-4a44-8797-6e8aad6f6488');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Craft 3 Application', 'default', 'ar', 1, 'http://localhost/apply/craft/web/', 1, '2020-02-25 13:38:34', '2020-03-06 14:47:42', NULL, '8db6c153-c86a-47a4-9530-5df9b7f323cb');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `structureelements`
--

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, NULL, 1, 1, 26, 0, '2020-03-06 14:42:10', '2020-03-06 15:00:39', '9ca4eade-4b45-41bd-85b3-b113b86119e4'),
(3, 1, 49, 1, 2, 3, 1, '2020-03-06 14:42:17', '2020-03-06 14:42:17', '9d720aaf-e266-4aeb-a985-a9daa37c3ad2'),
(4, 1, 50, 1, 4, 5, 1, '2020-03-06 14:42:17', '2020-03-06 14:42:17', 'acbfab12-7c73-4d85-accf-64878ca492ed'),
(6, 1, 52, 1, 6, 7, 1, '2020-03-06 14:42:25', '2020-03-06 14:42:25', '097679d3-689c-4ed6-860d-9269c7fa14d6'),
(7, 1, 53, 1, 8, 9, 1, '2020-03-06 14:42:25', '2020-03-06 14:42:25', '9b504b6a-4e32-49b1-a533-5a50818bce4f'),
(9, 1, 55, 1, 10, 11, 1, '2020-03-06 14:43:03', '2020-03-06 14:43:03', '7eea45d2-4acc-40d3-a85d-6ee28e61a774'),
(10, 1, 56, 1, 12, 13, 1, '2020-03-06 14:43:03', '2020-03-06 14:43:03', 'd8ec15fe-ca06-42b6-9eac-3e35c83cb1b3'),
(11, 1, 57, 1, 14, 15, 1, '2020-03-06 14:58:16', '2020-03-06 14:58:16', '759f24e5-54b0-49ca-981f-a153aa181e57'),
(12, 1, 58, 1, 16, 17, 1, '2020-03-06 14:58:36', '2020-03-06 14:58:36', '6b20b3d8-55b0-49f7-a5d7-78948777da74'),
(13, 1, 59, 1, 18, 19, 1, '2020-03-06 14:58:53', '2020-03-06 14:58:53', 'bdd09290-7bd0-461f-9cb9-2b687db054b9'),
(14, 1, 60, 1, 20, 21, 1, '2020-03-06 15:00:11', '2020-03-06 15:00:11', '3c7d275b-29bd-4be7-85e4-84c61c1d0c9e'),
(15, 1, 61, 1, 22, 23, 1, '2020-03-06 15:00:31', '2020-03-06 15:00:31', 'bd1b3b96-1dac-4510-a0c0-c866878ed511'),
(16, 1, 62, 1, 24, 25, 1, '2020-03-06 15:00:39', '2020-03-06 15:00:39', '0afd0fc0-44da-4bae-b8e6-858cd8d02eb5');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `structures`
--

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, '2020-03-06 14:40:35', '2020-03-06 14:40:35', NULL, 'efe1a9e6-64ce-4064-a256-928f140e97b6');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"DE\"}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Subbi', NULL, NULL, NULL, 'l.schleyer@netzhaut.de', '$2y$13$tkYM9m7PxtJh/H6Ydy1vx.eWF/JNWpAfmSOBR6wQC64P4V44MlPgm', 1, 0, 0, 0, '2020-03-06 14:19:42', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2020-02-25 13:38:35', '2020-02-25 13:38:35', '2020-03-06 14:19:42', 'e73f73a6-39bf-48c6-84bf-7d7a16e8c205');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'images', '', '2020-03-05 10:11:19', '2020-03-05 10:11:19', '1749de1f-3c74-4a07-80c0-d2b87f45532b'),
(2, NULL, NULL, 'Temporäre Quelle', NULL, '2020-03-05 10:13:17', '2020-03-05 10:13:17', '4fd20189-2863-481d-8116-12072d097b6b'),
(3, 2, NULL, 'user_1', 'user_1/', '2020-03-05 10:13:17', '2020-03-05 10:13:17', '3c99eda7-c68d-4b64-a9cf-25288852f768');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `volumes`
--

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'images', 'images', 'craft\\volumes\\Local', 1, 'http://localhost/apply/craft/web/images', '{\"path\":\"C:/xampp/htdocs/apply/craft/web/images\"}', 1, '2020-03-05 10:11:19', '2020-03-05 10:23:22', NULL, 'be894bfb-aeb3-4b4e-aacf-986eb38cd557');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2020-02-25 13:39:14', '2020-02-25 13:39:14', 'd8d2fcc4-7554-4c80-83c6-6eca48c0b22e'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2020-02-25 13:39:14', '2020-02-25 13:39:14', 'c2b366eb-0831-44db-beb4-3fc0e1985c6f'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2020-02-25 13:39:14', '2020-02-25 13:39:14', 'c2055ff1-5eda-48ab-90e0-5caa8bb16c65'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2020-02-25 13:39:14', '2020-02-25 13:39:14', 'ba3960da-4257-4ba8-aac9-a8ac9104d5eb');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indizes für die Tabelle `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  ADD KEY `assets_folderId_idx` (`folderId`),
  ADD KEY `assets_volumeId_idx` (`volumeId`),
  ADD KEY `assets_uploaderId_fk` (`uploaderId`);

--
-- Indizes für die Tabelle `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indizes für die Tabelle `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`);

--
-- Indizes für die Tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_groupId_idx` (`groupId`),
  ADD KEY `categories_parentId_fk` (`parentId`);

--
-- Indizes für die Tabelle `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorygroups_name_idx` (`name`),
  ADD KEY `categorygroups_handle_idx` (`handle`),
  ADD KEY `categorygroups_structureId_idx` (`structureId`),
  ADD KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `categorygroups_dateDeleted_idx` (`dateDeleted`);

--
-- Indizes für die Tabelle `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indizes für die Tabelle `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `changedattributes_siteId_fk` (`siteId`),
  ADD KEY `changedattributes_userId_fk` (`userId`);

--
-- Indizes für die Tabelle `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `changedfields_siteId_fk` (`siteId`),
  ADD KEY `changedfields_fieldId_fk` (`fieldId`),
  ADD KEY `changedfields_userId_fk` (`userId`);

--
-- Indizes für die Tabelle `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `content_siteId_idx` (`siteId`),
  ADD KEY `content_title_idx` (`title`);

--
-- Indizes für die Tabelle `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craftidtokens_userId_fk` (`userId`);

--
-- Indizes für die Tabelle `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indizes für die Tabelle `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drafts_creatorId_fk` (`creatorId`),
  ADD KEY `drafts_sourceId_fk` (`sourceId`);

--
-- Indizes für die Tabelle `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`);

--
-- Indizes für die Tabelle `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `elements_type_idx` (`type`),
  ADD KEY `elements_enabled_idx` (`enabled`),
  ADD KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  ADD KEY `elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  ADD KEY `elements_draftId_fk` (`draftId`),
  ADD KEY `elements_revisionId_fk` (`revisionId`);

--
-- Indizes für die Tabelle `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `elements_sites_siteId_idx` (`siteId`),
  ADD KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `elements_sites_enabled_idx` (`enabled`),
  ADD KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indizes für die Tabelle `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_postDate_idx` (`postDate`),
  ADD KEY `entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `entries_authorId_idx` (`authorId`),
  ADD KEY `entries_sectionId_idx` (`sectionId`),
  ADD KEY `entries_typeId_idx` (`typeId`),
  ADD KEY `entries_parentId_fk` (`parentId`);

--
-- Indizes für die Tabelle `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  ADD KEY `entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `entrytypes_dateDeleted_idx` (`dateDeleted`);

--
-- Indizes für die Tabelle `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldgroups_name_unq_idx` (`name`);

--
-- Indizes für die Tabelle `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indizes für die Tabelle `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `fieldlayouts_type_idx` (`type`);

--
-- Indizes für die Tabelle `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indizes für die Tabelle `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `fields_groupId_idx` (`groupId`),
  ADD KEY `fields_context_idx` (`context`);

--
-- Indizes für die Tabelle `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `globalsets_name_idx` (`name`),
  ADD KEY `globalsets_handle_idx` (`handle`),
  ADD KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  ADD UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  ADD KEY `gqltokens_schemaId_fk` (`schemaId`);

--
-- Indizes für die Tabelle `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `matrixblocks_sortOrder_idx` (`sortOrder`);

--
-- Indizes für die Tabelle `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `migrations_pluginId_idx` (`pluginId`),
  ADD KEY `migrations_type_pluginId_idx` (`type`,`pluginId`);

--
-- Indizes für die Tabelle `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plugins_handle_unq_idx` (`handle`);

--
-- Indizes für die Tabelle `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indizes für die Tabelle `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indizes für die Tabelle `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `relations_sourceId_idx` (`sourceId`),
  ADD KEY `relations_targetId_idx` (`targetId`),
  ADD KEY `relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indizes für die Tabelle `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indizes für die Tabelle `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  ADD KEY `revisions_creatorId_fk` (`creatorId`);

--
-- Indizes für die Tabelle `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `searchindex_keywords_idx` (`keywords`);

--
-- Indizes für die Tabelle `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_handle_idx` (`handle`),
  ADD KEY `sections_name_idx` (`name`),
  ADD KEY `sections_structureId_idx` (`structureId`),
  ADD KEY `sections_dateDeleted_idx` (`dateDeleted`);

--
-- Indizes für die Tabelle `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `sections_sites_siteId_idx` (`siteId`);

--
-- Indizes für die Tabelle `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indizes für die Tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_uid_idx` (`uid`),
  ADD KEY `sessions_token_idx` (`token`),
  ADD KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `sessions_userId_idx` (`userId`);

--
-- Indizes für die Tabelle `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indizes für die Tabelle `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sitegroups_name_idx` (`name`);

--
-- Indizes für die Tabelle `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `sites_handle_idx` (`handle`),
  ADD KEY `sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `sites_groupId_fk` (`groupId`);

--
-- Indizes für die Tabelle `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `structureelements_root_idx` (`root`),
  ADD KEY `structureelements_lft_idx` (`lft`),
  ADD KEY `structureelements_rgt_idx` (`rgt`),
  ADD KEY `structureelements_level_idx` (`level`),
  ADD KEY `structureelements_elementId_idx` (`elementId`);

--
-- Indizes für die Tabelle `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indizes für die Tabelle `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `systemmessages_language_idx` (`language`);

--
-- Indizes für die Tabelle `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taggroups_name_idx` (`name`),
  ADD KEY `taggroups_handle_idx` (`handle`),
  ADD KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_groupId_idx` (`groupId`);

--
-- Indizes für die Tabelle `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `templatecacheelements_elementId_idx` (`elementId`);

--
-- Indizes für die Tabelle `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `templatecachequeries_type_idx` (`type`);

--
-- Indizes für die Tabelle `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `templatecaches_siteId_idx` (`siteId`);

--
-- Indizes für die Tabelle `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unq_idx` (`token`),
  ADD KEY `tokens_expiryDate_idx` (`expiryDate`);

--
-- Indizes für die Tabelle `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `usergroups_name_unq_idx` (`name`);

--
-- Indizes für die Tabelle `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `usergroups_users_userId_idx` (`userId`);

--
-- Indizes für die Tabelle `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_name_unq_idx` (`name`);

--
-- Indizes für die Tabelle `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indizes für die Tabelle `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `userpermissions_users_userId_idx` (`userId`);

--
-- Indizes für die Tabelle `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_uid_idx` (`uid`),
  ADD KEY `users_verificationCode_idx` (`verificationCode`),
  ADD KEY `users_email_idx` (`email`),
  ADD KEY `users_username_idx` (`username`),
  ADD KEY `users_photoId_fk` (`photoId`);

--
-- Indizes für die Tabelle `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `volumefolders_parentId_idx` (`parentId`),
  ADD KEY `volumefolders_volumeId_idx` (`volumeId`);

--
-- Indizes für die Tabelle `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volumes_name_idx` (`name`),
  ADD KEY `volumes_handle_idx` (`handle`),
  ADD KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `volumes_dateDeleted_idx` (`dateDeleted`);

--
-- Indizes für die Tabelle `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT für Tabelle `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT für Tabelle `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT für Tabelle `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT für Tabelle `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT für Tabelle `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT für Tabelle `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT für Tabelle `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
