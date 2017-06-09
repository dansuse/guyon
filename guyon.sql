-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2017 at 01:29 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `guyon`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE IF NOT EXISTS `access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL DEFAULT '',
  `all_access` tinyint(1) NOT NULL DEFAULT '0',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `nama`, `created`, `updated`) VALUES
(1, 'Funny', '2017-05-08 00:00:00', '2017-05-08 06:09:59'),
(2, 'NSFW', '2017-05-08 00:00:00', '2017-05-08 06:09:59'),
(3, 'WTF', '2017-05-08 00:00:00', '2017-05-08 06:11:17'),
(4, 'Gaming', '2017-05-08 00:00:00', '2017-05-08 06:11:17'),
(5, 'Savage', '2017-05-08 00:00:00', '2017-05-08 06:11:17');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL,
  `idpost` int(11) NOT NULL DEFAULT '0',
  `idcomment` int(11) NOT NULL DEFAULT '0',
  `username` varchar(25) NOT NULL,
  `comment` text NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `idpost`, `idcomment`, `username`, `comment`, `like_count`, `status`, `created`, `updated`) VALUES
(1, 1, 0, 'hendynew', 'Dicintai oleh dia!', 0, '1', '0000-00-00 00:00:00', '2017-05-14 06:58:24'),
(2, 1, 0, 'hendynew', 'Dicintai oleh dia!', 0, '1', '0000-00-00 00:00:00', '2017-05-14 06:59:06'),
(3, 1, 0, 'hendynew', 'Dicintai oleh dia!11', 0, '1', '0000-00-00 00:00:00', '2017-05-14 07:01:31'),
(4, 0, 3, 'hendynew', 'wkwkwkw', 0, '1', '0000-00-00 00:00:00', '2017-05-28 04:47:08'),
(5, 0, 4, 'hendynew', 'hohohoho', 0, '1', '2017-05-28 18:48:07', '2017-05-28 04:48:07');

-- --------------------------------------------------------

--
-- Table structure for table `comment_like`
--

CREATE TABLE IF NOT EXISTS `comment_like` (
  `id` int(11) NOT NULL,
  `idcomment` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE IF NOT EXISTS `keys` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `username`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`, `updated`) VALUES
