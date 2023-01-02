-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 29, 2022 at 05:16 AM
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
-- Table structure for table `bill_infos`
--

CREATE TABLE `bill_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_info_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_list_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_date_time` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_time` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `change_amount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waiter_user_id` int(11) DEFAULT NULL,
  `date_only` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Signature', 'Beverage', '2022-12-28 09:37:14', '2022-12-28 09:41:20', '#f8e620'),
(2, 'Shooter', 'Beverage', '2022-12-28 09:37:25', '2022-12-28 09:41:39', '#5df47b'),
(3, 'Beer Cocktail', 'Beverage', '2022-12-28 09:38:31', '2022-12-28 09:42:11', '#ba6617'),
(4, 'Molecular', 'Beverage', '2022-12-28 09:38:41', '2022-12-28 09:42:25', '#b329ae'),
(5, 'Experimental Infuser', 'Beverage', '2022-12-28 09:38:51', '2022-12-28 09:42:39', '#3252d2'),
(6, 'Group Cocktail', 'Beverage', '2022-12-28 09:48:14', '2022-12-28 09:48:14', '#ddaa1d'),
(7, 'Classic Cocktail', 'Beverage', '2022-12-28 09:48:30', '2022-12-28 09:48:30', '#cf740c'),
(8, 'Soup', 'Food', '2022-12-28 09:55:27', '2022-12-28 09:55:27', '#eddb0c'),
(9, 'Snack', 'Food', '2022-12-28 09:55:47', '2022-12-28 09:55:47', '#ebee2f'),
(10, 'Dessert', 'Food', '2022-12-28 09:56:01', '2022-12-28 09:56:01', '#ead91f'),
(11, 'Asian - Fried Rice', 'Food', '2022-12-28 09:56:30', '2022-12-28 09:56:30', '#e9e216'),
(12, 'Asian - Noodlee', 'Food', '2022-12-28 09:56:54', '2022-12-28 09:56:54', '#f9e824'),
(13, 'Asian - Curry', 'Food', '2022-12-28 09:57:12', '2022-12-28 09:57:12', '#f4db34'),
(14, 'European', 'Food', '2022-12-28 10:06:24', '2022-12-28 10:06:24', '#f0df28'),
(15, 'Salad', 'Food', '2022-12-28 10:06:37', '2022-12-28 10:06:37', '#f9f224');

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
-- Table structure for table `fixed_assets`
--

CREATE TABLE `fixed_assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `inventory_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_damages`
--

CREATE TABLE `fixed_damages` (
  `id` int(10) UNSIGNED NOT NULL,
  `fixed_asset_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `damage_qty` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causes_of_accidents` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compensation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucher_attach` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_at` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `damage_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_damange_files`
--

CREATE TABLE `fixed_damange_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_damage_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_at` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_purchases`
--

CREATE TABLE `fixed_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `representative_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date_at` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_purchase_files`
--

CREATE TABLE `fixed_purchase_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fixed_purchase_id` int(11) DEFAULT NULL,
  `date_at` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_purchase_items`
--

CREATE TABLE `fixed_purchase_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `fixed_purchase_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_asset_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, 'Fresh Watermelon', 'Pcs', 1, '2022-12-29 03:12:20', '2022-12-29 03:12:20'),
(2, 'Absolute Raspberry', 'Ml', 1, '2022-12-29 03:12:30', '2022-12-29 03:12:30'),
(3, 'Passion Fruit Puree', 'Ml', 1, '2022-12-29 03:12:42', '2022-12-29 03:12:42'),
(4, 'Cheesecake', 'Ml', 1, '2022-12-29 03:12:56', '2022-12-29 03:12:56'),
(5, 'Lemon Juice', 'Ml', 1, '2022-12-29 03:13:07', '2022-12-29 03:13:07'),
(6, 'Passion Juice', 'MI', 1, '2022-12-29 03:13:19', '2022-12-29 03:13:19'),
(7, 'Whisky', 'ml', 1, '2022-12-29 03:14:00', '2022-12-29 03:14:00'),
(8, 'Bols Banana', 'ml', 1, '2022-12-29 03:14:06', '2022-12-29 03:14:06'),
(9, 'Vanilla syrup', 'ml', 1, '2022-12-29 03:14:11', '2022-12-29 03:14:11'),
(10, 'Banana Syrup', 'ml', 1, '2022-12-29 03:14:16', '2022-12-29 03:14:16'),
(11, 'Pineapple Juice', 'ml', 1, '2022-12-29 03:14:22', '2022-12-29 03:14:22'),
(12, 'Lime Juice', 'ml', 1, '2022-12-29 03:14:27', '2022-12-29 03:14:27'),
(13, 'Pineapple Fruit & Brown', 'pcs', 1, '2022-12-29 03:14:34', '2022-12-29 03:15:05');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_lists`
--

CREATE TABLE `ingredient_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  `menu_list_id` int(11) DEFAULT NULL,
  `ingredient_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `one_kg_price` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_kg` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gram_to_kg` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `one_kg_per_price` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 2, '2022-12-28 16:07:37', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-28 09:37:37', '2022-12-28 09:37:37'),
(2, 2, '2022-12-28 20:50:02', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-28 14:20:02', '2022-12-28 14:20:02'),
(3, 2, '2022-12-28 20:51:22', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-28 14:21:22', '2022-12-28 14:21:22'),
(4, 2, '2022-12-28 20:51:38', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-28 14:21:38', '2022-12-28 14:21:38'),
(5, 3, '2022-12-28 23:02:04', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-28 16:32:04', '2022-12-28 16:32:04'),
(6, 2, '2022-12-28 23:03:27', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-28 16:33:27', '2022-12-28 16:33:27'),
(7, 3, '2022-12-28 23:11:12', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-28 16:41:12', '2022-12-28 16:41:12'),
(8, 3, '2022-12-29 00:12:33', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-28 17:42:33', '2022-12-28 17:42:33'),
(9, 2, '2022-12-29 01:00:14', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-28 18:30:14', '2022-12-28 18:30:14'),
(10, 2, '2022-12-29 07:44:32', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-29 01:14:32', '2022-12-29 01:14:32'),
(11, 3, '2022-12-29 08:08:45', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-29 01:38:45', '2022-12-29 01:38:45');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `menu_name_mm` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_lists`
--

