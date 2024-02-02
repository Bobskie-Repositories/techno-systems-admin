-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2024 at 02:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techno_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add blacklisted token', 6, 'add_blacklistedtoken'),
(22, 'Can change blacklisted token', 6, 'change_blacklistedtoken'),
(23, 'Can delete blacklisted token', 6, 'delete_blacklistedtoken'),
(24, 'Can view blacklisted token', 6, 'view_blacklistedtoken'),
(25, 'Can add outstanding token', 7, 'add_outstandingtoken'),
(26, 'Can change outstanding token', 7, 'change_outstandingtoken'),
(27, 'Can delete outstanding token', 7, 'delete_outstandingtoken'),
(28, 'Can view outstanding token', 7, 'view_outstandingtoken'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add class member', 9, 'add_classmember'),
(34, 'Can change class member', 9, 'change_classmember'),
(35, 'Can delete class member', 9, 'delete_classmember'),
(36, 'Can view class member', 9, 'view_classmember'),
(37, 'Can add class room', 10, 'add_classroom'),
(38, 'Can change class room', 10, 'change_classroom'),
(39, 'Can delete class room', 10, 'delete_classroom'),
(40, 'Can view class room', 10, 'view_classroom'),
(41, 'Can add class room pe', 11, 'add_classroompe'),
(42, 'Can change class room pe', 11, 'change_classroompe'),
(43, 'Can delete class room pe', 11, 'delete_classroompe'),
(44, 'Can view class room pe', 11, 'view_classroompe'),
(45, 'Can add peer eval', 12, 'add_peereval'),
(46, 'Can change peer eval', 12, 'change_peereval'),
(47, 'Can delete peer eval', 12, 'delete_peereval'),
(48, 'Can view peer eval', 12, 'view_peereval'),
(49, 'Can add team', 13, 'add_team'),
(50, 'Can change team', 13, 'change_team'),
(51, 'Can delete team', 13, 'delete_team'),
(52, 'Can view team', 13, 'view_team'),
(53, 'Can add team member', 14, 'add_teammember'),
(54, 'Can change team member', 14, 'change_teammember'),
(55, 'Can delete team member', 14, 'delete_teammember'),
(56, 'Can view team member', 14, 'view_teammember'),
(57, 'Can add class room pe taker', 15, 'add_classroompetaker'),
(58, 'Can change class room pe taker', 15, 'change_classroompetaker'),
(59, 'Can delete class room pe taker', 15, 'delete_classroompetaker'),
(60, 'Can view class room pe taker', 15, 'view_classroompetaker'),
(61, 'Can add spring board template', 16, 'add_springboardtemplate'),
(62, 'Can change spring board template', 16, 'change_springboardtemplate'),
(63, 'Can delete spring board template', 16, 'delete_springboardtemplate'),
(64, 'Can view spring board template', 16, 'view_springboardtemplate'),
(65, 'Can add spring project', 17, 'add_springproject'),
(66, 'Can change spring project', 17, 'change_springproject'),
(67, 'Can delete spring project', 17, 'delete_springproject'),
(68, 'Can view spring project', 17, 'view_springproject'),
(69, 'Can add spring project board', 18, 'add_springprojectboard'),
(70, 'Can change spring project board', 18, 'change_springprojectboard'),
(71, 'Can delete spring project board', 18, 'delete_springprojectboard'),
(72, 'Can view spring project board', 18, 'view_springprojectboard'),
(73, 'Can add activity', 19, 'add_activity'),
(74, 'Can change activity', 19, 'change_activity'),
(75, 'Can delete activity', 19, 'delete_activity'),
(76, 'Can view activity', 19, 'view_activity'),
(77, 'Can add activity template', 20, 'add_activitytemplate'),
(78, 'Can change activity template', 20, 'change_activitytemplate'),
(79, 'Can delete activity template', 20, 'delete_activitytemplate'),
(80, 'Can view activity template', 20, 'view_activitytemplate'),
(81, 'Can add criteria', 21, 'add_criteria'),
(82, 'Can change criteria', 21, 'change_criteria'),
(83, 'Can delete criteria', 21, 'delete_criteria'),
(84, 'Can view criteria', 21, 'view_criteria'),
(85, 'Can add meeting', 22, 'add_meeting'),
(86, 'Can change meeting', 22, 'change_meeting'),
(87, 'Can delete meeting', 22, 'delete_meeting'),
(88, 'Can view meeting', 22, 'view_meeting'),
(89, 'Can add message', 23, 'add_message'),
(90, 'Can change message', 23, 'change_message'),
(91, 'Can delete message', 23, 'delete_message'),
(92, 'Can view message', 23, 'view_message'),
(93, 'Can add pitch', 24, 'add_pitch'),
(94, 'Can change pitch', 24, 'change_pitch'),
(95, 'Can delete pitch', 24, 'delete_pitch'),
(96, 'Can view pitch', 24, 'view_pitch'),
(97, 'Can add remark', 25, 'add_remark'),
(98, 'Can change remark', 25, 'change_remark'),
(99, 'Can delete remark', 25, 'delete_remark'),
(100, 'Can view remark', 25, 'view_remark'),
(101, 'Can add rating', 26, 'add_rating'),
(102, 'Can change rating', 26, 'change_rating'),
(103, 'Can delete rating', 26, 'delete_rating'),
(104, 'Can view rating', 26, 'view_rating'),
(105, 'Can add meeting presentor', 27, 'add_meetingpresentor'),
(106, 'Can change meeting presentor', 27, 'change_meetingpresentor'),
(107, 'Can delete meeting presentor', 27, 'delete_meetingpresentor'),
(108, 'Can view meeting presentor', 27, 'view_meetingpresentor'),
(109, 'Can add meeting criteria', 28, 'add_meetingcriteria'),
(110, 'Can change meeting criteria', 28, 'change_meetingcriteria'),
(111, 'Can delete meeting criteria', 28, 'delete_meetingcriteria'),
(112, 'Can view meeting criteria', 28, 'view_meetingcriteria'),
(113, 'Can add meeting comment', 29, 'add_meetingcomment'),
(114, 'Can change meeting comment', 29, 'change_meetingcomment'),
(115, 'Can delete meeting comment', 29, 'delete_meetingcomment'),
(116, 'Can view meeting comment', 29, 'view_meetingcomment'),
(117, 'Can add feedback', 30, 'add_feedback'),
(118, 'Can change feedback', 30, 'change_feedback'),
(119, 'Can delete feedback', 30, 'delete_feedback'),
(120, 'Can view feedback', 30, 'view_feedback'),
(121, 'Can add chatbot', 31, 'add_chatbot'),
(122, 'Can change chatbot', 31, 'change_chatbot'),
(123, 'Can delete chatbot', 31, 'delete_chatbot'),
(124, 'Can view chatbot', 31, 'view_chatbot'),
(125, 'Can add activity work attachment', 32, 'add_activityworkattachment'),
(126, 'Can change activity work attachment', 32, 'change_activityworkattachment'),
(127, 'Can delete activity work attachment', 32, 'delete_activityworkattachment'),
(128, 'Can view activity work attachment', 32, 'view_activityworkattachment'),
(129, 'Can add activity comment', 33, 'add_activitycomment'),
(130, 'Can change activity comment', 33, 'change_activitycomment'),
(131, 'Can delete activity comment', 33, 'delete_activitycomment'),
(132, 'Can view activity comment', 33, 'view_activitycomment');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'token_blacklist', 'blacklistedtoken'),
(7, 'token_blacklist', 'outstandingtoken'),
(19, 'wildforge_api', 'activity'),
(33, 'wildforge_api', 'activitycomment'),
(20, 'wildforge_api', 'activitytemplate'),
(32, 'wildforge_api', 'activityworkattachment'),
(31, 'wildforge_api', 'chatbot'),
(9, 'wildforge_api', 'classmember'),
(10, 'wildforge_api', 'classroom'),
(11, 'wildforge_api', 'classroompe'),
(15, 'wildforge_api', 'classroompetaker'),
(21, 'wildforge_api', 'criteria'),
(30, 'wildforge_api', 'feedback'),
(22, 'wildforge_api', 'meeting'),
(29, 'wildforge_api', 'meetingcomment'),
(28, 'wildforge_api', 'meetingcriteria'),
(27, 'wildforge_api', 'meetingpresentor'),
(23, 'wildforge_api', 'message'),
(12, 'wildforge_api', 'peereval'),
(24, 'wildforge_api', 'pitch'),
(26, 'wildforge_api', 'rating'),
(25, 'wildforge_api', 'remark'),
(16, 'wildforge_api', 'springboardtemplate'),
(17, 'wildforge_api', 'springproject'),
(18, 'wildforge_api', 'springprojectboard'),
(13, 'wildforge_api', 'team'),
(14, 'wildforge_api', 'teammember'),
(8, 'wildforge_api', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-02 13:46:47.008247'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-02-02 13:46:47.056644'),
(3, 'auth', '0001_initial', '2024-02-02 13:46:47.241945'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-02-02 13:46:47.285530'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-02-02 13:46:47.292646'),
(6, 'auth', '0004_alter_user_username_opts', '2024-02-02 13:46:47.296640'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-02-02 13:46:47.299199'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-02-02 13:46:47.301182'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-02-02 13:46:47.307220'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-02-02 13:46:47.311180'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-02-02 13:46:47.314208'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-02-02 13:46:47.323180'),
(13, 'auth', '0011_update_proxy_permissions', '2024-02-02 13:46:47.328180'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-02-02 13:46:47.331180'),
(15, 'wildforge_api', '0001_initial', '2024-02-02 13:46:47.931720'),
(16, 'admin', '0001_initial', '2024-02-02 13:46:48.041111'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-02-02 13:46:48.049168'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-02 13:46:48.057629'),
(19, 'sessions', '0001_initial', '2024-02-02 13:46:48.097873'),
(20, 'token_blacklist', '0001_initial', '2024-02-02 13:46:48.235769'),
(21, 'token_blacklist', '0002_outstandingtoken_jti_hex', '2024-02-02 13:46:48.247796'),
(22, 'token_blacklist', '0003_auto_20171017_2007', '2024-02-02 13:46:48.268573'),
(23, 'token_blacklist', '0004_auto_20171017_2013', '2024-02-02 13:46:48.319960'),
(24, 'token_blacklist', '0005_remove_outstandingtoken_jti', '2024-02-02 13:46:48.338617'),
(25, 'token_blacklist', '0006_auto_20171017_2113', '2024-02-02 13:46:48.358108'),
(26, 'token_blacklist', '0007_auto_20171017_2214', '2024-02-02 13:46:48.917995'),
(27, 'token_blacklist', '0008_migrate_to_bigautofield', '2024-02-02 13:46:49.388265'),
(28, 'token_blacklist', '0010_fix_migrate_to_bigautofield', '2024-02-02 13:46:49.403835'),
(29, 'token_blacklist', '0011_linearizes_history', '2024-02-02 13:46:49.407912'),
(30, 'token_blacklist', '0012_alter_outstandingtoken_user', '2024-02-02 13:46:49.421992'),
(31, 'wildforge_api', '0002_boardtemplate_project_projectboard', '2024-02-02 13:46:49.571270'),
(32, 'wildforge_api', '0003_rename_boardtemplate_springboardtemplate_and_more', '2024-02-02 13:46:49.948984'),
(33, 'wildforge_api', '0004_activity_activitytemplate_criteria_meeting_message_and_more', '2024-02-02 13:46:51.425869'),
(34, 'wildforge_api', '0005_alter_springboardtemplate_title', '2024-02-02 13:46:51.433869');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint(20) NOT NULL,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint(20) NOT NULL,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `jti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

INSERT INTO `token_blacklist_outstandingtoken` (`id`, `token`, `created_at`, `expires_at`, `user_id`, `jti`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxNDY1Nzc1MywiaWF0IjoxNzA2ODgxNzUzLCJqdGkiOiI4ZDdhOWNmMTA1ZDU0ZWRiYWM2YjQxMzRlOTExZTI3YyIsInVzZXJfaWQiOjF9.o7ROem3ez24zYntZ3_KJ8XZElF7ABDSqcx_foJZ_Ad0', '2024-02-02 13:49:13.187468', '2024-05-02 13:49:13.000000', 1, '8d7a9cf105d54edbac6b4134e911e27c'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxNDY1NzkyMCwiaWF0IjoxNzA2ODgxOTIwLCJqdGkiOiI4ZWZkMzY5YWQ1NTQ0YjQxYTVjNzlmZmU4NTBkMWYyMCIsInVzZXJfaWQiOjF9.gdHV2zvg8br7oM1WFMECoekmHSCfc1sMyhksPn3Jy5A', '2024-02-02 13:52:00.635733', '2024-05-02 13:52:00.000000', 1, '8efd369ad5544b41a5c79ffe850d1f20');

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_activity`
--

CREATE TABLE `wildforge_api_activity` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `submission_status` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  `evaluation` int(11) DEFAULT NULL,
  `total_score` int(11) NOT NULL,
  `classroom_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_activitycomment`
--

CREATE TABLE `wildforge_api_activitycomment` (
  `id` bigint(20) NOT NULL,
  `comment` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `activity_id_id` bigint(20) DEFAULT NULL,
  `user_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_activitytemplate`
--

CREATE TABLE `wildforge_api_activitytemplate` (
  `id` bigint(20) NOT NULL,
  `course_name` longtext NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_activityworkattachment`
--

CREATE TABLE `wildforge_api_activityworkattachment` (
  `id` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `file_attachment` varchar(100) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `activity_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_activity_team_id`
--

CREATE TABLE `wildforge_api_activity_team_id` (
  `id` bigint(20) NOT NULL,
  `activity_id` bigint(20) NOT NULL,
  `team_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_chatbot`
--

CREATE TABLE `wildforge_api_chatbot` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `classmember_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_chatbot_message_id`
--

CREATE TABLE `wildforge_api_chatbot_message_id` (
  `id` bigint(20) NOT NULL,
  `chatbot_id` bigint(20) NOT NULL,
  `message_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_classmember`
--

CREATE TABLE `wildforge_api_classmember` (
  `id` bigint(20) NOT NULL,
  `role` smallint(5) UNSIGNED DEFAULT NULL CHECK (`role` >= 0),
  `status` smallint(5) UNSIGNED DEFAULT NULL CHECK (`status` >= 0),
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `class_id_id` bigint(20) DEFAULT NULL,
  `user_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_classroom`
--

CREATE TABLE `wildforge_api_classroom` (
  `id` bigint(20) NOT NULL,
  `class_code` varchar(8) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `sections` varchar(100) NOT NULL,
  `schedule` varchar(100) NOT NULL,
  `max_teams_members` int(11) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_classroompe`
--

CREATE TABLE `wildforge_api_classroompe` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `class_id_id` bigint(20) NOT NULL,
  `peer_eval_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_classroompetaker`
--

CREATE TABLE `wildforge_api_classroompetaker` (
  `id` bigint(20) NOT NULL,
  `status` int(10) UNSIGNED NOT NULL CHECK (`status` >= 0),
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `class_member_id_id` bigint(20) NOT NULL,
  `class_room_pe_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_criteria`
--

CREATE TABLE `wildforge_api_criteria` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_feedback`
--

CREATE TABLE `wildforge_api_feedback` (
  `id` bigint(20) NOT NULL,
  `feedback` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `meeting_id_id` bigint(20) NOT NULL,
  `pitch_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_meeting`
--

CREATE TABLE `wildforge_api_meeting` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `teacher_weight_score` decimal(3,2) NOT NULL,
  `student_weight_score` decimal(3,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `video` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `classroom_id_id` bigint(20) NOT NULL,
  `owner_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_meetingcomment`
--

CREATE TABLE `wildforge_api_meetingcomment` (
  `id` bigint(20) NOT NULL,
  `comment` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `classmember_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_meetingcriteria`
--

CREATE TABLE `wildforge_api_meetingcriteria` (
  `id` bigint(20) NOT NULL,
  `weight` decimal(3,2) NOT NULL,
  `criteria_id_id` bigint(20) NOT NULL,
  `meeting_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_meetingpresentor`
--

CREATE TABLE `wildforge_api_meetingpresentor` (
  `id` bigint(20) NOT NULL,
  `is_rate_open` tinyint(1) NOT NULL,
  `meeting_id_id` bigint(20) NOT NULL,
  `pitch_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_meeting_meeting_comment_id`
--

CREATE TABLE `wildforge_api_meeting_meeting_comment_id` (
  `id` bigint(20) NOT NULL,
  `meeting_id` bigint(20) NOT NULL,
  `meetingcomment_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_message`
--

CREATE TABLE `wildforge_api_message` (
  `id` bigint(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_peereval`
--

CREATE TABLE `wildforge_api_peereval` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `forms_link` longtext DEFAULT NULL,
  `sheet_link` longtext DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_pitch`
--

CREATE TABLE `wildforge_api_pitch` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `team_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_rating`
--

CREATE TABLE `wildforge_api_rating` (
  `id` bigint(20) NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `classmember_id_id` bigint(20) NOT NULL,
  `meeting_criteria_id_id` bigint(20) NOT NULL,
  `meeting_id_id` bigint(20) NOT NULL,
  `pitch_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_remark`
--

CREATE TABLE `wildforge_api_remark` (
  `id` bigint(20) NOT NULL,
  `remark` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `classmember_id_id` bigint(20) NOT NULL,
  `meeting_id_id` bigint(20) NOT NULL,
  `pitch_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_springboardtemplate`
--

CREATE TABLE `wildforge_api_springboardtemplate` (
  `id` bigint(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `rules` longtext NOT NULL,
  `description` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wildforge_api_springboardtemplate`
--

INSERT INTO `wildforge_api_springboardtemplate` (`id`, `title`, `content`, `rules`, `description`, `date_created`) VALUES
(1, 'Ideating a New Venture - Modified', '<p><strong>Focus Area: </strong>[Specify the industry or sector you\'re exploring]</p><p><strong>End User:</strong> [Identify the target audience or user group for your venture]</p><p><strong>Knowledge:</strong> [List any relevant information or expertise needed for this venture]</p><p><br></p><p><strong>Problem Statement:</strong> [Clearly define the problem or challenge your venture aims to address]</p><p><br></p><p><strong>How-Might-We:</strong></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><ol><li>Action: [Choose a specific action verb like redesign, encourage, improve, solve, etc.]</li><li>Subject: [Specify the target audience or group, e.g., millennials, sales managers, retirees, students, etc.]</li><li>Outcome: [Describe the desired outcome or experience, such as frictionless, affordable, fun, engaging, etc.]</li></ol><p><br></p><p><br></p><p><strong>Elevator Pitch:</strong></p><p>Craft a concise elevator pitch (75-80 words) that highlights the unique value proposition of your venture, addressing the identified problem and showcasing the desired outcome.</p><p><br></p><p><strong>References:</strong></p><p>Paste relevant links or sources that support your ideation process.</p>', '<ol><li>Be creative: Think outside the box and explore innovative solutions.</li><li>Stay focused: Ensure your ideation aligns with the specified focus area and end user.</li><li>Collaboration is key: Encourage teamwork and diverse perspectives during the ideation process.</li><li>Research-backed: Base your ideas on reliable knowledge and data, referring to the provided references.</li><li>Concise communication: Clearly articulate your How-Might-We statements and elevator pitch within the given word limits.</li><li>Problem-centric: Keep the problem statement at the forefront, addressing real-world challenges.</li><li>Feasibility check: Consider the feasibility and practicality of your ideas within the chosen industry or sector.</li><li>Iterative process: Be open to refining and iterating on your ideas based on feedback and further insights.</li><li>User-centric: Prioritize the needs and preferences of the end user in your ideation.</li><li>Future-oriented: Think about the long-term impact and sustainability of your venture.</li></ol><p><br></p><p><strong>Evaluation Criteria: An AI will assess each input based on three key factors—novelty, capability, and technical feasibility. </strong></p><p><strong>Novelty evaluates the originality of the idea, capability assesses its potential impact, and technical feasibility gauges its practical implementation. </strong></p><p><br></p><p><strong>Ensure your input demonstrates a balance of innovation, effectiveness, and realistic execution to receive a comprehensive evaluation.</strong></p>', 'This template guides the ideation of a new venture, prompting problem-focused creativity with How-Might-We statements and an elevator pitch.', '2024-01-01 16:16:07.000000'),
(2, 'User Story Map', '<p><strong>End User</strong>: [Define the target user or customer for your venture]</p><p><br></p><p><strong>User Story:</strong></p><p><strong>User Story Title:</strong> [Give a title that succinctly describes the user\'s journey]</p><p><br></p><p><strong>PHASES:</strong></p><p><br></p><p><br></p><ol><li><span style=\"color: var(--tw-prose-bold);\">GOALS (PRESENT):</span> Identify the current goals or objectives of the user in their journey.</li><li><span style=\"color: var(--tw-prose-bold);\">STEPS (PRESENT):</span> Break down the user\'s current journey into distinct steps.</li><li><span style=\"color: var(--tw-prose-bold);\">OVERALL USER EXPERIENCE (1-5):</span> Rate the current user experience at each step, with 5 being the highest and 1 the lowest.</li></ol><p><br></p><p><strong>FOCUSED STEPS:</strong></p><p><br></p><p><br></p><ol><li><span style=\"color: var(--tw-prose-bold);\">PROPOSED INNOVATION:</span> Outline the innovative changes or solutions proposed for each step to enhance the user experience.</li><li><span style=\"color: var(--tw-prose-bold);\">SUPPORTING TECHNOLOGY:</span> Specify the technology or tools that will support the proposed innovations.</li><li><span style=\"color: var(--tw-prose-bold);\">MEASURABLE OUTCOME:</span> Define the measurable outcomes or improvements expected in the user\'s journey.</li></ol>', '<ol><li>Clearly Define End User: Clearly articulate the characteristics and needs of the end user to ensure a user-centric approach.</li><li>Comprehensive User Story: Provide a detailed and comprehensive user story, covering goals, steps, and the overall user experience.</li><li>Realistic Ratings: When assessing the overall user experience, provide ratings that accurately reflect the current situation.</li><li>Innovative Solutions: Propose creative and innovative solutions for each step to enhance the user journey.</li><li>Technology Alignment: Ensure that the supporting technology aligns with and enhances the proposed innovations.</li><li>Measurable Outcomes: Clearly outline measurable outcomes to gauge the success of the proposed changes in the user journey.</li><li>User-Centric Focus: Keep the end user at the center of the user story map, prioritizing their needs and preferences throughout the phases.</li></ol><p><br></p><p><strong>Evaluation Criteria</strong>: <strong>The AI will assess each input based on three key factors—novelty, capability, and technical feasibility. Novelty evaluates the originality of the idea, capability assesses its potential impact, and technical feasibility gauges its practical implementation.</strong></p><p><br></p><p><strong>﻿ Ensure your input demonstrates a balance of innovation, effectiveness, and realistic execution to receive a comprehensive evaluation.</strong></p>', 'This template elevate user experience by evaluating, innovating, and aligning technology, with rules prioritizing user-centric solutions.', '2024-01-01 16:16:07.000000'),
(3, 'Industries & Market Segments', '<p><strong>Idea or technology:</strong></p><p><br></p><p><strong>Industry or Similar Category:</strong></p><p><em>Specify the industry or a related category where your idea or technology is applicable</em>.</p><p><br></p><p><br></p><ol><li><br></li><li><br></li><li><br></li><li><br></li><li><br></li></ol><p><br></p><p><strong>Market Segment Level 1:</strong></p><p><em>Identify the primary market segment or target audience within the chosen industry.</em></p><p><br></p><p><br></p><p><br></p><ol><li><br></li><li><br></li><li><br></li><li><br></li><li><br></li></ol><p><br></p><p><strong>End User:</strong></p><p><em>Clearly define the end user or customer who will benefit from your idea or technology.</em></p><p><br></p><p><br></p><p><br></p><ol><li><br></li><li><br></li><li><br></li><li><br></li><li><br></li></ol>', '<ol><li>Clearly Define Idea or Technology: Provide a concise description of your idea or technology to ensure clarity.</li><li>Industry Identification: Clearly specify the industry or a similar category where your idea or technology is applicable.</li><li>Market Segment Level 1: Identify the primary market segment or target audience for your idea within the chosen industry.</li><li>End User: Clearly define the end user or customer who will benefit from your idea or technology.</li><li>Comprehensive Understanding: Ensure a comprehensive understanding of how your idea fits into the industry, addresses a specific market segment, and meets the needs of the end user.</li></ol><p><br></p><p><br></p><p><strong>Evaluation Criteria: The AI will assess each input based on three key factors—novelty, capability, and technical feasibility. Novelty evaluates the originality of the idea, capability assesses its potential impact, and technical feasibility gauges its practical implementation. </strong></p><p><br></p><p><strong>﻿Ensure your input demonstrates a balance of innovation, effectiveness, and realistic execution to receive a comprehensive evaluation.</strong></p>', 'This template refine ideas for specific industries by specifying technologies, market segments, and end users with clarity and precision.', '2024-01-01 16:16:07.000000'),
(4, 'PMR Preparation', '<p>Primary Market Research Preparation</p><p><br></p><p><strong>Proper Mindset:</strong></p><p><em>Approach with an inquisitive mindset, avoiding assumptions and advocating ideas. Embrace the learning process to discover unknown aspects of customer needs, potentially revising end-user segment definitions.</em></p><p><br></p><p><strong>Fill out all highlighted fields in yellow before submitting.</strong></p><p><br></p><p><br></p><ol><li>Profile(s) of the people you want to engage with:</li><li>Identify the top 2 end user segments, gathering preliminary information.</li></ol><p><br></p><p><strong>Top 1 End User Segment:</strong></p><p>(Lastname, Firstname) Background related to the problem, product, or solution.</p><p>[Complete information for 1-10 individuals]</p><p><br></p><p><strong>Top 2 End User Segment:</strong></p><p>(Lastname, Firstname) Background related to the problem, product, or solution.</p><p>[Complete information for 1-10 individuals]</p><p><br></p><p><strong>Experts:</strong></p><p>(Lastname, Firstname) Background related to the problem, product, or solution.</p><p>[Complete information for 1-10 individuals]</p><p><br></p><p><strong>Lead Customers:</strong></p><p>Size of Market (# of End Users in the country).</p><p>Competition/Alternatives (include competition available globally).</p><p><br></p><p><br></p><p><strong>Row Definitions:</strong></p><p><br></p><p><br></p><ul><li><em>Top End User Segment: T</em>he top 2 end user segments from End User Ranking.</li><li><em>20 End Users:</em> Individuals using the product, not the economic buyer. List users in the company or organization.</li><li><em>Background related to the product or solution: </em>One sentence describing the user\'s background and their ability to provide insights.</li><li><em>Expert: </em>Subject matter experts with reliable insights on the addressed problem and envisioned technology.</li><li><em>Lead Customers:</em> Influential customers whose purchase would set a precedent.</li><li>Size of Market (# of End Users): Estimate the number of end users.</li><li><em>Competition/Alternatives:</em> Identify competition and alternatives from the end user\'s perspective.</li></ul>', '<ol><li>Inquisitive Mindset: Maintain a curious approach, avoiding assumptions, and prioritize learning from customers during primary research.</li><li>Thorough Data Collection: Complete all highlighted fields in yellow to ensure comprehensive information for analysis.</li><li>End User Profiling: Clearly define the top two end user segments, providing background details for individuals in each segment.</li><li>Expert and Lead Customer Identification: List subject matter experts and influential lead customers, indicating their role and relevance.</li><li>Market Size Estimation: Provide an estimation of the market size in terms of end users, considering a relevant range (e.g., 10s, 100s, 1Ks, etc.).</li><li>Competition and Alternatives: Identify competitors and alternatives from the end user\'s perspective, including the \"do nothing\" option.</li><li>Partner Recognition: Acknowledge important partners or distributors crucial to fitting into the end user\'s workflow or business processes.</li><li>Clarity and Conciseness: Ensure that all responses are clear, concise, and contribute to a holistic understanding of the market landscape.</li><li>Continuous Review: Regularly revisit and update the collected information to reflect evolving market dynamics and insights.</li><li>Compliance: Adhere to the provided guidelines for a comprehensive and effective primary market research preparation.</li></ol><p><br></p><p><strong>Evaluation Criteria: The AI will assess each input based on three key factors—novelty, capability, and technical feasibility. Novelty evaluates the originality of the idea, capability assesses its potential impact, and technical feasibility gauges its practical implementation. </strong></p><p><br></p><p><strong>﻿Ensure your input demonstrates a balance of innovation, effectiveness, and realistic execution to receive a comprehensive evaluation.</strong></p>', 'This template Prepare for primary market research: Identify key end user segments, experts, lead customers, and vital partners for a comprehensive.', '2024-01-01 16:16:07.000000');

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_springproject`
--

CREATE TABLE `wildforge_api_springproject` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `score` double NOT NULL,
  `reason` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `team_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_springprojectboard`
--

CREATE TABLE `wildforge_api_springprojectboard` (
  `id` bigint(20) NOT NULL,
  `board_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `template_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `novelty` int(11) NOT NULL,
  `capability` int(11) NOT NULL,
  `technical_feasibility` int(11) NOT NULL,
  `feedback` longtext NOT NULL,
  `recommendation` longtext NOT NULL,
  `references` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `project_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_team`
--

CREATE TABLE `wildforge_api_team` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext DEFAULT NULL,
  `status` smallint(5) UNSIGNED DEFAULT NULL CHECK (`status` >= 0),
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_teammember`
--

CREATE TABLE `wildforge_api_teammember` (
  `id` bigint(20) NOT NULL,
  `role` smallint(5) UNSIGNED DEFAULT NULL CHECK (`role` >= 0),
  `status` smallint(5) UNSIGNED DEFAULT NULL CHECK (`status` >= 0),
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `class_member_id_id` bigint(20) DEFAULT NULL,
  `team_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_user`
--

CREATE TABLE `wildforge_api_user` (
  `id` bigint(20) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` smallint(5) UNSIGNED DEFAULT NULL CHECK (`role` >= 0),
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wildforge_api_user`
--

INSERT INTO `wildforge_api_user` (`id`, `last_login`, `is_superuser`, `is_staff`, `is_active`, `date_joined`, `first_name`, `last_name`, `email`, `password`, `role`, `date_created`, `date_updated`) VALUES
(1, '2024-02-02 13:52:00.677875', 0, 0, 1, '2024-02-02 13:49:12.407375', 'Admin', 'Admin', 'admin@gmail.com', 'pbkdf2_sha256$600000$l0e4362nMsj3PrvJRcgu1Q$cTE3bl6liisCqzPr5RcV6GFwS4wKQQ3eUT9cyqN6O/4=', 0, '2024-02-02 13:49:12.732358', '2024-02-02 13:49:12.732358');

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_user_groups`
--

CREATE TABLE `wildforge_api_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wildforge_api_user_user_permissions`
--

CREATE TABLE `wildforge_api_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_wildforge_api_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`);

--
-- Indexes for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  ADD KEY `token_blacklist_outs_user_id_83bc629a_fk_wildforge` (`user_id`);

--
-- Indexes for table `wildforge_api_activity`
--
ALTER TABLE `wildforge_api_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_activi_classroom_id_id_83f66ada_fk_wildforge` (`classroom_id_id`);

--
-- Indexes for table `wildforge_api_activitycomment`
--
ALTER TABLE `wildforge_api_activitycomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_activi_activity_id_id_93eeb3cb_fk_wildforge` (`activity_id_id`),
  ADD KEY `wildforge_api_activi_user_id_id_6d465fd6_fk_wildforge` (`user_id_id`);

--
-- Indexes for table `wildforge_api_activitytemplate`
--
ALTER TABLE `wildforge_api_activitytemplate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wildforge_api_activityworkattachment`
--
ALTER TABLE `wildforge_api_activityworkattachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_activi_activity_id_id_a0fc93af_fk_wildforge` (`activity_id_id`);

--
-- Indexes for table `wildforge_api_activity_team_id`
--
ALTER TABLE `wildforge_api_activity_team_id`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wildforge_api_activity_team_id_activity_id_team_id_72ba0a99_uniq` (`activity_id`,`team_id`),
  ADD KEY `wildforge_api_activi_team_id_1a1557f5_fk_wildforge` (`team_id`);

--
-- Indexes for table `wildforge_api_chatbot`
--
ALTER TABLE `wildforge_api_chatbot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_chatbo_classmember_id_id_c5643a79_fk_wildforge` (`classmember_id_id`);

--
-- Indexes for table `wildforge_api_chatbot_message_id`
--
ALTER TABLE `wildforge_api_chatbot_message_id`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wildforge_api_chatbot_me_chatbot_id_message_id_536c8343_uniq` (`chatbot_id`,`message_id`),
  ADD KEY `wildforge_api_chatbo_message_id_e1a54066_fk_wildforge` (`message_id`);

--
-- Indexes for table `wildforge_api_classmember`
--
ALTER TABLE `wildforge_api_classmember`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_classm_class_id_id_b1146650_fk_wildforge` (`class_id_id`),
  ADD KEY `wildforge_api_classm_user_id_id_aaab73b2_fk_wildforge` (`user_id_id`);

--
-- Indexes for table `wildforge_api_classroom`
--
ALTER TABLE `wildforge_api_classroom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_code` (`class_code`);

--
-- Indexes for table `wildforge_api_classroompe`
--
ALTER TABLE `wildforge_api_classroompe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_classr_peer_eval_id_id_9bcca07e_fk_wildforge` (`peer_eval_id_id`),
  ADD KEY `wildforge_api_classr_class_id_id_1981bc9c_fk_wildforge` (`class_id_id`);

--
-- Indexes for table `wildforge_api_classroompetaker`
--
ALTER TABLE `wildforge_api_classroompetaker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_classr_class_member_id_id_9fc8eef8_fk_wildforge` (`class_member_id_id`),
  ADD KEY `wildforge_api_classr_class_room_pe_id_id_9f9c1c45_fk_wildforge` (`class_room_pe_id_id`);

--
-- Indexes for table `wildforge_api_criteria`
--
ALTER TABLE `wildforge_api_criteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wildforge_api_feedback`
--
ALTER TABLE `wildforge_api_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_feedba_meeting_id_id_9cb1656f_fk_wildforge` (`meeting_id_id`),
  ADD KEY `wildforge_api_feedba_pitch_id_id_b2a38d02_fk_wildforge` (`pitch_id_id`);

--
-- Indexes for table `wildforge_api_meeting`
--
ALTER TABLE `wildforge_api_meeting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_meetin_owner_id_id_fb0d2e7e_fk_wildforge` (`owner_id_id`),
  ADD KEY `wildforge_api_meetin_classroom_id_id_0cc808fa_fk_wildforge` (`classroom_id_id`);

--
-- Indexes for table `wildforge_api_meetingcomment`
--
ALTER TABLE `wildforge_api_meetingcomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_meetin_classmember_id_id_65898e9b_fk_wildforge` (`classmember_id_id`);

--
-- Indexes for table `wildforge_api_meetingcriteria`
--
ALTER TABLE `wildforge_api_meetingcriteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_meetin_criteria_id_id_e22bcdcf_fk_wildforge` (`criteria_id_id`),
  ADD KEY `wildforge_api_meetin_meeting_id_id_05ee3855_fk_wildforge` (`meeting_id_id`);

--
-- Indexes for table `wildforge_api_meetingpresentor`
--
ALTER TABLE `wildforge_api_meetingpresentor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_meetin_meeting_id_id_dd98c94c_fk_wildforge` (`meeting_id_id`),
  ADD KEY `wildforge_api_meetin_pitch_id_id_004b8abf_fk_wildforge` (`pitch_id_id`);

--
-- Indexes for table `wildforge_api_meeting_meeting_comment_id`
--
ALTER TABLE `wildforge_api_meeting_meeting_comment_id`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wildforge_api_meeting_me_meeting_id_meetingcommen_daa54259_uniq` (`meeting_id`,`meetingcomment_id`),
  ADD KEY `wildforge_api_meetin_meetingcomment_id_0dacca64_fk_wildforge` (`meetingcomment_id`);

--
-- Indexes for table `wildforge_api_message`
--
ALTER TABLE `wildforge_api_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wildforge_api_peereval`
--
ALTER TABLE `wildforge_api_peereval`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wildforge_api_pitch`
--
ALTER TABLE `wildforge_api_pitch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_pitch_team_id_id_be519329_fk_wildforge_api_team_id` (`team_id_id`);

--
-- Indexes for table `wildforge_api_rating`
--
ALTER TABLE `wildforge_api_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_rating_classmember_id_id_6c19ed67_fk_wildforge` (`classmember_id_id`),
  ADD KEY `wildforge_api_rating_meeting_criteria_id__31cc6b40_fk_wildforge` (`meeting_criteria_id_id`),
  ADD KEY `wildforge_api_rating_meeting_id_id_5e778cc1_fk_wildforge` (`meeting_id_id`),
  ADD KEY `wildforge_api_rating_pitch_id_id_8a22bcd0_fk_wildforge` (`pitch_id_id`);

--
-- Indexes for table `wildforge_api_remark`
--
ALTER TABLE `wildforge_api_remark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_remark_classmember_id_id_952eb709_fk_wildforge` (`classmember_id_id`),
  ADD KEY `wildforge_api_remark_meeting_id_id_ca2349f6_fk_wildforge` (`meeting_id_id`),
  ADD KEY `wildforge_api_remark_pitch_id_id_6de219e6_fk_wildforge` (`pitch_id_id`);

--
-- Indexes for table `wildforge_api_springboardtemplate`
--
ALTER TABLE `wildforge_api_springboardtemplate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wildforge_api_springproject`
--
ALTER TABLE `wildforge_api_springproject`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `wildforge_api_projec_team_id_id_a0f32ae6_fk_wildforge` (`team_id_id`);

--
-- Indexes for table `wildforge_api_springprojectboard`
--
ALTER TABLE `wildforge_api_springprojectboard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_projec_project_id_id_7488c618_fk_wildforge` (`project_id_id`);

--
-- Indexes for table `wildforge_api_team`
--
ALTER TABLE `wildforge_api_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wildforge_api_teammember`
--
ALTER TABLE `wildforge_api_teammember`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wildforge_api_teamme_class_member_id_id_19457d3c_fk_wildforge` (`class_member_id_id`),
  ADD KEY `wildforge_api_teamme_team_id_id_01c52eaf_fk_wildforge` (`team_id_id`);

--
-- Indexes for table `wildforge_api_user`
--
ALTER TABLE `wildforge_api_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wildforge_api_user_groups`
--
ALTER TABLE `wildforge_api_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wildforge_api_user_groups_user_id_group_id_1f5afc83_uniq` (`user_id`,`group_id`),
  ADD KEY `wildforge_api_user_groups_group_id_c15fbd06_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `wildforge_api_user_user_permissions`
--
ALTER TABLE `wildforge_api_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wildforge_api_user_user__user_id_permission_id_77528255_uniq` (`user_id`,`permission_id`),
  ADD KEY `wildforge_api_user_u_permission_id_12d2fd14_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wildforge_api_activity`
--
ALTER TABLE `wildforge_api_activity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_activitycomment`
--
ALTER TABLE `wildforge_api_activitycomment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_activitytemplate`
--
ALTER TABLE `wildforge_api_activitytemplate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_activityworkattachment`
--
ALTER TABLE `wildforge_api_activityworkattachment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_activity_team_id`
--
ALTER TABLE `wildforge_api_activity_team_id`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_chatbot`
--
ALTER TABLE `wildforge_api_chatbot`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_chatbot_message_id`
--
ALTER TABLE `wildforge_api_chatbot_message_id`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_classmember`
--
ALTER TABLE `wildforge_api_classmember`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_classroom`
--
ALTER TABLE `wildforge_api_classroom`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_classroompe`
--
ALTER TABLE `wildforge_api_classroompe`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_classroompetaker`
--
ALTER TABLE `wildforge_api_classroompetaker`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_criteria`
--
ALTER TABLE `wildforge_api_criteria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_feedback`
--
ALTER TABLE `wildforge_api_feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_meeting`
--
ALTER TABLE `wildforge_api_meeting`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_meetingcomment`
--
ALTER TABLE `wildforge_api_meetingcomment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_meetingcriteria`
--
ALTER TABLE `wildforge_api_meetingcriteria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_meetingpresentor`
--
ALTER TABLE `wildforge_api_meetingpresentor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_meeting_meeting_comment_id`
--
ALTER TABLE `wildforge_api_meeting_meeting_comment_id`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_message`
--
ALTER TABLE `wildforge_api_message`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_peereval`
--
ALTER TABLE `wildforge_api_peereval`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_pitch`
--
ALTER TABLE `wildforge_api_pitch`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_rating`
--
ALTER TABLE `wildforge_api_rating`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_remark`
--
ALTER TABLE `wildforge_api_remark`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_springboardtemplate`
--
ALTER TABLE `wildforge_api_springboardtemplate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wildforge_api_springproject`
--
ALTER TABLE `wildforge_api_springproject`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_springprojectboard`
--
ALTER TABLE `wildforge_api_springprojectboard`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_team`
--
ALTER TABLE `wildforge_api_team`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_teammember`
--
ALTER TABLE `wildforge_api_teammember`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_user`
--
ALTER TABLE `wildforge_api_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wildforge_api_user_groups`
--
ALTER TABLE `wildforge_api_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wildforge_api_user_user_permissions`
--
ALTER TABLE `wildforge_api_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_wildforge_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `wildforge_api_user` (`id`);

--
-- Constraints for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  ADD CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`);

--
-- Constraints for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  ADD CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_wildforge` FOREIGN KEY (`user_id`) REFERENCES `wildforge_api_user` (`id`);

--
-- Constraints for table `wildforge_api_activity`
--
ALTER TABLE `wildforge_api_activity`
  ADD CONSTRAINT `wildforge_api_activi_classroom_id_id_83f66ada_fk_wildforge` FOREIGN KEY (`classroom_id_id`) REFERENCES `wildforge_api_classroom` (`id`);

--
-- Constraints for table `wildforge_api_activitycomment`
--
ALTER TABLE `wildforge_api_activitycomment`
  ADD CONSTRAINT `wildforge_api_activi_activity_id_id_93eeb3cb_fk_wildforge` FOREIGN KEY (`activity_id_id`) REFERENCES `wildforge_api_activity` (`id`),
  ADD CONSTRAINT `wildforge_api_activi_user_id_id_6d465fd6_fk_wildforge` FOREIGN KEY (`user_id_id`) REFERENCES `wildforge_api_user` (`id`);

--
-- Constraints for table `wildforge_api_activityworkattachment`
--
ALTER TABLE `wildforge_api_activityworkattachment`
  ADD CONSTRAINT `wildforge_api_activi_activity_id_id_a0fc93af_fk_wildforge` FOREIGN KEY (`activity_id_id`) REFERENCES `wildforge_api_activity` (`id`);

--
-- Constraints for table `wildforge_api_activity_team_id`
--
ALTER TABLE `wildforge_api_activity_team_id`
  ADD CONSTRAINT `wildforge_api_activi_activity_id_ef47ba46_fk_wildforge` FOREIGN KEY (`activity_id`) REFERENCES `wildforge_api_activity` (`id`),
  ADD CONSTRAINT `wildforge_api_activi_team_id_1a1557f5_fk_wildforge` FOREIGN KEY (`team_id`) REFERENCES `wildforge_api_team` (`id`);

--
-- Constraints for table `wildforge_api_chatbot`
--
ALTER TABLE `wildforge_api_chatbot`
  ADD CONSTRAINT `wildforge_api_chatbo_classmember_id_id_c5643a79_fk_wildforge` FOREIGN KEY (`classmember_id_id`) REFERENCES `wildforge_api_classmember` (`id`);

--
-- Constraints for table `wildforge_api_chatbot_message_id`
--
ALTER TABLE `wildforge_api_chatbot_message_id`
  ADD CONSTRAINT `wildforge_api_chatbo_chatbot_id_e43db318_fk_wildforge` FOREIGN KEY (`chatbot_id`) REFERENCES `wildforge_api_chatbot` (`id`),
  ADD CONSTRAINT `wildforge_api_chatbo_message_id_e1a54066_fk_wildforge` FOREIGN KEY (`message_id`) REFERENCES `wildforge_api_message` (`id`);

--
-- Constraints for table `wildforge_api_classmember`
--
ALTER TABLE `wildforge_api_classmember`
  ADD CONSTRAINT `wildforge_api_classm_class_id_id_b1146650_fk_wildforge` FOREIGN KEY (`class_id_id`) REFERENCES `wildforge_api_classroom` (`id`),
  ADD CONSTRAINT `wildforge_api_classm_user_id_id_aaab73b2_fk_wildforge` FOREIGN KEY (`user_id_id`) REFERENCES `wildforge_api_user` (`id`);

--
-- Constraints for table `wildforge_api_classroompe`
--
ALTER TABLE `wildforge_api_classroompe`
  ADD CONSTRAINT `wildforge_api_classr_class_id_id_1981bc9c_fk_wildforge` FOREIGN KEY (`class_id_id`) REFERENCES `wildforge_api_classroom` (`id`),
  ADD CONSTRAINT `wildforge_api_classr_peer_eval_id_id_9bcca07e_fk_wildforge` FOREIGN KEY (`peer_eval_id_id`) REFERENCES `wildforge_api_peereval` (`id`);

--
-- Constraints for table `wildforge_api_classroompetaker`
--
ALTER TABLE `wildforge_api_classroompetaker`
  ADD CONSTRAINT `wildforge_api_classr_class_member_id_id_9fc8eef8_fk_wildforge` FOREIGN KEY (`class_member_id_id`) REFERENCES `wildforge_api_classmember` (`id`),
  ADD CONSTRAINT `wildforge_api_classr_class_room_pe_id_id_9f9c1c45_fk_wildforge` FOREIGN KEY (`class_room_pe_id_id`) REFERENCES `wildforge_api_classroompe` (`id`);

--
-- Constraints for table `wildforge_api_feedback`
--
ALTER TABLE `wildforge_api_feedback`
  ADD CONSTRAINT `wildforge_api_feedba_meeting_id_id_9cb1656f_fk_wildforge` FOREIGN KEY (`meeting_id_id`) REFERENCES `wildforge_api_meeting` (`id`),
  ADD CONSTRAINT `wildforge_api_feedba_pitch_id_id_b2a38d02_fk_wildforge` FOREIGN KEY (`pitch_id_id`) REFERENCES `wildforge_api_pitch` (`id`);

--
-- Constraints for table `wildforge_api_meeting`
--
ALTER TABLE `wildforge_api_meeting`
  ADD CONSTRAINT `wildforge_api_meetin_classroom_id_id_0cc808fa_fk_wildforge` FOREIGN KEY (`classroom_id_id`) REFERENCES `wildforge_api_classroom` (`id`),
  ADD CONSTRAINT `wildforge_api_meetin_owner_id_id_fb0d2e7e_fk_wildforge` FOREIGN KEY (`owner_id_id`) REFERENCES `wildforge_api_classmember` (`id`);

--
-- Constraints for table `wildforge_api_meetingcomment`
--
ALTER TABLE `wildforge_api_meetingcomment`
  ADD CONSTRAINT `wildforge_api_meetin_classmember_id_id_65898e9b_fk_wildforge` FOREIGN KEY (`classmember_id_id`) REFERENCES `wildforge_api_classmember` (`id`);

--
-- Constraints for table `wildforge_api_meetingcriteria`
--
ALTER TABLE `wildforge_api_meetingcriteria`
  ADD CONSTRAINT `wildforge_api_meetin_criteria_id_id_e22bcdcf_fk_wildforge` FOREIGN KEY (`criteria_id_id`) REFERENCES `wildforge_api_criteria` (`id`),
  ADD CONSTRAINT `wildforge_api_meetin_meeting_id_id_05ee3855_fk_wildforge` FOREIGN KEY (`meeting_id_id`) REFERENCES `wildforge_api_meeting` (`id`);

--
-- Constraints for table `wildforge_api_meetingpresentor`
--
ALTER TABLE `wildforge_api_meetingpresentor`
  ADD CONSTRAINT `wildforge_api_meetin_meeting_id_id_dd98c94c_fk_wildforge` FOREIGN KEY (`meeting_id_id`) REFERENCES `wildforge_api_meeting` (`id`),
  ADD CONSTRAINT `wildforge_api_meetin_pitch_id_id_004b8abf_fk_wildforge` FOREIGN KEY (`pitch_id_id`) REFERENCES `wildforge_api_pitch` (`id`);

--
-- Constraints for table `wildforge_api_meeting_meeting_comment_id`
--
ALTER TABLE `wildforge_api_meeting_meeting_comment_id`
  ADD CONSTRAINT `wildforge_api_meetin_meeting_id_4b41709b_fk_wildforge` FOREIGN KEY (`meeting_id`) REFERENCES `wildforge_api_meeting` (`id`),
  ADD CONSTRAINT `wildforge_api_meetin_meetingcomment_id_0dacca64_fk_wildforge` FOREIGN KEY (`meetingcomment_id`) REFERENCES `wildforge_api_meetingcomment` (`id`);

--
-- Constraints for table `wildforge_api_pitch`
--
ALTER TABLE `wildforge_api_pitch`
  ADD CONSTRAINT `wildforge_api_pitch_team_id_id_be519329_fk_wildforge_api_team_id` FOREIGN KEY (`team_id_id`) REFERENCES `wildforge_api_team` (`id`);

--
-- Constraints for table `wildforge_api_rating`
--
ALTER TABLE `wildforge_api_rating`
  ADD CONSTRAINT `wildforge_api_rating_classmember_id_id_6c19ed67_fk_wildforge` FOREIGN KEY (`classmember_id_id`) REFERENCES `wildforge_api_classmember` (`id`),
  ADD CONSTRAINT `wildforge_api_rating_meeting_criteria_id__31cc6b40_fk_wildforge` FOREIGN KEY (`meeting_criteria_id_id`) REFERENCES `wildforge_api_criteria` (`id`),
  ADD CONSTRAINT `wildforge_api_rating_meeting_id_id_5e778cc1_fk_wildforge` FOREIGN KEY (`meeting_id_id`) REFERENCES `wildforge_api_meeting` (`id`),
  ADD CONSTRAINT `wildforge_api_rating_pitch_id_id_8a22bcd0_fk_wildforge` FOREIGN KEY (`pitch_id_id`) REFERENCES `wildforge_api_pitch` (`id`);

--
-- Constraints for table `wildforge_api_remark`
--
ALTER TABLE `wildforge_api_remark`
  ADD CONSTRAINT `wildforge_api_remark_classmember_id_id_952eb709_fk_wildforge` FOREIGN KEY (`classmember_id_id`) REFERENCES `wildforge_api_classmember` (`id`),
  ADD CONSTRAINT `wildforge_api_remark_meeting_id_id_ca2349f6_fk_wildforge` FOREIGN KEY (`meeting_id_id`) REFERENCES `wildforge_api_meeting` (`id`),
  ADD CONSTRAINT `wildforge_api_remark_pitch_id_id_6de219e6_fk_wildforge` FOREIGN KEY (`pitch_id_id`) REFERENCES `wildforge_api_pitch` (`id`);

--
-- Constraints for table `wildforge_api_springproject`
--
ALTER TABLE `wildforge_api_springproject`
  ADD CONSTRAINT `wildforge_api_projec_team_id_id_a0f32ae6_fk_wildforge` FOREIGN KEY (`team_id_id`) REFERENCES `wildforge_api_team` (`id`);

--
-- Constraints for table `wildforge_api_springprojectboard`
--
ALTER TABLE `wildforge_api_springprojectboard`
  ADD CONSTRAINT `wildforge_api_projec_project_id_id_7488c618_fk_wildforge` FOREIGN KEY (`project_id_id`) REFERENCES `wildforge_api_springproject` (`id`);

--
-- Constraints for table `wildforge_api_teammember`
--
ALTER TABLE `wildforge_api_teammember`
  ADD CONSTRAINT `wildforge_api_teamme_class_member_id_id_19457d3c_fk_wildforge` FOREIGN KEY (`class_member_id_id`) REFERENCES `wildforge_api_classmember` (`id`),
  ADD CONSTRAINT `wildforge_api_teamme_team_id_id_01c52eaf_fk_wildforge` FOREIGN KEY (`team_id_id`) REFERENCES `wildforge_api_team` (`id`);

--
-- Constraints for table `wildforge_api_user_groups`
--
ALTER TABLE `wildforge_api_user_groups`
  ADD CONSTRAINT `wildforge_api_user_g_user_id_73b188c8_fk_wildforge` FOREIGN KEY (`user_id`) REFERENCES `wildforge_api_user` (`id`),
  ADD CONSTRAINT `wildforge_api_user_groups_group_id_c15fbd06_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `wildforge_api_user_user_permissions`
--
ALTER TABLE `wildforge_api_user_user_permissions`
  ADD CONSTRAINT `wildforge_api_user_u_permission_id_12d2fd14_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `wildforge_api_user_u_user_id_6f1853ae_fk_wildforge` FOREIGN KEY (`user_id`) REFERENCES `wildforge_api_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