(2, 'hendynew', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', 1, 1, 0, NULL, 1495968157, '2017-05-28 10:42:37');

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE IF NOT EXISTS `like` (
  `id` int(11) NOT NULL,
  `idpost` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `like`
--

INSERT INTO `like` (`id`, `idpost`, `username`, `status`, `created`, `updated`) VALUES
(1, 1, 'FylvGt6Yyb6n-zTXcJHwjBawO', 1, '0000-00-00 00:00:00', '2017-05-14 13:15:20'),
(2, 2, 'hendynew', -1, '0000-00-00 00:00:00', '2017-05-14 13:29:54');

-- --------------------------------------------------------

--
-- Table structure for table `limits`
--

CREATE TABLE IF NOT EXISTS `limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`) VALUES
(1, 'api/key/new', 'get', 'a:9:{s:8:"username";s:8:"hendynew";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"cd399fa9-2d41-447c-80e6-a6a25887e206";s:13:"Authorization";s:235:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/key/new?username=hendynew", qop=auth, nc=1, cnonce="asdasdasd", response="173ca7092970fadc010aad48cdc35334", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '', '::1', 1496042221, 1.18051, '1', 500),
(2, 'api/key/new', 'get', 'a:9:{s:8:"username";s:10:"hendylukas";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"4fd81a61-eff5-4e6d-8912-283c48d5aefc";s:13:"Authorization";s:237:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/key/new?username=hendylukas", qop=auth, nc=1, cnonce="asdasdasd", response="bc8c7d703be897ac11606f8ff7901c0b", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '', '::1', 1496042297, 1.13397, '1', 500),
(3, 'api/key/new', 'get', 'a:9:{s:8:"username";s:10:"hendylukas";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"7d5557c1-2bbd-4681-9d4a-0241fb54a1df";s:13:"Authorization";s:237:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/key/new?username=hendylukas", qop=auth, nc=1, cnonce="asdasdasd", response="bc8c7d703be897ac11606f8ff7901c0b", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '', '::1', 1496042487, 1.15488, '1', 500),
(4, 'api/key/new', 'get', 'a:9:{s:8:"username";s:10:"hendylukas";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"4be94b81-0815-4a48-9ce9-250bd44422cc";s:13:"Authorization";s:237:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/key/new?username=hendylukas", qop=auth, nc=1, cnonce="asdasdasd", response="bc8c7d703be897ac11606f8ff7901c0b", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '', '::1', 1496042499, 1.12423, '1', 500),
(5, 'api/key/new', 'get', 'a:9:{s:8:"username";s:8:"hendynew";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"6d8eaae7-6797-41e5-8ca4-92de66265097";s:13:"Authorization";s:235:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/key/new?username=hendynew", qop=auth, nc=1, cnonce="asdasdasd", response="173ca7092970fadc010aad48cdc35334", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '', '::1', 1496042512, 1.12853, '1', 500),
(6, 'api/post/all', 'get', 'a:9:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"c862eebc-6322-49da-908c-065410dfde5a";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:13:"Authorization";s:218:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/all", qop=auth, nc=1, cnonce="asdasdasd", response="76612f973076094f776c67ddc7036de3", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496042760, 1.13412, '0', 401),
(7, 'api/post/all', 'get', 'a:9:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"e2857786-3870-4f0d-afab-07c7c33f1f73";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:13:"Authorization";s:218:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/all", qop=auth, nc=1, cnonce="asdasdasd", response="76612f973076094f776c67ddc7036de3", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496042770, 1.25734, '1', 200),
(8, 'api/post/all', 'get', 'a:9:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"280ca33f-3ccc-48d5-9178-7c43e32ed76a";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:13:"Authorization";s:218:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/all", qop=auth, nc=1, cnonce="asdasdasd", response="76612f973076094f776c67ddc7036de3", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496042796, 1.1605, '0', 401),
(9, 'api/post/all', 'get', 'a:9:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"4d5527da-c78a-43ff-aedb-221a14c9f2e2";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:13:"Authorization";s:218:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/all", qop=auth, nc=1, cnonce="asdasdasd", response="76612f973076094f776c67ddc7036de3", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496043497, 1.14592, '0', 401),
(10, 'api/post/all', 'get', 'a:9:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"1b996047-7254-405a-b0a4-71a286eb1f1f";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:13:"Authorization";s:218:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/all", qop=auth, nc=1, cnonce="asdasdasd", response="76612f973076094f776c67ddc7036de3", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496043503, 1.20136, '1', 200),
(11, 'api/post/all', 'get', 'a:9:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"70aea7f1-8baf-4dc0-b938-bf3be10c210d";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:13:"Authorization";s:218:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/all", qop=auth, nc=1, cnonce="asdasdasd", response="76612f973076094f776c67ddc7036de3", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496043508, 1.19308, '1', 200),
(12, 'api/post/all', 'get', 'a:9:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"a3727e71-50e4-46ee-a0a9-9e132e6e89f2";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:13:"Authorization";s:218:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/all", qop=auth, nc=1, cnonce="asdasdasd", response="76612f973076094f776c67ddc7036de3", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496043515, 1.17084, '1', 200),
(13, 'api/post/all', 'get', 'a:9:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"9197a02e-9303-401d-8046-95a17b159c5b";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:13:"Authorization";s:218:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/all", qop=auth, nc=1, cnonce="asdasdasd", response="76612f973076094f776c67ddc7036de3", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496043806, 1.16663, '1', 200),
(14, 'api/post/all', 'get', 'a:9:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"16b307bf-dcf4-43a4-a9fe-9805bcc302b3";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:13:"Authorization";s:218:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/all", qop=auth, nc=1, cnonce="asdasdasd", response="76612f973076094f776c67ddc7036de3", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496043901, 1.13897, '1', 200),
(15, 'api/post/all', 'get', 'a:9:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"e40cb642-1680-4870-971f-3aa2d69216d6";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:13:"Authorization";s:218:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/all", qop=auth, nc=1, cnonce="asdasdasd", response="76612f973076094f776c67ddc7036de3", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496045717, 1.14581, '1', 200);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL COMMENT '获取资源的access_token',
  `client_id` varchar(80) NOT NULL COMMENT '开发者Appid',
  `user_id` varchar(255) DEFAULT NULL COMMENT '开发者用户id',
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '认证的时间date("Y-m-d H:i:s")',
  `scope` varchar(2000) DEFAULT NULL COMMENT '权限容器',
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`access_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('0b84a512b6ea40d9aa71027fd3dd46d898e2ae5c', 'testclient', 'user', '2015-06-28 08:55:05', 'userinfo cloud file node'),
('1d83cfb85c8afe71dac8a9ab32875d4ce8025c11', 'testclient', 'user', '2015-06-28 08:53:34', 'userinfo cloud file node'),
('1f960e7bd2454a4a25f91232b71e2659fa8d6415', 'testclient', 'xiaocao', '2015-06-28 08:46:33', 'userinfo cloud file node'),
('23b3ce4747183460fd753238f0e79b34b3e7bc3c', 'testclient', 'user', '2015-06-28 08:55:06', 'userinfo node file'),
('5c19932029b545ba220b3cba53cc996d8e321704', 'testclient', 'user', '2015-06-28 08:54:33', 'userinfo cloud file node'),
('6b0abf82a8b4269759b47a2797794f657fe8868a', 'testclient', 'user', '2015-06-28 08:46:36', 'userinfo cloud file node'),
('7b6c72176ede3e63f78d61849b6ad01b2bf81a6b', 'testclient', 'user', '2015-06-28 08:55:16', 'userinfo node file'),
('8995e510a6e5672c73e800d48acf8a3f79205621', 'testclient', 'user', '2015-06-28 08:46:49', 'userinfo cloud file node'),
('8cb848d89b7d12beb746b0421ece7209f5c8633a', 'testclient', 'xiaocao', '2015-06-28 08:55:13', 'userinfo cloud file node'),
('ae5f8c93dc51d856d6536aec528c31c6f6450458', 'testclient', 'user', '2015-06-28 08:55:16', 'userinfo cloud file node'),
('df43443857a63df74f426dfa679c887483827318', 'testclient', 'xiaocao', '2015-06-28 08:46:48', 'userinfo cloud file node');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_authorization_codes`
--

CREATE TABLE IF NOT EXISTS `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL COMMENT '通过Authorization 获取到的code，用于获取access_token',
  `client_id` varchar(80) NOT NULL COMMENT '开发者Appid',
  `user_id` varchar(255) DEFAULT NULL COMMENT '开发者用户id',
  `redirect_uri` varchar(2000) DEFAULT NULL COMMENT '认证后跳转的url',
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '认证的时间date("Y-m-d H:i:s")',
  `scope` varchar(2000) DEFAULT NULL COMMENT '权限容器',
  PRIMARY KEY (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_authorization_codes`
--

INSERT INTO `oauth_authorization_codes` (`authorization_code`, `client_id`, `user_id`, `redirect_uri`, `expires`, `scope`) VALUES
('016e1a57392e4b672415340ba4d6df18c90eab9f', 'testclient', NULL, '', '2015-06-28 07:56:55', 'userinfo'),
('2f37568bc9a2d8eb3ecb4c360a3abc71235f68c0', 'testclient', NULL, '', '2015-06-28 07:52:14', 'userinfo'),
('63c3b32c565eea30197068658d32678baf1202d6', 'testclient', NULL, '', '2015-06-28 07:56:51', 'userinfo'),
('89fab65a94cbbf8b39ac21a3d797d45964deabd2', 'testclient', NULL, '', '2015-06-28 07:56:57', 'userinfo');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `client_id` varchar(80) NOT NULL COMMENT '开发者AppId',
  `client_secret` varchar(80) NOT NULL COMMENT '开发者AppSecret',
  `redirect_uri` varchar(2000) NOT NULL COMMENT '认证后跳转的url',
  `grant_types` varchar(80) DEFAULT NULL COMMENT '认证的方式，client_credentials、password、refresh_token、authorization_code、authorization_access_token',
  `scope` varchar(100) DEFAULT NULL COMMENT '权限容器',
  `user_id` varchar(80) DEFAULT NULL COMMENT '开发者用户id',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`) VALUES
('client2', 'pass2', 'http://homeway.me/', 'authorization_code', 'file node userinfo cloud', 'xiaocao'),
('testclient', 'testpass', 'http://homeway.me/', 'client_credentials password authorization_code refresh_token', 'file node userinfo cloud', 'xiaocao');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_jwt`
--

CREATE TABLE IF NOT EXISTS `oauth_jwt` (
  `client_id` varchar(80) NOT NULL COMMENT '开发者用户id',
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL COMMENT '跟新access_token的token',
  `client_id` varchar(80) NOT NULL COMMENT '开发者AppId',
  `user_id` varchar(255) DEFAULT NULL COMMENT '开发者用户id',
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '认证的时间date("Y-m-d H:i:s")',
  `scope` varchar(2000) DEFAULT NULL COMMENT '权限容器',
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`refresh_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('0dcd00a06f1598db7c7df2d2faf4c16a7be9c28d', 'testclient', 'user', '2015-07-12 07:55:06', 'userinfo node file'),
('7432203dc184c6c2090fef8b02c5c5acf3f349a5', 'testclient', 'user', '2015-07-12 07:55:16', 'userinfo node file'),
('aef23d373a276116b3afd946ba4a9c39780186c0', 'testclient', 'user', '2015-07-12 07:53:34', 'userinfo cloud file node'),
('af1e55594cae88cedf312f84a89109e3b80a5932', 'testclient', 'user', '2015-07-12 07:54:33', 'userinfo cloud file node'),
('f09ed02ebf185fb08b4f0f316e59bac07028997b', 'testclient', 'user', '2015-07-12 07:46:36', 'userinfo cloud file node'),
('fb1aa4bd8d123abaa882c759d60326dae51543c3', 'testclient', 'user', '2015-07-12 07:46:49', 'userinfo cloud file node');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_scopes` (
  `scope` text COMMENT '容器名字',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '是否默认拥有，1=>是，0=>否'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_scopes`
--

INSERT INTO `oauth_scopes` (`scope`, `is_default`) VALUES
('userinfo', 1),
('file', 0),
('node', 0),
('cloud', 0),
('share', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_users`
--

CREATE TABLE IF NOT EXISTS `oauth_users` (
  `username` varchar(255) NOT NULL COMMENT '内部时候使用的认证用户名',
  `password` varchar(2000) DEFAULT NULL COMMENT '内部时候使用的认证用户密码',
  `first_name` varchar(255) DEFAULT NULL COMMENT '内部时候使用',
  `last_name` varchar(255) DEFAULT NULL COMMENT '内部时候使用',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_users`
--

INSERT INTO `oauth_users` (`username`, `password`, `first_name`, `last_name`) VALUES
('user', 'pass', 'xiaocao', 'grasses'),
('username', 'password', 'xiaocao', 'grasses');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `username` varchar(25) NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `idkategori`, `caption`, `namafile`, `username`, `like_count`, `comment_count`, `status`, `created`, `updated`) VALUES
(8, 1, 'Slavic RPG', 'agLbjb1_700b.jpg', 'hendynew', 0, 0, '0', '0000-00-00 00:00:00', '2017-05-25 08:50:32'),
(9, 2, 'I got accepted to Harvard University', 'a3qDxL7_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:00:28'),
(10, 3, 'Me every Friday night', 'aWmArbK_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:00:44'),
(11, 2, '10 if it''s my lucky day', 'a9reg31_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:00:57'),
(12, 1, 'Where can I buy this shit', 'ajXjMWQ_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:01:10'),
(13, 1, 'So trueeeee', 'aQ9KjQW_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:01:22'),
(14, 2, 'Teenage Mutant Human-Turtle', 'a2rV3wp_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:01:32'),
(15, 2, 'BFF''s', 'avGqZnq_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `reply_like`
--

CREATE TABLE IF NOT EXISTS `reply_like` (
  `id` int(11) NOT NULL,
  `idreply` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE IF NOT EXISTS `report` (
  `id` int(11) NOT NULL,
  `idpost` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `cause` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `idpost`, `username`, `cause`, `status`, `created`, `updated`) VALUES
(1, 8, 'hendynew', 'this is bad', 0, '2017-05-25 15:50:32', '2017-05-25 01:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(25) NOT NULL,
  `password` varchar(44) NOT NULL,
  `hash` varchar(22) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `status` varchar(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `hash`, `nama`, `email`, `status`, `created`, `updated`) VALUES
('hendynew', '+xlJsUIrCsFj/S4LRVT+8ydq0jrpOBxQcLq4N7IKhBk=', 'af4149461a', 'Hendy Lukas', 'hendylukas68@gmail.com', '', '0000-00-00 00:00:00', '2017-05-08 19:40:18');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