INSERT INTO `menu_lists` (`id`, `menu_name`, `price`, `categorie_id`, `created_at`, `updated_at`, `menu_name_mm`) VALUES
(1, 'Crazy Monkey', '5000', 1, '2022-12-28 09:39:19', '2022-12-28 09:39:19', 'Crazy Monkey'),
(2, 'Passionate Kiss', '5000', 1, '2022-12-28 09:39:37', '2022-12-28 09:39:37', 'Passionate Kiss'),
(3, 'Nga Sar', '5000', 1, '2022-12-28 09:40:00', '2022-12-28 09:40:00', 'Nga Sar'),
(4, 'Lar Khae Talt', '5000', 1, '2022-12-28 09:40:11', '2022-12-28 09:40:11', 'Lar Khae Talt'),
(5, 'Thading Post', '5000', 1, '2022-12-28 09:40:20', '2022-12-28 09:40:20', 'Thading Post'),
(6, 'Yolk Sheet', '4000', 1, '2022-12-28 09:40:30', '2022-12-28 09:40:30', 'Yolk Sheet'),
(7, 'Sponsor', '4000', 1, '2022-12-28 09:40:39', '2022-12-28 09:40:39', 'Sponsor'),
(8, 'The Heart Breaker', '4000', 2, '2022-12-28 09:43:10', '2022-12-28 09:43:10', 'The Heart Breaker'),
(9, 'Antidote', '5000', 2, '2022-12-28 09:43:20', '2022-12-28 09:43:20', 'Antidote'),
(10, 'Let\'s Get LVA', '5000', 2, '2022-12-28 09:43:30', '2022-12-28 09:43:30', 'Let\'s Get LVA'),
(11, 'Blue Rosy Romance', '5000', 2, '2022-12-28 09:43:39', '2022-12-28 09:43:39', 'Blue Rosy Romance'),
(12, 'Atomic Bomb', '5000', 2, '2022-12-28 09:43:48', '2022-12-28 09:43:48', 'Atomic Bomb'),
(13, 'LVA Rainbow Saphire', '5000', 2, '2022-12-28 09:43:58', '2022-12-28 09:43:58', 'LVA Rainbow Saphire'),
(14, 'Black Velvet', '5000', 3, '2022-12-28 09:44:16', '2022-12-28 09:44:16', 'Black Velvet'),
(15, 'Lagarita', '5000', 3, '2022-12-28 09:44:25', '2022-12-28 09:44:25', 'Lagarita'),
(16, 'Rye House Spring', '5000', 3, '2022-12-28 09:44:35', '2022-12-28 09:44:35', 'Rye House Spring'),
(17, 'Radler Melon', '5000', 3, '2022-12-28 09:44:45', '2022-12-28 09:44:45', 'Radler Melon'),
(18, 'Pussy Beer', '5000', 3, '2022-12-28 09:44:54', '2022-12-28 09:44:54', 'Pussy Beer'),
(19, 'Raise Of The Moon', '5000', 4, '2022-12-28 09:45:18', '2022-12-28 09:45:18', 'Raise Of The Moon'),
(20, 'Jack Rabbit', '5000', 4, '2022-12-28 09:45:28', '2022-12-28 09:45:28', 'Jack Rabbit'),
(21, 'Spaghetti Mafia', '5000', 4, '2022-12-28 09:45:37', '2022-12-28 09:45:37', 'Spaghetti Mafia'),
(22, 'Happier Melows', '5000', 4, '2022-12-28 09:45:46', '2022-12-28 09:45:46', 'Happier Melows'),
(23, 'Molecular Groni', '5000', 4, '2022-12-28 09:45:55', '2022-12-28 09:45:55', 'Molecular Groni'),
(24, 'Zero Gravity', '5000', 4, '2022-12-28 09:46:09', '2022-12-28 09:46:09', 'Zero Gravity'),
(25, 'Yin Yang(Lavitation)', '5000', 4, '2022-12-28 09:46:18', '2022-12-28 09:46:18', 'Yin Yang(Lavitation)'),
(26, 'Live In Luxury', '5000', 4, '2022-12-28 09:46:27', '2022-12-28 09:46:27', 'Live In Luxury'),
(27, 'Blue Moon', '5000', 4, '2022-12-28 09:46:36', '2022-12-28 09:46:36', 'Blue Moon'),
(28, 'L-G-B-T', '5000', 4, '2022-12-28 09:46:45', '2022-12-28 09:46:45', 'L-G-B-T'),
(29, 'Royal After Noon', '5000', 5, '2022-12-28 09:46:56', '2022-12-28 09:46:56', 'Royal After Noon'),
(30, 'Floral Lemonade', '5000', 5, '2022-12-28 09:47:05', '2022-12-28 09:47:05', 'Floral Lemonade'),
(31, 'Tornado Time', '5000', 5, '2022-12-28 09:47:16', '2022-12-28 09:47:16', 'Tornado Time'),
(32, 'Eastern Rocky Levitate', '5000', 5, '2022-12-28 09:47:25', '2022-12-28 09:47:25', 'Eastern Rocky Levitate'),
(33, 'Blossom Bottle', '5000', 5, '2022-12-28 09:47:33', '2022-12-28 09:47:33', 'Blossom Bottle'),
(34, 'Sleep With Me', '5000', 6, '2022-12-28 09:48:49', '2022-12-28 09:48:49', 'Sleep With Me'),
(35, 'Strong Energy', '5000', 6, '2022-12-28 09:49:00', '2022-12-28 09:49:00', 'Strong Energy'),
(36, 'Angle Flower', '5000', 6, '2022-12-28 09:49:10', '2022-12-28 09:49:10', 'Angle Flower'),
(37, 'Whisky King', '5000', 6, '2022-12-28 09:49:22', '2022-12-28 09:49:22', 'Whisky King'),
(38, 'L-V-A 5 Tube', '5000', 6, '2022-12-28 09:49:55', '2022-12-28 09:49:55', 'L-V-A 5 Tube'),
(39, 'Scorpion', '5000', 7, '2022-12-28 09:50:06', '2022-12-28 09:50:06', 'Scorpion'),
(40, 'Salty Dog', '5000', 7, '2022-12-28 09:50:16', '2022-12-28 09:50:16', 'Salty Dog'),
(41, 'PEGU Club', '5000', 7, '2022-12-28 09:50:25', '2022-12-28 09:50:25', 'PEGU Club'),
(42, 'Planter Punch', '5000', 7, '2022-12-28 09:50:35', '2022-12-28 09:50:35', 'Planter Punch'),
(43, 'Mudside', '5000', 7, '2022-12-28 09:50:45', '2022-12-28 09:50:45', 'Mudside'),
(44, 'Chicken Mushroom cream soup', '5000', 8, '2022-12-28 09:57:59', '2022-12-28 09:57:59', 'Chicken Mushroom cream soup'),
(45, 'Tom Zaab Soup', '5000', 8, '2022-12-28 09:58:09', '2022-12-28 09:58:09', 'Tom Zaab Soup'),
(46, 'tomato cream soup', '5000', 8, '2022-12-28 09:59:09', '2022-12-28 09:59:09', 'tomato cream soup'),
(47, 'Lobster Soup', '500', 8, '2022-12-28 09:59:20', '2022-12-28 09:59:20', 'Lobster Soup'),
(48, 'Deep Fry Chicken wing', '5000', 9, '2022-12-28 09:59:41', '2022-12-28 09:59:41', 'Deep Fry Chicken wing'),
(49, 'Chicken Satay/Pork Satay', '5000', 9, '2022-12-28 09:59:51', '2022-12-28 09:59:51', 'Chicken Satay/Pork Satay'),
(50, 'Grill Chicken Butt', '5000', 9, '2022-12-28 10:00:07', '2022-12-28 10:00:07', 'Grill Chicken Butt'),
(51, 'Chicken Basket with Chilli Mayo', '5000', 9, '2022-12-28 10:00:16', '2022-12-28 10:00:16', 'Chicken Basket with Chilli Mayo'),
(52, 'Deep Fried Fish', '5000', 9, '2022-12-28 10:00:25', '2022-12-28 10:00:25', 'Deep Fried Fish'),
(53, 'Corn Creakers with Hot and  Spicy Sauce', '5000', 9, '2022-12-28 10:00:39', '2022-12-28 10:00:39', 'Corn Creakers with Hot and  Spicy Sauce'),
(54, 'Shrimp Tempura with sweet chilli Sauce', '5000', 9, '2022-12-28 10:00:51', '2022-12-28 10:00:51', 'Shrimp Tempura with sweet chilli Sauce'),
(55, 'Fish Finger with chilli Mayo sauce', '5000', 9, '2022-12-28 10:01:01', '2022-12-28 10:01:01', 'Fish Finger with chilli Mayo sauce'),
(56, 'Fried Morning Glories', '5000', 9, '2022-12-28 10:01:10', '2022-12-28 10:01:10', 'Fried Morning Glories'),
(57, 'Crispy pork Belly with Tomyum Paste', '5000', 9, '2022-12-28 10:01:20', '2022-12-28 10:01:20', 'Crispy pork Belly with Tomyum Paste'),
(58, 'Sweet and Sour Pork Ball', '5000', 9, '2022-12-28 10:01:30', '2022-12-28 10:01:30', 'Sweet and Sour Pork Ball'),
(59, 'Deep Fried Meat Ball (Thai)', '5000', 9, '2022-12-28 10:01:40', '2022-12-28 10:01:40', 'Deep Fried Meat Ball (Thai)'),
(60, 'Fried Potaoes', '5000', 9, '2022-12-28 10:01:49', '2022-12-28 10:01:49', 'Fried Potaoes'),
(61, 'Hot & Spicy Crispy Eel', '5000', 9, '2022-12-28 10:02:00', '2022-12-28 10:02:00', 'Hot & Spicy Crispy Eel'),
(62, 'Crapes with Brandy sauce', '5000', 10, '2022-12-28 10:02:15', '2022-12-28 10:02:15', 'Crapes with Brandy sauce'),
(63, 'Cremebule with Ice Cream', '5000', 10, '2022-12-28 10:02:25', '2022-12-28 10:02:25', 'Cremebule with Ice Cream'),
(64, 'Deep Fried Ice Cream', '5000', 10, '2022-12-28 10:02:36', '2022-12-28 10:02:36', 'Deep Fried Ice Cream'),
(65, 'Green Curry Fried Rice', '5000', 11, '2022-12-28 10:02:49', '2022-12-28 10:02:49', 'Green Curry Fried Rice'),
(66, 'Fried Rice Shrimp Paste', '5000', 11, '2022-12-28 10:03:05', '2022-12-28 10:03:05', 'Fried Rice Shrimp Paste'),
(67, 'Fried rice prawn in baked pineapple', '5000', 11, '2022-12-28 10:03:14', '2022-12-28 10:03:14', 'Fried rice prawn in baked pineapple'),
(68, 'Strie Fried Glass Noodle', '5000', 12, '2022-12-28 10:03:24', '2022-12-28 10:03:24', 'Strie Fried Glass Noodle'),
(69, 'Tofu Stew', '5000', 13, '2022-12-28 10:03:36', '2022-12-28 10:03:36', 'Tofu Stew'),
(70, 'Fish Red Curry', '5000', 13, '2022-12-28 10:03:47', '2022-12-28 10:03:47', 'Fish Red Curry'),
(71, 'Fried soft-crab curry powder', '5000', 13, '2022-12-28 10:03:58', '2022-12-28 10:03:58', 'Fried soft-crab curry powder'),
(72, 'Pad Thai Prawn', '5000', 13, '2022-12-28 10:04:09', '2022-12-28 10:04:09', 'Pad Thai Prawn'),
(73, 'Massaman Chicken curry', '5000', 13, '2022-12-28 10:04:20', '2022-12-28 10:04:20', 'Massaman Chicken curry'),
(74, 'Chicken Shawama', '5000', 13, '2022-12-28 10:04:32', '2022-12-28 10:04:32', 'Chicken Shawama'),
(75, 'Mapo Tofu', '5000', 13, '2022-12-28 10:04:41', '2022-12-28 10:04:41', 'Mapo Tofu'),
(76, 'Panang Beef', '5000', 13, '2022-12-28 10:04:50', '2022-12-28 10:04:50', 'Panang Beef'),
(77, 'Chicken Mala', '5000', 13, '2022-12-28 10:05:01', '2022-12-28 10:05:01', 'Chicken Mala'),
(78, 'Steam Fish with lemon sauce', '5000', 13, '2022-12-28 10:05:10', '2022-12-28 10:05:10', 'Steam Fish with lemon sauce'),
(79, 'BBQ Pork Ribs', '5000', 14, '2022-12-28 10:06:57', '2022-12-28 10:06:57', 'BBQ Pork Ribs'),
(80, 'Scotch Egg', '5000', 14, '2022-12-28 10:07:06', '2022-12-28 10:07:06', 'Scotch Egg'),
(81, 'Fish & Chip', '5000', 14, '2022-12-28 10:07:16', '2022-12-28 10:07:16', 'Fish & Chip'),
(82, 'Beef Stake', '5000', 14, '2022-12-28 10:07:25', '2022-12-28 10:07:25', 'Beef Stake'),
(83, 'Mix Grilled', '5000', 14, '2022-12-28 10:07:47', '2022-12-28 10:07:47', 'Mix Grilled'),
(84, 'Pork Steak with mushroom cream', '5000', 14, '2022-12-28 10:07:56', '2022-12-28 10:07:56', 'Pork Steak with mushroom cream'),
(85, 'Big  Max Burger', '5000', 14, '2022-12-28 10:08:06', '2022-12-28 10:08:06', 'Big  Max Burger'),
(86, 'Surf & Turf', '5000', 14, '2022-12-28 10:08:15', '2022-12-28 10:08:15', 'Surf & Turf'),
(87, 'Chicken Parmagaina', '500', 14, '2022-12-28 10:08:53', '2022-12-28 10:08:53', 'Chicken Parmagaina'),
(88, 'Chicken Burger', '5000', 14, '2022-12-28 10:09:07', '2022-12-28 10:09:07', 'Chicken Burger'),
(89, 'Carbonara', '500', 14, '2022-12-28 10:09:16', '2022-12-28 10:09:16', 'Carbonara'),
(90, 'Banger and Mash', '5000', 14, '2022-12-28 10:09:27', '2022-12-28 10:09:27', 'Banger and Mash'),
(91, 'Pasta Fettuccine with seafood', '5000', 14, '2022-12-28 10:09:36', '2022-12-28 10:09:36', 'Pasta Fettuccine with seafood'),
(92, 'Hawaiian Pizza', '5000', 14, '2022-12-28 10:09:46', '2022-12-28 10:09:46', 'Hawaiian Pizza'),
(93, 'Pork Neck salad(Thai)', '500', 15, '2022-12-28 10:09:56', '2022-12-28 10:09:56', 'Pork Neck salad(Thai)'),
(94, 'Tea Leaves & Dry Mutton Salad', '5000', 15, '2022-12-28 10:10:06', '2022-12-28 10:10:06', 'Tea Leaves & Dry Mutton Salad'),
(95, 'Ceasar Salad', '5000', 15, '2022-12-28 10:10:15', '2022-12-28 10:10:15', 'Ceasar Salad'),
(96, 'Yum Talay ( Seafood salad)', '5000', 15, '2022-12-28 10:10:24', '2022-12-28 10:10:24', 'Yum Talay ( Seafood salad)'),
(97, 'Prawn cocktail', '5000', 15, '2022-12-28 10:10:34', '2022-12-28 10:10:34', 'Prawn cocktail'),
(98, 'Caprese Salad', '5000', 15, '2022-12-28 10:10:45', '2022-12-28 10:10:45', 'Caprese Salad'),
(99, 'Raw Prawn with garlic Lemon', '5000', 15, '2022-12-28 10:10:55', '2022-12-28 10:10:55', 'Raw Prawn with garlic Lemon'),
(100, 'Pork Intesting Salad (Thai)', '5000', 15, '2022-12-28 10:11:04', '2022-12-28 10:11:04', 'Pork Intesting Salad (Thai)');

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
(31, '2022_11_22_201215_add_guest_no_to_order_infos_table', 20),
(32, '2022_11_23_095030_create_bill_infos_table', 21),
(33, '2022_11_23_100855_add_change_amount_to_bill_infos_table', 22),
(34, '2022_11_23_104217_add_change_amount_to_order_infos_table', 23),
(35, '2022_11_24_121042_add_waiter_user_id_to_bill_infos_table', 24),
(36, '2022_11_24_122653_add_date_only_to_bill_infos_table', 25),
(37, '2022_12_18_205439_add_menu_name_mm_to_menu_lists_table', 26),
(38, '2022_12_21_233912_create_fixed_assets_table', 27),
(39, '2022_12_22_000720_create_stores_table', 28),
(40, '2022_12_22_003557_add_store_id_to_fixed_assets_table', 29),
(41, '2022_12_22_005138_create_variable_assets_table', 30),
(42, '2022_12_22_100229_create_taxrates_table', 31),
(43, '2022_12_22_111313_create_payment_methods_table', 32),
(44, '2022_12_22_111744_add_status_to_payment_methods_table', 33),
(45, '2022_12_22_115607_create_suppliers_table', 34),
(46, '2022_12_22_121024_add_remark_to_suppliers_table', 35),
(49, '2022_12_22_150958_create_temp_fixed_purchase_items_table', 36),
(50, '2022_12_22_205900_create_fixed_purchases_table', 37),
(51, '2022_12_22_210543_create_fixed_purchase_items_table', 38),
(52, '2022_12_22_211854_create_fixed_purchase_files_table', 39),
(53, '2022_12_22_212843_add_fixed_purchase_id_to_fixed_purchase_files_table', 40),
(54, '2022_12_22_213955_add_date_at_to_fixed_purchases_table', 41),
(55, '2022_12_23_115704_add_date_at_to_fixed_purchase_files_table', 42),
(56, '2022_12_27_081431_create_variable_purchases_table', 43),
(57, '2022_12_27_081830_create_variable_purchase_items_table', 43),
(58, '2022_12_27_081916_create_variable_purchase_files_table', 43),
(59, '2022_12_27_084239_add_status_to_temp_fixed_purchase_items_table', 44),
(60, '2022_12_27_102614_create_fixed_damages_table', 45),
(61, '2022_12_27_102957_create_fixed_damange_files_table', 45),
(62, '2022_12_27_104147_add_damage_date_to_fixed_damages_table', 46),
(63, '2022_12_27_121553_create_variable_damages_table', 47),
(64, '2022_12_27_121635_create_variable_damange_files_table', 47),
(65, '2022_12_29_003926_add_menu_name_to_order_items_table', 48),
(66, '2022_12_29_100706_create_ingredient_lists_table', 49),
(67, '2022_12_29_103319_add_gram_to_kg_to_ingredient_lists_table', 50),
(68, '2022_12_29_103714_add_one_kg_per_price_to_ingredient_lists_table', 51);

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
  `guest_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_amount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_infos`
