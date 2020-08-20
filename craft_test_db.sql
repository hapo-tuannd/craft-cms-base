-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2020 at 12:42 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `craft_test_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
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
-- Table structure for table `assets`
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
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(8, 1, 1, 1, 'z1990210790537_4aaca18eb626c4f6dd465de9761a9e90.jpg', 'image', 960, 1280, 183276, NULL, NULL, NULL, '2020-08-20 10:26:34', '2020-08-20 10:26:34', '2020-08-20 10:26:34', 'c5184971-83b4-47bc-9145-ffb8b8390de8'),
(9, 1, 1, 1, 'Screenshot_4.png', 'image', 696, 481, 56508, NULL, NULL, NULL, '2020-08-20 10:27:46', '2020-08-20 10:27:46', '2020-08-20 10:27:46', '515d3c52-24ff-4f46-9c25-248a0c299a1f');

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
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
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
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
-- Table structure for table `categories`
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

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `groupId`, `parentId`, `deletedWithGroup`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(10, 1, NULL, NULL, '2020-08-20 10:28:20', '2020-08-20 10:28:20', '78cbcb67-e1d9-43aa-93af-bf64ae53a27f');

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
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

--
-- Dumping data for table `categorygroups`
--

INSERT INTO `categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 4, 'Blog Categories', 'blogCategories', '2020-08-20 09:56:37', '2020-08-20 09:56:37', NULL, '0688749d-207e-410f-acc9-e5f18bc047ff');

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
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

--
-- Dumping data for table `categorygroups_sites`
--

