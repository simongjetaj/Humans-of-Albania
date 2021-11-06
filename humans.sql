-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2019 at 03:25 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

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
CREATE DATABASE IF NOT EXISTS `humans` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `humans`;

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

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('1raM5IRHtTgLTZI7FEZUwqnLm0uAVxWo', 1551640082, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('2XD8eOisecpetJgy9HV6UpM0XBsKxi3D', 1551707885, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('5TmiKkdZ4js8h_FBH7XP8wMejEiq77Ij', 1551702712, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('5gF7QTZ7MYFUd3Gjpou9tp8ASlV7R0_c', 1551700859, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('67nQPcdpc8ZEjwTH6ZSDF5-EZJoIwXYP', 1551687500, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('8hOFJRVdCdbjJqoqThaKByChIy35etQ3', 1551695959, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('8k2pliaE8BiTRmtwaSpCS0qRfuOAtJok', 1551702359, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('8zxCr_DJV7lPEtCRsuMTHIJtC4xBBgoQ', 1551701540, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('AVc_aVqyC3xWTOMqYWIA9MFQSztaCG22', 1551704519, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('DTF_wq15u94AS4Ip3RbK_YX5vMvVixdJ', 1551709167, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('DgoJ9RZaePA2LLAKNDha74fxaqFAYliF', 1551693078, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('GsqpdJpY1FS_IDO3I26QcHeMJyuj5Zle', 1551700955, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('HVI6I5wsxJ19nr8DzoxDWhLfxawssfJB', 1551697646, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('JzJMMbBEbyi2Q1fV7AlIdo92uQ4BD7lC', 1551640792, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('MAqIablaj9S9AHNHjqNcfpz8hke5o79S', 1551704603, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('NWM3WqzkxApuNhLuMEI8a5Z7nLp7C09G', 1551706180, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('Of5d7hZws5-kpsewdMjC7_kCwODma1qE', 1551701583, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('QGdcW8mNyBg8DKUPo0O-G6ThHxq_L3TJ', 1551702274, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('RM1w9pkmpRhCwARC1CL63V5NW7-pMCcf', 1551640431, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('Rtl-M95hvBbXy2AbX0WoBZTtHvKfPYnk', 1551699328, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Su7F4DbG1-129lJybxZ2Q28ZFUGm4l-Y', 1551709022, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('TICfZdUskPDJGd59oQl7csk9aMEOJXj1', 1551702810, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Vivz6wAiPgQXqSNoV6RwUkN8bqlmUwBb', 1551692754, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('Wa7JR3EMlxsiITmRXNFXCQUKeOUrT9qF', 1551708427, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('Wc_hpf4KqspKatopuJMPpaoi0nbj1jhm', 1551704913, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('Xo4QKHmsBgrQmUdFKE1tHdW8Leqrbyj0', 1551686511, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('XyKKxrceRXYnmI9qogN04hoXXMSWmIuB', 1551631609, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('Ybr9TJw2RUZUXbyWtjHNM6d6kawEFy0g', 1551707315, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('YfINShH5z3-vekgVUPF4V8Y8J-RjorTe', 1551703116, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('_1dJpNeyv2avP2B0eRTX62kFeVz1ApRP', 1551695698, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('_doJ6RaFx0seaX117w_2_Jwvpak71iOr', 1551706546, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('bKDEnC3CCDq8qzrCyVg6v7tfKKtkwmgt', 1551708491, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('bSxlXJ2iPyPcAlXsSxPvdVVtq5lSeoqE', 1551705039, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('blR1GurXai8e47zSTWKWugbrzFQGbEB9', 1551697058, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('clWl9zaWz_ZSsPmCAEumIBtbeQgUwXTH', 1551704776, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('dYw9r3I8_Npo6q_fUPaLljzbyVAG0mgl', 1551696013, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('e9MapW7uVz05GZPfAbRxg6aoLFnXOsaU', 1551707451, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('eo5rlmgThdiNZ22-22kSg7avOU0__uOh', 1551708736, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('gc8PTk1PxTNPCAqJ_xcUtp33Ha5jF8xI', 1551642669, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('hTJR1HgVMmF2Qc7S_nX9pKZSOkMdBozL', 1551706939, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('j71HQRWbKulxthRc0hzxzOq1y30CR6bR', 1551640518, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('kAFTYmKzYrMkPTUAQpOT-q0rmde3M1jY', 1551698157, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('kXS8_l79SQMcKL_f3JA7qB00T89E8NHD', 1551707762, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('l-clq3cksyzN-uAty5047LEGN2o16PLg', 1551642725, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('mLy_vN86oTOamE7-3IwC8_d2nKyaCQKQ', 1551692610, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('muXEp4nk2iDZ3Pnw_lF-usLf3XfnkMvn', 1551639101, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('pKAnKopHyckfpqVFLc6zAcdqYWQkTBD-', 1551702221, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('rjfuQIR8zaYzSzMqTx7OoaFS_wuYC4hl', 1551708158, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('rqWYGMhAeV16Dq2LG9k1BLCC-IFMOEtl', 1551701896, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('shTp1Y7qr1aJhBDTxrYefObHP4z54TdI', 1551642524, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('t44kG-k1WsQvnsCRAgBz9l1CrUE8vjSR', 1551700560, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('uEOKAg1Nf85QwBL0eXGFtq9qqwrNkCoF', 1551693342, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('uP2gGhdhRMLDWqWdOW6rqKV6l-pwHMzj', 1551688868, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('xsPYh86-rbf2nTnskuSzEaVvazkZ9OMK', 1551639371, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}'),
('yEZ3UYD0ZX-lZoMnj2TtJe3Hv9yDA9D1', 1551708907, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"user_id\":1,\"username\":\"simongjetaj\"}}}');

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `story` text NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `user_id`, `title`, `story`, `image`, `created_at`) VALUES
(1, 2, 'Even though I’m skipping school, I don’t think I’m skipping education.', 'I started this business two years ago when I was twelve. An older friend told me that we could make good money selling fruit. We buy the fruit from villages and bring it to the city where it gets a much higher price. My friend is six years older than me, but he couldn’t keep up, so I set off on my own. I work every day. I’ve already made enough money to buy some land. I’m going to build a house and use the rest for farming. My parents tell me that I should be in school. I respect their views, but I also make more money than them. So it’s hard to listen. Plus I’m learning a lot about business. Even though I’m skipping school, I don’t think I’m skipping education.', NULL, '2018-02-17 11:01:55'),
(2, 1, 'The highest rank in class', 'I always sat in the first row. I always had the highest rank in class. I wanted to be a teacher, just like my teachers. But when it was time to enroll in grade seven, my mother told me we couldn’t afford it. I cried and begged but she just stayed silent. My teachers were so sad that they offered to pay half of the tuition. But it wasn’t enough because we’d still have to pay for the books and exams. So my mother made me understand that school was not in my luck. I’m still seventeen, but now I’m married and I work as a maid for a family. I wash their clothes, wash their dishes, clean their bathroom. Their house is near a school. So every morning I have to watch the children walk by in their uniforms.', NULL, '2018-02-20 17:04:57'),
(3, 3, 'Lorem ipsum dolor', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis eos ipsam magni, deserunt eius ratione sapiente assumenda, culpa, quod alias voluptatem est! Voluptatibus saepe voluptates animi minima sequi quisquam repellat officia dicta recusandae assumenda. Placeat animi eum delectus reprehenderit aut eligendi adipisci repudiandae alias libero ipsa, accusantium nam tempora neque...', NULL, '2018-02-28 11:19:11'),
(4, 1, 'Repellat officia ', 'Lorem crack sit amet consectetur adipisicing elit. Quis eos ipsam drakson magni. Placeat voluptatibus saepe animi eum delectus reprehenderit aut eligendi adipisci repudiandae alias libero ipsa, accusantium nam tempora neque! Voluptates animi minima sequi quisquam repellat officia dicta recusandae assumenda. ', NULL, '2018-02-28 12:43:24'),
(9, 1, 'Old Books', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Repudiandae expedita ex id deleniti odio commodi, maiores quis aperiam dolorum dignissimos? Expedita facere distinctio perspiciatis facilis recusandae incidunt necessitatibus officiis. Sunt repellat accusamus quisquam ad accusantium dicta ea atque nihil molestiae error? Quia facilis quae dolorum laboriosam! Fugiat ad assumenda neque?', 'public/storyImageUploads/image-1551622507042.jpg', '2019-03-03 14:15:07'),
(10, 1, 'Life', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Facere corrupti, maxime ipsa, hic, quisquam commodi veniam dolor aliquam omnis dolorum numquam. Ex earum ut expedita hic nihil quod eum doloremque. Molestias, perspiciatis dignissimos perferendis reiciendis illum minus voluptatem. Rem voluptatibus illum error deserunt aliquam fuga voluptatem! Veniam voluptas, laborum at natus sit magnam. Ipsum harum cum eum eveniet inventore fugit at delectus dicta quam voluptatem voluptatibus amet reprehenderit quisquam est explicabo non, pariatur repellat commodi. Incidunt, nihil optio! Molestiae eum hic, ad modi commodi perspiciatis laborum vero officia deserunt, ratione harum ut! Nesciunt temporibus cum neque ipsam quo repellendus quibusdam.', 'public/storyImageUploads/image-1551622621353.jpg', '2019-03-03 14:17:01');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
