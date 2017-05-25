-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2017 at 10:51 AM
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
  `level` int(11) NOT NULL,
  `ignore_limits` int(11) NOT NULL,
  `key` varchar(25) NOT NULL,
  `date_created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`level`, `ignore_limits`, `key`, `date_created`, `updated`) VALUES
(1, 1, '8ogwgsg4oos0sksososcs8gs4', '0000-00-00 00:00:00', '2017-05-08 15:58:35'),
(1, 1, 'wo4gww88084kw808skgkcsg4o', '0000-00-00 00:00:00', '2017-05-08 15:59:19'),
(1, 1, 'cs4cg4owcskw408gsws4cowsc', '0000-00-00 00:00:00', '2017-05-08 15:59:21');

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
  `username` varchar(25) NOT NULL,
  `comment` text NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reply`
--

INSERT INTO `reply` (`id`, `idcomment`, `username`, `comment`, `like_count`, `status`, `created`, `updated`) VALUES
(1, 1, 'hendynew', 'Dicintai oleh dia!', 0, '1', '0000-00-00 00:00:00', '2017-05-14 13:58:24'),
(2, 1, 'hendynew', 'Dicintai oleh dia!', 0, '1', '0000-00-00 00:00:00', '2017-05-14 13:59:06'),
(3, 1, 'hendynew', 'Dicintai oleh dia!11', 0, '1', '0000-00-00 00:00:00', '2017-05-14 14:01:31');

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
-- Indexes for table `like`
--
ALTER TABLE `like`
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
-- AUTO_INCREMENT for table `like`
--
ALTER TABLE `like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `reply`
--
ALTER TABLE `reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