--

INSERT INTO `order_infos` (`id`, `customer_id`, `table_list_id`, `order_no`, `inv_no`, `order_date_time`, `order_date`, `order_time`, `check_out_status`, `check_out_time`, `payment_type`, `total_amount`, `tax_amount`, `discount`, `service_charges`, `net_amount`, `received_amount`, `cashier_user_id`, `created_at`, `updated_at`, `waiter_user_id`, `guest_no`, `change_amount`) VALUES
(1, '0', '58', '000001', 'INV-29122022-0001', '2022-12-29 12:41:09 AM', '2022-12-29', '12:41:09 AM', NULL, NULL, NULL, '110000', NULL, NULL, NULL, NULL, NULL, '2', '2022-12-28 18:11:09', '2022-12-28 18:23:10', '2', '9', NULL),
(2, '0', '10', '000002', 'INV-29122022-0002', '2022-12-29 12:53:42 AM', '2022-12-29', '12:53:42 AM', NULL, NULL, NULL, '64000', NULL, NULL, NULL, NULL, NULL, '2', '2022-12-28 18:23:42', '2022-12-28 18:23:42', '2', '2', NULL),
(3, '0', '30', '000003', 'INV-29122022-0003', '2022-12-29 07:45:45 AM', '2022-12-29', '07:45:45 AM', NULL, NULL, NULL, '50000', NULL, NULL, NULL, NULL, NULL, '2', '2022-12-29 01:15:45', '2022-12-29 01:15:45', '2', '1', NULL),
(4, '0', '18', '000004', 'INV-29122022-0004', '2022-12-29 08:00:46 AM', '2022-12-29', '08:00:46 AM', NULL, NULL, NULL, '15000', NULL, NULL, NULL, NULL, NULL, '2', '2022-12-29 01:30:46', '2022-12-29 01:30:46', '2', '5', NULL),
(5, '0', '79', '000005', 'INV-29122022-0005', '2022-12-29 08:01:06 AM', '2022-12-29', '08:01:06 AM', NULL, NULL, NULL, '39000', NULL, NULL, NULL, NULL, NULL, '2', '2022-12-29 01:31:06', '2022-12-29 01:31:06', '2', '1', NULL),
(6, '0', '49', '000006', 'INV-29122022-0006', '2022-12-29 08:08:25 AM', '2022-12-29', '08:08:25 AM', NULL, NULL, NULL, '20000', NULL, NULL, NULL, NULL, NULL, '2', '2022-12-29 01:38:25', '2022-12-29 01:38:25', '2', '1', NULL);

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
  `manager_remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_info_id`, `menu_list_id`, `qty`, `price`, `remark`, `waiter_user_id`, `created_at`, `updated_at`, `preparation_status`, `preparation_date`, `preparation_user_id`, `difference_time`, `manager_remark`, `menu_name`) VALUES
