-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2019 at 05:14 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `application_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `getway` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hobby` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `application_name`, `title`, `address`, `email`, `logo`, `getway`, `created_at`, `updated_at`, `hobby`, `gender`) VALUES
(23, 'a', 'a', 'a', 'ajaz@gmail.com', '1572540942.png', 'Large', '2018-08-16 12:07:18', '2019-10-31 11:27:46', 'basketball,swimming', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_08_14_032740_create_blogs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `first_name`, `last_name`, `email`, `password`, `gender`, `created_at`, `updated_at`) VALUES
(1, 'ajaz', 'memon', 'ajaz@gmail.com', '$2y$10$GKZMC7zvgzzpbI9xtdGccuaKRNCRnqTlBihT2vDmvhxgr9QcbnxAO', 'male', '2019-11-13 20:29:29', '2019-11-13 20:30:45'),
(2, 'Nirav', 'nakrani', 'nirav@gmail.com', '$2y$10$lW/fxs1iMo/XWUFgepUwf.ngWVqy3xW5XS.7sos9XO043WpwC1GtC', 'male', '2019-11-13 20:31:52', '2019-11-13 20:31:52'),
(3, 'test', 'test', 'test@gmail.com', '$2y$10$334rgVVqInVI8ZloFKwspek6cL1iFD0SDNIYdQBycOztvL1IomJ0S', 'male', '2019-11-13 22:16:26', '2019-11-13 22:16:26'),
(4, 'qqqq', 'qqqq', 'admin@gmail.com', '$2y$10$4mPELswVuFXS4/1Y9McJ0.6H/bSxf1c8wvWSEe8hjLXZbsXqU3mqy', 'male', '2019-11-13 22:18:04', '2019-11-13 22:18:04'),
(5, 'aju', 'memon', 'aj@gmail.com', '$2y$10$bPP1VrxE/pzWclPqAIRuPODSvpDM6VqlDKd2YqQkHXCzBr1DLahVm', 'male', '2019-11-13 22:28:10', '2019-11-13 22:28:10'),
(6, 'aju1', 'memon', 'aj1@gmail.com', '$2y$10$IH37d5tZA00lAIY.Zs0J3uzdRF3mrdL9MVRm7y.fLrcvruyLjK8aS', 'female', '2019-11-13 22:29:26', '2019-11-13 22:35:16'),
(7, 'sdfhgssf', 'sdfkgass', 'ajaz1233@gmail.com', '$2y$10$nfsvxQ9eiHhQsy1/JwYIe.UmD85ElhotnBeIsITqDuQTbfS5AK2IK', 'male', '2019-11-13 22:43:21', '2019-11-13 22:43:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ajaz', 'ajaz@gmail.com', '$2y$10$ImO9w1gFhjl4rRw5a99SbOvBVkqDHqyyru5Xjemc1gsqMvTzfc4Am', NULL, '2018-08-13 22:16:51', '2018-08-13 22:16:51'),
(2, 'abc', 'admin@gmail.com', '$2y$10$2wEK59SJ1OQaKbzrVbiG8.ROTx5eBXhZK/FEZl/zyl1cYK06fWuAO', NULL, '2018-08-14 19:37:18', '2018-08-14 19:37:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
