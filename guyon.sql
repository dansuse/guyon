-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2017 at 01:54 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guyon`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `idpost` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `comment` text NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `idpost`, `username`, `comment`, `like_count`, `status`, `created`, `updated`) VALUES
(1, 2, 'hendynew', 'Dicintai oleh dia!', 0, '1', '0000-00-00 00:00:00', '2017-05-14 13:58:54');

-- --------------------------------------------------------

--
-- Table structure for table `comment_like`
--

CREATE TABLE `comment_like` (
  `id` int(11) NOT NULL,
  `idcomment` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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

CREATE TABLE `like` (
  `id` int(11) NOT NULL,
  `idpost` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `like`
--

INSERT INTO `like` (`id`, `idpost`, `username`, `status`, `created`, `updated`) VALUES
(1, 1, 'FylvGt6Yyb6n-zTXcJHwjBawO', 1, '0000-00-00 00:00:00', '2017-05-14 13:15:20'),
(2, 2, 'hendynew', -1, '0000-00-00 00:00:00', '2017-05-14 13:29:54');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`) VALUES
(1, 'api/post/all', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"16124bef-7e9b-4e56-9fd0-1b4d11f7d6e3\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495951730, 0.147486, '1', 200),
(2, 'api/post/all', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"4351900a-f2fe-479c-8a96-67c6c262afe6\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495952230, 0.172143, '1', 200),
(3, 'api/post/all', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"16ceb1be-267a-4e75-83e5-1b72ffb9626f\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495954055, 0.201507, '1', 200),
(4, 'api/post/all', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"b00e026f-1d0b-41d3-9985-5a8429bdbb71\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495955224, 0.148459, '1', 200),
(5, 'api/post/all', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"1b34b306-ac16-4f29-b653-4d81b5b3b471\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495955235, 0.129238, '1', 200),
(6, 'api/post/all', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"3bb46570-4931-4c2d-841c-d6a3c512e2b7\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495956827, 0.183528, '1', 200),
(7, 'api/post/all', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"bab8b8e7-f9ba-460a-bbf5-6899085b575f\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495957659, 0.276306, '1', 200),
(8, 'api/post/all', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"facbd778-cc78-41a0-b248-ca4f367dc4f1\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495957672, 0.155063, '0', 403),
(9, 'api/key/new', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"25cfa6e6-a4bb-4c15-927c-2e843e83ab80\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495958313, 0.145045, '0', 403),
(10, 'api/key/new', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"7259b9d9-4159-4426-9382-79f642aca7a3\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495958485, 0.152007, '0', 403),
(11, 'api/key/new', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"3fe1f4cc-a239-4092-ac8b-d2a907fe98ec\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495958489, 0.122702, '0', 403),
(12, 'api/key/new', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"82defad3-90c3-4ad2-8516-4ed191c963d3\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495958490, 0.280369, '0', 403),
(13, 'api/key/new', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"e534424d-1d59-4611-a7b4-cdf5023c4207\";s:9:\"X-API-KEY\";s:9:\"asdasdasd\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495958995, 0.135861, '0', 403),
(14, 'api/key/new', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"53fb2c93-bfd6-41b8-915e-eb77c5ab3280\";s:9:\"X-API-KEY\";s:9:\"asdasdasd\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495959003, 0.164147, '0', 403),
(15, 'api/key/new', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"a9124855-b162-415c-97c4-06762b57905a\";s:9:\"X-API-KEY\";s:9:\"asdasdasd\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495960620, 0.193316, '1', 201),
(16, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"665a5b05-367f-4010-abe3-d5f3de1d4cc8\";s:9:\"X-API-KEY\";s:0:\"\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495960797, 0.237262, '0', 403),
(17, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"95977004-9ac7-47f6-b80b-ea1367c7242c\";s:9:\"X-API-KEY\";s:40:\"0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4', '::1', 1495960844, 0.277626, '1', 200),
(18, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"77c7eb1b-2346-472d-8f38-b0356ce4210c\";s:9:\"X-API-KEY\";s:40:\"0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4\";s:13:\"Authorization\";s:30:\"Basic dXNlcm5hbWU6cGFzc3dvcmQ=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4', '::1', 1495961401, 0.241237, '1', 200),
(19, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"748773bd-524e-43d1-9cee-771a0e66f2b9\";s:9:\"X-API-KEY\";s:40:\"0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4\";s:13:\"Authorization\";s:222:\"Digest username=\"username\", realm=\"REST API\", nonce=\"592a94f3aaac6\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"592a9523e6767\", response=\"30ff48e92a45b86162c420a5f129c011\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4', '::1', 1495963250, 0.421669, '1', 200),
(20, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"c429b15b-a717-4b06-9983-45948fbaa79f\";s:9:\"X-API-KEY\";s:40:\"0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4\";s:13:\"Authorization\";s:222:\"Digest username=\"username\", realm=\"REST API\", nonce=\"592a94f3aaac6\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"592a9523e6767\", response=\"30ff48e92a45b86162c420a5f129c011\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4', '::1', 1495963285, 0.109035, '1', 200),
(21, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"f166054f-4b72-404b-aad6-db2fa623078b\";s:9:\"X-API-KEY\";s:40:\"0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4\";s:13:\"Authorization\";s:222:\"Digest username=\"username\", realm=\"REST API\", nonce=\"592a94f3aaac6\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"592a9523e6767\", response=\"30ff48e92a45b86162c420a5f129c011\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4', '::1', 1495965413, 0.229264, '1', 200),
(22, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"d56a3483-3521-4c37-872e-f714b8dd186d\";s:9:\"X-API-KEY\";s:40:\"0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4\";s:13:\"Authorization\";s:222:\"Digest username=\"username\", realm=\"REST API\", nonce=\"592a94f3aaac6\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"592a9523e6767\", response=\"30ff48e92a45b86162c420a5f129c011\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4', '::1', 1495966044, 0.132482, '1', 200),
(23, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"94ffa178-77f0-43fa-8dcf-df4e77ad77a3\";s:9:\"X-API-KEY\";s:40:\"0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592a94f3aaac6\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"592a9523e6767\", response=\"c9dd9bdbd5adb9275307d33680e66673\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4', '::1', 1495966944, 0.167144, '1', 200),
(24, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"9b0e9839-3c0d-4f0d-a601-298ac749ecbe\";s:9:\"X-API-KEY\";s:40:\"0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592a94f3aaac6\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"592a9523e6767\", response=\"c9dd9bdbd5adb9275307d33680e66673\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '0cs8ks8cowwgoko8g8k4cwc0gw8owcos4skokcs4', '::1', 1495967130, 0.107147, '1', 200),
(25, 'api/key/new', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"3a38ead1-39db-4b10-a2c3-22629190d7fe\";s:9:\"X-API-KEY\";s:9:\"asdasdasd\";s:13:\"Authorization\";s:221:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592a94f3aaac6\", uri=\"/guyon/api/key/new\", qop=auth, nc=1, cnonce=\"592a9523e6767\", response=\"b3b1746ba39b511e2d0bdf36cff4d53d\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495968054, 0.181884, '1', 500),
(26, 'api/key/new', 'get', 'a:10:{s:8:\"username\";s:8:\"hendynew\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"2286aafc-a6e2-4d55-b246-007077d93daf\";s:9:\"X-API-KEY\";s:9:\"asdasdasd\";s:13:\"Authorization\";s:239:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592a94f3aaac6\", uri=\"/guyon/api/key/new?username=hendynew\", qop=auth, nc=1, cnonce=\"592a9523e6767\", response=\"201f9065d6a65d9c815299a35d75e35a\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495968080, NULL, '1', 0),
(27, 'api/key/new', 'get', 'a:10:{s:8:\"username\";s:8:\"hendynew\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"ef0f929d-9799-4b24-978b-350bcf2169c2\";s:9:\"X-API-KEY\";s:9:\"asdasdasd\";s:13:\"Authorization\";s:239:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592a94f3aaac6\", uri=\"/guyon/api/key/new?username=hendynew\", qop=auth, nc=1, cnonce=\"592a9523e6767\", response=\"201f9065d6a65d9c815299a35d75e35a\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495968093, 0.164271, '1', 0),
(28, 'api/key/new', 'get', 'a:10:{s:8:\"username\";s:8:\"hendynew\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"0f96af22-eca5-42d6-98d9-b996daa95fc8\";s:9:\"X-API-KEY\";s:9:\"asdasdasd\";s:13:\"Authorization\";s:239:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592a94f3aaac6\", uri=\"/guyon/api/key/new?username=hendynew\", qop=auth, nc=1, cnonce=\"592a9523e6767\", response=\"201f9065d6a65d9c815299a35d75e35a\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495968157, 0.131801, '1', 201),
(29, 'api/key/new', 'get', 'a:10:{s:8:\"username\";s:8:\"hendynew\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"dbd0f313-d452-40b2-ad4a-54f23d44fac3\";s:9:\"X-API-KEY\";s:9:\"asdasdasd\";s:13:\"Authorization\";s:239:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592a94f3aaac6\", uri=\"/guyon/api/key/new?username=hendynew\", qop=auth, nc=1, cnonce=\"592a9523e6767\", response=\"201f9065d6a65d9c815299a35d75e35a\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495968171, 0.22688, '1', 500),
(30, 'api/post/mashup_template', 'get', 'a:7:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"81af0007-7330-4450-9d38-d4e01899afda\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495970751, 1.3759, '1', 200),
(31, 'api/post/memegen_fonts', 'get', 'a:7:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"10a8b4cd-3462-4c0f-a142-148a4fb65d2a\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495970871, 1.49924, '1', 200),
(32, 'api/post/memegen_fonts', 'get', 'a:7:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"de2e52a9-0274-4508-96d5-fce975b29c87\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495970906, 1.30395, '1', 200),
(33, 'api/post/memegen_fonts', 'get', 'a:7:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"e9e1e305-a8e6-494a-9b5e-4766ff51843f\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495970918, 1.39277, '1', 200),
(34, 'api/post/memegen_templates', 'get', 'a:7:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"c9ba48cc-2b99-4fff-87ad-875898d58b6a\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495970926, 1.3719, '1', 200),
(35, 'api/post/memegen_create_meme', 'get', 'a:10:{s:6:\"gambar\";s:6:\"tenguy\";s:5:\"text1\";s:4:\"haha\";s:5:\"text2\";s:4:\"hehe\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"c896a29b-1edd-4490-b45e-0ba9a705b116\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495971639, 3.25003, '1', 200),
(36, 'api/post/memegen_create_meme', 'get', 'a:10:{s:6:\"gambar\";s:6:\"tenguy\";s:5:\"text1\";s:4:\"haha\";s:5:\"text2\";s:4:\"hehe\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"f5679f6b-a3f0-42a4-a151-cb79c98852d3\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495971675, 0.122682, '1', 200),
(37, 'api/post/memegen_create_meme', 'get', 'a:11:{s:6:\"gambar\";s:6:\"tenguy\";s:5:\"text1\";s:4:\"haha\";s:5:\"text2\";s:4:\"hehe\";s:4:\"font\";s:9:\"exo-black\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"4b8590c3-762a-44bf-bd15-3869d444230c\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495971729, 0.180999, '1', 200),
(38, 'api/post/memegen_create_meme', 'get', 'a:13:{s:6:\"gambar\";s:6:\"tenguy\";s:5:\"text1\";s:4:\"haha\";s:5:\"text2\";s:4:\"hehe\";s:4:\"font\";s:9:\"exo-black\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:3:\"500\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"a547475b-c5ce-47ce-8536-f69748ec09af\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1495971781, 0.128505, '1', 200);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `username` varchar(25) NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `idkategori`, `caption`, `namafile`, `username`, `like_count`, `comment_count`, `status`, `created`, `updated`) VALUES
(8, 1, 'Slavic RPG', 'agLbjb1_700b.jpg', 'hendynew', 0, 0, '0', '0000-00-00 00:00:00', '2017-05-25 08:50:32'),
(9, 2, 'I got accepted to Harvard University', 'a3qDxL7_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:00:28'),
(10, 3, 'Me every Friday night', 'aWmArbK_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:00:44'),
(11, 2, '10 if it\'s my lucky day', 'a9reg31_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:00:57'),
(12, 1, 'Where can I buy this shit', 'ajXjMWQ_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:01:10'),
(13, 1, 'So trueeeee', 'aQ9KjQW_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:01:22'),
(14, 2, 'Teenage Mutant Human-Turtle', 'a2rV3wp_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:01:32'),
(15, 2, 'BFF\'s', 'avGqZnq_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `id` int(11) NOT NULL,
  `idcomment` int(11) NOT NULL,
  `idreply` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `comment` text NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reply`
--

INSERT INTO `reply` (`id`, `idcomment`, `idreply`, `username`, `comment`, `like_count`, `status`, `created`, `updated`) VALUES
(1, 1, 0, 'hendynew', 'Dicintai oleh dia!', 0, '1', '0000-00-00 00:00:00', '2017-05-14 13:58:24'),
(2, 1, 0, 'hendynew', 'Dicintai oleh dia!', 0, '1', '0000-00-00 00:00:00', '2017-05-14 13:59:06'),
(3, 1, 0, 'hendynew', 'Dicintai oleh dia!11', 0, '1', '0000-00-00 00:00:00', '2017-05-14 14:01:31'),
(4, 0, 3, 'hendynew', 'wkwkwkw', 0, '1', '0000-00-00 00:00:00', '2017-05-28 11:47:08'),
(5, 0, 4, 'hendynew', 'hohohoho', 0, '1', '2017-05-28 18:48:07', '2017-05-28 11:48:07');

-- --------------------------------------------------------

--
-- Table structure for table `reply_like`
--

CREATE TABLE `reply_like` (
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

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `idpost` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `cause` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `idpost`, `username`, `cause`, `status`, `created`, `updated`) VALUES
(1, 8, 'hendynew', 'this is bad', 0, '2017-05-25 15:50:32', '2017-05-25 08:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
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
('hendynew', '+xlJsUIrCsFj/S4LRVT+8ydq0jrpOBxQcLq4N7IKhBk=', 'af4149461a', 'Hendy Lukas', 'hendylukas68@gmail.com', '', '0000-00-00 00:00:00', '2017-05-09 02:40:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_like`
--
ALTER TABLE `comment_like`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reply_like`
--
ALTER TABLE `reply_like`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `comment_like`
--
ALTER TABLE `comment_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `like`
--
ALTER TABLE `like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `reply`
--
ALTER TABLE `reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `reply_like`
--
ALTER TABLE `reply_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
