/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : thcs_lytutrong_db

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 02/03/2026 21:47:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for nv4_authors
-- ----------------------------
DROP TABLE IF EXISTS `nv4_authors`;
CREATE TABLE `nv4_authors`  (
  `admin_id` int UNSIGNED NOT NULL,
  `editor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `lev` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `files_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'siteinfo',
  `admin_theme` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `addtime` int NOT NULL DEFAULT 0,
  `edittime` int NOT NULL DEFAULT 0,
  `is_suspend` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `susp_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `pre_check_num` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pre_last_login` int UNSIGNED NOT NULL DEFAULT 0,
  `pre_last_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `pre_last_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `check_num` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_login` int UNSIGNED NOT NULL DEFAULT 0,
  `last_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `last_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_authors
-- ----------------------------
INSERT INTO `nv4_authors` VALUES (1, 'ckeditor5-classic', 1, 'adobe,archives,audio,documents,flash,images,real,video|1|1|1', 'Administrator', 'siteinfo', '', 0, 0, 0, '', '', 0, '', '', '98b21302405330ef6ab2a86a6822a7fd', 1772429250, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0');

-- ----------------------------
-- Table structure for nv4_authors_api_credential
-- ----------------------------
DROP TABLE IF EXISTS `nv4_authors_api_credential`;
CREATE TABLE `nv4_authors_api_credential`  (
  `admin_id` int UNSIGNED NOT NULL,
  `credential_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `credential_ident` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `credential_secret` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `credential_ips` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `auth_method` enum('none','password_verify') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'password_verify' COMMENT 'Phương thức xác thực',
  `api_roles` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `addtime` int NOT NULL DEFAULT 0,
  `edittime` int NOT NULL DEFAULT 0,
  `last_access` int NOT NULL DEFAULT 0,
  UNIQUE INDEX `credential_ident`(`credential_ident`) USING BTREE,
  UNIQUE INDEX `credential_secret`(`credential_secret`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Bảng lưu key API của quản trị' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_authors_api_credential
-- ----------------------------

-- ----------------------------
-- Table structure for nv4_authors_api_role
-- ----------------------------
DROP TABLE IF EXISTS `nv4_authors_api_role`;
CREATE TABLE `nv4_authors_api_role`  (
  `role_id` smallint NOT NULL AUTO_INCREMENT,
  `role_title` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `role_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `addtime` int NOT NULL DEFAULT 0,
  `edittime` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Bảng lưu quyền truy cập API' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_authors_api_role
-- ----------------------------

-- ----------------------------
-- Table structure for nv4_authors_config
-- ----------------------------
DROP TABLE IF EXISTS `nv4_authors_config`;
CREATE TABLE `nv4_authors_config`  (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `keyname` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mask` tinyint NOT NULL DEFAULT 0,
  `begintime` int UNSIGNED NOT NULL DEFAULT 0,
  `endtime` int UNSIGNED NOT NULL DEFAULT 0,
  `notice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `keyname`(`keyname`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_authors_config
-- ----------------------------

-- ----------------------------
-- Table structure for nv4_authors_module
-- ----------------------------
DROP TABLE IF EXISTS `nv4_authors_module`;
CREATE TABLE `nv4_authors_module`  (
  `mid` mediumint NOT NULL AUTO_INCREMENT,
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `weight` mediumint NOT NULL DEFAULT 0,
  `act_1` tinyint NOT NULL DEFAULT 0,
  `act_2` tinyint NOT NULL DEFAULT 1,
  `act_3` tinyint NOT NULL DEFAULT 1,
  `checksum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  PRIMARY KEY (`mid`) USING BTREE,
  UNIQUE INDEX `module`(`module`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_authors_module
-- ----------------------------
INSERT INTO `nv4_authors_module` VALUES (1, 'siteinfo', 'mod_siteinfo', 1, 1, 1, 1, '1bc45c6f12d6a66e6297c36761483a2f');
INSERT INTO `nv4_authors_module` VALUES (2, 'authors', 'mod_authors', 2, 1, 1, 1, '3d5afd88a8a3684fb7644c504c87c28b');
INSERT INTO `nv4_authors_module` VALUES (3, 'settings', 'mod_settings', 3, 1, 1, 0, 'd994f64c0181cef70800b299452c51df');
INSERT INTO `nv4_authors_module` VALUES (4, 'database', 'mod_database', 4, 1, 0, 0, 'a17135f7a35745216463ad2aef3d2678');
INSERT INTO `nv4_authors_module` VALUES (5, 'webtools', 'mod_webtools', 5, 1, 1, 0, 'ccf1903a59a12901a277a69897b17c52');
INSERT INTO `nv4_authors_module` VALUES (6, 'seotools', 'mod_seotools', 6, 1, 1, 0, 'b2a54e3a399576a085bb9222c0b13a8e');
INSERT INTO `nv4_authors_module` VALUES (7, 'language', 'mod_language', 7, 1, 1, 0, '4898a5014a01ef695479e00326512737');
INSERT INTO `nv4_authors_module` VALUES (8, 'modules', 'mod_modules', 8, 1, 1, 0, 'af04f0d94815128d3cae73d4fd1f5188');
INSERT INTO `nv4_authors_module` VALUES (9, 'themes', 'mod_themes', 9, 1, 1, 0, '3fbcde378ceef40198b2d1ae78525bf2');
INSERT INTO `nv4_authors_module` VALUES (10, 'extensions', 'mod_extensions', 10, 1, 0, 0, '552092b03669ccc34252b77641300a93');
INSERT INTO `nv4_authors_module` VALUES (11, 'upload', 'mod_upload', 11, 1, 1, 1, '6ad9648eecb85fa34cc1836a5c924b54');
INSERT INTO `nv4_authors_module` VALUES (12, 'zalo', 'mod_zalo', 12, 1, 1, 0, '224ac2311496886018c5472c00470692');

-- ----------------------------
-- Table structure for nv4_authors_oauth
-- ----------------------------
DROP TABLE IF EXISTS `nv4_authors_oauth`;
CREATE TABLE `nv4_authors_oauth`  (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int UNSIGNED NOT NULL COMMENT 'ID của quản trị',
  `oauth_server` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Eg: facebook, google...',
  `oauth_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ID duy nhất ứng với server',
  `oauth_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email',
  `oauth_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `addtime` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_id`(`admin_id`, `oauth_server`, `oauth_uid`) USING BTREE,
  INDEX `oauth_email`(`oauth_email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Bảng lưu xác thực 2 bước từ oauth của admin' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_authors_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for nv4_banners_click
-- ----------------------------
DROP TABLE IF EXISTS `nv4_banners_click`;
CREATE TABLE `nv4_banners_click`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `bid` mediumint NOT NULL DEFAULT 0,
  `click_time` int UNSIGNED NOT NULL DEFAULT 0,
  `click_day` int NOT NULL,
  `click_ip` varchar(46) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_country` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_browse_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_browse_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_os_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_os_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_ref` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bid`(`bid`) USING BTREE,
  INDEX `click_day`(`click_day`) USING BTREE,
  INDEX `click_ip`(`click_ip`) USING BTREE,
  INDEX `click_country`(`click_country`) USING BTREE,
  INDEX `click_browse_key`(`click_browse_key`) USING BTREE,
  INDEX `click_os_key`(`click_os_key`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_banners_click
-- ----------------------------
INSERT INTO `nv4_banners_click` VALUES (1, 2, 1772423776, 0, '::1', 'ZZ', '', 'edge', '', 'Windows 10', 'http://localhost/thcs_lytutrong/en/about/chao-mung-den-voi-thcs-ly-tu-trong.html');
INSERT INTO `nv4_banners_click` VALUES (2, 1, 1772429884, 0, '::1', 'ZZ', '', 'edge', '', 'Windows 10', 'http://localhost/thcs_lytutrong/en/');

-- ----------------------------
-- Table structure for nv4_banners_plans
-- ----------------------------
DROP TABLE IF EXISTS `nv4_banners_plans`;
CREATE TABLE `nv4_banners_plans`  (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `blang` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `title` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `form` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` smallint UNSIGNED NOT NULL DEFAULT 0,
  `height` smallint UNSIGNED NOT NULL DEFAULT 0,
  `act` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `require_image` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `uploadtype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uploadgroup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exp_time` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_banners_plans
-- ----------------------------
INSERT INTO `nv4_banners_plans` VALUES (1, '', 'Mid-page ad block', '', 'sequential', 575, 72, 1, 1, 'images', '', 0);
INSERT INTO `nv4_banners_plans` VALUES (2, '', 'Left-column ad block', '', 'sequential', 212, 800, 1, 1, 'images', '', 0);
INSERT INTO `nv4_banners_plans` VALUES (3, '', 'Right-column ad block', '', 'random', 250, 500, 1, 1, 'images', '', 0);

-- ----------------------------
-- Table structure for nv4_banners_rows
-- ----------------------------
DROP TABLE IF EXISTS `nv4_banners_rows`;
CREATE TABLE `nv4_banners_rows`  (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pid` smallint UNSIGNED NOT NULL DEFAULT 0,
  `clid` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_ext` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_mime` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` int UNSIGNED NOT NULL DEFAULT 0,
  `height` int UNSIGNED NOT NULL DEFAULT 0,
  `file_alt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `imageforswf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `click_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `target` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_blank',
  `bannerhtml` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_time` int UNSIGNED NOT NULL DEFAULT 0,
  `publ_time` int UNSIGNED NOT NULL DEFAULT 0,
  `exp_time` int UNSIGNED NOT NULL DEFAULT 0,
  `hits_total` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `act` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `weight` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `clid`(`clid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_banners_rows
-- ----------------------------
INSERT INTO `nv4_banners_rows` VALUES (1, 'Mid-page advertisement', 1, 1, 'webnhanh.jpg', 'png', 'image/jpeg', 575, 72, '', '', 'http://webnhanh.vn', '_blank', '', 1772423300, 1772423300, 0, 1, 1, 1);
INSERT INTO `nv4_banners_rows` VALUES (2, 'Left-column advertisement', 2, 1, 'vinades.jpg', 'jpg', 'image/jpeg', 212, 400, '', '', 'https://vinades.vn', '_blank', '', 1772423300, 1772423300, 0, 1, 1, 2);

-- ----------------------------
-- Table structure for nv4_config
-- ----------------------------
DROP TABLE IF EXISTS `nv4_config`;
CREATE TABLE `nv4_config`  (
  `lang` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sys',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'global',
  `config_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `config_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  UNIQUE INDEX `lang`(`lang`, `module`, `config_name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_config
-- ----------------------------
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'admin_theme', 'admin_default');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'date_pattern', 'l, d/m/Y');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'time_pattern', 'H:i');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'online_upd', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'statistic', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'site_phone', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'mailer_mode', 'mail');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'smtp_host', 'smtp.gmail.com');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'smtp_ssl', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'smtp_port', '465');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'verify_peer_ssl', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'verify_peer_name_ssl', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'smtp_username', 'user@gmail.com');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'smtp_password', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'sender_name', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'sender_email', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'reply_name', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'reply_email', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'force_sender', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'force_reply', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'notify_email_error', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'googleAnalyticsID', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'googleAnalyticsSetDomainName', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'googleAnalyticsMethod', 'classic');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'googleAnalytics4ID', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'searchEngineUniqueID', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'zaloOfficialAccountID', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'zaloAppID', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'zaloAppSecretKey', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'zaloOAAccessToken', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'zaloOARefreshToken', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'zaloOAAccessTokenTime', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'metaTagsOgp', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'pageTitleMode', 'pagetitle');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'description_length', '170');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_unickmin', '4');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_unickmax', '20');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_upassmin', '8');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_upassmax', '32');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'dir_forum', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_unick_type', '4');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_upass_type', '3');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'allowmailchange', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'allowuserpublic', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'allowquestion', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'allowloginchange', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'allowuserlogin', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'allowuserloginmulti', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'allowuserreg', '2');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'is_user_forum', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'openid_servers', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'openid_processing', 'connect,create,auto');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'user_check_pass_time', '1800');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'auto_login_after_reg', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'whoviewuser', '2');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'ssl_https', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'facebook_client_id', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'facebook_client_secret', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'google_client_id', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'google_client_secret', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'referer_blocker', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'private_site', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'max_user_admin', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'max_user_number', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'captcha_area', 'r,m,p');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'captcha_type', 'captcha');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'dkim_included', 'sendmail,mail');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'smime_included', 'sendmail,mail');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_csp', 'script-src &#039;self&#039; *.google.com *.google-analytics.com *.googletagmanager.com *.gstatic.com *.facebook.com *.facebook.net *.twitter.com *.zalo.me *.zaloapp.com *.tawk.to *.cloudflareinsights.com &#039;unsafe-inline&#039; &#039;unsafe-hashes&#039; &#039;unsafe-eval&#039;;object-src &#039;self&#039;;style-src &#039;self&#039; *.google.com *.googleapis.com *.tawk.to &#039;unsafe-inline&#039;;img-src &#039;self&#039; data: *.twitter.com *.google.com *.googleapis.com *.gstatic.com *.facebook.com tawk.link *.tawk.to static.nukeviet.vn;media-src &#039;self&#039; *.tawk.to;frame-src &#039;self&#039; *.google.com *.youtube.com *.facebook.com *.facebook.net *.twitter.com *.zalo.me *.live.com;font-src &#039;self&#039; *.googleapis.com *.gstatic.com *.tawk.to;connect-src &#039;self&#039; *.zalo.me *.tawk.to wss://*.tawk.to *.ckeditor.com;form-action &#039;self&#039; *.google.com;base-uri &#039;self&#039;;');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_csp_act', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_rp', 'no-referrer-when-downgrade, strict-origin-when-cross-origin');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_rp_act', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_pp', 'accelerometer=(self), autoplay=(self \"https://youtube.com\" \"https://www.youtube.com\" \"https://*.youtube.com\"), camera=(self), display-capture=(self), encrypted-media=(self), fullscreen=(self \"https://youtube.com\" \"https://www.youtube.com\" \"https://*.youtube.com\"), gamepad=(self), geolocation=(self), gyroscope=(self), hid=(self), identity-credentials-get=(self), idle-detection=(self), local-fonts=(self), magnetometer=(self), microphone=(self), midi=(self), otp-credentials=(self), payment=(self), picture-in-picture=(self \"https://youtube.com\" \"https://www.youtube.com\" \"https://*.youtube.com\"), publickey-credentials-get=(self), screen-wake-lock=(self), serial=(self), storage-access=(self), usb=(self), web-share=(self), window-management=(self), xr-spatial-tracking=(self)');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_pp_act', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_fp', 'accelerometer \'self\'; autoplay \'self\' https://youtube.com https://www.youtube.com; camera \'self\'; display-capture \'self\'; encrypted-media \'self\'; fullscreen \'self\' https://youtube.com https://www.youtube.com; gamepad \'self\'; geolocation \'self\'; gyroscope \'self\'; hid \'self\'; identity-credentials-get \'self\'; idle-detection \'self\'; local-fonts \'self\'; magnetometer \'self\'; microphone \'self\'; midi \'self\'; otp-credentials \'self\'; payment \'self\'; picture-in-picture \'self\' https://youtube.com https://www.youtube.com; publickey-credentials-get \'self\'; screen-wake-lock \'self\'; serial \'self\'; storage-access \'self\'; usb \'self\'; web-share \'self\'; window-management \'self\'; xr-spatial-tracking \'self\'');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'nv_fp_act', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'ogp_image', '');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'over_capacity', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'show_folder_size', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'define', 'nv_gfx_num', '6');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'closed_site', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'site_reopening_time', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'notification_active', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'notification_autodel', '15');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'site_keywords', 'NukeViet, portal, mysql, php');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'block_admin_ip', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'admfirewall', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'dump_autobackup', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'dump_backup_ext', 'gz');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'dump_backup_day', '30');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'file_allowed_ext', 'adobe,archives,audio,documents,flash,images,real,video');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'forbid_extensions', 'htm,html,htmls,js,php,php3,php4,php5,phtml,inc');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'forbid_mimes', 'application/ecmascript,application/javascript,application/x-javascript,text/ecmascript,text/html,text/javascript,application/x-httpd-php,application/x-httpd-php-source,application/php,application/x-php,text/php,text/x-php');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'nv_max_size', '41943040');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'nv_overflow_size', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'upload_checking_mode', 'strong');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'upload_alt_require', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'upload_auto_alt', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'upload_chunk_size', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'useactivate', '2');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'allow_sitelangs', 'en');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'read_type', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'rewrite_enable', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'rewrite_optional', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'rewrite_endurl', '/');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'rewrite_exturl', '.html');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'rewrite_op_mod', '');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'autocheckupdate', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'autoupdatetime', '24');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'gzip_method', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'authors_detail_main', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'spadmin_add_admin', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'timestamp', '1772423300');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'version', '4.5.07');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'cookie_httponly', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'admin_check_pass_time', '1800');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'cookie_secure', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'cookie_SameSite', 'Lax');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'cookie_share', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'is_flood_blocker', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'max_requests_60', '40');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'max_requests_300', '150');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'is_login_blocker', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'login_number_tracking', '5');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'login_time_tracking', '5');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'login_time_ban', '30');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'nv_display_errors_list', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'display_errors_list', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'nv_auto_resize', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'dump_interval', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'nv_static_url', '');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'cdn_url', '');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'two_step_verification', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'admin_2step_opt', 'code');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'admin_2step_default', 'code');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'recaptcha_sitekey', '');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'recaptcha_secretkey', '');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'recaptcha_type', 'image');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'recaptcha_ver', '2');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'users_special', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'crosssite_restrict', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'crosssite_valid_domains', '');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'crosssite_valid_ips', '');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'crossadmin_restrict', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'crossadmin_valid_domains', '');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'crossadmin_valid_ips', '');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'domains_whitelist', '[\"youtube.com\",\"www.youtube.com\",\"google.com\",\"www.google.com\",\"drive.google.com\",\"docs.google.com\",\"view.officeapps.live.com\"]');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'domains_restrict', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'remote_api_access', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'remote_api_log', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'api_check_time', '5');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'allow_null_origin', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'ip_allow_null_origin', '');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'cookie_notice_popup', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'XSSsanitize', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'admin_XSSsanitize', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'define', 'nv_gfx_width', '150');
INSERT INTO `nv4_config` VALUES ('sys', 'define', 'nv_gfx_height', '40');
INSERT INTO `nv4_config` VALUES ('sys', 'define', 'nv_max_width', '1500');
INSERT INTO `nv4_config` VALUES ('sys', 'define', 'nv_max_height', '1500');
INSERT INTO `nv4_config` VALUES ('sys', 'define', 'nv_mobile_mode_img', '480');
INSERT INTO `nv4_config` VALUES ('sys', 'define', 'nv_live_cookie_time', '31104000');
INSERT INTO `nv4_config` VALUES ('sys', 'define', 'nv_live_session_time', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'define', 'nv_anti_iframe', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'define', 'nv_anti_agent', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'define', 'nv_allowed_html_tags', 'embed, object, param, a, b, blockquote, br, caption, col, colgroup, div, em, h1, h2, h3, h4, h5, h6, hr, i, img, li, p, span, strong, s, sub, sup, table, tbody, td, th, tr, u, ul, ol, iframe, figure, figcaption, video, audio, source, track, code, pre, mark');
INSERT INTO `nv4_config` VALUES ('sys', 'define', 'nv_debug', '1');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'site_domain', '');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'site_name', 'THCS Lý Tự Trọng');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'site_logo', '');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'site_banner', '');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'site_favicon', '');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'site_description', 'Sharing success, connect passions');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'site_keywords', '');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'theme_type', 'r,m,d');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'site_theme', 'default');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'preview_theme', '');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'user_allowed_theme', '');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'mobile_theme', 'mobile_default');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'site_home_module', 'news');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'switch_mobi_des', '1');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'upload_logo', '');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'upload_logo_pos', 'bottomRight');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'autologosize1', '50');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'autologosize2', '40');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'autologosize3', '30');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'autologomod', '');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'name_show', '1');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'cronjobs_next_time', '1772430192');
INSERT INTO `nv4_config` VALUES ('en', 'global', 'disable_site_content', '<p>For technical reasons Web site temporary not available. we are very sorry for that inconvenience!</p>');
INSERT INTO `nv4_config` VALUES ('en', 'seotools', 'prcservice', '');
INSERT INTO `nv4_config` VALUES ('en', 'about', 'auto_postcomm', '1');
INSERT INTO `nv4_config` VALUES ('en', 'about', 'allowed_comm', '-1');
INSERT INTO `nv4_config` VALUES ('en', 'about', 'view_comm', '6');
INSERT INTO `nv4_config` VALUES ('en', 'about', 'setcomm', '4');
INSERT INTO `nv4_config` VALUES ('en', 'about', 'activecomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'about', 'emailcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'about', 'adminscomm', '');
INSERT INTO `nv4_config` VALUES ('en', 'about', 'sortcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'about', 'captcha_area_comm', '1');
INSERT INTO `nv4_config` VALUES ('en', 'about', 'perpagecomm', '5');
INSERT INTO `nv4_config` VALUES ('en', 'about', 'timeoutcomm', '360');
INSERT INTO `nv4_config` VALUES ('en', 'about', 'allowattachcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'about', 'alloweditorcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'indexfile', 'viewcat_main_right');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'mobile_indexfile', 'viewcat_page_new');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'per_page', '20');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'st_links', '10');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'homewidth', '100');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'homeheight', '150');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'blockwidth', '70');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'blockheight', '75');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'imagefull', '460');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'copyright', 'Note: The above article reprinted at the website or other media sources not specify the source https://nukeviet.vn is copyright infringement');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'showtooltip', '1');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'tooltip_position', 'bottom');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'tooltip_length', '150');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'showhometext', '1');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'timecheckstatus', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'config_source', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'show_no_image', '');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'allowed_rating', '1');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'allowed_rating_point', '1');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'facebookappid', '');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'socialbutton', 'facebook,twitter');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'alias_lower', '1');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'tags_alias', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'auto_tags', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'tags_remind', '1');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'keywords_tag', '1');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'copy_news', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'structure_upload', 'Ym');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'imgposition', '2');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'htmlhometext', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'order_articles', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'identify_cat_change', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'active_history', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'hide_author', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'hide_inauthor', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'elas_use', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'elas_host', '');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'elas_port', '9200');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'elas_index', '');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'instant_articles_active', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'instant_articles_template', 'default');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'instant_articles_httpauth', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'instant_articles_username', '');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'instant_articles_password', '');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'instant_articles_livetime', '60');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'instant_articles_gettime', '120');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'instant_articles_auto', '1');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'auto_postcomm', '1');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'allowed_comm', '-1');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'view_comm', '6');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'setcomm', '4');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'activecomm', '1');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'emailcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'adminscomm', '');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'sortcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'captcha_area_comm', '1');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'perpagecomm', '5');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'timeoutcomm', '360');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'allowattachcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'alloweditorcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'frontend_edit_alias', '0');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'frontend_edit_layout', '1');
INSERT INTO `nv4_config` VALUES ('en', 'news', 'captcha_type', 'captcha');
INSERT INTO `nv4_config` VALUES ('en', 'contact', 'bodytext', 'If you have any questions or comments, please contact us below and we will get back to you as soon as possible.');
INSERT INTO `nv4_config` VALUES ('en', 'contact', 'sendcopymode', '0');
INSERT INTO `nv4_config` VALUES ('en', 'contact', 'captcha_type', 'captcha');
INSERT INTO `nv4_config` VALUES ('en', 'voting', 'difftimeout', '3600');
INSERT INTO `nv4_config` VALUES ('en', 'voting', 'captcha_type', 'captcha');
INSERT INTO `nv4_config` VALUES ('sys', 'banners', 'captcha_type', 'captcha');
INSERT INTO `nv4_config` VALUES ('en', 'page', 'auto_postcomm', '1');
INSERT INTO `nv4_config` VALUES ('en', 'page', 'allowed_comm', '-1');
INSERT INTO `nv4_config` VALUES ('en', 'page', 'view_comm', '6');
INSERT INTO `nv4_config` VALUES ('en', 'page', 'setcomm', '4');
INSERT INTO `nv4_config` VALUES ('en', 'page', 'activecomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'page', 'emailcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'page', 'adminscomm', '');
INSERT INTO `nv4_config` VALUES ('en', 'page', 'sortcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'page', 'captcha_area_comm', '1');
INSERT INTO `nv4_config` VALUES ('en', 'page', 'perpagecomm', '5');
INSERT INTO `nv4_config` VALUES ('en', 'page', 'timeoutcomm', '360');
INSERT INTO `nv4_config` VALUES ('en', 'page', 'allowattachcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'page', 'alloweditorcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'comment', 'captcha_type', 'captcha');
INSERT INTO `nv4_config` VALUES ('en', 'siteterms', 'auto_postcomm', '1');
INSERT INTO `nv4_config` VALUES ('en', 'siteterms', 'allowed_comm', '-1');
INSERT INTO `nv4_config` VALUES ('en', 'siteterms', 'view_comm', '6');
INSERT INTO `nv4_config` VALUES ('en', 'siteterms', 'setcomm', '4');
INSERT INTO `nv4_config` VALUES ('en', 'siteterms', 'activecomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'siteterms', 'emailcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'siteterms', 'adminscomm', '');
INSERT INTO `nv4_config` VALUES ('en', 'siteterms', 'sortcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'siteterms', 'captcha_area_comm', '1');
INSERT INTO `nv4_config` VALUES ('en', 'siteterms', 'perpagecomm', '5');
INSERT INTO `nv4_config` VALUES ('en', 'siteterms', 'timeoutcomm', '360');
INSERT INTO `nv4_config` VALUES ('en', 'siteterms', 'allowattachcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'siteterms', 'alloweditorcomm', '0');
INSERT INTO `nv4_config` VALUES ('en', 'freecontent', 'next_execute', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'statistics_timezone', 'Asia/Bangkok');
INSERT INTO `nv4_config` VALUES ('sys', 'site', 'site_email', 'webmaster@localhost');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'error_set_logs', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'error_send_email', 'webmaster@localhost');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'site_lang', 'en');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'my_domains', 'localhost');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'cookie_prefix', 'nv4');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'session_prefix', 'nv4s_b50IJ5');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'site_timezone', 'byCountry');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'proxy_blocker', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'str_referer_blocker', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'lang_multi', '1');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'lang_geo', '0');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'ftp_server', 'localhost');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'ftp_port', '21');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'ftp_user_name', '');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'ftp_user_pass', 'z1Kr9e2oYXRrWSS3w7jp-A,,');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'ftp_path', '/');
INSERT INTO `nv4_config` VALUES ('sys', 'global', 'ftp_check_login', '0');

-- ----------------------------
-- Table structure for nv4_cookies
-- ----------------------------
DROP TABLE IF EXISTS `nv4_cookies`;
CREATE TABLE `nv4_cookies`  (
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` int NOT NULL DEFAULT 0,
  `secure` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE INDEX `cookiename`(`name`, `domain`, `path`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_cookies
-- ----------------------------

-- ----------------------------
-- Table structure for nv4_counter
-- ----------------------------
DROP TABLE IF EXISTS `nv4_counter`;
CREATE TABLE `nv4_counter`  (
  `c_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_val` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_update` int NOT NULL DEFAULT 0,
  `c_count` int UNSIGNED NOT NULL DEFAULT 0,
  `en_count` int UNSIGNED NOT NULL DEFAULT 0,
  UNIQUE INDEX `c_type`(`c_type`, `c_val`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_counter
-- ----------------------------
INSERT INTO `nv4_counter` VALUES ('c_time', 'start', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('c_time', 'last', 0, 1772428937, 0);
INSERT INTO `nv4_counter` VALUES ('total', 'hits', 1772428937, 2, 2);
INSERT INTO `nv4_counter` VALUES ('year', '2026', 1772428937, 2, 2);
INSERT INTO `nv4_counter` VALUES ('year', '2027', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('year', '2028', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('year', '2029', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('year', '2030', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('year', '2031', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('year', '2032', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('year', '2033', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('year', '2034', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('month', 'Jan', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('month', 'Feb', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('month', 'Mar', 1772428937, 2, 2);
INSERT INTO `nv4_counter` VALUES ('month', 'Apr', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('month', 'May', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('month', 'Jun', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('month', 'Jul', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('month', 'Aug', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('month', 'Sep', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('month', 'Oct', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('month', 'Nov', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('month', 'Dec', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '01', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '02', 1772428937, 2, 2);
INSERT INTO `nv4_counter` VALUES ('day', '03', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '04', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '05', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '06', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '07', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '08', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '09', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '10', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '11', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '12', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '13', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '14', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '15', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '16', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '17', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '18', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '19', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '20', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '21', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '22', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '23', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '24', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '25', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '26', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '27', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '28', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '29', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '30', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('day', '31', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('dayofweek', 'Sunday', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('dayofweek', 'Monday', 1772428937, 2, 2);
INSERT INTO `nv4_counter` VALUES ('dayofweek', 'Tuesday', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('dayofweek', 'Wednesday', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('dayofweek', 'Thursday', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('dayofweek', 'Friday', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('dayofweek', 'Saturday', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '00', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '01', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '02', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '03', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '04', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '05', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '06', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '07', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '08', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '09', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '10', 1772423361, 1, 1);
INSERT INTO `nv4_counter` VALUES ('hour', '11', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '12', 1772428937, 1, 1);
INSERT INTO `nv4_counter` VALUES ('hour', '13', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '14', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '15', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '16', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '17', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '18', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '19', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '20', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '21', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '22', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('hour', '23', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('bot', 'googlebot', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('bot', 'msnbot', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('bot', 'bingbot', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('bot', 'yahooslurp', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('bot', 'w3cvalidator', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'opera', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'operamini', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'webtv', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'explorer', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'edge', 1772428937, 2, 2);
INSERT INTO `nv4_counter` VALUES ('browser', 'pocket', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'konqueror', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'icab', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'omniweb', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'firebird', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'firefox', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'iceweasel', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'shiretoko', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'mozilla', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'amaya', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'lynx', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'safari', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'iphone', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'ipod', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'ipad', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'chrome', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'cococ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'android', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'googlebot', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'yahooslurp', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'w3cvalidator', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'blackberry', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'icecat', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'nokias60', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'nokia', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'msn', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'msnbot', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'bingbot', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'netscape', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'galeon', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'netpositive', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'phoenix', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'Mobile', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'bots', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('browser', 'Unknown', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'unknown', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'win', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'win10', 1772428937, 2, 2);
INSERT INTO `nv4_counter` VALUES ('os', 'win8', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'win7', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'win2003', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'winvista', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'wince', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'winxp', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'win2000', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'apple', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'linux', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'os2', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'beos', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'iphone', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'ipod', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'ipad', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'blackberry', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'nokia', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'freebsd', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'openbsd', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'netbsd', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'sunos', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'opensolaris', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'android', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'irix', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('os', 'palm', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AD', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AE', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AF', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AG', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AI', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AL', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AM', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AN', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AO', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AQ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AS', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AT', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AU', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AW', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'AZ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BA', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BB', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BD', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BE', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BF', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BG', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BH', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BI', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BJ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BM', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BN', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BO', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BS', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BT', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BW', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BY', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'BZ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CA', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CD', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CF', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CG', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CH', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CI', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CK', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CL', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CM', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CN', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CO', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CS', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CU', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CV', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CY', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'CZ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'DE', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'DJ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'DK', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'DM', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'DO', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'DZ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'EC', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'EE', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'EG', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'ER', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'ES', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'ET', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'EU', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'FI', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'FJ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'FK', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'FM', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'FO', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'FR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GA', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GB', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GD', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GE', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GF', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GH', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GI', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GL', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GM', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GN', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GP', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GQ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GS', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GT', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GU', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GW', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'GY', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'HK', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'HN', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'HR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'HT', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'HU', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'ID', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'IE', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'IL', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'IN', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'IO', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'IQ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'IR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'IS', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'IT', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'JM', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'JO', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'JP', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'KE', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'KG', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'KH', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'KI', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'KM', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'KN', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'KR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'KW', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'KY', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'KZ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'LA', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'LB', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'LC', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'LI', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'LK', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'LR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'LS', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'LT', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'LU', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'LV', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'LY', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MA', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MC', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MD', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MG', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MH', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MK', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'ML', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MM', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MN', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MO', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MP', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MQ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MT', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MU', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MV', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MW', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MX', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MY', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'MZ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'NA', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'NC', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'NE', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'NF', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'NG', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'NI', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'NL', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'NO', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'NP', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'NR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'NU', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'NZ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'OM', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'PA', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'PE', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'PF', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'PG', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'PH', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'PK', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'PL', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'PR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'PS', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'PT', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'PW', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'PY', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'QA', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'RE', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'RO', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'RU', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'RW', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SA', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SB', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SC', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SD', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SE', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SG', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SI', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SK', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SL', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SM', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SN', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SO', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'ST', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SV', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SY', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'SZ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TD', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TF', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TG', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TH', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TJ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TK', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TL', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TM', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TN', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TO', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TR', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TT', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TV', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TW', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'TZ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'UA', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'UG', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'US', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'UY', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'UZ', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'VA', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'VC', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'VE', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'VG', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'VI', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'VN', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'VU', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'WS', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'YE', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'YT', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'YU', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'ZA', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'ZM', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'ZW', 0, 0, 0);
INSERT INTO `nv4_counter` VALUES ('country', 'ZZ', 1772428937, 2, 2);
INSERT INTO `nv4_counter` VALUES ('country', 'unkown', 0, 0, 0);

-- ----------------------------
-- Table structure for nv4_cronjobs
-- ----------------------------
DROP TABLE IF EXISTS `nv4_cronjobs`;
CREATE TABLE `nv4_cronjobs`  (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_time` int UNSIGNED NOT NULL DEFAULT 0,
  `inter_val` int UNSIGNED NOT NULL DEFAULT 0,
  `inter_val_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0: Lặp lại sau thời điểm bắt đầu thực tế, 1:lặp lại sau thời điểm bắt đầu trong CSDL',
  `run_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `run_func` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_sys` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `act` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `last_time` int UNSIGNED NOT NULL DEFAULT 0,
  `last_result` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `en_cron_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `is_sys`(`is_sys`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_cronjobs
-- ----------------------------
INSERT INTO `nv4_cronjobs` VALUES (1, 1772423300, 5, 0, 'online_expired_del.php', 'cron_online_expired_del', '', 0, 1, 1, 1772429892, 1, 'Delete expired online status');
INSERT INTO `nv4_cronjobs` VALUES (2, 1772423300, 1440, 0, 'dump_autobackup.php', 'cron_dump_autobackup', '', 0, 1, 1, 1772423343, 1, 'Automatic backup database');
INSERT INTO `nv4_cronjobs` VALUES (3, 1772423300, 60, 0, 'temp_download_destroy.php', 'cron_auto_del_temp_download', '', 0, 1, 1, 1772428937, 1, 'Empty temporary files');
INSERT INTO `nv4_cronjobs` VALUES (4, 1772423300, 30, 0, 'ip_logs_destroy.php', 'cron_del_ip_logs', '', 0, 1, 1, 1772428937, 1, 'Delete IP log files');
INSERT INTO `nv4_cronjobs` VALUES (5, 1772423300, 1440, 0, 'error_log_destroy.php', 'cron_auto_del_error_log', '', 0, 1, 1, 1772423343, 1, 'Delete expired error_log log files');
INSERT INTO `nv4_cronjobs` VALUES (6, 1772423300, 360, 0, 'error_log_sendmail.php', 'cron_auto_sendmail_error_log', '', 0, 1, 0, 0, 0, 'Send error logs to admin');
INSERT INTO `nv4_cronjobs` VALUES (7, 1772423300, 60, 0, 'ref_expired_del.php', 'cron_ref_expired_del', '', 0, 1, 1, 1772428937, 1, 'Delete expired referer');
INSERT INTO `nv4_cronjobs` VALUES (8, 1772423300, 60, 0, 'check_version.php', 'cron_auto_check_version', '', 0, 1, 1, 1772428937, 1, 'Check NukeViet version');
INSERT INTO `nv4_cronjobs` VALUES (9, 1772423300, 1440, 0, 'notification_autodel.php', 'cron_notification_autodel', '', 0, 1, 1, 1772423343, 1, 'Delete old notification');

-- ----------------------------
-- Table structure for nv4_en_about
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_about`;
CREATE TABLE `nv4_en_about`  (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `imagealt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `imageposition` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `bodytext` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `socialbutton` tinyint NOT NULL DEFAULT 0,
  `activecomm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `layout_func` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `weight` smallint NOT NULL DEFAULT 0,
  `admin_id` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `add_time` int NOT NULL DEFAULT 0,
  `edit_time` int NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `hitstotal` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `hot_post` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `alias`(`alias`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_about
-- ----------------------------
INSERT INTO `nv4_en_about` VALUES (1, 'Chào Mừng Đến Với THCS Lý Tự Trọng', 'chao-mung-den-voi-thcs-ly-tu-trong', 'z7578205362124_5cb723f97cd4a479ee0f1dea6785fed7.jpg', '', 0, '', '<p>Website của nhà trường sớm hình thành,, một trong những website &nbsp;của các trường THCS ở Tây Ninh, với mong muốn không chỉ cung cấp các thông tin hữu ích của nhà trường, mà còn là một nơi giao lưu học tập các bô môn, các vấn đề liên quan đến việc rèn luyện kỹ năng sống. Website nhà trường dành cho tất cả mọi người – từ các bậc phụ huynh, các em học sinh, đến quý thầy cô…</p><p>Website “của Trường THCS Lý Tự Trọng, Hòa Thành – Tây Ninh” có các chuyên mục chính: Giới thiệu, Tài nguyên học tập nghiên cứu dành cho cả giáo viên lẫn học sinh, Giải trí, và Giao lưu. Những chuyên mục này được thực hiện với tiêu chí “học tập và giảng dạy” với nguồn tài nguyên phong phú và được cập nhật thường xuyên. Các bạn có thể tìm hiểu về nhà trường ở chuyên mục Giới thiệu, hoặc tiếp cận các tài nguyên học tập và giảng dạy các bộ môn ở chuyên mục tài nguyên, hay thư giãn ở các chuyên mục Giải trí, và nhất là có thể giao lưu trao đổi chia sẽ qua facebook của nhà trường.</p><p>Nào, xin mời các bạn vào các chuyên mục mà mình quan tâm! Chúc các bạn có những giờ phút thật vui và bổ ích khi đến thăm website của nhà trường chúng tôi!</p><p>Mặc dù chúng tôi đã rất cố gắng tuy nhiên không thể tránh khỏi những thiếu sót và hạn chế hoặc chưa thật sự làm hài lòng các bạn, chúng tôi xin chân thành tiếp nhận mọi sự đóng góp ý kiến xây dựng của các bạn để website ngày càng hoàn thiện hơn.</p><p>Thay mặt Ban Giám hiệu nhà trường, xin cảm ơn sự đóng góp xây dựng của quý thầy cô, các bạn cùng các em học sinh!</p><p>Chào thân ái!</p>', 'chào mừng,đến với,thcs lý,tự trọng', 0, '4', '', 1, 1, 1277266815, 1772424565, 1, 2, 0);
INSERT INTO `nv4_en_about` VALUES (2, 'THCS Lý Tự Trong', 'thcs-ly-tu-trong', '', '', 0, '', '<p>Website của nhà trường sớm hình thành, một trong những website &nbsp;của các trường THCS ở Tây Ninh, với mong muốn không chỉ cung cấp các thông tin hữu ích của nhà trường, mà còn là một nơi giao lưu học tập các bô môn, các vấn đề liên quan đến việc rèn luyện kỹ năng sống. Website nhà trường dành cho tất cả mọi người – từ các bậc phụ huynh, các em học sinh, đến quý thầy cô…</p><p>Website “của Trường THCS Lý Tự Trọng, Hòa Thành – Tây Ninh” có các chuyên mục chính: Giới thiệu, Tài nguyên học tập nghiên cứu dành cho cả giáo viên lẫn học sinh, Giải trí, và Giao lưu. Những chuyên mục này được thực hiện với tiêu chí “học tập và giảng dạy” với nguồn tài nguyên phong phú và được cập nhật thường xuyên. Các bạn có thể tìm hiểu về nhà trường ở chuyên mục Giới thiệu, hoặc tiếp cận các tài nguyên học tập và giảng dạy các bộ môn ở chuyên mục tài nguyên, hay thư giãn ở các chuyên mục Giải trí, và nhất là có thể giao lưu trao đổi chia sẽ qua facebook của nhà trường.</p><p>Nào, xin mời các bạn vào các chuyên mục mà mình quan tâm! Chúc các bạn có những giờ phút thật vui và bổ ích khi đến thăm website của nhà trường chúng tôi!</p><p>Mặc dù chúng tôi đã rất cố gắng tuy nhiên không thể tránh khỏi những thiếu sót và hạn chế hoặc chưa thật sự làm hài lòng các bạn, chúng tôi xin chân thành tiếp nhận mọi sự đóng góp ý kiến xây dựng của các bạn để website ngày càng hoàn thiện hơn.</p><p>Thay mặt Ban Giám hiệu nhà trường, xin cảm ơn sự đóng góp xây dựng của quý thầy cô, các bạn cùng các em học sinh!</p><p>Chào thân ái!</p>', 'nukeviet&#039;s versioning,schemes', 0, '4', '', 2, 1, 1277267054, 1772424638, 1, 0, 0);

-- ----------------------------
-- Table structure for nv4_en_about_config
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_about_config`;
CREATE TABLE `nv4_en_about_config`  (
  `config_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE INDEX `config_name`(`config_name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_about_config
-- ----------------------------
INSERT INTO `nv4_en_about_config` VALUES ('viewtype', '0');
INSERT INTO `nv4_en_about_config` VALUES ('facebookapi', '');
INSERT INTO `nv4_en_about_config` VALUES ('per_page', '20');
INSERT INTO `nv4_en_about_config` VALUES ('news_first', '0');
INSERT INTO `nv4_en_about_config` VALUES ('related_articles', '5');
INSERT INTO `nv4_en_about_config` VALUES ('copy_page', '0');
INSERT INTO `nv4_en_about_config` VALUES ('alias_lower', '1');
INSERT INTO `nv4_en_about_config` VALUES ('socialbutton', 'facebook,twitter');

-- ----------------------------
-- Table structure for nv4_en_blocks_groups
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_blocks_groups`;
CREATE TABLE `nv4_en_blocks_groups`  (
  `bid` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `theme` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `template` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `position` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `exp_time` int NULL DEFAULT 0,
  `active` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1',
  `act` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `groups_view` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `all_func` tinyint NOT NULL DEFAULT 0,
  `weight` int NOT NULL DEFAULT 0,
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`bid`) USING BTREE,
  INDEX `theme`(`theme`) USING BTREE,
  INDEX `module`(`module`) USING BTREE,
  INDEX `position`(`position`) USING BTREE,
  INDEX `exp_time`(`exp_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_blocks_groups
-- ----------------------------
INSERT INTO `nv4_en_blocks_groups` VALUES (1, 'default', 'news', 'module.block_newscenter.php', 'Breaking news', '', 'no_title', '[TOP]', 0, '1', 1, '6', 0, 1, 'a:10:{s:6:\"numrow\";i:6;s:11:\"showtooltip\";i:1;s:16:\"tooltip_position\";s:6:\"bottom\";s:14:\"tooltip_length\";s:3:\"150\";s:12:\"length_title\";i:0;s:15:\"length_hometext\";i:0;s:17:\"length_othertitle\";i:60;s:5:\"width\";i:500;s:6:\"height\";i:0;s:7:\"nocatid\";a:0:{}}');
INSERT INTO `nv4_en_blocks_groups` VALUES (2, 'default', 'banners', 'global.banners.php', 'Center Banner', '', 'no_title', '[TOP]', 0, '1', 1, '6', 0, 2, 'a:1:{s:12:\"idplanbanner\";i:1;}');
INSERT INTO `nv4_en_blocks_groups` VALUES (3, 'default', 'news', 'global.block_category.php', 'Category', '', 'no_title', '[LEFT]', 0, '1', 1, '6', 0, 1, 'a:2:{s:5:\"catid\";i:0;s:12:\"title_length\";i:0;}');
INSERT INTO `nv4_en_blocks_groups` VALUES (4, 'default', 'theme', 'global.module_menu.php', 'Module Menu', '', 'no_title', '[LEFT]', 0, '1', 1, '6', 0, 2, '');
INSERT INTO `nv4_en_blocks_groups` VALUES (5, 'default', 'banners', 'global.banners.php', 'Left Banner', '', 'no_title', '[LEFT]', 0, '1', 1, '6', 1, 3, 'a:1:{s:12:\"idplanbanner\";i:2;}');
INSERT INTO `nv4_en_blocks_groups` VALUES (6, 'default', 'statistics', 'global.counter.php', 'Statistics', '', 'primary', '[LEFT]', 0, '1', 1, '6', 1, 4, '');
INSERT INTO `nv4_en_blocks_groups` VALUES (7, 'default', 'about', 'global.about.php', 'About', '', 'border', '[RIGHT]', 0, '1', 1, '6', 1, 1, '');
INSERT INTO `nv4_en_blocks_groups` VALUES (8, 'default', 'banners', 'global.banners.php', 'Right Banner', '', 'no_title', '[RIGHT]', 0, '1', 1, '6', 1, 2, 'a:1:{s:12:\"idplanbanner\";i:3;}');
INSERT INTO `nv4_en_blocks_groups` VALUES (9, 'default', 'voting', 'global.voting_random.php', 'Voting', '', 'primary', '[RIGHT]', 0, '1', 1, '6', 1, 3, '');
INSERT INTO `nv4_en_blocks_groups` VALUES (10, 'default', 'news', 'global.block_tophits.php', 'Top Hits', '', 'primary', '[RIGHT]', 0, '1', 1, '6', 1, 4, 'a:6:{s:10:\"number_day\";i:3650;s:6:\"numrow\";i:10;s:11:\"showtooltip\";i:1;s:16:\"tooltip_position\";s:6:\"bottom\";s:14:\"tooltip_length\";s:3:\"150\";s:7:\"nocatid\";a:2:{i:0;i:10;i:1;i:11;}}');
INSERT INTO `nv4_en_blocks_groups` VALUES (11, 'default', 'theme', 'global.copyright.php', 'Copyright', '', 'no_title', '[FOOTER_SITE]', 0, '1', 1, '6', 1, 1, 'a:5:{s:12:\"copyright_by\";s:0:\"\";s:13:\"copyright_url\";s:0:\"\";s:9:\"design_by\";s:12:\"VINADES.,JSC\";s:10:\"design_url\";s:19:\"https://vinades.vn/\";s:13:\"siteterms_url\";s:54:\"/thcs_lytutrong/index.php?language=en&amp;nv=siteterms\";}');
INSERT INTO `nv4_en_blocks_groups` VALUES (12, 'default', 'contact', 'global.contact_form.php', 'Feedback', '', 'no_title', '[FOOTER_SITE]', 0, '1', 1, '6', 1, 2, '');
INSERT INTO `nv4_en_blocks_groups` VALUES (13, 'default', 'theme', 'global.QR_code.php', 'QR code', '', 'no_title', '[QR_CODE]', 0, '1', 1, '6', 1, 1, '');
INSERT INTO `nv4_en_blocks_groups` VALUES (14, 'default', 'statistics', 'global.counter_button.php', 'Online button', '', 'no_title', '[QR_CODE]', 0, '1', 1, '6', 1, 2, '');
INSERT INTO `nv4_en_blocks_groups` VALUES (15, 'default', 'users', 'global.user_button.php', 'Member login', '', 'no_title', '[PERSONALAREA]', 0, '1', 1, '6', 1, 1, '');
INSERT INTO `nv4_en_blocks_groups` VALUES (16, 'default', 'theme', 'global.company_info.php', 'Managing company', '', 'simple', '[COMPANY_INFO]', 0, '1', 1, '6', 1, 1, 'a:13:{s:12:\"company_name\";s:51:\"Vietnam Open Source Development Joint Stock Company\";s:15:\"company_address\";s:101:\"6th floor, Song Da building, No. 131 Tran Phu street, Van Quan ward, Ha Dong district, Hanoi, Vietnam\";s:16:\"company_sortname\";s:12:\"VINADES.,JSC\";s:15:\"company_regcode\";s:0:\"\";s:16:\"company_regplace\";s:0:\"\";s:21:\"company_licensenumber\";s:0:\"\";s:22:\"company_responsibility\";s:0:\"\";s:15:\"company_showmap\";i:1;s:14:\"company_mapurl\";s:312:\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d427.01613794022035!2d105.78849184070538!3d20.979995366268337!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac93055e2f2f%3A0x91f4b423089193dd!2zQ8O0bmcgdHkgQ-G7lSBwaOG6p24gUGjDoXQgdHJp4buDbiBOZ3Xhu5NuIG3hu58gVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1701239622249!5m2!1svi!2s\";s:13:\"company_phone\";s:30:\"+84-24-85872007[+842485872007]\";s:11:\"company_fax\";s:15:\"+84-24-35500914\";s:13:\"company_email\";s:18:\"contact@vinades.vn\";s:15:\"company_website\";s:18:\"https://vinades.vn\";}');
INSERT INTO `nv4_en_blocks_groups` VALUES (17, 'default', 'menu', 'global.bootstrap.php', 'Menu Site', '', 'no_title', '[MENU_SITE]', 0, '1', 1, '6', 1, 1, 'a:2:{s:6:\"menuid\";i:1;s:12:\"title_length\";i:0;}');
INSERT INTO `nv4_en_blocks_groups` VALUES (18, 'default', 'contact', 'global.contact_default.php', 'Contact Default', '', 'no_title', '[CONTACT_DEFAULT]', 0, '1', 1, '6', 1, 1, '');
INSERT INTO `nv4_en_blocks_groups` VALUES (19, 'default', 'theme', 'global.social.php', 'Social icon', '', 'no_title', '[SOCIAL_ICONS]', 0, '1', 1, '6', 1, 1, 'a:3:{s:8:\"facebook\";s:32:\"http://www.facebook.com/nukeviet\";s:7:\"youtube\";s:37:\"https://www.youtube.com/user/nukeviet\";s:7:\"twitter\";s:28:\"https://twitter.com/nukeviet\";}');
INSERT INTO `nv4_en_blocks_groups` VALUES (20, 'default', 'theme', 'global.menu_footer.php', 'Main categories', '', 'simple', '[MENU_FOOTER]', 0, '1', 1, '6', 1, 1, 'a:1:{s:14:\"module_in_menu\";a:8:{i:0;s:5:\"about\";i:1;s:4:\"news\";i:2;s:5:\"users\";i:3;s:7:\"contact\";i:4;s:6:\"voting\";i:5;s:7:\"banners\";i:6;s:4:\"seek\";i:7;s:5:\"feeds\";}}');
INSERT INTO `nv4_en_blocks_groups` VALUES (21, 'default', 'freecontent', 'global.free_content.php', 'Introduction', '', 'no_title', '[FEATURED_PRODUCT]', 0, '1', 1, '6', 1, 1, 'a:2:{s:7:\"blockid\";i:1;s:7:\"numrows\";i:2;}');
INSERT INTO `nv4_en_blocks_groups` VALUES (22, 'mobile_default', 'menu', 'global.metismenu.php', 'Menu Site', '', 'no_title', '[MENU_SITE]', 0, '1', 1, '6', 1, 1, 'a:2:{s:6:\"menuid\";i:1;s:12:\"title_length\";i:0;}');
INSERT INTO `nv4_en_blocks_groups` VALUES (23, 'mobile_default', 'users', 'global.user_button.php', 'Sign In', '', 'no_title', '[MENU_SITE]', 0, '1', 1, '6', 1, 2, '');
INSERT INTO `nv4_en_blocks_groups` VALUES (24, 'mobile_default', 'contact', 'global.contact_default.php', 'Contact Default', '', 'no_title', '[SOCIAL_ICONS]', 0, '1', 1, '6', 1, 1, '');
INSERT INTO `nv4_en_blocks_groups` VALUES (25, 'mobile_default', 'contact', 'global.contact_form.php', 'Feedback', '', 'no_title', '[SOCIAL_ICONS]', 0, '1', 1, '6', 1, 2, '');
INSERT INTO `nv4_en_blocks_groups` VALUES (26, 'mobile_default', 'theme', 'global.social.php', 'Social icon', '', 'no_title', '[SOCIAL_ICONS]', 0, '1', 1, '6', 1, 3, 'a:3:{s:8:\"facebook\";s:32:\"http://www.facebook.com/nukeviet\";s:7:\"youtube\";s:37:\"https://www.youtube.com/user/nukeviet\";s:7:\"twitter\";s:28:\"https://twitter.com/nukeviet\";}');
INSERT INTO `nv4_en_blocks_groups` VALUES (27, 'mobile_default', 'theme', 'global.QR_code.php', 'QR code', '', 'no_title', '[SOCIAL_ICONS]', 0, '1', 1, '6', 1, 4, '');
INSERT INTO `nv4_en_blocks_groups` VALUES (28, 'mobile_default', 'theme', 'global.copyright.php', 'Copyright', '', 'no_title', '[FOOTER_SITE]', 0, '1', 1, '6', 1, 1, 'a:5:{s:12:\"copyright_by\";s:0:\"\";s:13:\"copyright_url\";s:0:\"\";s:9:\"design_by\";s:12:\"VINADES.,JSC\";s:10:\"design_url\";s:19:\"https://vinades.vn/\";s:13:\"siteterms_url\";s:54:\"/thcs_lytutrong/index.php?language=en&amp;nv=siteterms\";}');
INSERT INTO `nv4_en_blocks_groups` VALUES (29, 'mobile_default', 'theme', 'global.menu_footer.php', 'Main categories', '', 'primary', '[MENU_FOOTER]', 0, '1', 1, '6', 1, 1, 'a:1:{s:14:\"module_in_menu\";a:9:{i:0;s:5:\"about\";i:1;s:4:\"news\";i:2;s:5:\"users\";i:3;s:7:\"contact\";i:4;s:6:\"voting\";i:5;s:7:\"banners\";i:6;s:4:\"seek\";i:7;s:5:\"feeds\";i:8;s:9:\"siteterms\";}}');
INSERT INTO `nv4_en_blocks_groups` VALUES (30, 'mobile_default', 'theme', 'global.company_info.php', 'Managing company', '', 'primary', '[COMPANY_INFO]', 0, '1', 1, '6', 1, 1, 'a:13:{s:12:\"company_name\";s:51:\"Vietnam Open Source Development Joint Stock Company\";s:15:\"company_address\";s:101:\"6th floor, Song Da building, No. 131 Tran Phu street, Van Quan ward, Ha Dong district, Hanoi, Vietnam\";s:16:\"company_sortname\";s:12:\"VINADES.,JSC\";s:15:\"company_regcode\";s:0:\"\";s:16:\"company_regplace\";s:0:\"\";s:21:\"company_licensenumber\";s:0:\"\";s:22:\"company_responsibility\";s:0:\"\";s:15:\"company_showmap\";i:1;s:14:\"company_mapurl\";s:312:\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d427.01613794022035!2d105.78849184070538!3d20.979995366268337!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac93055e2f2f%3A0x91f4b423089193dd!2zQ8O0bmcgdHkgQ-G7lSBwaOG6p24gUGjDoXQgdHJp4buDbiBOZ3Xhu5NuIG3hu58gVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1701239622249!5m2!1svi!2s\";s:13:\"company_phone\";s:30:\"+84-24-85872007[+842485872007]\";s:11:\"company_fax\";s:15:\"+84-24-35500914\";s:13:\"company_email\";s:18:\"contact@vinades.vn\";s:15:\"company_website\";s:18:\"https://vinades.vn\";}');

-- ----------------------------
-- Table structure for nv4_en_blocks_weight
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_blocks_weight`;
CREATE TABLE `nv4_en_blocks_weight`  (
  `bid` mediumint NOT NULL DEFAULT 0,
  `func_id` mediumint NOT NULL DEFAULT 0,
  `weight` mediumint NOT NULL DEFAULT 0,
  UNIQUE INDEX `bid`(`bid`, `func_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of nv4_en_blocks_weight
-- ----------------------------
INSERT INTO `nv4_en_blocks_weight` VALUES (1, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (2, 4, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (3, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (3, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (3, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (3, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (3, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (3, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (3, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (3, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (3, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (4, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 4, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 5, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 6, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 7, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 8, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 9, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 10, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 11, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 12, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 20, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 21, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 22, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 23, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 24, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 25, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 26, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 27, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 28, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 29, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 30, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 33, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 34, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 35, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 36, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 37, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 38, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 39, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (5, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 1, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 2, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 3, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 4, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 5, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 6, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 7, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 8, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 9, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 10, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 11, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 12, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 13, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 14, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 15, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 16, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 17, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 18, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 19, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 20, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 21, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 22, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 23, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 24, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 25, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 26, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 27, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 28, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 29, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 30, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 31, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 32, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 33, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 34, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 35, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 36, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 37, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 38, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 39, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 40, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 41, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 42, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 43, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 44, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 45, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 46, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 47, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 48, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 49, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 50, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 51, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 52, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 53, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 54, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 55, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 56, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 57, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 58, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 59, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 60, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 61, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 62, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 63, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 64, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (6, 65, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (7, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 1, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 2, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 3, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 4, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 5, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 6, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 7, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 8, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 9, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 10, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 11, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 12, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 13, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 14, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 15, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 16, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 17, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 18, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 19, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 20, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 21, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 22, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 23, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 24, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 25, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 26, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 27, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 28, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 29, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 30, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 31, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 32, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 33, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 34, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 35, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 36, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 37, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 38, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 39, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 40, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 41, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 42, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 43, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 44, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 45, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 46, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 47, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 48, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 49, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 50, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 51, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 52, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 53, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 54, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 55, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 56, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 57, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 58, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 59, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 60, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 61, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 62, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 63, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 64, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (8, 65, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 1, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 2, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 3, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 4, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 5, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 6, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 7, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 8, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 9, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 10, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 11, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 12, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 13, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 14, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 15, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 16, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 17, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 18, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 19, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 20, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 21, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 22, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 23, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 24, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 25, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 26, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 27, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 28, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 29, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 30, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 31, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 32, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 33, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 34, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 35, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 36, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 37, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 38, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 39, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 40, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 41, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 42, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 43, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 44, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 45, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 46, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 47, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 48, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 49, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 50, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 51, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 52, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 53, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 54, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 55, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 56, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 57, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 58, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 59, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 60, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 61, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 62, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 63, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 64, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (9, 65, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 1, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 2, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 3, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 4, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 5, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 6, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 7, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 8, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 9, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 10, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 11, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 12, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 13, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 14, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 15, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 16, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 17, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 18, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 19, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 20, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 21, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 22, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 23, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 24, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 25, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 26, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 27, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 28, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 29, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 30, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 31, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 32, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 33, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 34, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 35, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 36, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 37, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 38, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 39, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 40, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 41, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 42, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 43, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 44, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 45, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 46, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 47, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 48, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 49, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 50, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 51, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 52, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 53, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 54, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 55, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 56, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 57, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 58, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 59, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 60, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 61, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 62, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 63, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 64, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (10, 65, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (11, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 1, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 2, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 3, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 4, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 5, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 6, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 7, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 8, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 9, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 10, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 11, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 12, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 13, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 14, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 15, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 16, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 17, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 18, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 19, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 20, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 21, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 22, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 23, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 24, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 25, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 26, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 27, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 28, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 29, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 30, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 31, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 32, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 33, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 34, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 35, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 36, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 37, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 38, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 39, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 40, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 41, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 42, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 43, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 44, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 45, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 46, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 47, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 48, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 49, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 50, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 51, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 52, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 53, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 54, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 55, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 56, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 57, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 58, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 59, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 60, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 61, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 62, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 63, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 64, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (12, 65, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (13, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 1, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 2, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 3, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 4, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 5, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 6, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 7, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 8, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 9, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 10, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 11, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 12, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 13, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 14, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 15, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 16, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 17, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 18, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 19, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 20, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 21, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 22, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 23, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 24, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 25, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 26, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 27, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 28, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 29, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 30, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 31, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 32, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 33, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 34, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 35, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 36, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 37, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 38, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 39, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 40, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 41, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 42, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 43, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 44, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 45, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 46, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 47, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 48, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 49, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 50, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 51, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 52, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 53, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 54, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 55, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 56, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 57, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 58, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 59, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 60, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 61, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 62, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 63, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 64, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (14, 65, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (15, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (16, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (17, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (18, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (19, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (20, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (21, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (22, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 1, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 2, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 3, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 4, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 5, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 6, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 7, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 8, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 9, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 10, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 11, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 12, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 13, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 14, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 15, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 16, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 17, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 18, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 19, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 20, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 21, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 22, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 23, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 24, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 25, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 26, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 27, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 28, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 29, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 30, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 31, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 32, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 33, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 34, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 35, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 36, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 37, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 38, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 39, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 40, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 41, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 42, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 43, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 44, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 45, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 46, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 47, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 48, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 49, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 50, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 51, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 52, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 53, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 54, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 55, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 56, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 57, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 58, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 59, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 60, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 61, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 62, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 63, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 64, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (23, 65, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (24, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 1, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 2, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 3, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 4, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 5, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 6, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 7, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 8, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 9, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 10, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 11, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 12, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 13, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 14, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 15, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 16, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 17, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 18, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 19, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 20, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 21, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 22, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 23, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 24, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 25, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 26, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 27, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 28, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 29, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 30, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 31, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 32, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 33, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 34, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 35, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 36, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 37, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 38, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 39, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 40, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 41, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 42, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 43, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 44, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 45, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 46, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 47, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 48, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 49, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 50, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 51, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 52, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 53, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 54, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 55, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 56, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 57, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 58, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 59, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 60, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 61, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 62, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 63, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 64, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (25, 65, 2);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 1, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 2, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 3, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 4, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 5, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 6, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 7, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 8, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 9, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 10, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 11, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 12, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 13, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 14, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 15, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 16, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 17, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 18, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 19, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 20, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 21, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 22, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 23, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 24, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 25, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 26, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 27, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 28, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 29, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 30, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 31, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 32, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 33, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 34, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 35, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 36, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 37, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 38, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 39, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 40, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 41, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 42, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 43, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 44, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 45, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 46, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 47, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 48, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 49, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 50, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 51, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 52, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 53, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 54, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 55, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 56, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 57, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 58, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 59, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 60, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 61, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 62, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 63, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 64, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (26, 65, 3);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 1, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 2, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 3, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 4, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 5, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 6, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 7, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 8, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 9, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 10, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 11, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 12, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 13, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 14, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 15, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 16, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 17, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 18, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 19, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 20, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 21, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 22, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 23, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 24, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 25, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 26, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 27, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 28, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 29, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 30, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 31, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 32, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 33, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 34, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 35, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 36, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 37, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 38, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 39, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 40, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 41, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 42, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 43, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 44, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 45, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 46, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 47, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 48, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 49, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 50, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 51, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 52, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 53, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 54, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 55, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 56, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 57, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 58, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 59, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 60, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 61, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 62, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 63, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 64, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (27, 65, 4);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (28, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (29, 65, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 1, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 2, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 3, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 4, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 5, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 6, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 7, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 8, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 9, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 10, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 11, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 12, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 13, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 14, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 15, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 16, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 17, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 18, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 19, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 20, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 21, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 22, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 23, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 24, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 25, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 26, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 27, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 28, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 29, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 30, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 31, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 32, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 33, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 34, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 35, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 36, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 37, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 38, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 39, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 40, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 41, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 42, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 43, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 44, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 45, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 46, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 47, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 48, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 49, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 50, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 51, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 52, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 53, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 54, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 55, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 56, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 57, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 58, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 59, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 60, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 61, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 62, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 63, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 64, 1);
INSERT INTO `nv4_en_blocks_weight` VALUES (30, 65, 1);

-- ----------------------------
-- Table structure for nv4_en_comment
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_comment`;
CREATE TABLE `nv4_en_comment`  (
  `cid` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `module` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` int NOT NULL DEFAULT 0,
  `id` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `pid` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_time` int UNSIGNED NOT NULL DEFAULT 0,
  `userid` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `post_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_ip` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `likes` mediumint NOT NULL DEFAULT 0,
  `dislikes` mediumint NOT NULL DEFAULT 0,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `mod_id`(`module`, `area`, `id`) USING BTREE,
  INDEX `post_time`(`post_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_comment
-- ----------------------------

-- ----------------------------
-- Table structure for nv4_en_contact_department
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_contact_department`;
CREATE TABLE `nv4_en_contact_department`  (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `others` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cats` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admins` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `act` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `weight` smallint NOT NULL,
  `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `full_name`(`full_name`) USING BTREE,
  UNIQUE INDEX `alias`(`alias`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_contact_department
-- ----------------------------
INSERT INTO `nv4_en_contact_department` VALUES (1, 'Consumer Care Division', 'Consumer-Care', '', '(08) 38.000.000[+84838000000]', '08 38.000.001', 'customer@mysite.com', '', 'Receive requests, suggestions, comments relating to the operations of company', '{\"viber\":\"myViber\",\"skype\":\"mySkype\",\"yahoo\":\"myYahoo\"}', 'Consulting|Complaints|Cooperation', '1/1/1/0;', 1, 1, 1);
INSERT INTO `nv4_en_contact_department` VALUES (2, 'Technical Department', 'Technical', '', '(08) 38.000.002[+84838000002]', '08 38.000.003', 'technical@mysite.com', '', 'Resolve technical issues', '{\"viber\":\"myViber2\",\"skype\":\"mySkype2\",\"yahoo\":\"myYahoo2\"}', 'Bug Reports|Recommendations to improve', '1/1/1/0;', 1, 2, 0);

-- ----------------------------
-- Table structure for nv4_en_contact_reply
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_contact_reply`;
CREATE TABLE `nv4_en_contact_reply`  (
  `rid` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `reply_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `reply_time` int UNSIGNED NOT NULL DEFAULT 0,
  `reply_aid` mediumint UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`rid`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_contact_reply
-- ----------------------------

-- ----------------------------
-- Table structure for nv4_en_contact_send
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_contact_send`;
CREATE TABLE `nv4_en_contact_send`  (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` smallint UNSIGNED NOT NULL DEFAULT 0,
  `cat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_time` int UNSIGNED NOT NULL DEFAULT 0,
  `sender_id` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `sender_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `sender_ip` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_read` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_reply` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_processed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `processed_by` int UNSIGNED NOT NULL DEFAULT 0,
  `processed_time` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sender_name`(`sender_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_contact_send
-- ----------------------------

-- ----------------------------
-- Table structure for nv4_en_contact_supporter
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_contact_supporter`;
CREATE TABLE `nv4_en_contact_supporter`  (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `departmentid` smallint UNSIGNED NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `others` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `act` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `weight` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_contact_supporter
-- ----------------------------

-- ----------------------------
-- Table structure for nv4_en_freecontent_blocks
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_freecontent_blocks`;
CREATE TABLE `nv4_en_freecontent_blocks`  (
  `bid` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_freecontent_blocks
-- ----------------------------
INSERT INTO `nv4_en_freecontent_blocks` VALUES (1, 'Sản phẩm', 'Sản phẩm của công ty cổ phần phát triển nguồn mở Việt Nam - VINADES.,JSC');

-- ----------------------------
-- Table structure for nv4_en_freecontent_rows
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_freecontent_rows`;
CREATE TABLE `nv4_en_freecontent_rows`  (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `bid` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '_blank|_self|_parent|_top',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `start_time` int NOT NULL DEFAULT 0,
  `end_time` int NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0: In-Active, 1: Active, 2: Expired',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_freecontent_rows
-- ----------------------------
INSERT INTO `nv4_en_freecontent_rows` VALUES (1, 1, 'Hệ quản trị nội dung NukeViet', '<ul>\n	<li>Giải thưởng Nhân tài đất Việt 2011, 10.000+ website đang sử dụng</li>\n	<li>Được Bộ GD&amp;ĐT khuyến khích sử dụng trong các cơ sở giáo dục</li>\n	<li>Bộ TT&amp;TT quy định ưu tiên sử dụng trong cơ quan nhà nước</li>\n</ul>', 'https://vinades.vn/vi/san-pham/nukeviet/', '_blank', 'nukeviet.jpg', 1772423300, 0, 1);
INSERT INTO `nv4_en_freecontent_rows` VALUES (2, 1, 'Cổng thông tin doanh nghiệp', '<ul>\n	<li>Tích hợp bán hàng trực tuyến</li>\n	<li>Tích hợp các nghiệp vụ quản lý (quản lý khách hàng, quản lý nhân sự, quản lý tài liệu)</li>\n</ul>', 'https://vinades.vn/vi/san-pham/Cong-thong-tin-doanh-nghiep-NukeViet-portal/', '_blank', 'nukeviet-portal.jpg', 1772423300, 0, 1);
INSERT INTO `nv4_en_freecontent_rows` VALUES (3, 1, 'Cổng thông tin Phòng giáo dục, Sở giáo dục', '<ul>\n	<li>Tích hợp chung website hàng trăm trường</li>\n	<li>Tích hợp các ứng dụng trực tuyến (Tra điểm SMS, Tra cứu văn bằng, Học bạ điện tử ...)</li>\n</ul>', 'https://vinades.vn/vi/san-pham/Cong-thong-tin-giao-duc-NukeViet-Edugate/', '_blank', 'nukeviet-edu.jpg', 1772423300, 0, 1);
INSERT INTO `nv4_en_freecontent_rows` VALUES (4, 1, 'Tòa soạn báo điện tử chuyên nghiệp', '<ul>\n	<li>Bảo mật đa tầng, phân quyền linh hoạt</li>\n	<li>Hệ thống bóc tin tự động, đăng bài tự động, cùng nhiều chức năng tiên tiến khác...</li>\n</ul>', 'https://vinades.vn/vi/san-pham/Toa-soan-bao-dien-tu/', '_blank', 'nukeviet-toasoan.jpg', 1772423300, 0, 1);

-- ----------------------------
-- Table structure for nv4_en_menu
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_menu`;
CREATE TABLE `nv4_en_menu`  (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_menu
-- ----------------------------
INSERT INTO `nv4_en_menu` VALUES (1, 'Top Menu');

-- ----------------------------
-- Table structure for nv4_en_menu_rows
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_menu_rows`;
CREATE TABLE `nv4_en_menu_rows`  (
  `id` mediumint NOT NULL AUTO_INCREMENT,
  `parentid` mediumint UNSIGNED NOT NULL,
  `mid` smallint NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `weight` int NOT NULL,
  `sort` int NOT NULL DEFAULT 0,
  `lev` int NOT NULL DEFAULT 0,
  `subitem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `groups_view` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `op` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `target` tinyint NULL DEFAULT 0,
  `css` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `active_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentid`(`parentid`, `mid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_menu_rows
-- ----------------------------
INSERT INTO `nv4_en_menu_rows` VALUES (1, 0, 1, 'About', '/thcs_lytutrong/index.php?language=en&nv=about', '', '', '', 1, 1, 0, '', '6', 'about', '', 1, '', 0, 1);
INSERT INTO `nv4_en_menu_rows` VALUES (2, 0, 1, 'News', '/thcs_lytutrong/index.php?language=en&nv=news', '', '', '', 2, 2, 0, '', '6', 'news', '', 1, '', 0, 1);
INSERT INTO `nv4_en_menu_rows` VALUES (3, 0, 1, 'Users', '/thcs_lytutrong/index.php?language=en&nv=users', '', '', '', 3, 3, 0, '6,7,8,9,10,11', '6', 'users', '', 1, '', 0, 1);
INSERT INTO `nv4_en_menu_rows` VALUES (4, 0, 1, 'Voting', '/thcs_lytutrong/index.php?language=en&nv=voting', '', '', '', 4, 10, 0, '', '6', 'voting', '', 1, '', 0, 1);
INSERT INTO `nv4_en_menu_rows` VALUES (5, 0, 1, 'Contact', '/thcs_lytutrong/index.php?language=en&nv=contact', '', '', '', 5, 11, 0, '', '6', 'contact', '', 1, '', 0, 1);
INSERT INTO `nv4_en_menu_rows` VALUES (6, 3, 1, 'Login', '/thcs_lytutrong/index.php?language=en&nv=users&op=login', '', '', '', 1, 4, 1, '', '5', 'users', 'login', 1, '', 0, 1);
INSERT INTO `nv4_en_menu_rows` VALUES (7, 3, 1, 'Register', '/thcs_lytutrong/index.php?language=en&nv=users&op=register', '', '', '', 2, 5, 1, '', '5', 'users', 'register', 1, '', 0, 1);
INSERT INTO `nv4_en_menu_rows` VALUES (8, 3, 1, 'Password recovery', '/thcs_lytutrong/index.php?language=en&nv=users&op=lostpass', '', '', '', 3, 6, 1, '', '5', 'users', 'lostpass', 1, '', 0, 1);
INSERT INTO `nv4_en_menu_rows` VALUES (9, 3, 1, 'Account Settings', '/thcs_lytutrong/index.php?language=en&nv=users&op=editinfo', '', '', '', 4, 7, 1, '', '4,7', 'users', 'editinfo', 1, '', 0, 1);
INSERT INTO `nv4_en_menu_rows` VALUES (10, 3, 1, 'Members list', '/thcs_lytutrong/index.php?language=en&nv=users&op=memberlist', '', '', '', 5, 8, 1, '', '4,7', 'users', 'memberlist', 1, '', 0, 1);
INSERT INTO `nv4_en_menu_rows` VALUES (11, 3, 1, 'Logout', '/thcs_lytutrong/index.php?language=en&nv=users&op=logout', '', '', '', 6, 9, 1, '', '4,7', 'users', 'logout', 1, '', 0, 1);

-- ----------------------------
-- Table structure for nv4_en_modblocks
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_modblocks`;
CREATE TABLE `nv4_en_modblocks`  (
  `module_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên module',
  `tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tag của khối block',
  `ini_tag` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tag tương đương trong config ini',
  `title` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Tên gọi nếu có',
  UNIQUE INDEX `modblock`(`module_name`, `tag`) USING BTREE,
  INDEX `module_name`(`module_name`) USING BTREE,
  INDEX `tag`(`tag`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Vị trí block tùy chỉnh theo từng module' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_modblocks
-- ----------------------------

-- ----------------------------
-- Table structure for nv4_en_modfuncs
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_modfuncs`;
CREATE TABLE `nv4_en_modfuncs`  (
  `func_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `func_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `func_custom_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `func_site_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `in_module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_func` tinyint NOT NULL DEFAULT 0,
  `in_submenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `subweight` smallint UNSIGNED NOT NULL DEFAULT 1,
  `setting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`func_id`) USING BTREE,
  UNIQUE INDEX `func_name`(`func_name`, `in_module`) USING BTREE,
  UNIQUE INDEX `alias`(`alias`, `in_module`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nv4_en_modfuncs
-- ----------------------------
INSERT INTO `nv4_en_modfuncs` VALUES (1, 'main', 'main', 'Main', '', 'about', 1, 0, 1, '');
INSERT INTO `nv4_en_modfuncs` VALUES (2, 'sitemap', 'sitemap', 'Sitemap', '', 'about', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (3, 'rss', 'rss', 'Rss', '', 'about', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (4, 'main', 'main', 'Main', '', 'news', 1, 0, 1, '');
INSERT INTO `nv4_en_modfuncs` VALUES (5, 'viewcat', 'viewcat', 'Viewcat', '', 'news', 1, 0, 2, '');
INSERT INTO `nv4_en_modfuncs` VALUES (6, 'topic', 'topic', 'Topic', '', 'news', 1, 0, 3, '');
INSERT INTO `nv4_en_modfuncs` VALUES (7, 'content', 'content', 'Content', '', 'news', 1, 1, 4, '');
INSERT INTO `nv4_en_modfuncs` VALUES (8, 'detail', 'detail', 'Detail', '', 'news', 1, 0, 5, '');
INSERT INTO `nv4_en_modfuncs` VALUES (9, 'tag', 'tag', 'Tag', '', 'news', 1, 0, 6, '');
INSERT INTO `nv4_en_modfuncs` VALUES (10, 'rss', 'rss', 'Rss', '', 'news', 1, 1, 7, '');
INSERT INTO `nv4_en_modfuncs` VALUES (11, 'search', 'search', 'Search', '', 'news', 1, 1, 8, '');
INSERT INTO `nv4_en_modfuncs` VALUES (12, 'groups', 'groups', 'Groups', '', 'news', 1, 0, 9, '');
INSERT INTO `nv4_en_modfuncs` VALUES (13, 'author', 'author', 'Author', '', 'news', 1, 0, 10, '');
INSERT INTO `nv4_en_modfuncs` VALUES (14, 'sitemap', 'sitemap', 'Sitemap', '', 'news', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (15, 'print', 'print', 'Print', '', 'news', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (16, 'rating', 'rating', 'Rating', '', 'news', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (17, 'savefile', 'savefile', 'Savefile', '', 'news', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (18, 'sendmail', 'sendmail', 'Sendmail', '', 'news', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (19, 'instant-rss', 'instant-rss', 'Instant Articles RSS', '', 'news', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (20, 'main', 'main', 'Main', '', 'users', 1, 0, 1, '');
INSERT INTO `nv4_en_modfuncs` VALUES (21, 'login', 'login', 'Login', '', 'users', 1, 1, 2, '');
INSERT INTO `nv4_en_modfuncs` VALUES (22, 'register', 'register', 'Register', '', 'users', 1, 1, 3, '');
INSERT INTO `nv4_en_modfuncs` VALUES (23, 'lostpass', 'lostpass', 'Password recovery', '', 'users', 1, 1, 4, '');
INSERT INTO `nv4_en_modfuncs` VALUES (24, 'active', 'active', 'Active account', '', 'users', 1, 0, 5, '');
INSERT INTO `nv4_en_modfuncs` VALUES (25, 'lostactivelink', 'lostactivelink', 'Lostactivelink', '', 'users', 1, 0, 6, '');
INSERT INTO `nv4_en_modfuncs` VALUES (26, 'editinfo', 'editinfo', 'Account Settings', '', 'users', 1, 1, 7, '');
INSERT INTO `nv4_en_modfuncs` VALUES (27, 'memberlist', 'memberlist', 'Members list', '', 'users', 1, 1, 8, '');
INSERT INTO `nv4_en_modfuncs` VALUES (28, 'groups', 'groups', 'Group management', '', 'users', 1, 1, 9, '');
INSERT INTO `nv4_en_modfuncs` VALUES (29, 'avatar', 'avatar', 'Avatar', '', 'users', 1, 0, 10, '');
INSERT INTO `nv4_en_modfuncs` VALUES (30, 'logout', 'logout', 'Logout', '', 'users', 1, 1, 11, '');
INSERT INTO `nv4_en_modfuncs` VALUES (31, 'oauth', 'oauth', 'Oauth', '', 'users', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (32, 'main', 'main', 'Main', '', 'contact', 1, 0, 1, '');
INSERT INTO `nv4_en_modfuncs` VALUES (33, 'main', 'main', 'Main', '', 'statistics', 1, 0, 1, '');
INSERT INTO `nv4_en_modfuncs` VALUES (34, 'allreferers', 'allreferers', 'By referrers', '', 'statistics', 1, 1, 2, '');
INSERT INTO `nv4_en_modfuncs` VALUES (35, 'allcountries', 'allcountries', 'By countries', '', 'statistics', 1, 1, 3, '');
INSERT INTO `nv4_en_modfuncs` VALUES (36, 'allbrowsers', 'allbrowsers', 'By browsers ', '', 'statistics', 1, 1, 4, '');
INSERT INTO `nv4_en_modfuncs` VALUES (37, 'allos', 'allos', 'By operating system', '', 'statistics', 1, 1, 5, '');
INSERT INTO `nv4_en_modfuncs` VALUES (38, 'allbots', 'allbots', 'By search engines', '', 'statistics', 1, 1, 6, '');
INSERT INTO `nv4_en_modfuncs` VALUES (39, 'referer', 'referer', 'By month', '', 'statistics', 1, 0, 7, '');
INSERT INTO `nv4_en_modfuncs` VALUES (40, 'main', 'main', 'Main', '', 'voting', 1, 0, 1, '');
INSERT INTO `nv4_en_modfuncs` VALUES (41, 'main', 'main', 'Main', '', 'banners', 1, 0, 1, '');
INSERT INTO `nv4_en_modfuncs` VALUES (42, 'addads', 'addads', 'Addads', '', 'banners', 1, 0, 2, '');
INSERT INTO `nv4_en_modfuncs` VALUES (43, 'clientinfo', 'clientinfo', 'Clientinfo', '', 'banners', 1, 0, 3, '');
INSERT INTO `nv4_en_modfuncs` VALUES (44, 'stats', 'stats', 'Stats', '', 'banners', 1, 0, 4, '');
INSERT INTO `nv4_en_modfuncs` VALUES (45, 'cledit', 'cledit', 'Cledit', '', 'banners', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (46, 'click', 'click', 'Click', '', 'banners', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (47, 'clinfo', 'clinfo', 'Clinfo', '', 'banners', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (48, 'logininfo', 'logininfo', 'Logininfo', '', 'banners', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (49, 'viewmap', 'viewmap', 'Viewmap', '', 'banners', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (50, 'main', 'main', 'Main', '', 'seek', 1, 0, 1, '');
INSERT INTO `nv4_en_modfuncs` VALUES (51, 'main', 'main', 'Main', '', 'feeds', 1, 0, 1, '');
INSERT INTO `nv4_en_modfuncs` VALUES (52, 'main', 'main', 'Main', '', 'page', 1, 0, 1, '');
INSERT INTO `nv4_en_modfuncs` VALUES (53, 'sitemap', 'sitemap', 'Sitemap', '', 'page', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (54, 'rss', 'rss', 'Rss', '', 'page', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (55, 'main', 'main', 'Main', '', 'comment', 1, 0, 1, '');
INSERT INTO `nv4_en_modfuncs` VALUES (56, 'post', 'post', 'Post', '', 'comment', 1, 0, 2, '');
INSERT INTO `nv4_en_modfuncs` VALUES (57, 'like', 'like', 'Like', '', 'comment', 1, 0, 3, '');
INSERT INTO `nv4_en_modfuncs` VALUES (58, 'delete', 'delete', 'Delete', '', 'comment', 1, 0, 4, '');
INSERT INTO `nv4_en_modfuncs` VALUES (59, 'down', 'down', 'Down', '', 'comment', 1, 0, 5, '');
INSERT INTO `nv4_en_modfuncs` VALUES (60, 'main', 'main', 'Main', '', 'siteterms', 1, 0, 1, '');
INSERT INTO `nv4_en_modfuncs` VALUES (61, 'rss', 'rss', 'Rss', '', 'siteterms', 1, 0, 2, '');
INSERT INTO `nv4_en_modfuncs` VALUES (62, 'sitemap', 'sitemap', 'Sitemap', '', 'siteterms', 0, 0, 0, '');
INSERT INTO `nv4_en_modfuncs` VALUES (63, 'main', 'main', 'Main', '', 'two-step-verification', 1, 0, 1, '');
INSERT INTO `nv4_en_modfuncs` VALUES (64, 'confirm', 'confirm', 'Confirm', '', 'two-step-verification', 1, 0, 2, '');
INSERT INTO `nv4_en_modfuncs` VALUES (65, 'setup', 'setup', 'Setup', '', 'two-step-verification', 1, 0, 3, '');

-- ----------------------------
-- Table structure for nv4_en_modthemes
-- ----------------------------
DROP TABLE IF EXISTS `nv4_en_modthemes`;
CREATE TABLE `nv4_en_modthemes`  (
  `func_id` mediumint NULL DEFAULT NULL,
  `layout` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `theme` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  UNIQUE INDEX `func_id`(`func_id`, `layout`, `theme`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;