(1, 1, 62, '1', '5000', NULL, '2', '2022-12-28 18:11:09', '2022-12-28 18:11:09', NULL, NULL, NULL, NULL, NULL, 'Crapes with Brandy sauce'),
(2, 1, 63, '1', '5000', NULL, '2', '2022-12-28 18:11:09', '2022-12-28 18:11:09', NULL, NULL, NULL, NULL, NULL, 'Cremebule with Ice Cream'),
(3, 1, 64, '1', '5000', NULL, '2', '2022-12-28 18:11:09', '2022-12-28 18:11:09', NULL, NULL, NULL, NULL, NULL, 'Deep Fried Ice Cream'),
(4, 1, 64, '2', '5000', NULL, '2', '2022-12-28 18:23:10', '2022-12-28 18:23:10', NULL, NULL, NULL, NULL, NULL, 'Deep Fried Ice Cream'),
(5, 1, 63, '3', '5000', NULL, '2', '2022-12-28 18:23:10', '2022-12-28 18:23:10', NULL, NULL, NULL, NULL, NULL, 'Cremebule with Ice Cream'),
(6, 1, 62, '12', '5000', NULL, '2', '2022-12-28 18:23:10', '2022-12-28 18:23:10', NULL, NULL, NULL, NULL, NULL, 'Crapes with Brandy sauce'),
(7, 1, 67, '1', '5000', NULL, '2', '2022-12-28 18:23:10', '2022-12-28 18:23:10', NULL, NULL, NULL, NULL, NULL, 'Fried rice prawn in baked pineapple'),
(8, 1, 66, '1', '5000', NULL, '2', '2022-12-28 18:23:10', '2022-12-28 18:23:10', NULL, NULL, NULL, NULL, NULL, 'Fried Rice Shrimp Paste'),
(9, 2, 2, '1', '5000', NULL, '2', '2022-12-28 18:23:42', '2022-12-28 18:23:42', NULL, NULL, NULL, NULL, NULL, 'Passionate Kiss'),
(10, 2, 3, '2', '5000', NULL, '2', '2022-12-28 18:23:42', '2022-12-28 18:23:42', NULL, NULL, NULL, NULL, NULL, 'Nga Sar'),
(11, 2, 4, '2', '5000', NULL, '2', '2022-12-28 18:23:42', '2022-12-28 18:23:42', NULL, NULL, NULL, NULL, NULL, 'Lar Khae Talt'),
(12, 2, 8, '1', '4000', NULL, '2', '2022-12-28 18:23:42', '2022-12-28 18:23:42', NULL, NULL, NULL, NULL, NULL, 'The Heart Breaker'),
(13, 2, 9, '1', '5000', NULL, '2', '2022-12-28 18:23:42', '2022-12-28 18:23:42', NULL, NULL, NULL, NULL, NULL, 'Antidote'),
(14, 2, 10, '1', '5000', NULL, '2', '2022-12-28 18:23:42', '2022-12-28 18:23:42', NULL, NULL, NULL, NULL, NULL, 'Let\'s Get LVA'),
(15, 2, 12, '1', '5000', NULL, '2', '2022-12-28 18:23:42', '2022-12-28 18:23:42', NULL, NULL, NULL, NULL, NULL, 'Atomic Bomb'),
(16, 2, 13, '1', '5000', NULL, '2', '2022-12-28 18:23:42', '2022-12-28 18:23:42', NULL, NULL, NULL, NULL, NULL, 'LVA Rainbow Saphire'),
(17, 2, 41, '2', '5000', NULL, '2', '2022-12-28 18:23:42', '2022-12-28 18:23:42', NULL, NULL, NULL, NULL, NULL, 'PEGU Club'),
(18, 2, 40, '1', '5000', NULL, '2', '2022-12-28 18:23:42', '2022-12-28 18:23:42', NULL, NULL, NULL, NULL, NULL, 'Salty Dog'),
(19, 3, 9, '1', '5000', NULL, '2', '2022-12-29 01:15:45', '2022-12-29 01:15:45', NULL, NULL, NULL, NULL, NULL, 'Antidote'),
(20, 3, 12, '1', '5000', NULL, '2', '2022-12-29 01:15:45', '2022-12-29 01:15:45', NULL, NULL, NULL, NULL, NULL, 'Atomic Bomb'),
(21, 3, 34, '4', '5000', NULL, '2', '2022-12-29 01:15:45', '2022-12-29 01:15:45', NULL, NULL, NULL, NULL, NULL, 'Sleep With Me'),
(22, 3, 35, '1', '5000', NULL, '2', '2022-12-29 01:15:45', '2022-12-29 01:15:45', NULL, NULL, NULL, NULL, NULL, 'Strong Energy'),
(23, 3, 36, '1', '5000', NULL, '2', '2022-12-29 01:15:45', '2022-12-29 01:15:45', NULL, NULL, NULL, NULL, NULL, 'Angle Flower'),
(24, 3, 66, '1', '5000', NULL, '2', '2022-12-29 01:15:45', '2022-12-29 01:15:45', NULL, NULL, NULL, NULL, NULL, 'Fried Rice Shrimp Paste'),
(25, 3, 67, '1', '5000', NULL, '2', '2022-12-29 01:15:45', '2022-12-29 01:15:45', NULL, NULL, NULL, NULL, NULL, 'Fried rice prawn in baked pineapple'),
(26, 4, 1, '1', '5000', NULL, '2', '2022-12-29 01:30:46', '2022-12-29 01:30:46', NULL, NULL, NULL, NULL, NULL, 'Crazy Monkey'),
(27, 4, 2, '1', '5000', NULL, '2', '2022-12-29 01:30:46', '2022-12-29 01:30:46', NULL, NULL, NULL, NULL, NULL, 'Passionate Kiss'),
(28, 4, 3, '1', '5000', NULL, '2', '2022-12-29 01:30:46', '2022-12-29 01:30:46', NULL, NULL, NULL, NULL, NULL, 'Nga Sar'),
(29, 5, 1, '1', '5000', NULL, '2', '2022-12-29 01:31:06', '2022-12-29 01:31:06', NULL, NULL, NULL, NULL, NULL, 'Crazy Monkey'),
(30, 5, 2, '1', '5000', NULL, '2', '2022-12-29 01:31:06', '2022-12-29 01:31:06', NULL, NULL, NULL, NULL, NULL, 'Passionate Kiss'),
(31, 5, 3, '1', '5000', NULL, '2', '2022-12-29 01:31:06', '2022-12-29 01:31:06', NULL, NULL, NULL, NULL, NULL, 'Nga Sar'),
(32, 5, 6, '1', '4000', NULL, '2', '2022-12-29 01:31:06', '2022-12-29 01:31:06', NULL, NULL, NULL, NULL, NULL, 'Yolk Sheet'),
(33, 5, 20, '1', '5000', NULL, '2', '2022-12-29 01:31:06', '2022-12-29 01:31:06', NULL, NULL, NULL, NULL, NULL, 'Jack Rabbit'),
(34, 5, 21, '1', '5000', NULL, '2', '2022-12-29 01:31:06', '2022-12-29 01:31:06', NULL, NULL, NULL, NULL, NULL, 'Spaghetti Mafia'),
(35, 5, 27, '1', '5000', NULL, '2', '2022-12-29 01:31:06', '2022-12-29 01:31:06', NULL, NULL, NULL, NULL, NULL, 'Blue Moon'),
(36, 5, 28, '1', '5000', NULL, '2', '2022-12-29 01:31:06', '2022-12-29 01:31:06', NULL, NULL, NULL, NULL, NULL, 'L-G-B-T'),
(37, 6, 20, '1', '5000', NULL, '2', '2022-12-29 01:38:25', '2022-12-29 01:38:25', NULL, NULL, NULL, NULL, NULL, 'Jack Rabbit'),
(38, 6, 21, '1', '5000', NULL, '2', '2022-12-29 01:38:25', '2022-12-29 01:38:25', NULL, NULL, NULL, NULL, NULL, 'Spaghetti Mafia'),
(39, 6, 22, '1', '5000', NULL, '2', '2022-12-29 01:38:25', '2022-12-29 01:38:25', NULL, NULL, NULL, NULL, NULL, 'Happier Melows'),
(40, 6, 23, '1', '5000', NULL, '2', '2022-12-29 01:38:25', '2022-12-29 01:38:25', NULL, NULL, NULL, NULL, NULL, 'Molecular Groni');

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
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `remark`, `user_id`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Cash Down', 'Cash Down', 1, '2022-12-22 04:53:26', '2022-12-22 04:54:47', 'Active'),
(2, 'KPay', 'KPay', 1, '2022-12-22 04:53:36', '2022-12-22 04:53:36', 'Active');

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
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `code_name`, `address`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Store 1', 'S1', 'Yangon', '1', '2022-12-21 17:49:37', '2022-12-21 17:49:37'),
(2, 'Store 2', 'S2', 'Yangon', '1', '2022-12-21 17:49:50', '2022-12-21 17:52:54');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `taxrates`
--

