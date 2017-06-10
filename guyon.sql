-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2017 at 06:02 AM
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpost` int(11) NOT NULL DEFAULT '0',
  `idcomment` int(11) NOT NULL DEFAULT '0',
  `username` varchar(25) NOT NULL,
  `comment` text NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcomment` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpost` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

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
(15, 'api/post/all', 'get', 'a:9:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"e40cb642-1680-4870-971f-3aa2d69216d6";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:13:"Authorization";s:218:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/all", qop=auth, nc=1, cnonce="asdasdasd", response="76612f973076094f776c67ddc7036de3", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1496045717, 1.14581, '1', 200),
(16, 'api/post/explore', 'get', 'a:11:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"6d856671-09e8-48b4-b359-14f04b22f65c";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '', '::1', 1497021355, 1.33145, '0', 403),
(17, 'api/post/explore', 'get', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"9aaf5b65-90af-465c-9102-47df481d5e63";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021366, 1.18585, '1', 404),
(18, 'api/post/explore', 'get', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"5e288fe3-357d-4552-99d6-0e7964d51438";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021431, 1.10826, '1', 404),
(19, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"574bbcf4-1c92-4e3a-8888-bbccee287ba7";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021442, 1.10091, '1', 404),
(20, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"f172c4fa-e608-4631-b69b-b69014536844";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021471, 1.1308, '1', 404),
(21, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"f84967bb-33c5-43a3-a481-005489182d61";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"0";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021555, 1.14995, '1', 404),
(22, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"30b29b60-2037-418a-a1e0-8682d9c518aa";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021568, 1.11658, '1', 404),
(23, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"17ea1fbc-8e6f-4e78-a60c-6750772b6d5c";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021670, 1.0882, '1', 404),
(24, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"83163d47-3f21-44eb-a070-0aaf0f12c078";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021706, 1.10399, '1', 404),
(25, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"931bc737-9dc6-41be-80d7-fc53855beba3";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021781, 1.12434, '1', 404),
(26, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"e33e4137-e403-43d0-979d-2a0b7e37e4c7";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021794, 1.08527, '1', 404),
(27, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"74bfbe56-d693-4d96-a428-9a93c35b8edc";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021877, 1.16628, '1', 0),
(28, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"d299820d-6791-4e22-92d2-0efdc12d906f";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021894, 1.08946, '1', 200),
(29, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"a989547e-fc6b-4af3-a944-244b5dd63204";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497021934, 1.1372, '1', 404),
(30, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"863fa9d6-1884-4f30-839f-ff9564cd189e";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022070, 1.18436, '1', 404),
(31, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"f4b1a77f-2017-41c3-97f3-3ed2aa490b2e";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022082, 1.08882, '1', 404),
(32, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"c72cf612-e203-427d-ab7f-c9bc828a0578";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022106, 1.06175, '1', 0),
(33, 'api/post/fresh', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"0851fc74-cb10-4736-a2b7-8b1983594833";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:220:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/fresh", qop=auth, nc=1, cnonce="asdasdasd", response="7925c084d5fea381152fff22f08cfc2e", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022209, 1.11582, '1', 0),
(34, 'api/post/fresh', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"9c1ab34c-e504-4e26-8ebc-2c3653fa2456";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:220:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/fresh", qop=auth, nc=1, cnonce="asdasdasd", response="7925c084d5fea381152fff22f08cfc2e", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022223, 1.12072, '1', 200),
(35, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"50a9d411-3c67-4078-998a-52574d8fe441";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022232, 1.08258, '1', 404),
(36, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"2abc05ac-cf4e-40b8-a4f7-d393ae204c21";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"2";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022284, 1.11978, '1', 404),
(37, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"5dda5211-3014-446d-a761-a237a52a9e23";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"2";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022339, 1.10261, '1', 200),
(38, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"2c8489f6-dfdb-4046-9a39-e3d2b7605e9e";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"2";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022373, 1.09207, '1', 404),
(39, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"fc496ed8-7581-403c-a72d-224a9c422cc7";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"2";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022382, 1.09597, '1', 200),
(40, 'api/post/explore', 'get', 'a:13:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"eb89aa98-ef42-4d3e-9070-713634629201";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"2";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"Authorization";s:222:"Digest username="hendynew", realm="REST API", nonce="592bc5f2ac181", uri="/guyon/api/post/explore", qop=auth, nc=1, cnonce="asdasdasd", response="9c7c2386e69243940f5ab5c0a2163232", opaque="aba3d4b49c454e1974970e7b5514b001"";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022431, 1.0912, '1', 200),
(41, 'api/post/explore', 'get', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"80a2cbd7-5484-42cc-893d-0fc5bf9d6373";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"2";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022451, 1.1008, '1', 200),
(42, 'api/post/explore', 'post', 'a:18:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"23203681-570b-4a3c-9b30-cfe18890df24";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"2";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:12:"content-type";s:33:"application/x-www-form-urlencoded";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"28";s:10:"Connection";s:10:"keep-alive";s:1:"r";s:3:"255";s:1:"g";s:3:"255";s:1:"b";s:2:"23";s:6:"status";s:4:"lamp";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497022504, 1.0982, '1', 200),
(43, 'api/post/all', 'get', 'a:8:{s:4:"Host";s:9:"localhost";s:10:"User-Agent";s:73:"Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0";s:6:"Accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:15:"Accept-Language";s:14:"en-US,en;q=0.5";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:465:"fbm_1444994855531376=base_domain=.localhost; fblo_1444994855531376=y; fblo_1899784486971261=y; ci_session=a%3A4%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%2245b7e9329fd30861d616b93d960a9aaa%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A3%3A%22%3A%3A1%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A73%3A%22Mozilla%2F5.0+%28Windows+NT+10.0%3B+WOW64%3B+rv%3A53.0%29+Gecko%2F20100101+Firefox%2F53.0%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1496985284%3B%7D2a847b4e683a0583b196744888316890";s:10:"Connection";s:10:"keep-alive";s:25:"Upgrade-Insecure-Requests";s:1:"1";}', '', '::1', 1497049302, 1.60911, '0', 403),
(44, 'api/post/all', 'get', 'a:9:{s:4:"Host";s:9:"localhost";s:10:"User-Agent";s:73:"Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0";s:6:"Accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:15:"Accept-Language";s:14:"en-US,en;q=0.5";s:15:"Accept-Encoding";s:13:"gzip, deflate";s:6:"Cookie";s:465:"fbm_1444994855531376=base_domain=.localhost; fblo_1444994855531376=y; fblo_1899784486971261=y; ci_session=a%3A4%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%2245b7e9329fd30861d616b93d960a9aaa%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A3%3A%22%3A%3A1%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A73%3A%22Mozilla%2F5.0+%28Windows+NT+10.0%3B+WOW64%3B+rv%3A53.0%29+Gecko%2F20100101+Firefox%2F53.0%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1496985284%3B%7D2a847b4e683a0583b196744888316890";s:10:"Connection";s:10:"keep-alive";s:25:"Upgrade-Insecure-Requests";s:1:"1";s:13:"Cache-Control";s:9:"max-age=0";}', '', '::1', 1497049446, 1.23464, '0', 403),
(45, 'api/post/explore', 'get', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"fdea4852-73c1-4454-82eb-c8efa550175a";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"2";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049517, 1.45561, '1', 200),
(46, 'api/post/explore', 'get', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"66e8b70d-4b6a-4e14-b781-4f541afff05a";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"2";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049535, 1.16366, '1', 200),
(47, 'api/post/explore', 'get', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"b80d9947-c354-4e91-a82a-3f160f3f78a4";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"2";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049557, 1.11125, '1', 200),
(48, 'api/post/explore', 'get', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"d0a03209-6da7-4ef4-b2f3-17126cfb1f4b";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:8:"kategori";s:1:"2";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049636, 1.08469, '1', 200),
(49, 'api/post/explore', 'get', 'a:12:{s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"8011753f-a823-4b72-b667-3de8dfca9480";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049656, 1.1164, '1', 200),
(50, 'api/post/explore', 'get', 'a:12:{s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"8343f6d9-c045-4fb8-ba1e-90e806c3b88b";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049671, 1.11168, '1', 200),
(51, 'api/post/explore', 'get', 'a:12:{s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"a1e6b359-c9d3-43ee-bf93-25e94bfbfd9a";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049687, 1.10661, '1', 200),
(52, 'api/post/explore', 'get', 'a:12:{s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"83ad5cb4-f21f-48ab-8c09-edabd53071f0";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049960, NULL, '1', 0),
(53, 'api/post/explore', 'get', 'a:12:{s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"5";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"1cb2332e-83b1-48ce-baca-e556a848bd78";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497049995, 1.1401, '1', 200),
(54, 'api/post/explore', 'get', 'a:12:{s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"1";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"38e1e02d-aea9-4b7b-970a-73c4f28dbdcb";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050032, 1.16063, '1', 200),
(55, 'api/post/explore', 'get', 'a:12:{s:8:"kategori";s:1:"1";s:5:"start";s:1:"0";s:3:"end";s:1:"0";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"817d020a-9c93-4d65-88bc-c0508dbc93c8";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050038, 1.18707, '1', 200),
(56, 'api/post/fresh', 'get', 'a:11:{s:5:"start";s:1:"0";s:3:"end";s:1:"0";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"526355a2-e244-4eac-96a8-4642aaaad193";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050075, 1.12528, '1', 200),
(57, 'api/post/fresh', 'get', 'a:11:{s:5:"start";s:1:"0";s:3:"end";s:1:"3";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"66f2d25a-134f-44a0-93b2-22ca65eac253";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050291, 1.1384, '1', 200),
(58, 'api/post/fresh', 'get', 'a:11:{s:5:"start";s:1:"0";s:3:"end";s:1:"4";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"c4855de8-7121-41e0-ba6e-732b277e427e";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050301, 1.11034, '1', 200),
(59, 'api/post/fresh', 'get', 'a:11:{s:5:"start";s:1:"1";s:3:"end";s:1:"4";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"08fd2184-13ed-4297-a486-5a671b633284";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050319, 1.13792, '1', 200),
(60, 'api/post/trending', 'get', 'a:11:{s:5:"start";s:1:"1";s:3:"end";s:1:"4";s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"fc5d1d04-6b2d-47a4-b92d-fb71ebec3634";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050564, 1.13291, '1', 200),
(61, 'api/post/upvote', 'post', 'a:16:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"d65e886c-3f0b-4e56-887a-be5bf87030c8";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:12:"content-type";s:33:"application/x-www-form-urlencoded";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"28";s:10:"Connection";s:10:"keep-alive";s:1:"r";s:3:"255";s:1:"g";s:3:"255";s:1:"b";s:2:"23";s:6:"status";s:4:"lamp";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497050622, 1.14622, '1', 200),
(62, 'api/post/all', 'delete', 'a:10:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"17811e2c-4b0b-4f0f-9224-bb151bdfc569";s:13:"Authorization";s:22:"Basic YWRtaW46MTIzNA==";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:12:"content-type";s:80:"multipart/form-data; boundary=--------------------------108236648261268423526868";s:14:"content-length";s:1:"0";s:10:"Connection";s:10:"keep-alive";}', '', '::1', 1497051205, 1.12774, '0', 403),
(63, 'api/post/upvote', 'post', 'a:16:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"a873a279-3425-4597-92b1-6ecdb6e9f85b";s:8:"username";s:8:"hendynew";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:12:"content-type";s:33:"application/x-www-form-urlencoded";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"28";s:10:"Connection";s:10:"keep-alive";s:1:"r";s:3:"255";s:1:"g";s:3:"255";s:1:"b";s:2:"23";s:6:"status";s:4:"lamp";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497064875, 1.42781, '1', 200),
(64, 'api/post/upvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"c3c622b0-24b1-4e50-82f1-539274282e5f";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:12:"content-type";s:33:"application/x-www-form-urlencoded";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497064928, 1.11631, '1', 200),
(65, 'api/post/upvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"8a462cb8-de50-468d-b04b-4abfe7ff772d";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:12:"content-type";s:33:"application/x-www-form-urlencoded";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497064988, 1.12001, '1', 200),
(66, 'api/post/upvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"96971e0e-a400-4269-8e9b-57c8799310e8";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:12:"content-type";s:33:"application/x-www-form-urlencoded";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497064999, 1.18845, '1', 200),
(67, 'api/post/upvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"f1245294-696c-407d-9cd0-06aeda487315";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:12:"content-type";s:33:"application/x-www-form-urlencoded";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065021, 1.12322, '1', 200),
(68, 'api/post/upvote', 'post', 'a:11:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"d066efd4-3347-4563-a111-951f9020fead";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:12:"content-type";s:33:"application/x-www-form-urlencoded";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '', '::1', 1497065049, 1.11139, '0', 403),
(69, 'api/post/upvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"0826b2f0-1688-40bf-931c-de6bed502316";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065054, 1.11482, '1', 200),
(70, 'api/post/upvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"bd2299c4-88b7-48f3-b231-1f35b0e59dfd";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:80:"multipart/form-data; boundary=--------------------------924408681015199399364058";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:3:"308";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065290, 1.10458, '1', 200);
INSERT INTO `logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`) VALUES
(71, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"49f05343-3385-48e9-94f7-94c40db229ac";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065494, 1.11243, '1', 200),
(72, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"3a0a1c65-d58d-41e0-944f-6e1350c3bcc9";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065533, 1.14493, '1', 200),
(73, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"440c1d75-d8b8-4b4a-9baa-0a81ca1300a1";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065544, 1.11907, '1', 200),
(74, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"5860fe8d-a509-4988-80f7-6575a66d066b";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065556, 1.1103, '1', 200),
(75, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"d73f156a-e8e8-4e90-acd2-88da5b4b59fb";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065752, 1.09487, '1', 200),
(76, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"86963a7f-5ca7-4aad-a0f7-7be0cbb85a0f";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065761, 1.09374, '1', 200),
(77, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"8979cfdf-4b8e-4868-9705-455e7ef62472";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065782, 1.1186, '1', 200),
(78, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"eb35bbbe-a3ff-4f79-97ac-59df7ba90e26";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497065825, 1.16892, '1', 200),
(79, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"9b668e6b-7290-4988-8e85-f7d38e7cad67";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066019, 1.10798, '1', 200),
(80, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"2b0b847b-6e76-49b8-8917-a96e2d818def";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066032, 1.10557, '1', 200),
(81, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"b064dbd8-cd79-4001-ad96-7893965c9aab";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066547, 1.11425, '1', 200),
(82, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"4b978d80-39f0-4d96-9444-fe416374e75a";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066571, 1.10598, '1', 200),
(83, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"057d81ff-1005-44ad-9cec-e5a2ea9a5959";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"59";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:36:"bEPldVuLYvXbgZKNWWWSoJWWZrShAzWQEUk=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066615, 1.17766, '1', 200),
(84, 'api/post/all', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"691286c4-8afa-4205-9975-95484eb112d3";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:12:"content-type";s:80:"multipart/form-data; boundary=--------------------------162818269992127698685452";s:14:"content-length";s:3:"403";s:10:"Connection";s:10:"keep-alive";s:7:"movieid";s:0:"";s:10:"movietitle";s:14:"Hendy Filmaaaa";s:10:"moviegenre";s:9:"lucu haha";}', '', '::1', 1497066644, 1.11526, '0', 403),
(85, 'api/post/all', 'get', 'a:8:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"1cfc9dbf-5276-45e4-a3dd-230dee0041c9";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:10:"Connection";s:10:"keep-alive";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066673, 1.12004, '1', 200),
(86, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"d1b13be7-bc98-4321-b240-0b05ffc41d2e";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"67";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:44:"czFBhfnLXNxD58iCT2pCzq1I0huxkow0EWaEegmP4E0=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066696, 1.11372, '1', 200),
(87, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"adccbb94-ae27-4dfc-9e69-2410f76bf6db";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"67";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:44:"czFBhfnLXNxD58iCT2pCzq1I0huxkow0EWaEegmP4E0=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066710, 1.08816, '1', 200),
(88, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"6163cdd1-2a2d-4559-91f8-9648457fa2b2";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"67";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:44:"czFBhfnLXNxD58iCT2pCzq1I0huxkow0EWaEegmP4E0=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066726, 1.21338, '1', 0),
(89, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"b5998773-0cdd-4a1d-a0f5-416d1c003ade";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"67";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:44:"czFBhfnLXNxD58iCT2pCzq1I0huxkow0EWaEegmP4E0=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066748, 1.11937, '1', 0),
(90, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"63bf1c85-64d3-4cb2-acb4-7eede21d3338";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"67";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:44:"czFBhfnLXNxD58iCT2pCzq1I0huxkow0EWaEegmP4E0=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497066846, 1.12348, '1', 0),
(91, 'api/post/downvote', 'post', 'a:12:{s:13:"cache-control";s:8:"no-cache";s:13:"Postman-Token";s:36:"aeecfeef-7466-48e5-abd5-be07e4afa2f9";s:9:"X-API-KEY";s:40:"4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0";s:12:"Content-Type";s:33:"application/x-www-form-urlencoded";s:10:"User-Agent";s:30:"PostmanRuntime/3.0.11-hotfix.2";s:6:"Accept";s:3:"*/*";s:4:"Host";s:9:"localhost";s:15:"accept-encoding";s:13:"gzip, deflate";s:14:"content-length";s:2:"67";s:10:"Connection";s:10:"keep-alive";s:8:"username";s:8:"hendynew";s:2:"id";s:44:"czFBhfnLXNxD58iCT2pCzq1I0huxkow0EWaEegmP4E0=";}', '4gs84sos0cgswcows40ow4o80c0swwws8gsow4s0', '::1', 1497067010, 1.18254, '1', 200);

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `idkategori`, `caption`, `namafile`, `username`, `like_count`, `comment_count`, `status`, `created`, `updated`) VALUES
(8, 1, 'Slavic RPG', 'agLbjb1_700b.jpg', 'hendynew', 0, 0, '0', '0000-00-00 00:00:00', '2017-05-25 08:50:32'),
(9, 2, 'I got accepted to Harvard University', 'a3qDxL7_700b.jpg', 'hendynew', -4, 0, '1', '0000-00-00 00:00:00', '2017-06-10 03:56:50'),
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idreply` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
