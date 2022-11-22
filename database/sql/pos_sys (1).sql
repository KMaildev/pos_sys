-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 22, 2022 at 07:23 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_sys`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_temps`
--

CREATE TABLE `cart_temps` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_list_id` int(11) DEFAULT NULL,
  `qty` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_temps`
--

INSERT INTO `cart_temps` (`id`, `menu_list_id`, `qty`, `price`, `remark`, `session_id`, `user_id`, `created_at`, `updated_at`) VALUES
(29, 4, '1', '5000', '', 'p3Ju0RJ1ZQagL7RNu8ZHYWfStM2M4Z9hSu19TmUi', '2', '2022-11-21 01:32:35', '2022-11-21 01:32:35'),
(30, 8, '1', '5000', '', 'p3Ju0RJ1ZQagL7RNu8ZHYWfStM2M4Z9hSu19TmUi', '2', '2022-11-21 01:32:35', '2022-11-21 01:32:35'),
(31, 10, '1', '3500', '', 'p3Ju0RJ1ZQagL7RNu8ZHYWfStM2M4Z9hSu19TmUi', '2', '2022-11-21 01:32:36', '2022-11-21 01:32:36'),
(32, 18, '1', '5000', '', 'p3Ju0RJ1ZQagL7RNu8ZHYWfStM2M4Z9hSu19TmUi', '2', '2022-11-21 01:32:36', '2022-11-21 01:32:36'),
(33, 4, '1', '5000', '', 'sf66jp0MX5DZ09MFNmRqCHVlIG5zY8p9l3jECL2U', '2', '2022-11-21 04:49:03', '2022-11-21 04:49:03'),
(34, 8, '1', '5000', '', 'sf66jp0MX5DZ09MFNmRqCHVlIG5zY8p9l3jECL2U', '2', '2022-11-21 04:49:03', '2022-11-21 04:49:03'),
(35, 6, '1', '6000', '', 'sf66jp0MX5DZ09MFNmRqCHVlIG5zY8p9l3jECL2U', '2', '2022-11-21 04:50:34', '2022-11-21 04:50:34'),
(36, 15, '1', '5000', '', 'sf66jp0MX5DZ09MFNmRqCHVlIG5zY8p9l3jECL2U', '2', '2022-11-21 04:50:35', '2022-11-21 04:50:35'),
(37, 19, '1', '6000', '', 'sf66jp0MX5DZ09MFNmRqCHVlIG5zY8p9l3jECL2U', '2', '2022-11-21 04:50:36', '2022-11-21 04:50:36'),
(38, 13, '1', '1000', '', 'sf66jp0MX5DZ09MFNmRqCHVlIG5zY8p9l3jECL2U', '2', '2022-11-21 04:50:49', '2022-11-21 04:50:49'),
(39, 12, '1', '1000', '', 'sf66jp0MX5DZ09MFNmRqCHVlIG5zY8p9l3jECL2U', '2', '2022-11-21 04:50:50', '2022-11-21 04:50:50'),
(40, 11, '1', '1000', '', 'sf66jp0MX5DZ09MFNmRqCHVlIG5zY8p9l3jECL2U', '2', '2022-11-21 04:50:50', '2022-11-21 04:50:50'),
(41, 14, '1', '3000', '', 'sf66jp0MX5DZ09MFNmRqCHVlIG5zY8p9l3jECL2U', '2', '2022-11-21 04:51:02', '2022-11-21 04:51:02'),
(42, 1, '1', '3000', '', 'sf66jp0MX5DZ09MFNmRqCHVlIG5zY8p9l3jECL2U', '2', '2022-11-21 04:51:03', '2022-11-21 04:51:03'),
(43, 2, '1', '5000', '', 'uy5aUXhHEz1CeWF394dfT612ysivVpq9I8vrQb2z', '2', '2022-11-21 17:10:03', '2022-11-21 17:10:03'),
(44, 3, '1', '5000', '', 'uy5aUXhHEz1CeWF394dfT612ysivVpq9I8vrQb2z', '2', '2022-11-21 17:10:03', '2022-11-21 17:10:03'),
(45, 4, '1', '5000', '', 'uy5aUXhHEz1CeWF394dfT612ysivVpq9I8vrQb2z', '2', '2022-11-21 17:10:05', '2022-11-21 17:10:05'),
(48, 2, '8', '5000', '', 'oi7fSQkKVZL9Xuxe9fcotN9Wf8Aot4JApw67L2e0', '2', '2022-11-21 19:23:46', '2022-11-21 20:03:40'),
(49, 3, '2', '5000', '', 'oi7fSQkKVZL9Xuxe9fcotN9Wf8Aot4JApw67L2e0', '2', '2022-11-21 19:23:47', '2022-11-21 20:03:32'),
(50, 7, '3', '3000', '', 'oi7fSQkKVZL9Xuxe9fcotN9Wf8Aot4JApw67L2e0', '2', '2022-11-21 19:23:47', '2022-11-21 20:03:38'),
(51, 8, '1', '5000', '', 'oi7fSQkKVZL9Xuxe9fcotN9Wf8Aot4JApw67L2e0', '2', '2022-11-21 20:00:01', '2022-11-21 20:00:01'),
(52, 16, '1', '5000', '', 'oi7fSQkKVZL9Xuxe9fcotN9Wf8Aot4JApw67L2e0', '2', '2022-11-21 20:03:33', '2022-11-21 20:03:33'),
(53, 20, '2', '3000', '', 'oi7fSQkKVZL9Xuxe9fcotN9Wf8Aot4JApw67L2e0', '2', '2022-11-21 20:03:34', '2022-11-21 20:03:44'),
(54, 21, '1', '5000', '', 'oi7fSQkKVZL9Xuxe9fcotN9Wf8Aot4JApw67L2e0', '2', '2022-11-21 20:03:34', '2022-11-21 20:03:34'),
(55, 22, '1', '3500', '', 'oi7fSQkKVZL9Xuxe9fcotN9Wf8Aot4JApw67L2e0', '2', '2022-11-21 20:03:36', '2022-11-21 20:03:36'),
(56, 18, '1', '5000', '', 'oi7fSQkKVZL9Xuxe9fcotN9Wf8Aot4JApw67L2e0', '2', '2022-11-21 20:03:37', '2022-11-21 20:03:37'),
(57, 10, '1', '3500', '', 'oi7fSQkKVZL9Xuxe9fcotN9Wf8Aot4JApw67L2e0', '2', '2022-11-21 20:03:37', '2022-11-21 20:03:37'),
(58, 6, '1', '6000', '', 'oi7fSQkKVZL9Xuxe9fcotN9Wf8Aot4JApw67L2e0', '2', '2022-11-21 20:03:39', '2022-11-21 20:03:39'),
(59, 15, '1', '5000', '', 'oi7fSQkKVZL9Xuxe9fcotN9Wf8Aot4JApw67L2e0', '2', '2022-11-21 20:03:43', '2022-11-21 20:03:43'),
(60, 19, '1', '6000', '', 'oi7fSQkKVZL9Xuxe9fcotN9Wf8Aot4JApw67L2e0', '2', '2022-11-21 20:03:43', '2022-11-21 20:03:43'),
(112, 4, '1', '5000', '', 'LVMqHXOX1O3VdEirsmiDeTFcvpuXLe7XS8VCjEI1', '2', '2022-11-22 13:01:17', '2022-11-22 13:01:17'),
(113, 5, '1', '5000', '', 'LVMqHXOX1O3VdEirsmiDeTFcvpuXLe7XS8VCjEI1', '2', '2022-11-22 13:01:18', '2022-11-22 13:01:18'),
(149, 5, '1', '5000', '', 'QEPa1yndp36p2oXBRw5Wv6PpGQHN8OLrQrWGtIYt', '2', '2022-11-22 15:40:15', '2022-11-22 15:40:15'),
(150, 24, '1', '1000', '', '0VHiQKOK01x4Wfqy2XL95sfB0I0P2M0nZmQ7rVTw', '2', '2022-11-22 15:45:36', '2022-11-22 15:45:36'),
(151, 23, '1', '1000', '', '0VHiQKOK01x4Wfqy2XL95sfB0I0P2M0nZmQ7rVTw', '2', '2022-11-22 15:45:37', '2022-11-22 15:45:37'),
(152, 14, '1', '3000', '', '0VHiQKOK01x4Wfqy2XL95sfB0I0P2M0nZmQ7rVTw', '2', '2022-11-22 15:45:42', '2022-11-22 15:45:42'),
(153, 7, '1', '3000', '', '0VHiQKOK01x4Wfqy2XL95sfB0I0P2M0nZmQ7rVTw', '2', '2022-11-22 15:45:45', '2022-11-22 15:45:45'),
(154, 4, '1', '5000', '', 'dz4VRnCKV3ZwmmsoJslR7J0XUV17PLOYnFTUpxmE', '2', '2022-11-22 15:52:57', '2022-11-22 15:52:57'),
(155, 8, '1', '5000', '', 'dz4VRnCKV3ZwmmsoJslR7J0XUV17PLOYnFTUpxmE', '2', '2022-11-22 15:52:58', '2022-11-22 15:52:58'),
(156, 17, '1', '5000', '', 'dz4VRnCKV3ZwmmsoJslR7J0XUV17PLOYnFTUpxmE', '2', '2022-11-22 15:52:58', '2022-11-22 15:52:58'),
(159, 6, '1', '6000', '', 'MfnIZabdxlDfjlPdoNIHAs6OfZUuADxODjJHs2S1', '2', '2022-11-22 18:00:45', '2022-11-22 18:00:45'),
(160, 7, '1', '3000', '', 'MfnIZabdxlDfjlPdoNIHAs6OfZUuADxODjJHs2S1', '2', '2022-11-22 18:00:46', '2022-11-22 18:00:46'),
(161, 16, '1', '5000', '', 'MfnIZabdxlDfjlPdoNIHAs6OfZUuADxODjJHs2S1', '2', '2022-11-22 18:00:46', '2022-11-22 18:00:46');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `background_color` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `type`, `created_at`, `updated_at`, `background_color`) VALUES
(1, 'Chicken', 'Food', '2022-11-14 08:57:36', '2022-11-21 19:09:42', '#ebecac'),
(2, 'SEAFOOD', 'Food', '2022-11-14 08:57:50', '2022-11-21 19:10:20', '#e9e6eb'),
(3, 'Appetizer', 'Food', '2022-11-14 08:58:01', '2022-11-21 19:09:14', '#a0a9ee'),
(4, 'Vegetables', 'Food', '2022-11-14 08:58:04', '2022-11-21 19:10:50', '#b0f0a3'),
(5, 'Salad', 'Food', '2022-11-14 08:58:10', '2022-11-14 08:58:10', '#d494e5'),
(6, 'LIQUOR', 'Bar', '2022-11-14 08:58:18', '2022-11-21 18:54:50', '#ea5353'),
(7, 'BOTTEL BEER', 'Bar', '2022-11-14 08:58:25', '2022-11-21 18:55:15', '#ab4012'),
(8, 'Wine', 'Bar', '2022-11-14 08:58:31', '2022-11-21 18:55:32', '#b25c15'),
(9, 'SOFT BEVERAGE', 'Bar', '2022-11-14 08:58:43', '2022-11-14 08:58:43', '#0a4825'),
(10, 'Water', 'Bar', '2022-11-14 08:58:47', '2022-11-14 08:58:47', '#0a4825'),
(12, 'Beverage', 'Beverage', '2022-11-21 18:11:06', '2022-11-21 18:11:06', '#0a4825'),
(13, 'Soup', 'Food', '2022-11-21 18:36:19', '2022-11-21 19:07:49', '#b4f4cf'),
(14, 'Grill', 'Food', '2022-11-21 19:05:43', '2022-11-21 19:08:25', '#eeb4a0');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_id`, `name`, `primary_number`, `additional_number`, `email`, `address`, `date_of_birth`, `join_date`, `remark`, `gender`, `created_at`, `updated_at`) VALUES
(1, '220001', 'Mg Mg', '091234567', '0932112345', 'aungsoe@gmail.com', 'Yangon', '1.1.1995', '1.1.1995', 'No Remark', 'male', '2022-11-14 22:03:05', '2022-11-14 22:11:58'),
(2, '220002', 'Aung Aung', '093234564', '0943223456', 'aung@gmail.com', 'Yangon', '1.1.1995', '1.1.2022', 'No Remark', 'male', '2022-11-14 22:03:45', '2022-11-14 22:03:45');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2022-11-14 02:13:28', '2022-11-14 08:03:18'),
(2, 'Manager', '2022-11-14 02:13:34', '2022-11-14 02:13:34'),
(3, 'HR', '2022-11-14 02:13:40', '2022-11-14 02:13:40'),
(4, 'Waiter', '2022-11-14 02:13:46', '2022-11-14 02:13:46'),
(5, 'Cashier', '2022-11-14 02:13:52', '2022-11-14 02:13:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `floors`
--

CREATE TABLE `floors` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `floors`
--

INSERT INTO `floors` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Ground Floor', '2022-11-14 10:05:23', '2022-11-14 10:07:07'),
(2, 'First Floor', '2022-11-14 10:05:41', '2022-11-14 10:05:41'),
(3, 'Second Floor', '2022-11-14 10:05:45', '2022-11-14 10:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `unit`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'OIL', 'KG', 1, '2022-11-14 10:22:14', '2022-11-14 10:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `login_time` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_ip` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`id`, `user_id`, `login_time`, `login_ip`, `device`, `created_at`, `updated_at`) VALUES
(1, 2, '2022-11-21 16:06:46', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-21 09:36:46', '2022-11-21 09:36:46'),
(2, 2, '2022-11-21 16:08:05', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-21 09:38:05', '2022-11-21 09:38:05'),
(3, 2, '2022-11-21 16:11:25', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-21 09:41:25', '2022-11-21 09:41:25'),
(4, 2, '2022-11-21 22:59:15', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-21 16:29:15', '2022-11-21 16:29:15'),
(5, 2, '2022-11-21 23:10:01', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-21 16:40:01', '2022-11-21 16:40:01'),
(6, 2, '2022-11-22 00:38:04', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-21 18:08:04', '2022-11-21 18:08:04'),
(7, 2, '2022-11-22 00:52:24', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-21 18:22:24', '2022-11-21 18:22:24'),
(8, 2, '2022-11-22 00:55:49', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-21 18:25:49', '2022-11-21 18:25:49'),
(9, 2, '2022-11-22 09:34:11', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 03:04:11', '2022-11-22 03:04:11'),
(10, 2, '2022-11-22 19:29:05', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 12:59:05', '2022-11-22 12:59:05'),
(11, 2, '2022-11-22 19:50:34', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 13:20:34', '2022-11-22 13:20:34'),
(12, 2, '2022-11-22 19:50:49', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 13:20:49', '2022-11-22 13:20:49'),
(13, 2, '2022-11-22 21:36:42', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 15:06:42', '2022-11-22 15:06:42'),
(14, 2, '2022-11-22 21:37:41', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 15:07:41', '2022-11-22 15:07:41'),
(15, 2, '2022-11-22 21:39:39', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 15:09:39', '2022-11-22 15:09:39'),
(16, 2, '2022-11-22 21:42:39', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 15:12:39', '2022-11-22 15:12:39'),
(17, 2, '2022-11-22 22:13:44', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 15:43:44', '2022-11-22 15:43:44'),
(18, 2, '2022-11-22 22:14:43', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 15:44:43', '2022-11-22 15:44:43'),
(19, 2, '2022-11-22 22:21:59', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 15:51:59', '2022-11-22 15:51:59'),
(20, 3, '2022-11-22 22:26:15', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 15:56:15', '2022-11-22 15:56:15'),
(21, 3, '2022-11-22 22:29:00', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 15:59:00', '2022-11-22 15:59:00'),
(22, 3, '2022-11-22 22:30:53', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 16:00:53', '2022-11-22 16:00:53'),
(23, 3, '2022-11-22 22:36:56', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 16:06:56', '2022-11-22 16:06:56'),
(24, 2, '2022-11-23 00:30:23', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 18:00:23', '2022-11-22 18:00:23'),
(25, 2, '2022-11-23 00:31:05', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 18:01:05', '2022-11-22 18:01:05'),
(26, 3, '2022-11-23 00:31:36', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-22 18:01:36', '2022-11-22 18:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `members_lists`
--

CREATE TABLE `members_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `members_list_file` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `insert_user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_lists`
--

CREATE TABLE `menu_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_lists`
--

INSERT INTO `menu_lists` (`id`, `menu_name`, `price`, `categorie_id`, `created_at`, `updated_at`) VALUES
(1, 'Fride Rice (Chicken,Pork)', '3000', 2, '2022-11-14 09:41:37', '2022-11-14 09:51:53'),
(2, 'Fried Rice (Shrimp, Crab, Squid, Seafood)', '5000', 1, '2022-11-14 09:41:48', '2022-11-14 09:41:48'),
(3, 'Fried Rice with shrimp paste', '5000', 1, '2022-11-14 09:41:58', '2022-11-14 09:41:58'),
(4, 'Fried Rice with Thai Sour Pork', '5000', 1, '2022-11-14 09:42:07', '2022-11-14 09:42:07'),
(5, 'Tom Yum Fried Rice', '5000', 1, '2022-11-14 09:42:36', '2022-11-14 09:42:36'),
(6, 'Tom Yum Fried Rice (Shrimp/ Squid/ Seafood)', '6000', 1, '2022-11-14 09:42:45', '2022-11-14 09:42:45'),
(7, 'Spicy Curry (Chicken/ Pork)', '3000', 1, '2022-11-14 09:42:55', '2022-11-14 09:42:55'),
(8, 'Pat Thai with Shrimp', '5000', 1, '2022-11-14 09:43:04', '2022-11-14 09:43:04'),
(10, 'Pork Salad', '3500', 1, '2022-11-14 09:54:12', '2022-11-14 09:54:12'),
(11, 'Water', '1000', 10, '2022-11-16 01:07:50', '2022-11-16 01:07:50'),
(12, 'Cool Water', '1000', 10, '2022-11-16 01:10:12', '2022-11-16 01:10:12'),
(13, 'Hot Water', '1000', 10, '2022-11-16 01:10:22', '2022-11-16 01:10:22'),
(14, 'Fride Rice (Chicken,Pork)', '3000', 2, '2022-11-14 09:41:37', '2022-11-14 09:51:53'),
(15, 'Fried Rice (Shrimp, Crab, Squid, Seafood)', '5000', 1, '2022-11-14 09:41:48', '2022-11-14 09:41:48'),
(16, 'Fried Rice with shrimp paste', '5000', 1, '2022-11-14 09:41:58', '2022-11-14 09:41:58'),
(17, 'Fried Rice with Thai Sour Pork', '5000', 1, '2022-11-14 09:42:07', '2022-11-14 09:42:07'),
(18, 'Tom Yum Fried Rice', '5000', 1, '2022-11-14 09:42:36', '2022-11-14 09:42:36'),
(19, 'Tom Yum Fried Rice (Shrimp/ Squid/ Seafood)', '6000', 1, '2022-11-14 09:42:45', '2022-11-14 09:42:45'),
(20, 'Spicy Curry (Chicken/ Pork)', '3000', 1, '2022-11-14 09:42:55', '2022-11-14 09:42:55'),
(21, 'Pat Thai with Shrimp', '5000', 1, '2022-11-14 09:43:04', '2022-11-14 09:43:04'),
(22, 'Pork Salad', '3500', 1, '2022-11-14 09:54:12', '2022-11-14 09:54:12'),
(23, 'Shark', '1000', 12, '2022-11-21 18:11:26', '2022-11-21 18:11:26'),
(24, 'Water', '1000', 12, '2022-11-21 18:11:33', '2022-11-21 18:11:33'),
(25, 'Beef Consomme', '1000', 13, '2022-11-21 19:12:53', '2022-11-21 19:12:53'),
(26, 'Calm Chowder', '1000', 13, '2022-11-21 19:13:04', '2022-11-21 19:13:04'),
(27, 'Fr-Onion Soup', '1000', 13, '2022-11-21 19:13:14', '2022-11-21 19:13:14'),
(28, 'Gazpacho', '1000', 13, '2022-11-21 19:13:36', '2022-11-21 19:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_11_14_081102_create_permission_tables', 2),
(6, '2022_11_14_081238_add_status_to_permissions_table', 3),
(8, '2022_11_14_082319_create_members_lists_table', 4),
(9, '2022_11_14_081805_create_departments_table', 5),
(10, '2022_11_14_152437_create_categories_table', 6),
(11, '2022_11_14_160540_create_menu_lists_table', 7),
(12, '2022_11_14_163020_create_floors_table', 8),
(13, '2022_11_14_164217_create_ingredients_table', 9),
(14, '2022_11_14_165715_create_table_lists_table', 10),
(18, '2022_11_15_035359_create_customers_table', 11),
(19, '2022_11_19_183857_create_cart_temps_table', 12),
(24, '2022_11_20_135749_create_order_items_table', 13),
(25, '2022_11_20_133845_create_order_infos_table', 14),
(26, '2022_11_20_154331_add_preparation_status_to_order_items_table', 15),
(27, '2022_11_20_161953_add_waiter_user_id_to_order_infos_table', 16),
(28, '2022_11_21_020757_add_pin_code_to_users_table', 17),
(29, '2022_11_21_155212_create_login_logs_table', 18),
(30, '2022_11_22_010412_add_background_color_to_categories_table', 19),
(31, '2022_11_22_201215_add_guest_no_to_order_infos_table', 20);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_infos`
--

CREATE TABLE `order_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_list_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inv_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date_time` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_time` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_out_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_out_time` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_amount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_charges` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_amount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_amount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cashier_user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `waiter_user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_infos`
--

INSERT INTO `order_infos` (`id`, `customer_id`, `table_list_id`, `order_no`, `inv_no`, `order_date_time`, `order_date`, `order_time`, `check_out_status`, `check_out_time`, `payment_type`, `total_amount`, `tax_amount`, `discount`, `service_charges`, `net_amount`, `received_amount`, `cashier_user_id`, `created_at`, `updated_at`, `waiter_user_id`, `guest_no`) VALUES
(1, '0', '3', '000001', 'INV-23112022-0001', '2022-11-23 12:30:31 AM', '2022-11-23', '12:30:31 AM', NULL, NULL, NULL, '25000', NULL, NULL, NULL, NULL, NULL, '2', '2022-11-22 18:00:31', '2022-11-22 18:00:31', '2', '2'),
(2, '0', '8', '000002', 'INV-23112022-0002', '2022-11-23 12:31:17 AM', '2022-11-23', '12:31:17 AM', NULL, NULL, NULL, '94000', NULL, NULL, NULL, NULL, NULL, '2', '2022-11-22 18:01:17', '2022-11-22 18:01:28', '2', '8');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_info_id` int(11) DEFAULT NULL,
  `menu_list_id` int(11) DEFAULT NULL,
  `qty` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waiter_user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `preparation_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preparation_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preparation_user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `difference_time` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_info_id`, `menu_list_id`, `qty`, `price`, `remark`, `waiter_user_id`, `created_at`, `updated_at`, `preparation_status`, `preparation_date`, `preparation_user_id`, `difference_time`, `manager_remark`) VALUES
(1, 1, 2, '1', '5000', '', '2', '2022-11-22 14:58:10', '2022-11-22 14:58:10', NULL, NULL, NULL, NULL, NULL),
(2, 1, 3, '1', '5000', '', '2', '2022-11-22 14:58:10', '2022-11-22 14:58:10', NULL, NULL, NULL, NULL, NULL),
(3, 1, 4, '1', '5000', '', '2', '2022-11-22 14:58:10', '2022-11-22 14:58:10', NULL, NULL, NULL, NULL, NULL),
(4, 2, 5, '1', '5000', '', '2', '2022-11-22 14:58:25', '2022-11-22 14:58:25', NULL, NULL, NULL, NULL, NULL),
(5, 2, 4, '1', '5000', '', '2', '2022-11-22 14:58:25', '2022-11-22 14:58:25', NULL, NULL, NULL, NULL, NULL),
(6, 2, 3, '1', '5000', '', '2', '2022-11-22 14:58:25', '2022-11-22 14:58:25', NULL, NULL, NULL, NULL, NULL),
(7, 2, 2, '1', '5000', '', '2', '2022-11-22 14:58:25', '2022-11-22 14:58:25', NULL, NULL, NULL, NULL, NULL),
(8, 2, 6, '1', '6000', '', '2', '2022-11-22 14:58:25', '2022-11-22 14:58:25', NULL, NULL, NULL, NULL, NULL),
(9, 2, 16, '1', '5000', '', '2', '2022-11-22 14:58:25', '2022-11-22 14:58:25', NULL, NULL, NULL, NULL, NULL),
(10, 2, 22, '1', '3500', '', '2', '2022-11-22 14:58:43', '2022-11-22 14:58:43', NULL, NULL, NULL, NULL, NULL),
(11, 2, 21, '1', '5000', '', '2', '2022-11-22 14:58:43', '2022-11-22 14:58:43', NULL, NULL, NULL, NULL, NULL),
(12, 2, 20, '1', '3000', '', '2', '2022-11-22 14:58:43', '2022-11-22 14:58:43', NULL, NULL, NULL, NULL, NULL),
(13, 2, 6, '3', '6000', '', '2', '2022-11-22 14:58:43', '2022-11-22 14:58:43', NULL, NULL, NULL, NULL, NULL),
(14, 3, 2, '1', '5000', '', '2', '2022-11-22 15:07:11', '2022-11-22 15:07:11', NULL, NULL, NULL, NULL, NULL),
(15, 3, 3, '1', '5000', '', '2', '2022-11-22 15:07:11', '2022-11-22 15:07:11', NULL, NULL, NULL, NULL, NULL),
(16, 1, 4, '1', '5000', '', '2', '2022-11-22 18:00:31', '2022-11-22 18:00:31', NULL, NULL, NULL, NULL, NULL),
(17, 1, 5, '1', '5000', '', '2', '2022-11-22 18:00:31', '2022-11-22 18:00:31', NULL, NULL, NULL, NULL, NULL),
(18, 2, 4, '1', '5000', '', '2', '2022-11-22 18:01:17', '2022-11-22 18:01:17', NULL, NULL, NULL, NULL, NULL),
(19, 2, 8, '1', '5000', '', '2', '2022-11-22 18:01:17', '2022-11-22 18:01:17', NULL, NULL, NULL, NULL, NULL),
(20, 2, 17, '1', '5000', '', '2', '2022-11-22 18:01:17', '2022-11-22 18:01:17', NULL, NULL, NULL, NULL, NULL),
(21, 2, 21, '1', '5000', '', '2', '2022-11-22 18:01:17', '2022-11-22 18:01:17', NULL, NULL, NULL, NULL, NULL),
(22, 2, 5, '1', '5000', '', '2', '2022-11-22 18:01:28', '2022-11-22 18:01:28', NULL, NULL, NULL, NULL, NULL),
(23, 2, 10, '1', '3500', '', '2', '2022-11-22 18:01:28', '2022-11-22 18:01:28', NULL, NULL, NULL, NULL, NULL),
(24, 2, 18, '1', '5000', '', '2', '2022-11-22 18:01:28', '2022-11-22 18:01:28', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `status`) VALUES
(1, 'pos_module', 'web', '2022-11-14 03:12:18', '2022-11-14 03:12:18', 'module'),
(2, 'counter_module', 'web', '2022-11-14 03:12:26', '2022-11-14 03:12:26', 'module');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Waiter', 'web', '2022-11-14 03:13:30', '2022-11-14 03:13:30'),
(2, 'Cashier', 'web', '2022-11-14 03:13:47', '2022-11-14 03:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `table_lists`
--

CREATE TABLE `table_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_lists`
--

INSERT INTO `table_lists` (`id`, `table_name`, `floor_id`, `created_at`, `updated_at`) VALUES
(1, 'G1', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(2, 'G2', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(3, 'G3', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(4, 'G4', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(5, 'G5', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(6, 'G6', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(7, 'G7', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(8, 'G8', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(9, 'G9', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(10, 'G10', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(11, 'G11', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(12, 'G12', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(13, 'G13', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(14, 'G14', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(15, 'G15', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(16, 'G16', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(17, 'G17', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(18, 'G18', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(19, 'G19', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(20, 'G20', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(21, 'G21', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(22, 'G22', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(23, 'G23', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(24, 'G24', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(25, 'G25', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(26, 'G26', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(27, 'G27', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(28, 'G28', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(29, 'G29', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(30, 'G30', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(31, 'F1', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(32, 'F2', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(33, 'F3', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(34, 'F4', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(35, 'F5', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(36, 'F6', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(37, 'F7', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(38, 'F8', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(39, 'F9', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(40, 'F10', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(41, 'F11', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(42, 'F12', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(43, 'F13', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(44, 'F14', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(45, 'F15', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(46, 'F16', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(47, 'F17', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(48, 'F18', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(49, 'F19', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(50, 'F20', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(51, 'F21', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(52, 'F22', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(53, 'F23', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(54, 'F24', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(55, 'F25', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(56, 'F26', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(57, 'F27', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(58, 'F28', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(59, 'F29', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(60, 'F30', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(61, 'S1', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(62, 'S2', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(63, 'S3', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(64, 'S4', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(65, 'S5', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(66, 'S6', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(67, 'S7', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(68, 'S8', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(69, 'S9', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(70, 'S10', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(71, 'S11', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(72, 'S12', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(73, 'S13', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(74, 'S14', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(75, 'S15', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(76, 'S16', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(77, 'S17', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(78, 'S18', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(79, 'S19', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(80, 'S20', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(81, 'S21', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(82, 'S22', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(83, 'S23', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(84, 'S24', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(85, 'S25', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(86, 'S26', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(87, 'S27', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(88, 'S28', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(89, 'S29', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(90, 'S30', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(91, '1', 1, '2022-11-21 18:24:39', '2022-11-21 18:24:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nrc_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_banned` int(11) NOT NULL DEFAULT 1,
  `last_login_at` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_ip` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nrc_front` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nrc_back` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `members_list_file` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_file` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leave_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leave_remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leave_by` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employment_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `employee_id`, `phone`, `nrc_number`, `gender`, `address`, `department_id`, `is_banned`, `last_login_at`, `last_login_ip`, `agent`, `nrc_front`, `nrc_back`, `members_list_file`, `other_file`, `leave_date`, `leave_remark`, `leave_by`, `contact_person`, `emergency_contact`, `passport_photo`, `join_date`, `employment_type`, `remember_token`, `created_at`, `updated_at`, `pin_code`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$H4Dl/7aFMsm1xck7mqa.PehZTR5oWppsGZ09pO7VHsE7euBe.sCQi', '00001', '09123123122', '1/agc(N)991223', 'male', 'YGN', '1', 1, '2022-11-22 23:09:04', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Probation', NULL, '2022-11-14 01:38:14', '2022-11-22 16:39:04', NULL),
(2, 'Mg Mg', 'waiter@gmail.com', NULL, '$2y$10$YlWrTGwZXqnf1/D4ifbXu.xDm5kdkbG4uNrbfqll.RIb3xHWUwKzG', '00002', '0912312313', '1/abc(n)009221', 'male', 'YGN', '4', 1, '23/11/2022 00:31:05 am', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Probation', 'yRbZtI6uGjm1396Yk4HTzuc0EPzNBLEbQhHqauE1HpQA9J8DBktsoFOi1QG4', '2022-11-14 02:14:39', '2022-11-22 18:01:05', 123456),
(3, 'Cashier', 'cashier@gmail.com', NULL, '$2y$10$KL/3ZNF1BfbUI4ElchzP9uWxwfagZcAxiq9ISNMas439.IvR8ewrK', '00003', '09123123123', '1/abc(N)009221', 'male', 'YGN', '5', 1, '23/11/2022 00:31:36 am', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Probation', NULL, '2022-11-14 03:17:19', '2022-11-22 18:01:36', 123457);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_temps`
--
ALTER TABLE `cart_temps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members_lists`
--
ALTER TABLE `members_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_lists`
--
ALTER TABLE `menu_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `order_infos`
--
ALTER TABLE `order_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `table_lists`
--
ALTER TABLE `table_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_temps`
--
ALTER TABLE `cart_temps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floors`
--
ALTER TABLE `floors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `members_lists`
--
ALTER TABLE `members_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_lists`
--
ALTER TABLE `menu_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `order_infos`
--
ALTER TABLE `order_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_lists`
--
ALTER TABLE `table_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