CREATE TABLE `taxrates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxrate` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxrates`
--

INSERT INTO `taxrates` (`id`, `name`, `taxrate`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '3%', '3', 'Active', 1, '2022-12-22 03:47:54', '2022-12-22 04:41:02'),
(2, '6%', '6', 'Active', 1, '2022-12-22 03:48:16', '2022-12-22 03:48:16');

-- --------------------------------------------------------

--
-- Table structure for table `temp_fixed_purchase_items`
--

CREATE TABLE `temp_fixed_purchase_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `temp_id` int(11) DEFAULT NULL,
  `temp_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$H4Dl/7aFMsm1xck7mqa.PehZTR5oWppsGZ09pO7VHsE7euBe.sCQi', '00001', '09123123122', '1/agc(N)991223', 'male', 'YGN', '1', 1, '2022-12-29 09:38:17', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Probation', NULL, '2022-11-14 01:38:14', '2022-12-29 03:08:17', NULL),
(2, 'Waiter1', 'waiter@gmail.com', NULL, '$2y$10$YlWrTGwZXqnf1/D4ifbXu.xDm5kdkbG4uNrbfqll.RIb3xHWUwKzG', '00002', '0912312313', '1/abc(n)009221', 'male', 'YGN', '4', 1, '29/12/2022 07:44:32 am', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Probation', 'xqsIPz4OntqClSMIfSOLlHzupJodZBaoIU3hgzsg0YGE0yvGw1yWVf4QRPQL', '2022-11-14 02:14:39', '2022-12-29 01:14:32', 123456),
(3, 'Cashier1', 'cashier@gmail.com', NULL, '$2y$10$KL/3ZNF1BfbUI4ElchzP9uWxwfagZcAxiq9ISNMas439.IvR8ewrK', '00003', '09123123123', '1/abc(N)009221', 'male', 'YGN', '5', 1, '29/12/2022 08:08:45 am', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Probation', NULL, '2022-11-14 03:17:19', '2022-12-29 01:38:45', 123457);

-- --------------------------------------------------------

--
-- Table structure for table `variable_assets`
--

CREATE TABLE `variable_assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `inventory_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variable_damages`
--

