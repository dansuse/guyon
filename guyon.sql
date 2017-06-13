-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2017 at 12:47 AM
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
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(40) NOT NULL DEFAULT '',
  `all_access` tinyint(1) NOT NULL DEFAULT '0',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `idpost` int(11) NOT NULL DEFAULT '0',
  `idcomment` int(11) NOT NULL DEFAULT '0',
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
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `client_id` varchar(80) NOT NULL,
  `limits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `username`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`, `updated`, `client_id`, `limits`) VALUES
(5, 'hendynew', 'kos8000ogk80k4wwc4g4kwwsswcksockskgs8444', 1, 0, 0, NULL, 0, '2017-06-13 17:43:19', 'bubuue5tJuRgoMZXdhfNA1hFzsCa', 1000);

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
(3, 2, 'hendynew', -1, '0000-00-00 00:00:00', '2017-06-10 03:56:21'),
(4, 9, 'hendynew', -1, '0000-00-00 00:00:00', '2017-06-10 03:56:50');

-- --------------------------------------------------------

--
-- Table structure for table `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `limits`
--

INSERT INTO `limits` (`id`, `uri`, `count`, `hour_started`, `api_key`) VALUES
(1, 'api-key:4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', 1, 1497370712, '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0'),
(3, 'api-key:4sscgcwow44sg80ogokg8ok0400w00wowwccw88w', 5, 1497372608, '4sscgcwow44sg80ogokg8ok0400w00wowwccw88w');

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
(1, 'api/key/new', 'get', 'a:9:{s:8:\"username\";s:8:\"hendynew\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"cd399fa9-2d41-447c-80e6-a6a25887e206\";s:13:\"Authorization\";s:235:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/key/new?username=hendynew\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"173ca7092970fadc010aad48cdc35334\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1496042221, 1.18051, '1', 500),
(2, 'api/key/new', 'get', 'a:9:{s:8:\"username\";s:10:\"hendylukas\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"4fd81a61-eff5-4e6d-8912-283c48d5aefc\";s:13:\"Authorization\";s:237:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/key/new?username=hendylukas\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"bc8c7d703be897ac11606f8ff7901c0b\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1496042297, 1.13397, '1', 500),
(3, 'api/key/new', 'get', 'a:9:{s:8:\"username\";s:10:\"hendylukas\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"7d5557c1-2bbd-4681-9d4a-0241fb54a1df\";s:13:\"Authorization\";s:237:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/key/new?username=hendylukas\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"bc8c7d703be897ac11606f8ff7901c0b\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1496042487, 1.15488, '1', 500),
(4, 'api/key/new', 'get', 'a:9:{s:8:\"username\";s:10:\"hendylukas\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"4be94b81-0815-4a48-9ce9-250bd44422cc\";s:13:\"Authorization\";s:237:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/key/new?username=hendylukas\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"bc8c7d703be897ac11606f8ff7901c0b\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1496042499, 1.12423, '1', 500),
(5, 'api/key/new', 'get', 'a:9:{s:8:\"username\";s:8:\"hendynew\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"6d8eaae7-6797-41e5-8ca4-92de66265097\";s:13:\"Authorization\";s:235:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/key/new?username=hendynew\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"173ca7092970fadc010aad48cdc35334\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1496042512, 1.12853, '1', 500),
(6, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"c862eebc-6322-49da-908c-065410dfde5a\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:13:\"Authorization\";s:218:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"76612f973076094f776c67ddc7036de3\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496042760, 1.13412, '0', 401),
(7, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"e2857786-3870-4f0d-afab-07c7c33f1f73\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:13:\"Authorization\";s:218:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"76612f973076094f776c67ddc7036de3\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496042770, 1.25734, '1', 200),
(8, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"280ca33f-3ccc-48d5-9178-7c43e32ed76a\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:13:\"Authorization\";s:218:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"76612f973076094f776c67ddc7036de3\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496042796, 1.1605, '0', 401),
(9, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"4d5527da-c78a-43ff-aedb-221a14c9f2e2\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:13:\"Authorization\";s:218:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"76612f973076094f776c67ddc7036de3\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496043497, 1.14592, '0', 401),
(10, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"1b996047-7254-405a-b0a4-71a286eb1f1f\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:13:\"Authorization\";s:218:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"76612f973076094f776c67ddc7036de3\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496043503, 1.20136, '1', 200),
(11, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"70aea7f1-8baf-4dc0-b938-bf3be10c210d\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:13:\"Authorization\";s:218:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"76612f973076094f776c67ddc7036de3\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496043508, 1.19308, '1', 200),
(12, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"a3727e71-50e4-46ee-a0a9-9e132e6e89f2\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:13:\"Authorization\";s:218:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"76612f973076094f776c67ddc7036de3\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496043515, 1.17084, '1', 200),
(13, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"9197a02e-9303-401d-8046-95a17b159c5b\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:13:\"Authorization\";s:218:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"76612f973076094f776c67ddc7036de3\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496043806, 1.16663, '1', 200),
(14, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"16b307bf-dcf4-43a4-a9fe-9805bcc302b3\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:13:\"Authorization\";s:218:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"76612f973076094f776c67ddc7036de3\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496043901, 1.13897, '1', 200),
(15, 'api/post/all', 'get', 'a:9:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"e40cb642-1680-4870-971f-3aa2d69216d6\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:13:\"Authorization\";s:218:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/all\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"76612f973076094f776c67ddc7036de3\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496045717, 1.14581, '1', 200),
(16, 'api/post/explore', 'get', 'a:11:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"6d856671-09e8-48b4-b359-14f04b22f65c\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1497021355, 1.33145, '0', 403),
(17, 'api/post/explore', 'get', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"9aaf5b65-90af-465c-9102-47df481d5e63\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021366, 1.18585, '1', 404),
(18, 'api/post/explore', 'get', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"5e288fe3-357d-4552-99d6-0e7964d51438\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021431, 1.10826, '1', 404),
(19, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"574bbcf4-1c92-4e3a-8888-bbccee287ba7\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021442, 1.10091, '1', 404),
(20, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"f172c4fa-e608-4631-b69b-b69014536844\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021471, 1.1308, '1', 404),
(21, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"f84967bb-33c5-43a3-a481-005489182d61\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"0\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021555, 1.14995, '1', 404),
(22, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"30b29b60-2037-418a-a1e0-8682d9c518aa\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021568, 1.11658, '1', 404),
(23, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"17ea1fbc-8e6f-4e78-a60c-6750772b6d5c\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021670, 1.0882, '1', 404),
(24, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"83163d47-3f21-44eb-a070-0aaf0f12c078\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021706, 1.10399, '1', 404),
(25, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"931bc737-9dc6-41be-80d7-fc53855beba3\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021781, 1.12434, '1', 404),
(26, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"e33e4137-e403-43d0-979d-2a0b7e37e4c7\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021794, 1.08527, '1', 404),
(27, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"74bfbe56-d693-4d96-a428-9a93c35b8edc\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021877, 1.16628, '1', 0),
(28, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"d299820d-6791-4e22-92d2-0efdc12d906f\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021894, 1.08946, '1', 200),
(29, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"a989547e-fc6b-4af3-a944-244b5dd63204\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021934, 1.1372, '1', 404),
(30, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"863fa9d6-1884-4f30-839f-ff9564cd189e\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022070, 1.18436, '1', 404),
(31, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"f4b1a77f-2017-41c3-97f3-3ed2aa490b2e\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022082, 1.08882, '1', 404),
(32, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"c72cf612-e203-427d-ab7f-c9bc828a0578\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022106, 1.06175, '1', 0),
(33, 'api/post/fresh', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"0851fc74-cb10-4736-a2b7-8b1983594833\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:220:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/fresh\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"7925c084d5fea381152fff22f08cfc2e\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022209, 1.11582, '1', 0),
(34, 'api/post/fresh', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"9c1ab34c-e504-4e26-8ebc-2c3653fa2456\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:220:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/fresh\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"7925c084d5fea381152fff22f08cfc2e\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022223, 1.12072, '1', 200),
(35, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"50a9d411-3c67-4078-998a-52574d8fe441\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022232, 1.08258, '1', 404),
(36, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"2abc05ac-cf4e-40b8-a4f7-d393ae204c21\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"2\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022284, 1.11978, '1', 404),
(37, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"5dda5211-3014-446d-a761-a237a52a9e23\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"2\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022339, 1.10261, '1', 200),
(38, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"2c8489f6-dfdb-4046-9a39-e3d2b7605e9e\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"2\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022373, 1.09207, '1', 404),
(39, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"fc496ed8-7581-403c-a72d-224a9c422cc7\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"2\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022382, 1.09597, '1', 200),
(40, 'api/post/explore', 'get', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"eb89aa98-ef42-4d3e-9070-713634629201\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"2\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"Authorization\";s:222:\"Digest username=\"hendynew\", realm=\"REST API\", nonce=\"592bc5f2ac181\", uri=\"/guyon/api/post/explore\", qop=auth, nc=1, cnonce=\"asdasdasd\", response=\"9c7c2386e69243940f5ab5c0a2163232\", opaque=\"aba3d4b49c454e1974970e7b5514b001\"\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022431, 1.0912, '1', 200),
(41, 'api/post/explore', 'get', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"80a2cbd7-5484-42cc-893d-0fc5bf9d6373\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"2\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022451, 1.1008, '1', 200),
(42, 'api/post/explore', 'post', 'a:18:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"23203681-570b-4a3c-9b30-cfe18890df24\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"2\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:12:\"content-type\";s:33:\"application/x-www-form-urlencoded\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"28\";s:10:\"Connection\";s:10:\"keep-alive\";s:1:\"r\";s:3:\"255\";s:1:\"g\";s:3:\"255\";s:1:\"b\";s:2:\"23\";s:6:\"status\";s:4:\"lamp\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022504, 1.0982, '1', 200),
(43, 'api/post/all', 'get', 'a:8:{s:4:\"Host\";s:9:\"localhost\";s:10:\"User-Agent\";s:73:\"Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:6:\"Cookie\";s:465:\"fbm_1444994855531376=base_domain=.localhost; fblo_1444994855531376=y; fblo_1899784486971261=y; ci_session=a%3A4%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%2245b7e9329fd30861d616b93d960a9aaa%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A3%3A%22%3A%3A1%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A73%3A%22Mozilla%2F5.0+%28Windows+NT+10.0%3B+WOW64%3B+rv%3A53.0%29+Gecko%2F20100101+Firefox%2F53.0%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1496985284%3B%7D2a847b4e683a0583b196744888316890\";s:10:\"Connection\";s:10:\"keep-alive\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '::1', 1497049302, 1.60911, '0', 403),
(44, 'api/post/all', 'get', 'a:9:{s:4:\"Host\";s:9:\"localhost\";s:10:\"User-Agent\";s:73:\"Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:6:\"Cookie\";s:465:\"fbm_1444994855531376=base_domain=.localhost; fblo_1444994855531376=y; fblo_1899784486971261=y; ci_session=a%3A4%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%2245b7e9329fd30861d616b93d960a9aaa%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A3%3A%22%3A%3A1%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A73%3A%22Mozilla%2F5.0+%28Windows+NT+10.0%3B+WOW64%3B+rv%3A53.0%29+Gecko%2F20100101+Firefox%2F53.0%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1496985284%3B%7D2a847b4e683a0583b196744888316890\";s:10:\"Connection\";s:10:\"keep-alive\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";s:13:\"Cache-Control\";s:9:\"max-age=0\";}', '', '::1', 1497049446, 1.23464, '0', 403),
(45, 'api/post/explore', 'get', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"fdea4852-73c1-4454-82eb-c8efa550175a\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"2\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049517, 1.45561, '1', 200),
(46, 'api/post/explore', 'get', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"66e8b70d-4b6a-4e14-b781-4f541afff05a\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"2\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049535, 1.16366, '1', 200),
(47, 'api/post/explore', 'get', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"b80d9947-c354-4e91-a82a-3f160f3f78a4\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"2\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049557, 1.11125, '1', 200),
(48, 'api/post/explore', 'get', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"d0a03209-6da7-4ef4-b2f3-17126cfb1f4b\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:8:\"kategori\";s:1:\"2\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049636, 1.08469, '1', 200),
(49, 'api/post/explore', 'get', 'a:12:{s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"8011753f-a823-4b72-b667-3de8dfca9480\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049656, 1.1164, '1', 200),
(50, 'api/post/explore', 'get', 'a:12:{s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"8343f6d9-c045-4fb8-ba1e-90e806c3b88b\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049671, 1.11168, '1', 200),
(51, 'api/post/explore', 'get', 'a:12:{s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"a1e6b359-c9d3-43ee-bf93-25e94bfbfd9a\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049687, 1.10661, '1', 200),
(52, 'api/post/explore', 'get', 'a:12:{s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"83ad5cb4-f21f-48ab-8c09-edabd53071f0\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049960, NULL, '1', 0),
(53, 'api/post/explore', 'get', 'a:12:{s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"5\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"1cb2332e-83b1-48ce-baca-e556a848bd78\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049995, 1.1401, '1', 200),
(54, 'api/post/explore', 'get', 'a:12:{s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"1\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"38e1e02d-aea9-4b7b-970a-73c4f28dbdcb\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050032, 1.16063, '1', 200),
(55, 'api/post/explore', 'get', 'a:12:{s:8:\"kategori\";s:1:\"1\";s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"0\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"817d020a-9c93-4d65-88bc-c0508dbc93c8\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050038, 1.18707, '1', 200),
(56, 'api/post/fresh', 'get', 'a:11:{s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"0\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"526355a2-e244-4eac-96a8-4642aaaad193\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050075, 1.12528, '1', 200),
(57, 'api/post/fresh', 'get', 'a:11:{s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"3\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"66f2d25a-134f-44a0-93b2-22ca65eac253\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050291, 1.1384, '1', 200),
(58, 'api/post/fresh', 'get', 'a:11:{s:5:\"start\";s:1:\"0\";s:3:\"end\";s:1:\"4\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"c4855de8-7121-41e0-ba6e-732b277e427e\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050301, 1.11034, '1', 200),
(59, 'api/post/fresh', 'get', 'a:11:{s:5:\"start\";s:1:\"1\";s:3:\"end\";s:1:\"4\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"08fd2184-13ed-4297-a486-5a671b633284\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050319, 1.13792, '1', 200),
(60, 'api/post/trending', 'get', 'a:11:{s:5:\"start\";s:1:\"1\";s:3:\"end\";s:1:\"4\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"fc5d1d04-6b2d-47a4-b92d-fb71ebec3634\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050564, 1.13291, '1', 200),
(61, 'api/post/upvote', 'post', 'a:16:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"d65e886c-3f0b-4e56-887a-be5bf87030c8\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:12:\"content-type\";s:33:\"application/x-www-form-urlencoded\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"28\";s:10:\"Connection\";s:10:\"keep-alive\";s:1:\"r\";s:3:\"255\";s:1:\"g\";s:3:\"255\";s:1:\"b\";s:2:\"23\";s:6:\"status\";s:4:\"lamp\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050622, 1.14622, '1', 200),
(62, 'api/post/all', 'delete', 'a:10:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"17811e2c-4b0b-4f0f-9224-bb151bdfc569\";s:13:\"Authorization\";s:22:\"Basic YWRtaW46MTIzNA==\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:12:\"content-type\";s:80:\"multipart/form-data; boundary=--------------------------108236648261268423526868\";s:14:\"content-length\";s:1:\"0\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1497051205, 1.12774, '0', 403),
(63, 'api/post/upvote', 'post', 'a:16:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"a873a279-3425-4597-92b1-6ecdb6e9f85b\";s:8:\"username\";s:8:\"hendynew\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:12:\"content-type\";s:33:\"application/x-www-form-urlencoded\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"28\";s:10:\"Connection\";s:10:\"keep-alive\";s:1:\"r\";s:3:\"255\";s:1:\"g\";s:3:\"255\";s:1:\"b\";s:2:\"23\";s:6:\"status\";s:4:\"lamp\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497064875, 1.42781, '1', 200),
(64, 'api/post/upvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"c3c622b0-24b1-4e50-82f1-539274282e5f\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:12:\"content-type\";s:33:\"application/x-www-form-urlencoded\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497064928, 1.11631, '1', 200),
(65, 'api/post/upvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"8a462cb8-de50-468d-b04b-4abfe7ff772d\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:12:\"content-type\";s:33:\"application/x-www-form-urlencoded\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497064988, 1.12001, '1', 200);
INSERT INTO `logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`) VALUES
(66, 'api/post/upvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"96971e0e-a400-4269-8e9b-57c8799310e8\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:12:\"content-type\";s:33:\"application/x-www-form-urlencoded\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497064999, 1.18845, '1', 200),
(67, 'api/post/upvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"f1245294-696c-407d-9cd0-06aeda487315\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:12:\"content-type\";s:33:\"application/x-www-form-urlencoded\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065021, 1.12322, '1', 200),
(68, 'api/post/upvote', 'post', 'a:11:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"d066efd4-3347-4563-a111-951f9020fead\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:12:\"content-type\";s:33:\"application/x-www-form-urlencoded\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '', '::1', 1497065049, 1.11139, '0', 403),
(69, 'api/post/upvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"0826b2f0-1688-40bf-931c-de6bed502316\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065054, 1.11482, '1', 200),
(70, 'api/post/upvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"bd2299c4-88b7-48f3-b231-1f35b0e59dfd\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:80:\"multipart/form-data; boundary=--------------------------924408681015199399364058\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"308\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065290, 1.10458, '1', 200),
(71, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"49f05343-3385-48e9-94f7-94c40db229ac\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065494, 1.11243, '1', 200),
(72, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"3a0a1c65-d58d-41e0-944f-6e1350c3bcc9\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065533, 1.14493, '1', 200),
(73, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"440c1d75-d8b8-4b4a-9baa-0a81ca1300a1\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065544, 1.11907, '1', 200),
(74, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"5860fe8d-a509-4988-80f7-6575a66d066b\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065556, 1.1103, '1', 200),
(75, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"d73f156a-e8e8-4e90-acd2-88da5b4b59fb\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065752, 1.09487, '1', 200),
(76, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"86963a7f-5ca7-4aad-a0f7-7be0cbb85a0f\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065761, 1.09374, '1', 200),
(77, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"8979cfdf-4b8e-4868-9705-455e7ef62472\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065782, 1.1186, '1', 200),
(78, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"eb35bbbe-a3ff-4f79-97ac-59df7ba90e26\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065825, 1.16892, '1', 200),
(79, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"9b668e6b-7290-4988-8e85-f7d38e7cad67\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066019, 1.10798, '1', 200),
(80, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"2b0b847b-6e76-49b8-8917-a96e2d818def\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066032, 1.10557, '1', 200),
(81, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"b064dbd8-cd79-4001-ad96-7893965c9aab\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066547, 1.11425, '1', 200),
(82, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"4b978d80-39f0-4d96-9444-fe416374e75a\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066571, 1.10598, '1', 200),
(83, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"057d81ff-1005-44ad-9cec-e5a2ea9a5959\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"59\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:36:\"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066615, 1.17766, '1', 200),
(84, 'api/post/all', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"691286c4-8afa-4205-9975-95484eb112d3\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:12:\"content-type\";s:80:\"multipart/form-data; boundary=--------------------------162818269992127698685452\";s:14:\"content-length\";s:3:\"403\";s:10:\"Connection\";s:10:\"keep-alive\";s:7:\"movieid\";s:0:\"\";s:10:\"movietitle\";s:14:\"Hendy Filmaaaa\";s:10:\"moviegenre\";s:9:\"lucu haha\";}', '', '::1', 1497066644, 1.11526, '0', 403),
(85, 'api/post/all', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"1cfc9dbf-5276-45e4-a3dd-230dee0041c9\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066673, 1.12004, '1', 200),
(86, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"d1b13be7-bc98-4321-b240-0b05ffc41d2e\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"67\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:44:\"czFBhfnLXNxD58iCT2pCzq1I0huxkow0EWaEegmP4E0=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066696, 1.11372, '1', 200),
(87, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"adccbb94-ae27-4dfc-9e69-2410f76bf6db\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"67\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:44:\"czFBhfnLXNxD58iCT2pCzq1I0huxkow0EWaEegmP4E0=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066710, 1.08816, '1', 200),
(88, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"6163cdd1-2a2d-4559-91f8-9648457fa2b2\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"67\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:44:\"czFBhfnLXNxD58iCT2pCzq1I0huxkow0EWaEegmP4E0=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066726, 1.21338, '1', 0),
(89, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"b5998773-0cdd-4a1d-a0f5-416d1c003ade\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"67\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:44:\"czFBhfnLXNxD58iCT2pCzq1I0huxkow0EWaEegmP4E0=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066748, 1.11937, '1', 0),
(90, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"63bf1c85-64d3-4cb2-acb4-7eede21d3338\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"67\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:44:\"czFBhfnLXNxD58iCT2pCzq1I0huxkow0EWaEegmP4E0=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066846, 1.12348, '1', 0),
(91, 'api/post/downvote', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"aeecfeef-7466-48e5-abd5-be07e4afa2f9\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"67\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:2:\"id\";s:44:\"czFBhfnLXNxD58iCT2pCzq1I0huxkow0EWaEegmP4E0=\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497067010, 1.18254, '1', 200),
(92, 'api/oauth2/authorize', 'post', 'a:11:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"ca2e827c-f1b6-4825-aa60-7acc85adfd60\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:30:\"Basic aGVuZHluZXc6aGVuZHkxMjM=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"14\";s:10:\"Connection\";s:10:\"keep-alive\";s:10:\"authorized\";s:3:\"yes\";}', '', '::1', 1497099695, 0.204194, '1', 0),
(93, 'api/oauth2/authorize', 'post', 'a:11:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"e088b94a-1ed1-4ac0-b3ca-dd4f6fe070ff\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:30:\"Basic aGVuZHluZXc6aGVuZHkxMjM=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"14\";s:10:\"Connection\";s:10:\"keep-alive\";s:10:\"authorized\";s:3:\"yes\";}', '', '::1', 1497099715, 0.112116, '1', 0),
(94, 'api/oauth2/authorize', 'post', 'a:11:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"2bcf5100-a135-423e-947a-f53f540715dd\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:30:\"Basic aGVuZHluZXc6aGVuZHkxMjM=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"14\";s:10:\"Connection\";s:10:\"keep-alive\";s:10:\"authorized\";s:3:\"yes\";}', '', '::1', 1497100767, 0.118083, '1', 0),
(95, 'api/oauth2/authorize', 'post', 'a:11:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"cc23a0b4-a785-479e-8859-69bc1a44d544\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:30:\"Basic aGVuZHluZXc6aGVuZHkxMjM=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"14\";s:10:\"Connection\";s:10:\"keep-alive\";s:10:\"authorized\";s:3:\"yes\";}', '', '::1', 1497100779, 0.0937459, '1', 0),
(96, 'api/oauth2/authorize', 'post', 'a:11:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"66022073-eefd-49c8-a97a-93f71540c34e\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:30:\"Basic aGVuZHluZXc6aGVuZHkxMjM=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"14\";s:10:\"Connection\";s:10:\"keep-alive\";s:10:\"authorized\";s:3:\"yes\";}', '', '::1', 1497100923, 0.283741, '1', 0),
(97, 'api/oauth2/authorize', 'post', 'a:11:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"0523977a-1d0a-4802-b918-3aec0c96632c\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:30:\"Basic aGVuZHluZXc6aGVuZHkxMjM=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"14\";s:10:\"Connection\";s:10:\"keep-alive\";s:10:\"authorized\";s:3:\"yes\";}', '', '::1', 1497101008, 0.165229, '1', 0),
(98, 'api/oauth2/token', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"b294ae6a-fe95-456c-a94d-e81002da67b4\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:82:\"Basic YXNkYXNkUUt6NkZJdVVvUTQ3UTVKR3VCR2YyMDpybllqaFlYeU9Ra1BkaGVvZzNERzUxVkRRazZa\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"75\";s:10:\"Connection\";s:10:\"keep-alive\";s:10:\"grant_type\";s:18:\"authorization_code\";s:4:\"code\";s:40:\"91569d1556c3e9ad7a32042f2733ec6f626e1d80\";}', '', '::1', 1497101014, 0.109822, '1', 0),
(99, 'api/oauth2/token', 'post', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"438149ab-dfe8-4788-8071-7767c3dab779\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:82:\"Basic YXNkYXNkUUt6NkZJdVVvUTQ3UTVKR3VCR2YyMDpybllqaFlYeU9Ra1BkaGVvZzNERzUxVkRRazZa\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"92\";s:10:\"Connection\";s:10:\"keep-alive\";s:10:\"grant_type\";s:18:\"authorization_code\";s:4:\"code\";s:40:\"91569d1556c3e9ad7a32042f2733ec6f626e1d80\";s:12:\"redirect_uri\";s:3:\"qew\";}', '', '::1', 1497101024, 0.444028, '1', 0),
(100, 'api/user/login', 'post', 'a:11:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"5e292a15-5fa7-421d-9e79-a52cd01b8130\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"27\";s:10:\"Connection\";s:10:\"keep-alive\";s:4:\"user\";s:8:\"hendynew\";s:4:\"pass\";s:8:\"hendy123\";}', '', '::1', 1497286178, 0.392203, '1', 201),
(101, 'api/post/all', 'get', 'a:9:{s:5:\"start\";s:1:\"1\";s:3:\"end\";s:1:\"5\";s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";s:10:\"User-Agent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36\";s:6:\"Accept\";s:74:\"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\";s:15:\"Accept-Encoding\";s:23:\"gzip, deflate, sdch, br\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.8\";}', '', '::1', 1497319417, 5.9489, '1', 200),
(102, 'api/post/all', 'get', 'a:7:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";s:10:\"User-Agent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36\";s:6:\"Accept\";s:74:\"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\";s:15:\"Accept-Encoding\";s:23:\"gzip, deflate, sdch, br\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.8\";}', '', '::1', 1497319417, 5.94867, '1', 200),
(103, 'api/oauth2/authorize', 'post', 'a:11:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"f3f650bc-16ee-43b5-968c-7603eff77af1\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:30:\"Basic aGVuZHluZXc6aGVuZHkxMjM=\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"14\";s:10:\"Connection\";s:10:\"keep-alive\";s:10:\"authorized\";s:3:\"yes\";}', '', '::1', 1497370397, 0.338838, '1', 0),
(104, 'api/oauth2/token', 'post', 'a:13:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"f582b3ad-612b-47f3-90ea-8b16834e8ee0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:82:\"Basic YXNkYXNkUUt6NkZJdVVvUTQ3UTVKR3VCR2YyMDpybllqaFlYeU9Ra1BkaGVvZzNERzUxVkRRazZa\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"92\";s:10:\"Connection\";s:10:\"keep-alive\";s:10:\"grant_type\";s:18:\"authorization_code\";s:4:\"code\";s:40:\"2c7e16c6befa641d6fe7b74c10ace3986bf86afb\";s:12:\"redirect_uri\";s:3:\"qew\";}', '', '::1', 1497370407, 0.267559, '1', 0),
(105, 'api/post/all', 'get', 'a:7:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"86905c4a-8078-415a-aa34-0f7a99f20511\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1497370446, 0.132986, '0', 403),
(106, 'api/post/all', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"db78758d-c114-4b1c-b29b-5a62cd531690\";s:9:\"X-API-KEY\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1497370463, 0.131232, '0', 403),
(107, 'api/post/all', 'get', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"0897e1b5-b764-4e71-b349-f6634a5b0521\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497370487, 0.172278, '1', 200),
(108, 'api/post/all', 'get', 'a:8:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"9f95f49c-aae0-457a-a997-c3801302df0d\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1497370545, 0.142283, '0', 403),
(109, 'api/post/all', 'get', 'a:8:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"3a9c434d-554a-4a1e-aabe-3a43c34aa7b8\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1497370571, 0.142591, '0', 403),
(110, 'api/post/all', 'get', 'a:9:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"b8de986d-2a56-4dbf-9f47-4f2ef367885f\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497370577, 0.212156, '1', 200),
(111, 'api/post/all', 'get', 'a:8:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"b58f2fed-b79d-4a33-ac59-cfe8ed27bbfc\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1497370582, 0.209369, '0', 403),
(112, 'api/post/all', 'get', 'a:9:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"b978357f-0977-44de-b334-f3302917bebb\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497370599, 0.202153, '1', 200),
(113, 'api/post/all', 'get', 'a:8:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"cd1015be-32e5-47ef-896c-809cab617f74\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1497370604, 0.204402, '0', 403),
(114, 'api/post/all', 'get', 'a:8:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"faad5cc0-bb42-47cc-86e4-2ef85006382a\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1497370658, 0.161098, '0', 403),
(115, 'api/post/all', 'get', 'a:8:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"3c93e74f-c334-4abf-bc36-e98c772a1dcf\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1497370674, 0.17638, '0', 403),
(116, 'api/post/all', 'get', 'a:9:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"9312c2ab-cb49-4ea0-97b8-1e64f31fc44c\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497370678, 0.199433, '1', 200),
(117, 'api/post/all', 'get', 'a:9:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"14416fea-7724-43ca-890e-b72b0f2cdbc9\";s:9:\"X-API-KEY\";s:40:\"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497370712, 0.252287, '1', 200),
(118, 'api/key/new', 'post', 'a:8:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"1cebb9db-4f7c-487e-b969-7661781ba781\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:1:\"0\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1497372100, 0.19341, '1', 500),
(119, 'api/key/new', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"feaca1a2-cb9e-4f18-b5a0-cc466ab756b4\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"43\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:9:\"client_id\";s:3:\"asd\";s:6:\"limits\";s:4:\"2000\";}', '', '::1', 1497372126, 0.171271, '1', 201),
(120, 'api/key/new', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"36007868-47e4-4462-8c2e-ee4691852f1f\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"43\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:9:\"client_id\";s:3:\"asd\";s:6:\"limits\";s:4:\"2000\";}', '', '::1', 1497372152, 0.180312, '1', 0),
(121, 'api/key/new', 'post', 'a:12:{s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"8261542d-09f0-4c9b-ba62-72934b84a8f0\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"43\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"username\";s:8:\"hendynew\";s:9:\"client_id\";s:3:\"asd\";s:6:\"limits\";s:4:\"2000\";}', '', '::1', 1497372197, 0.18059, '1', 201),
(122, 'api/post/all', 'get', 'a:9:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"ccfed419-e47e-4c5e-8e9e-6f078d0eca8f\";s:9:\"X-API-KEY\";s:40:\"4sscgcwow44sg80ogokg8ok0400w00wowwccw88w\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4sscgcwow44sg80ogokg8ok0400w00wowwccw88w', '::1', 1497372584, 0.340426, '1', 200),
(123, 'api/post/all', 'get', 'a:9:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"e7c7fb82-94f5-469c-ae9e-88ff0220445b\";s:9:\"X-API-KEY\";s:40:\"4sscgcwow44sg80ogokg8ok0400w00wowwccw88w\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4sscgcwow44sg80ogokg8ok0400w00wowwccw88w', '::1', 1497372608, 0.262174, '1', 200),
(124, 'api/post/all', 'get', 'a:9:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"bcc8aacf-bfe2-4f44-9ec3-e18782de9fc7\";s:9:\"X-API-KEY\";s:40:\"4sscgcwow44sg80ogokg8ok0400w00wowwccw88w\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4sscgcwow44sg80ogokg8ok0400w00wowwccw88w', '::1', 1497372685, 0.211642, '1', 200),
(125, 'api/post/all', 'get', 'a:9:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"dc152c74-1e4d-47d9-b255-47d0eb145741\";s:9:\"X-API-KEY\";s:40:\"4sscgcwow44sg80ogokg8ok0400w00wowwccw88w\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4sscgcwow44sg80ogokg8ok0400w00wowwccw88w', '::1', 1497373563, 0.142271, '1', 200),
(126, 'api/post/all', 'get', 'a:9:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"a47a2126-ead6-450b-9166-33aeb9949579\";s:9:\"X-API-KEY\";s:40:\"4sscgcwow44sg80ogokg8ok0400w00wowwccw88w\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4sscgcwow44sg80ogokg8ok0400w00wowwccw88w', '::1', 1497373584, 0.236024, '1', 200),
(127, 'api/post/all', 'get', 'a:9:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"a18e0805-7187-4e42-a4e3-7dd313c79bc1\";s:9:\"X-API-KEY\";s:41:\"4sscgcwow44sg80ogokg8ok0400w00wowwccw88wi\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1497373625, 0.1104, '0', 403),
(128, 'api/post/all', 'get', 'a:9:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"21b10ad7-777d-4f96-ac6a-409958d6ccfe\";s:9:\"X-API-KEY\";s:41:\"4sscgcwow44sg80ogokg8ok0400w00wowwccw88wi\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', 1497373673, 0.136707, '0', 403),
(129, 'api/post/all', 'get', 'a:9:{s:12:\"access_token\";s:40:\"0283685305e052c46863993b7062ab24cd1e9d96\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"e22a773c-d32b-4e14-9b44-41ef18dba3c8\";s:9:\"X-API-KEY\";s:40:\"4sscgcwow44sg80ogokg8ok0400w00wowwccw88w\";s:10:\"User-Agent\";s:30:\"PostmanRuntime/3.0.11-hotfix.2\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:9:\"localhost\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '4sscgcwow44sg80ogokg8ok0400w00wowwccw88w', '::1', 1497373677, 0.233197, '1', 200);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`access_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('0283685305e052c46863993b7062ab24cd1e9d96', 'asdasdQKz6FIuUoQ47Q5JGuBGf20', 'hendynew', '2017-06-13 17:13:27', NULL),
('2744ec5017cdf8525b3d4103ae7518407dd014e2', 'asdasdQKz6FIuUoQ47Q5JGuBGf20', 'hendynew', '2017-06-10 14:23:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_authorization_codes`
--

CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_authorization_codes`
--

INSERT INTO `oauth_authorization_codes` (`authorization_code`, `client_id`, `user_id`, `redirect_uri`, `expires`, `scope`) VALUES
('41d82e1a5ca9ab08108364ac9df4391fa8ae5ea5', 'asdasdQKz6FIuUoQ47Q5JGuBGf20', 'hendynew', 'qew', '2017-06-10 13:22:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(100) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `nama_aplikasi` varchar(255) NOT NULL,
  `deskripsi_aplikasi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`, `nama_aplikasi`, `deskripsi_aplikasi`) VALUES
('bubuue5tJuRgoMZXdhfNA1hFzsCa', '0MGH8bKmaUZkQJ3pCxJhuUAcizSd', 'huhu', NULL, NULL, 'hendynew', 'bubu', 'huhu');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`refresh_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('081aa4986dc14a5d15e74c2b59bb6adc85e4e61f', 'asdasdQKz6FIuUoQ47Q5JGuBGf20', 'hendynew', '2017-06-24 13:23:44', NULL),
('136e9890ca6a4b0f7666434ceff82d05a42d4fa6', 'asdasdQKz6FIuUoQ47Q5JGuBGf20', 'hendynew', '2017-06-27 16:13:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_scopes`
--

CREATE TABLE `oauth_scopes` (
  `scope` text,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(9, 2, 'I got accepted to Harvard University', 'a3qDxL7_700b.jpg', 'hendynew', -4, 0, '1', '0000-00-00 00:00:00', '2017-06-10 03:56:50'),
(10, 3, 'Me every Friday night', 'aWmArbK_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:00:44'),
(11, 2, '10 if it\'s my lucky day', 'a9reg31_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:00:57'),
(12, 1, 'Where can I buy this shit', 'ajXjMWQ_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:01:10'),
(13, 1, 'So trueeeee', 'aQ9KjQW_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:01:22'),
(14, 2, 'Teenage Mutant Human-Turtle', 'a2rV3wp_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:01:32'),
(15, 2, 'BFF\'s', 'avGqZnq_700b.jpg', 'hendynew', 0, 0, '1', '0000-00-00 00:00:00', '2017-05-15 02:02:01');

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
('hendynew', '+xlJsUIrCsFj/S4LRVT+8ydq0jrpOBxQcLq4N7IKhBk=', 'af4149461a', 'Hendy Lukas', 'hendylukas68@gmail.com', '', '0000-00-00 00:00:00', '2017-05-08 19:40:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`access_token`);

--
-- Indexes for table `oauth_authorization_codes`
--
ALTER TABLE `oauth_authorization_codes`
  ADD PRIMARY KEY (`authorization_code`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`refresh_token`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reply_like`
--
ALTER TABLE `reply_like`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access`
--
ALTER TABLE `access`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `comment_like`
--
ALTER TABLE `comment_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `like`
--
ALTER TABLE `like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `reply_like`
--
ALTER TABLE `reply_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