INSERT INTO `categorygroups_sites` (`id`, `groupId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'blog-categories/{slug}', 'blog/_category', '2020-08-20 09:56:37', '2020-08-20 09:56:37', '93973357-201f-407a-8b08-d69c989d3c9e');

-- --------------------------------------------------------

--
-- Table structure for table `changedattributes`
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
-- Dumping data for table `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 'title', '2020-08-20 08:55:13', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_summary` varchar(1200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_summary`) VALUES
(1, 1, 1, NULL, '2020-08-20 08:17:39', '2020-08-20 08:17:39', '0e1ed0ea-efe1-4493-bd63-579cdbce2d39', NULL),
(2, 2, 1, 'Test header', '2020-08-20 08:28:52', '2020-08-20 08:55:13', 'a849890b-7637-4cb9-a548-2c7522d65c5e', NULL),
(3, 3, 1, 'header', '2020-08-20 08:28:52', '2020-08-20 08:28:52', 'de73ce23-f498-464e-98c8-e0ca7a767663', NULL),
(4, 4, 1, 'header', '2020-08-20 08:54:25', '2020-08-20 08:54:25', 'ba1d8330-1cd2-427c-af66-f2d44a1e93be', NULL),
(5, 5, 1, 'Test header', '2020-08-20 08:55:13', '2020-08-20 08:55:13', '96f6ad43-7525-4524-8f92-3fd641d994a1', NULL),
(6, 6, 1, NULL, '2020-08-20 09:41:58', '2020-08-20 09:41:58', '2c16d013-889b-4406-b702-09326e6be152', NULL),
(7, 7, 1, NULL, '2020-08-20 10:25:38', '2020-08-20 10:25:38', 'ab0298d2-05aa-46fa-8714-68a2fb688d03', NULL),
(8, 8, 1, 'Z1990210790537 4aaca18eb626c4f6dd465de9761a9e90', '2020-08-20 10:26:34', '2020-08-20 10:26:34', '9ebbcc91-611f-4991-965d-77592bdbf506', NULL),
(9, 9, 1, 'Screenshot 4', '2020-08-20 10:27:46', '2020-08-20 10:27:46', '095ad49d-1d0a-4901-93fa-35e55f20b83a', NULL),
(10, 10, 1, 'My Stories', '2020-08-20 10:28:20', '2020-08-20 10:28:20', 'dab2dfd1-4bbc-4f3c-833c-abd365627302', NULL),
(11, 11, 1, NULL, '2020-08-20 10:32:21', '2020-08-20 10:32:21', 'cc05ef17-9b51-468b-8575-5c1f5b0e9ab0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
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
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
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
-- Dumping data for table `drafts`
--

INSERT INTO `drafts` (`id`, `sourceId`, `creatorId`, `name`, `notes`, `trackChanges`, `dateLastMerged`) VALUES
(1, NULL, 1, 'First draft', NULL, 0, NULL),
(2, NULL, 1, 'First draft', NULL, 0, NULL),
(3, NULL, 1, 'First draft', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elementindexsettings`
--

INSERT INTO `elementindexsettings` (`id`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '{\"sources\":{\"singles\":{\"tableAttributes\":{\"1\":\"link\",\"2\":\"section\",\"3\":\"type\",\"4\":\"slug\",\"5\":\"uri\",\"6\":\"postDate\",\"7\":\"expiryDate\",\"8\":\"id\",\"9\":\"uid\",\"10\":\"dateCreated\",\"11\":\"dateUpdated\",\"12\":\"revisionNotes\"}}}}', '2020-08-20 08:55:40', '2020-08-20 08:55:40', '5cf8b236-2be6-40b5-ab5c-05a86d124e69');

-- --------------------------------------------------------

--
-- Table structure for table `elements`
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
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2020-08-20 08:17:39', '2020-08-20 08:17:39', NULL, '0426cdc3-6653-4eaa-b30f-ee8a0b54e367'),
(2, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2020-08-20 08:28:52', '2020-08-20 08:55:12', NULL, 'b4458c53-5109-48e3-a0d6-be0248524cc4'),
(3, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2020-08-20 08:28:52', '2020-08-20 08:28:52', NULL, '94839856-daac-4380-b283-ff1a652d2b25'),
(4, NULL, 2, 1, 'craft\\elements\\Entry', 1, 0, '2020-08-20 08:54:25', '2020-08-20 08:54:25', NULL, '2b4e1a15-de20-4449-b11d-80f1792050e1'),
(5, NULL, 3, 1, 'craft\\elements\\Entry', 1, 0, '2020-08-20 08:55:12', '2020-08-20 08:55:12', NULL, 'aa1b7059-3eb0-46f0-a975-511c5ed68874'),
(6, 1, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-08-20 09:41:58', '2020-08-20 09:41:58', NULL, '3ec71d93-9453-4ea1-9800-0b29040c44b8'),
(7, 2, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-08-20 10:25:38', '2020-08-20 10:25:38', NULL, 'e8527a87-6729-4fa5-bfe2-e1e169adc1c2'),
(8, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2020-08-20 10:26:34', '2020-08-20 10:26:34', NULL, '5f101f67-625e-487b-950e-4760a246c853'),
(9, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2020-08-20 10:27:46', '2020-08-20 10:27:46', NULL, 'fc6020b8-d60a-46be-9bca-6165153444f8'),
(10, NULL, NULL, 4, 'craft\\elements\\Category', 1, 0, '2020-08-20 10:28:20', '2020-08-20 10:28:20', NULL, 'a91473fe-b1fc-45c3-9f50-319afd400177'),
(11, 3, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-08-20 10:32:21', '2020-08-20 10:32:21', NULL, 'aca69f32-2b06-401f-9464-d2a327fffbbf');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
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
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2020-08-20 08:17:39', '2020-08-20 08:17:39', 'c2a95911-8c9c-4795-b844-de000f5a29bf'),
(2, 2, 1, 'header', NULL, 1, '2020-08-20 08:28:52', '2020-08-20 08:28:52', 'fd2bbbd5-0e97-4c1e-8b84-294718f7a579'),
(3, 3, 1, 'header', NULL, 1, '2020-08-20 08:28:52', '2020-08-20 08:28:52', '8fbea509-7fd3-438b-b49c-2b5f56771558'),
(4, 4, 1, 'header', NULL, 1, '2020-08-20 08:54:25', '2020-08-20 08:54:25', '2870650f-526c-4c60-a88f-0fc2045cd09c'),
(5, 5, 1, 'header', NULL, 1, '2020-08-20 08:55:13', '2020-08-20 08:55:13', '27b95dc7-c38b-4aba-a260-41283fefdc9a'),
(6, 6, 1, '__temp_vmsqdeydjgffcodtkkpmdoiqlkmwwdtyxebp', 'blog/__temp_vmsqdeydjgffcodtkkpmdoiqlkmwwdtyxebp', 1, '2020-08-20 09:41:58', '2020-08-20 09:41:58', 'ca2c113f-150e-4b5f-9e61-1152c3769194'),
(7, 7, 1, '__temp_vfqjtpvtkicsvqsmdoxdexcqotesypqaodey', 'blog/__temp_vfqjtpvtkicsvqsmdoxdexcqotesypqaodey', 1, '2020-08-20 10:25:38', '2020-08-20 10:25:38', 'de17bb9e-18af-48a1-bc7b-e5bd7847e79e'),
(8, 8, 1, NULL, NULL, 1, '2020-08-20 10:26:34', '2020-08-20 10:26:34', 'c269b83b-a02c-4ba3-bf43-826c87cc2ab3'),
(9, 9, 1, NULL, NULL, 1, '2020-08-20 10:27:46', '2020-08-20 10:27:46', '7da645b3-a5f8-4e25-82be-a8e609246c2d'),
(10, 10, 1, 'my-stories', 'blog-categories/my-stories', 1, '2020-08-20 10:28:20', '2020-08-20 10:28:23', '0e71005e-c7bb-4454-b556-81a7954a5e1b'),
(11, 11, 1, '__temp_htvtklhndqlietopceakuzsthckkbjqdvrzi', 'blog/__temp_htvtklhndqlietopceakuzsthckkbjqdvrzi', 1, '2020-08-20 10:32:21', '2020-08-20 10:32:21', 'aad373ed-cc92-439b-a8af-d3f6d08faae3');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
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
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, 1, NULL, '2020-08-20 08:28:00', NULL, NULL, '2020-08-20 08:28:52', '2020-08-20 08:28:52', '2383b729-db8e-49f3-96d0-0d091a246602'),
(3, 1, NULL, 1, NULL, '2020-08-20 08:28:00', NULL, NULL, '2020-08-20 08:28:52', '2020-08-20 08:28:52', 'c5bf0a9c-7f80-4628-9a7a-30f015e5e159'),
(4, 1, NULL, 1, NULL, '2020-08-20 08:28:00', NULL, NULL, '2020-08-20 08:54:25', '2020-08-20 08:54:25', '2d97e803-db94-45d0-bac6-d8b57697d842'),
(5, 1, NULL, 1, NULL, '2020-08-20 08:28:00', NULL, NULL, '2020-08-20 08:55:13', '2020-08-20 08:55:13', '4354253d-865e-4140-b916-217ceb3df84c'),
(6, 2, NULL, 2, 1, '2020-08-20 09:41:00', NULL, NULL, '2020-08-20 09:41:58', '2020-08-20 09:41:58', 'ce5ba731-ffd6-4424-836c-977eebd3fdec'),
(7, 2, NULL, 2, 1, '2020-08-20 10:25:00', NULL, NULL, '2020-08-20 10:25:38', '2020-08-20 10:25:38', 'fc5e9bf7-be54-4769-968f-fecb047a7db3'),
(11, 2, NULL, 2, 1, '2020-08-20 10:32:00', NULL, NULL, '2020-08-20 10:32:21', '2020-08-20 10:32:21', '5ff90002-5a45-4e82-8771-099c33ef9544');

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'header', 'header', 1, 'site', NULL, NULL, 1, '2020-08-20 08:28:05', '2020-08-20 08:28:05', NULL, '5fd7c188-22bd-42ac-8494-f4f3648277ec'),
(2, 2, 2, 'Blog', 'blog', 1, 'site', NULL, 'Headline', 1, '2020-08-20 09:41:20', '2020-08-20 10:24:34', NULL, '5892e8b3-86b7-43d3-9bd0-35111a701cab');

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2020-08-20 08:17:39', '2020-08-20 08:17:39', '9d6b4120-a312-4d2c-8184-b9b18758ce92'),
(2, 'Blog Post Fields', '2020-08-20 10:03:25', '2020-08-20 10:03:25', 'd32ba746-906b-4d53-aef8-8ea88f43f008');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
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
-- Dumping data for table `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 5, 6, 5, 1, 0, '2020-08-20 10:18:18', '2020-08-20 10:18:18', '2bf3e799-d6d0-4c2b-9e37-487ff8c7877d'),
(2, 6, 7, 6, 0, 0, '2020-08-20 10:18:18', '2020-08-20 10:18:18', '46bbef6b-b772-4b86-b8f1-19ae45608831'),
(3, 2, 8, 1, 0, 1, '2020-08-20 10:24:34', '2020-08-20 10:24:34', '57249042-fd76-4077-9fe2-9dbd42bd11ae'),
(4, 2, 8, 2, 0, 2, '2020-08-20 10:24:34', '2020-08-20 10:24:34', 'd651bd06-618c-49c5-8027-5a922cb30b39'),
(5, 2, 8, 4, 0, 3, '2020-08-20 10:24:34', '2020-08-20 10:24:34', 'b574b637-293c-4188-bcb6-b4b3215abbf8'),
(6, 2, 8, 3, 0, 4, '2020-08-20 10:24:34', '2020-08-20 10:24:34', '853309e6-856c-4b26-b995-1957d95b3739');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
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
-- Dumping data for table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2020-08-20 08:28:05', '2020-08-20 08:28:05', NULL, 'cc2f4bcf-c1a5-44cf-8182-45844ce84936'),
(2, 'craft\\elements\\Entry', '2020-08-20 09:41:20', '2020-08-20 09:41:20', NULL, '3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd'),
(3, 'craft\\elements\\Asset', '2020-08-20 09:53:32', '2020-08-20 09:53:32', NULL, '7873c647-2f00-4afb-826a-26df7567f821'),
(4, 'craft\\elements\\Category', '2020-08-20 09:56:37', '2020-08-20 09:56:37', NULL, '07adb3b8-661a-44ac-9fdb-3707a25bd41f'),
(5, 'craft\\elements\\MatrixBlock', '2020-08-20 10:18:18', '2020-08-20 10:18:18', NULL, 'c5888eef-26b8-464c-b2e5-bae82b63144c'),
(6, 'craft\\elements\\MatrixBlock', '2020-08-20 10:18:18', '2020-08-20 10:18:18', NULL, '0783aa5f-8578-45fb-b5eb-94a66fc46a77');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autofocus\":false,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\Heading\",\"heading\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\Template\",\"template\":\"\",\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\Heading\",\"heading\":null}]', 1, '2020-08-20 08:54:25', '2020-08-20 08:54:25', '15d0b669-f8eb-47b7-984f-858db7529794'),
(4, 3, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autofocus\":false,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100}]', 1, '2020-08-20 09:53:32', '2020-08-20 09:53:32', 'fd34e8ba-14de-401b-93dc-3fbe09385b81'),
(5, 4, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autofocus\":false,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100}]', 1, '2020-08-20 09:56:37', '2020-08-20 09:56:37', '76152975-cac2-48ec-affd-7c6f43d17a0f'),
(6, 5, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"3d6f3570-536d-4fb4-8ec8-7ada705701d5\"}]', 1, '2020-08-20 10:18:18', '2020-08-20 10:18:18', '31b0f0f3-4632-4db4-988e-07b3e2134b87'),
(7, 6, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"fd6a9b0b-c68e-4add-bb6f-217e308b32a0\"}]', 1, '2020-08-20 10:18:18', '2020-08-20 10:18:18', '2c40a925-db18-4d71-8b0a-f32a2ecc94d6'),
(8, 2, 'Post Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autofocus\":false,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0d4d066d-6c5c-41e9-a294-ce3311044fb2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d5b4b62c-6dc3-41da-beaa-a63af6b8f18a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bab1985a-1b08-45aa-b667-ef3a1b3422a8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4f2f6613-af4a-4c26-940c-eb9c46b3df96\"}]', 1, '2020-08-20 10:24:34', '2020-08-20 10:24:34', '1d3e7d8b-e57d-419e-b2b8-d081840c8ce4');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
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
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 'Summary', 'summary', 'global', 'Enter a brief, one or two sentence post summary.', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":300,\"code\":\"\",\"columnType\":null,\"initialRows\":\"1\",\"multiline\":\"1\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-08-20 10:06:27', '2020-08-20 10:06:27', '0d4d066d-6c5c-41e9-a294-ce3311044fb2'),
(2, 2, 'Feature Image', 'featureImage', 'global', 'Feature Image', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:91bf635a-721b-4687-8fc4-f34564d38616\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"Add a feature image \",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:91bf635a-721b-4687-8fc4-f34564d38616\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2020-08-20 10:11:26', '2020-08-20 10:11:26', 'd5b4b62c-6dc3-41da-beaa-a63af6b8f18a'),
(3, 2, 'Post Categories', 'postCategories', 'global', 'Post Categories', 0, 'site', NULL, 'craft\\fields\\Categories', '{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"Add a category\",\"showSiteMenu\":true,\"source\":\"group:0688749d-207e-410f-acc9-e5f18bc047ff\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-08-20 10:12:57', '2020-08-20 10:12:57', '4f2f6613-af4a-4c26-940c-eb9c46b3df96'),
(4, 2, 'Post Content', 'postContent', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_postcontent}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2020-08-20 10:18:17', '2020-08-20 10:18:17', 'bab1985a-1b08-45aa-b667-ef3a1b3422a8'),
(5, NULL, 'Text', 'text', 'matrixBlockType:65a6cc4f-aed2-4776-a543-95c6723d609c', 'Text', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}', '2020-08-20 10:18:18', '2020-08-20 10:18:18', '3d6f3570-536d-4fb4-8ec8-7ada705701d5'),
(6, NULL, 'Image', 'image', 'matrixBlockType:19cbcf73-2c69-465d-89a1-9685edee6be8', '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:91bf635a-721b-4687-8fc4-f34564d38616\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:91bf635a-721b-4687-8fc4-f34564d38616\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":false,\"viewMode\":\"large\"}', '2020-08-20 10:18:18', '2020-08-20 10:18:18', 'fd6a9b0b-c68e-4add-bb6f-217e308b32a0');

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
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
-- Table structure for table `gqlschemas`
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
-- Table structure for table `gqltokens`
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
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.5.5', '3.5.12', 0, 'ocuctiqypzbr', '2020-08-20 08:17:39', '2020-08-20 10:18:18', '12d057f7-2237-40a2-943a-28d883204867');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
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
-- Table structure for table `matrixblocktypes`
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

--
-- Dumping data for table `matrixblocktypes`
--

INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 4, 5, 'Text', 'text', 1, '2020-08-20 10:18:18', '2020-08-20 10:18:18', '65a6cc4f-aed2-4776-a543-95c6723d609c'),
(2, 4, 6, 'Image', 'image', 2, '2020-08-20 10:18:18', '2020-08-20 10:18:18', '19cbcf73-2c69-465d-89a1-9685edee6be8');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_postcontent`
--

CREATE TABLE `matrixcontent_postcontent` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_text_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'de37549c-69ed-40cf-a615-bdf835c743fc'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '9c9df996-16d6-47af-83c8-c9e0dbaeb319'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '19b9507f-5b25-4493-8bda-d513cda306c1'),
(4, 'craft', 'm150403_184533_field_version', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '3b1b6d0e-9037-41a2-9be5-40f72193af93'),
(5, 'craft', 'm150403_184729_type_columns', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '639c0c25-334b-4c5e-9881-6a1d5c905250'),
(6, 'craft', 'm150403_185142_volumes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'df05cb99-a40f-4101-8e24-d775a18cb56d'),
(7, 'craft', 'm150428_231346_userpreferences', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '20f1dabd-055e-4239-9a12-56e8ab6cba62'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '27a3f646-6936-4c13-8192-afdb8de76117'),
(9, 'craft', 'm150617_213829_update_email_settings', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '04320944-ac5d-4c28-8fde-b3406885be3b'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '6eafefe3-608b-4166-bbc1-974b86bfe89f'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'db268a96-dd3b-4d47-bd8d-84494777ddf9'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '11564d3d-ba46-4fd8-a053-1e14090ec6e3'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'a7dce6bb-bd12-4827-bdc0-0162c88b2d22'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '6668de51-c091-4f89-938d-2a30141b7d54'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '92fe7c26-7faf-4e19-b24a-07e04d6fc1ed'),
(16, 'craft', 'm151209_000000_move_logo', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'c30dc823-0ccd-4bde-8c23-3a41c2cf8543'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '7ff5ffec-981b-41c3-87c6-d26314a6e6fd'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '9d0ebae0-3ccb-4746-b0cb-e5c1ecdf7411'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2d8862a6-3af5-46d2-9b82-eee80d6bd1a0'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'e5ea572c-7da4-454e-ae8f-0c3c06a45ea7'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '671f26b1-51bf-4894-9fa3-5fbda54cc967'),
(22, 'craft', 'm160727_194637_column_cleanup', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'fc871434-61eb-48e7-9b0c-27115e38f48c'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '87dc581f-3253-48ab-8d52-8a9a489e2128'),
(24, 'craft', 'm160807_144858_sites', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '4c31576f-f63d-491e-a2ef-4b05cb094acb'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '25c0785e-8032-4397-8f96-93e4c25e9dde'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '12131514-7333-4b92-9fb2-824571c82e8d'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '237f7403-bb0b-438d-bdd1-b8f2ab97cc79'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'd826e279-b9a1-4346-b1e2-10449d04c1f8'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'e159f44d-a201-4789-983a-a1f6f372cd2e'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '47e67839-1679-4205-8642-dde34470a8df'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '7b0ab9b2-9beb-4ace-8cae-588cc4bf7a3c'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'd5614798-bcfc-4627-bb93-6c7fbfe5966e'),
(33, 'craft', 'm161007_130653_update_email_settings', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '8b8eaf66-1a43-42d7-9946-c7c86bb18ae3'),
(34, 'craft', 'm161013_175052_newParentId', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'abf69666-6895-4ef3-b7ab-05a1a0f48990'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2e6a3fc2-83cb-4f18-a301-e0ca811d4b2c'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '14d7cf9b-98f2-412d-808d-505ac485c14f'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'bc14e6e6-3449-469b-9788-59e7ea4b6d39'),
(38, 'craft', 'm161029_124145_email_message_languages', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'b029b545-21d7-4ec6-857a-fd9fc6357c21'),
(39, 'craft', 'm161108_000000_new_version_format', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '618dcbb0-da31-4e40-84d3-ead49adc8f05'),
(40, 'craft', 'm161109_000000_index_shuffle', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '21a4f666-86e6-4a53-a7ec-43fce66face2'),
(41, 'craft', 'm161122_185500_no_craft_app', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '8dfe205c-1ca5-4fe9-9963-7abd37ae3110'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'e77f6616-edf0-4a35-b356-e9bf2e670181'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'e00834e5-f595-4c6c-90d7-7923082c7867'),
(44, 'craft', 'm170114_161144_udates_permission', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '3926351d-f7ff-458f-bae9-2e16b0039960'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '10945ed4-5d0b-4444-bb4f-cab467c6bcf9'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '541c648a-c0d2-416b-b74d-7e24f0ba94d4'),
(47, 'craft', 'm170206_142126_system_name', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '19555346-8b15-4d1d-a610-cb03b81e6555'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'fc2de0ef-4c0a-4a7a-bb7f-4f08a784d5b2'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'c215a6a1-b703-4e28-ad28-63fa8adf8972'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'cfb94324-34ba-4314-a611-7d1e21145720'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '251b28e4-b48a-4604-bb2c-7d8f5d13b08d'),
(52, 'craft', 'm170228_171113_system_messages', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '424eebf5-9030-4c7d-b708-215294dc7f42'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'afc28096-eee1-4284-8530-4d942b8ae1c5'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'd214f5e6-07d4-4010-8ca8-604dbe1f2fee'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '7657d6ba-3084-4634-ac13-2859f70c53d4'),
(56, 'craft', 'm170612_000000_route_index_shuffle', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'a2e9483c-667a-4719-9818-70d6608bde93'),
(57, 'craft', 'm170621_195237_format_plugin_handles', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '12bce5ec-2d32-45c1-a00d-a8ae5f13c1cc'),
(58, 'craft', 'm170630_161027_deprecation_line_nullable', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '561a09b8-53e2-4b05-b092-d8673f765b50'),
(59, 'craft', 'm170630_161028_deprecation_changes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '31b887bb-7d5b-4f9e-ab27-e51f3a3b085c'),
(60, 'craft', 'm170703_181539_plugins_table_tweaks', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '460dff20-e164-40d5-b01e-6ab1e50c0d33'),
(61, 'craft', 'm170704_134916_sites_tables', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'c446e602-de06-4119-b32f-b1778e174176'),
(62, 'craft', 'm170706_183216_rename_sequences', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '4771879c-d42c-4918-8a28-02fe81f17c8c'),
(63, 'craft', 'm170707_094758_delete_compiled_traits', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'c1c40fe2-8416-4f3f-9850-4c49c678f4bb'),
(64, 'craft', 'm170731_190138_drop_asset_packagist', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '3d7ed713-2590-463d-aca8-da20794c1428'),
(65, 'craft', 'm170810_201318_create_queue_table', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '7dbd065b-4ec8-4bb4-9ff8-5a39e52cacc3'),
(66, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '33ef34de-4caa-415d-9350-58ee3949cd92'),
(67, 'craft', 'm170914_204621_asset_cache_shuffle', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'cf5c1edd-2b2b-4a28-939f-6f042049ba7e'),
(68, 'craft', 'm171011_214115_site_groups', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'bd0d88ba-ef7a-4ddd-8016-77955723b4f7'),
(69, 'craft', 'm171012_151440_primary_site', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '05883d31-4c1d-4c5e-8a48-addcc70ca58e'),
(70, 'craft', 'm171013_142500_transform_interlace', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '7ab01bd8-deaf-4a49-b552-b41650798d4e'),
(71, 'craft', 'm171016_092553_drop_position_select', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '9521fcb1-65f3-4a68-a67a-dd781a743e32'),
(72, 'craft', 'm171016_221244_less_strict_translation_method', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '5c2fadbc-12ae-4f97-b4bb-89d48a96a38c'),
(73, 'craft', 'm171107_000000_assign_group_permissions', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2f14e498-60a4-4070-9f60-a1ec01f8dea6'),
(74, 'craft', 'm171117_000001_templatecache_index_tune', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'd9068ac2-bbe5-49e8-a093-a004f9bf7d31'),
(75, 'craft', 'm171126_105927_disabled_plugins', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'd904ca31-2cdd-4cd8-b6e4-7ad5b42594a4'),
(76, 'craft', 'm171130_214407_craftidtokens_table', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '7bd827a6-3961-4fe4-bfad-39487168fc2e'),
(77, 'craft', 'm171202_004225_update_email_settings', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '9249b251-6b2f-4cf4-8448-b4c77f61bf26'),
(78, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'ee1991b1-6d8d-4c3d-873e-2dd958b685af'),
(79, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '466acaf4-e049-41b2-9d2a-aad632029549'),
(80, 'craft', 'm171218_143135_longtext_query_column', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '8345374b-2c98-4257-8314-f91bdf8fd14a'),
(81, 'craft', 'm171231_055546_environment_variables_to_aliases', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '55d6a632-a4ab-44d6-b3e4-e79b47f4d085'),
(82, 'craft', 'm180113_153740_drop_users_archived_column', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '28cb4099-0b49-40e3-9f81-dc202c376c68'),
(83, 'craft', 'm180122_213433_propagate_entries_setting', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'dcc8251f-8fd5-4110-a6c3-f587d53933ca'),
(84, 'craft', 'm180124_230459_fix_propagate_entries_values', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '9e902a46-b45e-4789-84e5-9d4d2d258a67'),
(85, 'craft', 'm180128_235202_set_tag_slugs', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '02da00fb-33ce-4ec7-9b71-a7a2dac09ae8'),
(86, 'craft', 'm180202_185551_fix_focal_points', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'e3dee8f7-029e-4eeb-900f-732b443f561a'),
(87, 'craft', 'm180217_172123_tiny_ints', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'c1f1a1ce-7f33-4094-938d-be4cdfb3a146'),
(88, 'craft', 'm180321_233505_small_ints', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '956a0fad-0e26-4843-9400-d75d285ae296'),
(89, 'craft', 'm180328_115523_new_license_key_statuses', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '8dfe4317-e59a-4e59-80f3-f53d2eb44f6f'),
(90, 'craft', 'm180404_182320_edition_changes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '49fef14c-9f07-4d29-942e-da5255fbba29'),
(91, 'craft', 'm180411_102218_fix_db_routes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'ed4e8a0c-933e-4f98-b1e4-2c665f7945d3'),
(92, 'craft', 'm180416_205628_resourcepaths_table', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'ec608abf-2cbb-4d41-ba4f-fa284509af17'),
(93, 'craft', 'm180418_205713_widget_cleanup', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '8f90fca0-a859-49fd-b9f0-cfb9e37d1c48'),
(94, 'craft', 'm180425_203349_searchable_fields', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'd25ba670-05ee-4bee-bb02-51338cd0bba1'),
(95, 'craft', 'm180516_153000_uids_in_field_settings', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'c7f04582-ad9f-4eed-9edf-baa74ba75fc5'),
(96, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'a6eae58b-6b9d-4388-a758-21f410a51e2d'),
(97, 'craft', 'm180518_173000_permissions_to_uid', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '7f7d8f48-9917-4183-8765-9f389e48d836'),
(98, 'craft', 'm180520_173000_matrix_context_to_uids', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2ed0f601-317e-4571-b229-140bf464211a'),
(99, 'craft', 'm180521_172900_project_config_table', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '418e9639-c96a-4700-beb8-d5d494356584'),
(100, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '5fe66b50-1036-4a06-9530-d9b431f9b63f'),
(101, 'craft', 'm180731_162030_soft_delete_sites', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '604bed59-2dd0-4cc4-a103-8318018f2c03'),
(102, 'craft', 'm180810_214427_soft_delete_field_layouts', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '6b931330-032a-45d3-a4f9-38abcf69a7c1'),
(103, 'craft', 'm180810_214439_soft_delete_elements', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '15c75eb2-b4e4-49e5-8aef-c39db701dd35'),
(104, 'craft', 'm180824_193422_case_sensitivity_fixes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '5a9b5b8f-8968-44e3-b3bf-a532d61dfe37'),
(105, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'fc0649bd-e194-42ce-9aeb-e313162b3ed6'),
(106, 'craft', 'm180904_112109_permission_changes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '68b83775-dc4b-454b-8a64-c66100c7beab'),
(107, 'craft', 'm180910_142030_soft_delete_sitegroups', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'bfb0c3c7-af23-478f-881b-819c1cd7498b'),
(108, 'craft', 'm181011_160000_soft_delete_asset_support', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '3e82bae9-894d-44da-9302-1184bed12874'),
(109, 'craft', 'm181016_183648_set_default_user_settings', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '5d6f343b-5d0e-41a4-b332-97edd66e01f1'),
(110, 'craft', 'm181017_225222_system_config_settings', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '73858e12-9a95-4ea3-abf5-09843b480a49'),
(111, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '53472521-bdce-4960-af3e-4447b74a4fc6'),
(112, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '019a3c01-4900-4af5-8e6d-6a9a2a0631b8'),
(113, 'craft', 'm181112_203955_sequences_table', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'f9759853-5124-4aa7-869e-05ddff820af9'),
(114, 'craft', 'm181121_001712_cleanup_field_configs', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '42751fd4-e072-4dac-934f-a546a1182d26'),
(115, 'craft', 'm181128_193942_fix_project_config', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '15df2acc-b994-405d-91a1-82a7c9b15602'),
(116, 'craft', 'm181130_143040_fix_schema_version', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '0b96c0f7-7d53-40b4-9561-35bf36eb1d06'),
(117, 'craft', 'm181211_143040_fix_entry_type_uids', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'c65303a5-bb26-4424-bb06-52857392c840'),
(118, 'craft', 'm181217_153000_fix_structure_uids', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '62cfffbc-be59-4e5d-894f-e63adbc31f8e'),
(119, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'db60ee04-ff49-4a21-bdb7-55b6b938d5f0'),
(120, 'craft', 'm190108_110000_cleanup_project_config', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '068b9686-1d9c-4d5f-86fc-daadb70b1d2e'),
(121, 'craft', 'm190108_113000_asset_field_setting_change', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'd22da63b-e44f-45c6-847c-d79fc07f4ac0'),
(122, 'craft', 'm190109_172845_fix_colspan', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '01fc570c-ec29-44bb-920a-b4543e4dbf61'),
(123, 'craft', 'm190110_150000_prune_nonexisting_sites', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '8015ac68-f97a-4d30-9598-cc3f20f4abeb'),
(124, 'craft', 'm190110_214819_soft_delete_volumes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '365e1c52-62aa-4223-a426-71066121b460'),
(125, 'craft', 'm190112_124737_fix_user_settings', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '9d95f557-47e8-4a81-a524-b1056c4354b2'),
(126, 'craft', 'm190112_131225_fix_field_layouts', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '8be5b179-77f6-4035-adb1-4413a2e99895'),
(127, 'craft', 'm190112_201010_more_soft_deletes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '5c644b0b-0061-4ec7-b8e2-393c4c56d5dd'),
(128, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '5a94b010-d197-4f28-958b-cf79d1e7b143'),
(129, 'craft', 'm190121_120000_rich_text_config_setting', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '612141d8-7cd5-4734-8fc9-5ed37b390c83'),
(130, 'craft', 'm190125_191628_fix_email_transport_password', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'bbd4521e-7b27-4743-b143-3f71514db791'),
(131, 'craft', 'm190128_181422_cleanup_volume_folders', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'b80fe650-1cba-4f27-94a0-6726e9a101ca'),
(132, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '4958dd68-94fa-4fdf-8dd8-c23b6b3057c2'),
(133, 'craft', 'm190218_143000_element_index_settings_uid', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '3293315f-4be1-4b17-8f88-bc25e6c886d9'),
(134, 'craft', 'm190312_152740_element_revisions', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'e75f32ca-368d-49a4-ad67-1e4fc733af09'),
(135, 'craft', 'm190327_235137_propagation_method', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '3cc45c84-8df9-4f90-8528-afd5044601c5'),
(136, 'craft', 'm190401_223843_drop_old_indexes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'e9a328d7-6245-451d-9af4-649762127291'),
(137, 'craft', 'm190416_014525_drop_unique_global_indexes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'c11c4270-0a36-4530-be03-76a0757c63a5'),
(138, 'craft', 'm190417_085010_add_image_editor_permissions', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '8c66a85f-ada3-4c4e-8be7-9bbcb6cb1648'),
(139, 'craft', 'm190502_122019_store_default_user_group_uid', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '313f0372-8e72-4dbf-a7af-31d9f9ed2e2f'),
(140, 'craft', 'm190504_150349_preview_targets', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '8b1c4c6e-eb67-4f2c-bf4c-719ab152a2e7'),
(141, 'craft', 'm190516_184711_job_progress_label', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'ee9fd84b-fd2a-4cbe-8914-d73d8c584a1a'),
(142, 'craft', 'm190523_190303_optional_revision_creators', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '8af47b3b-64d1-4309-864e-9380ef3c836b'),
(143, 'craft', 'm190529_204501_fix_duplicate_uids', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'e2b67b9e-d6e1-4eda-abad-8f4aecaeaa5c'),
(144, 'craft', 'm190605_223807_unsaved_drafts', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'ca79dce6-8bb8-4b75-9ef5-eb4672568187'),
(145, 'craft', 'm190607_230042_entry_revision_error_tables', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '1a53764b-6c28-4078-8eff-3cf2fe34ca84'),
(146, 'craft', 'm190608_033429_drop_elements_uid_idx', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'f3a7fccd-eb5b-4eaa-9b20-3f8825c33b9f'),
(147, 'craft', 'm190617_164400_add_gqlschemas_table', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '677c6094-579f-42c0-bca9-d5e8f765c492'),
(148, 'craft', 'm190624_234204_matrix_propagation_method', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '8c287c4b-3abc-48e8-98bf-edd0b7482297'),
(149, 'craft', 'm190711_153020_drop_snapshots', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'c049509d-e3b3-4abf-97d3-e7c8321c8c79'),
(150, 'craft', 'm190712_195914_no_draft_revisions', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '3e54a753-2622-423b-872f-43165751d722'),
(151, 'craft', 'm190723_140314_fix_preview_targets_column', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '96f39435-7d11-405b-849d-9255a8fa973e'),
(152, 'craft', 'm190820_003519_flush_compiled_templates', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '90b19ffb-6a74-447c-9ff7-df166740fc26'),
(153, 'craft', 'm190823_020339_optional_draft_creators', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'fecdaae5-c806-4778-ae4b-d78cae208a4f'),
(154, 'craft', 'm190913_152146_update_preview_targets', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '07aff541-600a-4093-9174-11478d4f728a'),
(155, 'craft', 'm191107_122000_add_gql_project_config_support', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '0e2809a3-29ca-43bb-abd1-33ff36f631e6'),
(156, 'craft', 'm191204_085100_pack_savable_component_settings', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '32ae56f3-1d94-46b7-8c88-7b3f1677a52e'),
(157, 'craft', 'm191206_001148_change_tracking', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'd73d347e-c747-45ea-b4a7-5b58e21f9e90'),
(158, 'craft', 'm191216_191635_asset_upload_tracking', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '4acc24a0-cbdc-4b80-a2fa-30ec622cc890'),
(159, 'craft', 'm191222_002848_peer_asset_permissions', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '476974ad-14f3-4e17-b3c3-09cf52f96733'),
(160, 'craft', 'm200127_172522_queue_channels', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '3a58fb38-7d8b-4fe2-81b5-c8f7965b90ac'),
(161, 'craft', 'm200211_175048_truncate_element_query_cache', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '0bfe7fda-dd02-4cf2-8c55-8009714f7de9'),
(162, 'craft', 'm200213_172522_new_elements_index', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'a40324d1-b051-403c-bf8f-05de907a8ffd'),
(163, 'craft', 'm200228_195211_long_deprecation_messages', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'a193ad1a-cb84-4c23-9a75-8eb215937d84'),
(164, 'craft', 'm200306_054652_disabled_sites', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '3cb4fdd5-3e3e-4ee2-bda1-068f3e61e969'),
(165, 'craft', 'm200522_191453_clear_template_caches', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '5bcc770a-3c3e-498b-968f-9adbc440ea48'),
(166, 'craft', 'm200606_231117_migration_tracks', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '5a5d8da0-5c97-43df-ae44-3578335462a7'),
(167, 'craft', 'm200619_215137_title_translation_method', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'ac2ef382-cb74-4a48-922e-069d0e22a5bb'),
(168, 'craft', 'm200620_005028_user_group_descriptions', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'f2f61550-eb4e-4ea3-a10d-ae761caa5d0a'),
(169, 'craft', 'm200620_230205_field_layout_changes', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '6612e474-4f25-4731-b4a7-25f48ada7aec'),
(170, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '4c96d60f-5b52-4ba1-ab4e-32ed5f4bb346'),
(171, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '6ea5e871-27ea-4ed2-afdc-8e455a950a3a'),
(172, 'craft', 'm200630_183000_drop_configmap', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'accb11dd-4c19-41c1-9cdc-4463bf0a1a85'),
(173, 'craft', 'm200715_113400_transform_index_error_flag', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '0c6e6b6f-4fa5-4be1-8596-a511ce220810'),
(174, 'craft', 'm200716_110900_replace_file_asset_permissions', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'c1b415c0-5605-4595-bd17-cbf9ef4ae3e4'),
(175, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', 'b4f50f46-12b5-4c03-8c7f-23bd5b189d5e'),
(176, 'craft', 'm200720_175543_drop_unique_constraints', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:40', '113053c4-40da-4fd7-ac2b-f57dfbbd4996'),
(177, 'plugin:redactor', 'm180430_204710_remove_old_plugins', '2020-08-20 10:00:57', '2020-08-20 10:00:57', '2020-08-20 10:00:57', 'bbca026a-7c69-471d-90a0-c091e1ca13c2'),
(178, 'plugin:redactor', 'Install', '2020-08-20 10:00:57', '2020-08-20 10:00:57', '2020-08-20 10:00:57', '4ced3358-ec71-4014-b28e-a30823e0b72f'),
(179, 'plugin:redactor', 'm190225_003922_split_cleanup_html_settings', '2020-08-20 10:00:57', '2020-08-20 10:00:57', '2020-08-20 10:00:57', '97df539c-b6b5-4782-af37-d17983869d72');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
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
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'redactor', '2.7.1', '2.3.0', 'unknown', NULL, '2020-08-20 10:00:56', '2020-08-20 10:00:56', '2020-08-20 10:02:39', '23e378b1-a1a9-4558-868f-04cfcd515009');

-- --------------------------------------------------------

--
-- Table structure for table `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.autocapitalize', 'true'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.autocomplete', 'false'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.autocorrect', 'true'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.autofocus', 'false'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.class', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.disabled', 'false'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.id', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.instructions', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.label', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.max', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.min', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.name', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.orientation', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.placeholder', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.readonly', 'false'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.requirable', 'false'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.required', 'false'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.size', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.step', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.tip', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.title', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.warning', 'null'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.elements.0.width', '100'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.name', '\"Content\"'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.fieldLayouts.07adb3b8-661a-44ac-9fdb-3707a25bd41f.tabs.0.sortOrder', '1'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.handle', '\"blogCategories\"'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.name', '\"Blog Categories\"'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.siteSettings.331c97fc-d7b2-41c3-9371-7965dee11a7f.hasUrls', 'true'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.siteSettings.331c97fc-d7b2-41c3-9371-7965dee11a7f.template', '\"blog/_category\"'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.siteSettings.331c97fc-d7b2-41c3-9371-7965dee11a7f.uriFormat', '\"blog-categories/{slug}\"'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.structure.maxLevels', '1'),
('categoryGroups.0688749d-207e-410f-acc9-e5f18bc047ff.structure.uid', '\"61b69ee4-dc7e-4f53-ae0f-17fe5534633c\"'),
('dateModified', '1597919074'),
('email.fromEmail', '\"tuannd@haposoft.com\"'),
('email.fromName', '\"Craft\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.autofocus', 'false'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.class', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.disabled', 'false'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.id', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.instructions', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.label', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.max', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.min', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.name', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.orientation', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.readonly', 'false'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.requirable', 'false'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.required', 'false'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.size', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.step', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.tip', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.title', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.warning', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.0.width', '100'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.1.fieldUid', '\"0d4d066d-6c5c-41e9-a294-ce3311044fb2\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.1.instructions', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.1.label', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.1.required', 'false'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.1.tip', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.1.warning', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.1.width', '100'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.2.fieldUid', '\"d5b4b62c-6dc3-41da-beaa-a63af6b8f18a\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.2.instructions', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.2.label', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.2.required', 'false'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.2.tip', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.2.warning', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.2.width', '100'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.3.fieldUid', '\"bab1985a-1b08-45aa-b667-ef3a1b3422a8\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.3.instructions', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.3.label', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.3.required', 'false'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.3.tip', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.3.warning', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.3.width', '100'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.4.fieldUid', '\"4f2f6613-af4a-4c26-940c-eb9c46b3df96\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.4.instructions', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.4.label', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.4.required', 'false'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.4.tip', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.4.warning', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.elements.4.width', '100'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.name', '\"Post Content\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.fieldLayouts.3b0b0668-c262-4b69-9f5c-3bae3dcfa5dd.tabs.0.sortOrder', '1'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.handle', '\"blog\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.hasTitleField', 'true'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.name', '\"Blog\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.section', '\"7324aa92-bc35-4e0b-8bcb-8f17bee832bb\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.sortOrder', '1'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.titleFormat', '\"Headline\"'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.titleTranslationKeyFormat', 'null'),
('entryTypes.5892e8b3-86b7-43d3-9bd0-35111a701cab.titleTranslationMethod', '\"site\"'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.autofocus', 'false'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.class', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.disabled', 'false'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.id', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.instructions', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.label', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.max', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.min', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.name', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.orientation', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.readonly', 'false'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.requirable', 'false'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.required', 'false'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.size', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.step', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.tip', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.title', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.warning', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.0.width', '100'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.1.heading', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\Heading\"'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.2.template', '\"\"'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\Template\"'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.2.width', '100'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.3.heading', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\Heading\"'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.name', '\"Content\"'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.fieldLayouts.cc2f4bcf-c1a5-44cf-8182-45844ce84936.tabs.0.sortOrder', '1'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.handle', '\"header\"'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.hasTitleField', 'true'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.name', '\"header\"'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.section', '\"48c3a575-b126-478e-bee0-03cb4962af93\"'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.sortOrder', '1'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.titleFormat', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.titleTranslationKeyFormat', 'null'),
('entryTypes.5fd7c188-22bd-42ac-8494-f4f3648277ec.titleTranslationMethod', '\"site\"'),
('fieldGroups.9d6b4120-a312-4d2c-8184-b9b18758ce92.name', '\"Common\"'),
('fieldGroups.d32ba746-906b-4d53-aef8-8ea88f43f008.name', '\"Blog Post Fields\"'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.contentColumnType', '\"string(1200)\"'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.fieldGroup', '\"d32ba746-906b-4d53-aef8-8ea88f43f008\"'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.handle', '\"summary\"'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.instructions', '\"Enter a brief, one or two sentence post summary.\"'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.name', '\"Summary\"'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.searchable', 'false'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.settings.byteLimit', 'null'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.settings.charLimit', '300'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.settings.code', '\"\"'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.settings.columnType', 'null'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.settings.initialRows', '\"1\"'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.settings.multiline', '\"1\"'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.settings.placeholder', '\"\"'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.settings.uiMode', '\"normal\"'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.translationKeyFormat', 'null'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.translationMethod', '\"none\"'),
('fields.0d4d066d-6c5c-41e9-a294-ce3311044fb2.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.contentColumnType', '\"string\"'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.fieldGroup', '\"d32ba746-906b-4d53-aef8-8ea88f43f008\"'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.handle', '\"postCategories\"'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.instructions', '\"Post Categories\"'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.name', '\"Post Categories\"'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.searchable', 'false'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.settings.allowLimit', 'false'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.settings.allowMultipleSources', 'false'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.settings.allowSelfRelations', 'false'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.settings.branchLimit', '\"\"'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.settings.limit', 'null'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.settings.localizeRelations', 'false'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.settings.selectionLabel', '\"Add a category\"'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.settings.showSiteMenu', 'true'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.settings.source', '\"group:0688749d-207e-410f-acc9-e5f18bc047ff\"'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.settings.sources', '\"*\"'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.settings.targetSiteId', 'null'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.settings.validateRelatedElements', 'false'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.settings.viewMode', 'null'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.translationKeyFormat', 'null'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.translationMethod', '\"site\"'),
('fields.4f2f6613-af4a-4c26-940c-eb9c46b3df96.type', '\"craft\\\\fields\\\\Categories\"'),
('fields.bab1985a-1b08-45aa-b667-ef3a1b3422a8.contentColumnType', '\"string\"'),
('fields.bab1985a-1b08-45aa-b667-ef3a1b3422a8.fieldGroup', '\"d32ba746-906b-4d53-aef8-8ea88f43f008\"'),
('fields.bab1985a-1b08-45aa-b667-ef3a1b3422a8.handle', '\"postContent\"'),
('fields.bab1985a-1b08-45aa-b667-ef3a1b3422a8.instructions', '\"\"'),
('fields.bab1985a-1b08-45aa-b667-ef3a1b3422a8.name', '\"Post Content\"'),
('fields.bab1985a-1b08-45aa-b667-ef3a1b3422a8.searchable', 'false'),
('fields.bab1985a-1b08-45aa-b667-ef3a1b3422a8.settings.contentTable', '\"{{%matrixcontent_postcontent}}\"'),
('fields.bab1985a-1b08-45aa-b667-ef3a1b3422a8.settings.maxBlocks', '\"\"'),
('fields.bab1985a-1b08-45aa-b667-ef3a1b3422a8.settings.minBlocks', '\"\"'),
('fields.bab1985a-1b08-45aa-b667-ef3a1b3422a8.settings.propagationMethod', '\"all\"'),
('fields.bab1985a-1b08-45aa-b667-ef3a1b3422a8.translationKeyFormat', 'null'),
('fields.bab1985a-1b08-45aa-b667-ef3a1b3422a8.translationMethod', '\"site\"'),
('fields.bab1985a-1b08-45aa-b667-ef3a1b3422a8.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.contentColumnType', '\"string\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.fieldGroup', '\"d32ba746-906b-4d53-aef8-8ea88f43f008\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.handle', '\"featureImage\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.instructions', '\"Feature Image\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.name', '\"Feature Image\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.searchable', 'false'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.allowedKinds.0', '\"image\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.allowSelfRelations', 'false'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.defaultUploadLocationSource', '\"volume:91bf635a-721b-4687-8fc4-f34564d38616\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.defaultUploadLocationSubpath', '\"\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.limit', '\"1\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.localizeRelations', 'false'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.restrictFiles', '\"1\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.selectionLabel', '\"Add a feature image \"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.showSiteMenu', 'true'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.showUnpermittedFiles', 'false'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.showUnpermittedVolumes', 'false'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.singleUploadLocationSource', '\"volume:91bf635a-721b-4687-8fc4-f34564d38616\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.singleUploadLocationSubpath', '\"\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.source', 'null'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.sources', '\"*\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.targetSiteId', 'null'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.useSingleFolder', 'false'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.validateRelatedElements', 'false'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.settings.viewMode', '\"list\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.translationKeyFormat', 'null'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.translationMethod', '\"site\"'),
('fields.d5b4b62c-6dc3-41da-beaa-a63af6b8f18a.type', '\"craft\\\\fields\\\\Assets\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.field', '\"bab1985a-1b08-45aa-b667-ef3a1b3422a8\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fieldLayouts.0783aa5f-8578-45fb-b5eb-94a66fc46a77.tabs.0.elements.0.fieldUid', '\"fd6a9b0b-c68e-4add-bb6f-217e308b32a0\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fieldLayouts.0783aa5f-8578-45fb-b5eb-94a66fc46a77.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fieldLayouts.0783aa5f-8578-45fb-b5eb-94a66fc46a77.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fieldLayouts.0783aa5f-8578-45fb-b5eb-94a66fc46a77.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fieldLayouts.0783aa5f-8578-45fb-b5eb-94a66fc46a77.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fieldLayouts.0783aa5f-8578-45fb-b5eb-94a66fc46a77.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fieldLayouts.0783aa5f-8578-45fb-b5eb-94a66fc46a77.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fieldLayouts.0783aa5f-8578-45fb-b5eb-94a66fc46a77.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fieldLayouts.0783aa5f-8578-45fb-b5eb-94a66fc46a77.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fieldLayouts.0783aa5f-8578-45fb-b5eb-94a66fc46a77.tabs.0.sortOrder', '1'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.contentColumnType', '\"string\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.fieldGroup', 'null'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.handle', '\"image\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.instructions', '\"\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.name', '\"Image\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.searchable', 'false'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.allowedKinds.0', '\"image\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.defaultUploadLocationSource', '\"volume:91bf635a-721b-4687-8fc4-f34564d38616\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.defaultUploadLocationSubpath', '\"\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.limit', '\"\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.localizeRelations', 'false'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.restrictFiles', '\"1\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.showSiteMenu', 'true'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.showUnpermittedFiles', 'false'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.showUnpermittedVolumes', 'false'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.singleUploadLocationSource', '\"volume:91bf635a-721b-4687-8fc4-f34564d38616\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.singleUploadLocationSubpath', '\"\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.source', 'null'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.sources', '\"*\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.targetSiteId', 'null'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.useSingleFolder', 'true'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.settings.viewMode', '\"large\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.translationKeyFormat', 'null'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.translationMethod', '\"site\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.fields.fd6a9b0b-c68e-4add-bb6f-217e308b32a0.type', '\"craft\\\\fields\\\\Assets\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.handle', '\"image\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.name', '\"Image\"'),
('matrixBlockTypes.19cbcf73-2c69-465d-89a1-9685edee6be8.sortOrder', '2'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.field', '\"bab1985a-1b08-45aa-b667-ef3a1b3422a8\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fieldLayouts.c5888eef-26b8-464c-b2e5-bae82b63144c.tabs.0.elements.0.fieldUid', '\"3d6f3570-536d-4fb4-8ec8-7ada705701d5\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fieldLayouts.c5888eef-26b8-464c-b2e5-bae82b63144c.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fieldLayouts.c5888eef-26b8-464c-b2e5-bae82b63144c.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fieldLayouts.c5888eef-26b8-464c-b2e5-bae82b63144c.tabs.0.elements.0.required', 'true'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fieldLayouts.c5888eef-26b8-464c-b2e5-bae82b63144c.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fieldLayouts.c5888eef-26b8-464c-b2e5-bae82b63144c.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fieldLayouts.c5888eef-26b8-464c-b2e5-bae82b63144c.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fieldLayouts.c5888eef-26b8-464c-b2e5-bae82b63144c.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fieldLayouts.c5888eef-26b8-464c-b2e5-bae82b63144c.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fieldLayouts.c5888eef-26b8-464c-b2e5-bae82b63144c.tabs.0.sortOrder', '1'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.contentColumnType', '\"text\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.fieldGroup', 'null'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.handle', '\"text\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.instructions', '\"Text\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.name', '\"Text\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.searchable', 'false'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.availableTransforms', '\"*\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.availableVolumes', '\"*\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.cleanupHtml', 'true'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.columnType', '\"text\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.configSelectionMode', '\"choose\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.defaultTransform', '\"\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.manualConfig', '\"\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.purifierConfig', '\"\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.purifyHtml', '\"1\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.redactorConfig', '\"\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.removeEmptyTags', '\"1\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.removeInlineStyles', '\"1\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.removeNbsp', '\"1\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.showHtmlButtonForNonAdmins', '\"\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.showUnpermittedFiles', 'false'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.showUnpermittedVolumes', 'false'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.settings.uiMode', '\"enlarged\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.translationKeyFormat', 'null'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.translationMethod', '\"none\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.fields.3d6f3570-536d-4fb4-8ec8-7ada705701d5.type', '\"craft\\\\redactor\\\\Field\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.handle', '\"text\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.name', '\"Text\"'),
('matrixBlockTypes.65a6cc4f-aed2-4776-a543-95c6723d609c.sortOrder', '1'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('sections.48c3a575-b126-478e-bee0-03cb4962af93.enableVersioning', 'true'),
('sections.48c3a575-b126-478e-bee0-03cb4962af93.handle', '\"header\"'),
('sections.48c3a575-b126-478e-bee0-03cb4962af93.name', '\"header\"'),
('sections.48c3a575-b126-478e-bee0-03cb4962af93.propagationMethod', '\"all\"'),
('sections.48c3a575-b126-478e-bee0-03cb4962af93.siteSettings.331c97fc-d7b2-41c3-9371-7965dee11a7f.enabledByDefault', 'true'),
('sections.48c3a575-b126-478e-bee0-03cb4962af93.siteSettings.331c97fc-d7b2-41c3-9371-7965dee11a7f.hasUrls', 'false'),
('sections.48c3a575-b126-478e-bee0-03cb4962af93.siteSettings.331c97fc-d7b2-41c3-9371-7965dee11a7f.template', 'null'),
('sections.48c3a575-b126-478e-bee0-03cb4962af93.siteSettings.331c97fc-d7b2-41c3-9371-7965dee11a7f.uriFormat', 'null'),
('sections.48c3a575-b126-478e-bee0-03cb4962af93.type', '\"single\"'),
('sections.7324aa92-bc35-4e0b-8bcb-8f17bee832bb.enableVersioning', 'true'),
('sections.7324aa92-bc35-4e0b-8bcb-8f17bee832bb.handle', '\"blog\"'),
('sections.7324aa92-bc35-4e0b-8bcb-8f17bee832bb.name', '\"Blog\"'),
('sections.7324aa92-bc35-4e0b-8bcb-8f17bee832bb.propagationMethod', '\"all\"'),
('sections.7324aa92-bc35-4e0b-8bcb-8f17bee832bb.siteSettings.331c97fc-d7b2-41c3-9371-7965dee11a7f.enabledByDefault', 'true'),
('sections.7324aa92-bc35-4e0b-8bcb-8f17bee832bb.siteSettings.331c97fc-d7b2-41c3-9371-7965dee11a7f.hasUrls', 'true'),
('sections.7324aa92-bc35-4e0b-8bcb-8f17bee832bb.siteSettings.331c97fc-d7b2-41c3-9371-7965dee11a7f.template', '\"blog/_entry\"'),
('sections.7324aa92-bc35-4e0b-8bcb-8f17bee832bb.siteSettings.331c97fc-d7b2-41c3-9371-7965dee11a7f.uriFormat', '\"blog/{slug}\"'),
('sections.7324aa92-bc35-4e0b-8bcb-8f17bee832bb.type', '\"channel\"'),
('siteGroups.9eb057d6-0272-40d2-aa80-635ffa8ed367.name', '\"Craft\"'),
('sites.331c97fc-d7b2-41c3-9371-7965dee11a7f.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.331c97fc-d7b2-41c3-9371-7965dee11a7f.handle', '\"default\"'),
('sites.331c97fc-d7b2-41c3-9371-7965dee11a7f.hasUrls', 'true'),
('sites.331c97fc-d7b2-41c3-9371-7965dee11a7f.language', '\"en-US\"'),
('sites.331c97fc-d7b2-41c3-9371-7965dee11a7f.name', '\"Craft\"'),
('sites.331c97fc-d7b2-41c3-9371-7965dee11a7f.primary', 'true'),
('sites.331c97fc-d7b2-41c3-9371-7965dee11a7f.siteGroup', '\"9eb057d6-0272-40d2-aa80-635ffa8ed367\"'),
('sites.331c97fc-d7b2-41c3-9371-7965dee11a7f.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"Craft\"'),
('system.schemaVersion', '\"3.5.12\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.autocomplete', 'false'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.autocorrect', 'true'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.autofocus', 'false'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.class', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.disabled', 'false'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.id', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.instructions', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.label', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.max', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.min', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.name', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.orientation', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.placeholder', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.readonly', 'false'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.requirable', 'false'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.required', 'false'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.size', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.step', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.tip', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.title', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.warning', 'null'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.elements.0.width', '100'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.name', '\"Content\"'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.fieldLayouts.7873c647-2f00-4afb-826a-26df7567f821.tabs.0.sortOrder', '1'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.handle', '\"blog\"'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.hasUrls', 'true'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.name', '\"Blog\"'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.settings.path', '\"@webroot/assets/blog\"'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.sortOrder', '1'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.type', '\"craft\\\\volumes\\\\Local\"'),
('volumes.91bf635a-721b-4687-8fc4-f34564d38616.url', '\"@web/assets/blog\"');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
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
-- Table structure for table `relations`
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

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('1320e64c', '@craft/redactor/assets/field/dist'),
('150f197f', '@app/web/assets/utilities/dist'),
('200b99bc', '@bower/jquery/dist'),
('26be757e', '@app/web/assets/matrixsettings/dist'),
('2da3c129', '@lib/jquery.payment'),
('31846ec1', '@lib/velocity'),
('3c5972d2', '@app/web/assets/feed/dist'),
('54833e0d', '@app/web/assets/updateswidget/dist'),
('562c1cab', '@craft/redactor/assets/redactor/dist'),
('58111658', '@lib/vue'),
('5c59082d', '@app/web/assets/cp/dist'),
('6827f04e', '@app/web/assets/craftsupport/dist'),
('6a397c63', '@app/web/assets/recententries/dist'),
('6bf67fd6', '@app/web/assets/fieldsettings/dist'),
('6ce1846c', '@lib/axios'),
('70b718e1', '@app/web/assets/installer/dist'),
('75572784', '@app/web/assets/pluginstore/dist'),
('7f2df564', '@lib/jquery-ui'),
('8128596e', '@app/web/assets/fields/dist'),
('82b47c2c', '@app/web/assets/sites/dist'),
('82e6c4d7', '@app/web/assets/matrix/dist'),
('84ff46d2', '@lib/fabric'),
('864f7720', '@app/web/assets/dashboard/dist'),
('87d36525', '@app/web/assets/deprecationerrors/dist'),
('91b992ec', '@lib/garnishjs'),
('a3c94eff', '@app/web/assets/queuemanager/dist'),
('a6e9b520', '@app/web/assets/editentry/dist'),
('a9839370', '@lib/prismjs'),
('ab0599f9', '@lib/jquery-touch-events'),
('ab84dad3', '@app/web/assets/updates/dist'),
('aca1a53b', '@lib/picturefill'),
('b449a4c5', '@lib/fileupload'),
('b8ea9bd2', '@lib/iframe-resizer'),
('b907f803', '@app/web/assets/dbbackup/dist'),
('bb1fb42b', '@lib/d3'),
('c1918231', '@app/web/assets/admintable/dist'),
('ccc4a7df', '@app/web/assets/clearcaches/dist'),
('cd4c9440', '@lib/timepicker'),
('cebbf10b', '@app/web/assets/editsection/dist'),
('efa969f0', '@app/web/assets/plugins/dist'),
('f2b3cc35', '@lib/xregexp'),
('f8df88bf', '@lib/selectize'),
('f9b3249', '@lib/element-resize-detector');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, NULL),
(2, 2, 1, 2, NULL),
(3, 2, 1, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' tuannd haposoft com '),
(1, 'slug', 0, 1, ''),
(2, 'title', 0, 1, ' test header '),
(2, 'slug', 0, 1, ' header '),
(8, 'filename', 0, 1, ' z1990210790537 4aaca18eb626c4f6dd465de9761a9e90 jpg '),
(8, 'extension', 0, 1, ' jpg '),
(8, 'kind', 0, 1, ' image '),
(8, 'slug', 0, 1, ''),
(8, 'title', 0, 1, ' z1990210790537 4aaca18eb626c4f6dd465de9761a9e90 '),
(9, 'filename', 0, 1, ' screenshot 4 png '),
(9, 'extension', 0, 1, ' png '),
(9, 'kind', 0, 1, ' image '),
(9, 'slug', 0, 1, ''),
(9, 'title', 0, 1, ' screenshot 4 '),
(10, 'slug', 0, 1, ' my stories '),
(10, 'title', 0, 1, ' my stories ');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
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
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'header', 'header', 'single', 1, 'all', NULL, '2020-08-20 08:28:05', '2020-08-20 08:28:52', NULL, '48c3a575-b126-478e-bee0-03cb4962af93'),
(2, NULL, 'Blog', 'blog', 'channel', 1, 'all', NULL, '2020-08-20 09:41:20', '2020-08-20 09:41:20', NULL, '7324aa92-bc35-4e0b-8bcb-8f17bee832bb');

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
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
-- Dumping data for table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 0, NULL, NULL, 1, '2020-08-20 08:28:05', '2020-08-20 08:28:52', '6b7dfe37-be7c-400c-9221-30fa292c32e1'),
(2, 2, 1, 1, 'blog/{slug}', 'blog/_entry', 1, '2020-08-20 09:41:20', '2020-08-20 09:41:20', 'a9382272-b245-42de-bdba-a69912b3f476');

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
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
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, '4rrtKKWDSalUkte9C4VaWp_fjIAxC9NRJcK-Dp0esZVR2XE3FOkAjfvQcKsi7A2tBLOtYz9hegs3-mBhmgmVVKt_h1RDlU7d4AoD', '2020-08-20 08:17:40', '2020-08-20 10:34:58', '5d8ba02d-fc88-4ae1-a32e-4788f4f365cb');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
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
-- Table structure for table `sitegroups`
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
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Craft', '2020-08-20 08:17:39', '2020-08-20 08:17:39', NULL, '9eb057d6-0272-40d2-aa80-635ffa8ed367');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
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
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Craft', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2020-08-20 08:17:39', '2020-08-20 08:17:39', NULL, '331c97fc-d7b2-41c3-9371-7965dee11a7f');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
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
-- Dumping data for table `structureelements`
--

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, NULL, 1, 1, 4, 0, '2020-08-20 10:28:20', '2020-08-20 10:28:20', '02511177-c6c2-4a73-93f7-ae7179c6ce0c'),
(2, 1, 10, 1, 2, 3, 1, '2020-08-20 10:28:20', '2020-08-20 10:28:20', '3f479a2c-20e9-40e4-914f-8b4aa598015c');

-- --------------------------------------------------------

--
-- Table structure for table `structures`
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
-- Dumping data for table `structures`
--

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, '2020-08-20 09:56:37', '2020-08-20 09:56:37', NULL, '61b69ee4-dc7e-4f53-ae0f-17fe5534633c');

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
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
-- Table structure for table `taggroups`
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
-- Table structure for table `tags`
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
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
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
-- Table structure for table `tokens`
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

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `route`, `usageLimit`, `usageCount`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'bx8eqIK1s2_2V8DLnJlcvJQhwRymnVKl', '[\"preview/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"sourceId\":11,\"siteId\":1,\"draftId\":3,\"revisionId\":null}]', NULL, NULL, '2020-08-21 10:34:22', '2020-08-20 10:34:22', '2020-08-20 10:34:22', '6adde4ce-4311-4c12-8fed-2ae40cff8e84');

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
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
-- Table structure for table `userpermissions`
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
-- Table structure for table `userpermissions_usergroups`
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
-- Table structure for table `userpermissions_users`
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
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'tuannd@haposoft.com', '$2y$13$MZolH1Wd7Ua2Pxzbio5mvOkYT3sQzAiXVLYY/DgCr.3SDHx4jDcni', 1, 0, 0, 0, '2020-08-20 08:17:40', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2020-08-20 08:17:40', '2020-08-20 08:17:40', '2020-08-20 08:17:45', 'af473a8c-63ff-4e15-a344-b09b12baa514');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
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
-- Dumping data for table `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Blog', '', '2020-08-20 09:53:32', '2020-08-20 09:53:32', 'eb29fe1d-80d0-44c0-b770-b536396ba5de'),
(2, NULL, NULL, 'Temporary source', NULL, '2020-08-20 09:53:49', '2020-08-20 09:53:49', 'cc622076-811e-466c-8fc0-002245e14061'),
(3, 2, NULL, 'user_1', 'user_1/', '2020-08-20 09:53:49', '2020-08-20 09:53:49', '59d73a97-86d7-406f-86cb-8ef4918195ae');

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
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
-- Dumping data for table `volumes`
--

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 3, 'Blog', 'blog', 'craft\\volumes\\Local', 1, '@web/assets/blog', '{\"path\":\"@webroot/assets/blog\"}', 1, '2020-08-20 09:53:32', '2020-08-20 09:53:32', NULL, '91bf635a-721b-4687-8fc4-f34564d38616');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
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
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2020-08-20 08:17:44', '2020-08-20 08:17:44', '89695c11-89bf-4dcd-a70d-e791618051f5'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2020-08-20 08:17:44', '2020-08-20 08:17:44', '4744fabb-4040-4a85-8f72-8369756ef04a'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2020-08-20 08:17:44', '2020-08-20 08:17:44', 'a2c36e85-9430-4ef7-a6aa-a96e8b887f7e'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2020-08-20 08:17:44', '2020-08-20 08:17:44', '93297d8b-1936-4145-9f36-b944e6d54d64');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  ADD KEY `assets_folderId_idx` (`folderId`),
  ADD KEY `assets_volumeId_idx` (`volumeId`),
  ADD KEY `assets_uploaderId_fk` (`uploaderId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransforms_name_idx` (`name`),
  ADD KEY `assettransforms_handle_idx` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_groupId_idx` (`groupId`),
  ADD KEY `categories_parentId_fk` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorygroups_name_idx` (`name`),
  ADD KEY `categorygroups_handle_idx` (`handle`),
  ADD KEY `categorygroups_structureId_idx` (`structureId`),
  ADD KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `categorygroups_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `changedattributes_siteId_fk` (`siteId`),
  ADD KEY `changedattributes_userId_fk` (`userId`);

--
-- Indexes for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `changedfields_siteId_fk` (`siteId`),
  ADD KEY `changedfields_fieldId_fk` (`fieldId`),
  ADD KEY `changedfields_userId_fk` (`userId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `content_siteId_idx` (`siteId`),
  ADD KEY `content_title_idx` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drafts_creatorId_fk` (`creatorId`),
  ADD KEY `drafts_sourceId_fk` (`sourceId`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `elements`
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
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `elements_sites_siteId_idx` (`siteId`),
  ADD KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `elements_sites_enabled_idx` (`enabled`),
  ADD KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indexes for table `entries`
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
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  ADD KEY `entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `entrytypes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldgroups_name_idx` (`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fields_handle_context_idx` (`handle`,`context`),
  ADD KEY `fields_groupId_idx` (`groupId`),
  ADD KEY `fields_context_idx` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `globalsets_name_idx` (`name`),
  ADD KEY `globalsets_handle_idx` (`handle`),
  ADD KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  ADD UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  ADD KEY `gqltokens_schemaId_fk` (`schemaId`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `matrixblocks_sortOrder_idx` (`sortOrder`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocktypes_name_fieldId_idx` (`name`,`fieldId`),
  ADD KEY `matrixblocktypes_handle_fieldId_idx` (`handle`,`fieldId`),
  ADD KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `matrixcontent_postcontent`
--
ALTER TABLE `matrixcontent_postcontent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_postcontent_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_postcontent_siteId_fk` (`siteId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `migrations_track_name_unq_idx` (`track`,`name`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plugins_handle_unq_idx` (`handle`);

--
-- Indexes for table `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `relations_sourceId_idx` (`sourceId`),
  ADD KEY `relations_targetId_idx` (`targetId`),
  ADD KEY `relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  ADD KEY `revisions_creatorId_fk` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_handle_idx` (`handle`),
  ADD KEY `sections_name_idx` (`name`),
  ADD KEY `sections_structureId_idx` (`structureId`),
  ADD KEY `sections_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_uid_idx` (`uid`),
  ADD KEY `sessions_token_idx` (`token`),
  ADD KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `sessions_userId_idx` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sitegroups_name_idx` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `sites_handle_idx` (`handle`),
  ADD KEY `sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `sites_groupId_fk` (`groupId`);

--
-- Indexes for table `structureelements`
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
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `systemmessages_language_idx` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taggroups_name_idx` (`name`),
  ADD KEY `taggroups_handle_idx` (`handle`),
  ADD KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_groupId_idx` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unq_idx` (`token`),
  ADD KEY `tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usergroups_handle_idx` (`handle`),
  ADD KEY `usergroups_name_idx` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_uid_idx` (`uid`),
  ADD KEY `users_verificationCode_idx` (`verificationCode`),
  ADD KEY `users_email_idx` (`email`),
  ADD KEY `users_username_idx` (`username`),
  ADD KEY `users_photoId_fk` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `volumefolders_parentId_idx` (`parentId`),
  ADD KEY `volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volumes_name_idx` (`name`),
  ADD KEY `volumes_handle_idx` (`handle`),
  ADD KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `volumes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `matrixcontent_postcontent`
--
ALTER TABLE `matrixcontent_postcontent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixcontent_postcontent`
--
ALTER TABLE `matrixcontent_postcontent`
  ADD CONSTRAINT `matrixcontent_postcontent_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_postcontent_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