CREATE TABLE `variable_damages` (
  `id` int(10) UNSIGNED NOT NULL,
  `variable_asset_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `damage_qty` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causes_of_accidents` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compensation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucher_attach` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_at` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `damage_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variable_damange_files`
--

CREATE TABLE `variable_damange_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variable_damage_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_at` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variable_purchases`
--

CREATE TABLE `variable_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `representative_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_at` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variable_purchase_files`
--

CREATE TABLE `variable_purchase_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_at` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variable_purchase_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variable_purchase_items`
--

CREATE TABLE `variable_purchase_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `variable_purchase_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_asset_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_infos`
--
ALTER TABLE `bill_infos`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `fixed_assets`
--
ALTER TABLE `fixed_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fixed_damages`
--
ALTER TABLE `fixed_damages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fixed_damange_files`
--
ALTER TABLE `fixed_damange_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fixed_purchases`
--
ALTER TABLE `fixed_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fixed_purchase_files`
--
ALTER TABLE `fixed_purchase_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fixed_purchase_items`
--
ALTER TABLE `fixed_purchase_items`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `ingredient_lists`
--
ALTER TABLE `ingredient_lists`
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
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_lists`
--
ALTER TABLE `table_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxrates`
--
ALTER TABLE `taxrates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_fixed_purchase_items`
--
ALTER TABLE `temp_fixed_purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `variable_assets`
--
ALTER TABLE `variable_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variable_damages`
--
ALTER TABLE `variable_damages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variable_damange_files`
--
ALTER TABLE `variable_damange_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variable_purchases`
--
ALTER TABLE `variable_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variable_purchase_files`
--
ALTER TABLE `variable_purchase_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variable_purchase_items`
--
ALTER TABLE `variable_purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_infos`
--
ALTER TABLE `bill_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_temps`
--
ALTER TABLE `cart_temps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `fixed_assets`
--
ALTER TABLE `fixed_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fixed_damages`
--
ALTER TABLE `fixed_damages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fixed_damange_files`
--
ALTER TABLE `fixed_damange_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fixed_purchases`
--
ALTER TABLE `fixed_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fixed_purchase_files`
--
ALTER TABLE `fixed_purchase_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fixed_purchase_items`
--
ALTER TABLE `fixed_purchase_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floors`
--
ALTER TABLE `floors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ingredient_lists`
--
ALTER TABLE `ingredient_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `members_lists`
--
ALTER TABLE `members_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_lists`
--
ALTER TABLE `menu_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `order_infos`
--
ALTER TABLE `order_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_lists`
--
ALTER TABLE `table_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `taxrates`
--
ALTER TABLE `taxrates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `temp_fixed_purchase_items`
--
ALTER TABLE `temp_fixed_purchase_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `variable_assets`
--
ALTER TABLE `variable_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variable_damages`
--
ALTER TABLE `variable_damages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variable_damange_files`
--
ALTER TABLE `variable_damange_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variable_purchases`
--
ALTER TABLE `variable_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variable_purchase_files`
--
ALTER TABLE `variable_purchase_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variable_purchase_items`
--
ALTER TABLE `variable_purchase_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
