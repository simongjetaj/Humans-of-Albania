-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2018 at 02:46 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `humans`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `username`, `comment`) VALUES
(1, 3, 'simongjetaj', 'Great Post!'),
(2, 1, 'petersimon', 'Great Post!'),
(3, 2, 'simongjetaj', 'Keep it up, Simon!'),
(4, 6, 'simongjetaj', 'Nice!'),
(5, 3, 'johndoe', 'Cool!'),
(6, 4, 'chris', 'Placeat animi eum!');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `story` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `user_id`, `title`, `story`, `created_at`) VALUES
(1, 2, 'Even though I’m skipping school, I don’t think I’m skipping education.', 'I started this business two years ago when I was twelve. An older friend told me that we could make good money selling fruit. We buy the fruit from villages and bring it to the city where it gets a much higher price. My friend is six years older than me, but he couldn’t keep up, so I set off on my own. I work every day. I’ve already made enough money to buy some land. I’m going to build a house and use the rest for farming. My parents tell me that I should be in school. I respect their views, but I also make more money than them. So it’s hard to listen. Plus I’m learning a lot about business. Even though I’m skipping school, I don’t think I’m skipping education.', '2018-02-17 11:01:55'),
(2, 1, 'The highest rank in class', 'I always sat in the first row. I always had the highest rank in class. I wanted to be a teacher, just like my teachers. But when it was time to enroll in grade seven, my mother told me we couldn’t afford it. I cried and begged but she just stayed silent. My teachers were so sad that they offered to pay half of the tuition. But it wasn’t enough because we’d still have to pay for the books and exams. So my mother made me understand that school was not in my luck. I’m still seventeen, but now I’m married and I work as a maid for a family. I wash their clothes, wash their dishes, clean their bathroom. Their house is near a school. So every morning I have to watch the children walk by in their uniforms.', '2018-02-20 17:04:57'),
(3, 3, 'Lorem ipsum dolor', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis eos ipsam magni, deserunt eius ratione sapiente assumenda, culpa, quod alias voluptatem est! Voluptatibus saepe voluptates animi minima sequi quisquam repellat officia dicta recusandae assumenda. Placeat animi eum delectus reprehenderit aut eligendi adipisci repudiandae alias libero ipsa, accusantium nam tempora neque...', '2018-02-28 11:19:11'),
(4, 1, 'Repellat officia ', 'Lorem crack sit amet consectetur adipisicing elit. Quis eos ipsam drakson magni. Placeat voluptatibus saepe animi eum delectus reprehenderit aut eligendi adipisci repudiandae alias libero ipsa, accusantium nam tempora neque! Voluptates animi minima sequi quisquam repellat officia dicta recusandae assumenda. ', '2018-02-28 12:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` binary(60) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `register_date`) VALUES
(1, 'simongjetaj', 'gjetajsimon@gmail.com', 0x243261243130246a7648614f2f4c72306c774d647962696a5a4259732e364736485131595555396a34716d775973477062665153796345303332766d, '2018-02-20 09:39:58'),
(2, 'petersimon', 'peter@test.com', 0x243261243130245147787938454a455a344a76515a34684a4b47343865457750684f376a374571775073744f744e32356f504d6c5a55643749766875, '2018-02-20 14:56:39'),
(3, 'johndoe', 'john@test.com', 0x24326124313024496d493570505252696d5748432e4f6b6d48356c722e6958516b337a57582f4b4f31574f592e644b7167446655707132696571442e, '2018-02-20 15:04:06'),
(4, 'chris', 'chris@gmail.com', 0x243261243130245679642f72364b465a783163614970353234764e732e75646f5a5450626945634a6c616a764b2e4949797552387177676439437461, '2018-02-24 09:16:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
