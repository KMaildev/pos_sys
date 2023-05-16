-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2023 at 06:26 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_sys_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_infos`
--

CREATE TABLE `bill_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_info_id` text DEFAULT NULL,
  `customer_id` text DEFAULT NULL,
  `table_list_id` text DEFAULT NULL,
  `bill_date_time` text DEFAULT NULL,
  `bill_time` text DEFAULT NULL,
  `payment_type` text DEFAULT NULL,
  `total_amount` text DEFAULT NULL,
  `tax_amount` text DEFAULT NULL,
  `discount` text DEFAULT NULL,
  `service_charges` text DEFAULT NULL,
  `net_amount` text DEFAULT NULL,
  `received_amount` text DEFAULT NULL,
  `cashier_user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `change_amount` text DEFAULT NULL,
  `waiter_user_id` int(11) DEFAULT NULL,
  `date_only` text DEFAULT NULL,
  `order_no` text DEFAULT NULL,
  `inv_no` text DEFAULT NULL,
  `first_table_id` text DEFAULT NULL,
  `discount_amount` text DEFAULT NULL,
  `refund_amount` text DEFAULT NULL,
  `service_charge_amount` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill_infos`
--

INSERT INTO `bill_infos` (`id`, `order_info_id`, `customer_id`, `table_list_id`, `bill_date_time`, `bill_time`, `payment_type`, `total_amount`, `tax_amount`, `discount`, `service_charges`, `net_amount`, `received_amount`, `cashier_user_id`, `created_at`, `updated_at`, `change_amount`, `waiter_user_id`, `date_only`, `order_no`, `inv_no`, `first_table_id`, `discount_amount`, `refund_amount`, `service_charge_amount`) VALUES
(1, '1', '0', '1', '2023-05-13 04:03:09 PM', '04:03:09 PM', '0', '43500', '3', '5', '0', '42630', '0', '3', '2023-05-13 09:03:09', '2023-05-13 09:03:09', '0', 2, '2023-05-13', '000001', 'INV-13052023-0001', NULL, '0', '42630', '0'),
(2, '2', '0', '2', '2023-05-13 04:15:34 PM', '04:15:34 PM', '0', '40500', '0', '0', '0', '40500', '0', '3', '2023-05-13 09:15:34', '2023-05-13 09:15:34', '0', 2, '2023-05-13', '000003', 'INV-13052023-0003', NULL, '0', '40500', '0'),
(3, '3', '0', '1', '2023-05-16 08:34:01 AM', '08:34:01 AM', '1', '90000', '0', '0', '5', '94500', '0', '3', '2023-05-16 01:34:01', '2023-05-16 01:34:01', '0', 2, '2023-05-16', '000003', 'INV-16052023-0003', NULL, '0', '94500', '0'),
(4, '4', '0', '1', '2023-05-16 09:55:15 AM', '09:55:15 AM', '2', '18500', '5', '0', '0', '19425', '0', '3', '2023-05-16 02:55:15', '2023-05-16 02:55:15', '0', 3, '2023-05-16', '000004', 'INV-16052023-0004', NULL, '0', '19425', '0');

-- --------------------------------------------------------

--
-- Table structure for table `cart_temps`
--

CREATE TABLE `cart_temps` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_list_id` int(11) DEFAULT NULL,
  `qty` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `session_id` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `background_color` text DEFAULT NULL,
  `photo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `type`, `created_at`, `updated_at`, `background_color`, `photo`) VALUES
(1, 'Signature Cocktails', 'Beverage', '2022-12-28 09:37:14', '2023-05-16 03:36:11', '#e68619', '1.png'),
(2, 'Group Cocktails', 'Bar', '2022-12-28 09:37:25', '2023-05-16 01:33:23', '#eacb06', '2.png'),
(3, 'Beer Cocktails', 'Bar', '2022-12-28 09:38:31', '2023-05-16 01:34:23', '#c7c10f', '3.png'),
(4, 'Classic Cocktails', 'Bar', '2022-12-28 09:38:41', '2023-05-16 01:34:52', '#8ec7ff', '4.png'),
(5, 'Healthy Juice', 'Beverage', '2022-12-28 09:38:51', '2023-05-16 01:35:45', '#3bae0a', 'viber_image_2023-02-03_14-04-14-796.png'),
(8, 'Soup', 'Food', '2022-12-28 09:55:27', '2023-02-08 04:45:59', '#b7ffb7', '6.png'),
(9, 'Peachy Patato', 'Food', '2022-12-28 09:55:47', '2023-05-16 01:55:10', '#00f5f5', '7.png'),
(10, 'Pop\"Pah\"', 'Food', '2022-12-28 09:56:01', '2023-05-16 01:57:08', '#dd9873', '8.png'),
(11, 'Asian', 'Food', '2022-12-28 09:56:30', '2023-02-08 04:46:51', '#ffc78e', '9.png'),
(12, 'Rice & Noodlee', 'Food', '2022-12-28 09:56:54', '2023-02-08 04:47:07', '#d0a2ff', '10.png'),
(13, 'Vegetable', 'Food', '2022-12-28 09:57:12', '2023-05-16 01:58:37', '#42d93f', '11.png'),
(14, 'With Extra', 'Food', '2022-12-28 10:06:24', '2023-05-16 01:59:02', '#0e7723', '12.png'),
(15, 'Salad', 'Food', '2022-12-28 10:06:37', '2023-02-08 04:48:07', '#ffbbff', '13.png'),
(18, 'Soft Drinks', 'Beverage', '2023-05-16 01:11:37', '2023-05-16 01:36:16', '#c9b6b6', 'wine4.webp'),
(19, 'Draught Beer', 'Bar', '2023-05-16 01:37:06', '2023-05-16 01:37:06', '#0781df', ''),
(20, 'Beer Bottles', 'Bar', '2023-05-16 01:42:50', '2023-05-16 01:42:50', '#3762c8', ''),
(21, 'Shisha (Single)', 'Bar', '2023-05-16 01:43:35', '2023-05-16 01:44:32', '#ccc7c7', ''),
(22, 'Shisha (Mixed)', 'Bar', '2023-05-16 01:44:58', '2023-05-16 01:44:58', '#655d5d', ''),
(23, 'Wine', 'Beverage', '2023-05-16 01:54:03', '2023-05-16 01:54:03', '#aa0909', '');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `primary_number` text DEFAULT NULL,
  `additional_number` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `date_of_birth` text DEFAULT NULL,
  `join_date` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_id`, `name`, `primary_number`, `additional_number`, `email`, `address`, `date_of_birth`, `join_date`, `remark`, `gender`, `created_at`, `updated_at`) VALUES
(1, '230001', 'Mg Mg', '09444151443', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-24 04:23:34', '2023-04-24 04:23:34'),
(2, '230002', 'Aung Aung', '09888987665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-24 05:19:22', '2023-04-24 05:19:22'),
(3, '230003', 'Soe Soe', '0988272665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-24 05:19:30', '2023-04-24 05:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `damages`
--

CREATE TABLE `damages` (
  `id` int(10) UNSIGNED NOT NULL,
  `ingredient_id` text DEFAULT NULL,
  `damage_date` text DEFAULT NULL,
  `damage_unit` text DEFAULT NULL,
  `cause_of_damage` text DEFAULT NULL,
  `store_id` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `damage_files`
--

CREATE TABLE `damage_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `damage_id` text DEFAULT NULL,
  `files` text DEFAULT NULL,
  `original_name` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
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
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `rate` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `name`, `rate`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '0%', '0', 'Active', 1, '2023-02-12 10:40:53', '2023-02-12 10:45:21'),
(2, '3%', '3', 'Active', 1, '2023-02-12 10:42:02', '2023-02-12 10:42:02'),
(3, '5%', '5', 'Active', 1, '2023-02-12 10:42:07', '2023-02-12 10:42:07'),
(4, '7%', '7', 'Active', 1, '2023-02-12 10:42:18', '2023-02-12 10:42:18'),
(5, '10%', '10', 'Active', 1, '2023-02-12 10:42:25', '2023-02-12 10:42:25'),
(6, 'AMP', '100', 'Active', 1, '2023-05-08 17:18:15', '2023-05-08 17:18:15');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_assets`
--

CREATE TABLE `fixed_assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `inventory_code` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `unit` text DEFAULT NULL,
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
  `fixed_asset_id` text DEFAULT NULL,
  `damage_qty` text DEFAULT NULL,
  `causes_of_accidents` text DEFAULT NULL,
  `compensation` text DEFAULT NULL,
  `voucher_attach` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `date_at` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `damage_date` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_damange_files`
--

CREATE TABLE `fixed_damange_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `attachments` text DEFAULT NULL,
  `original_name` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `fixed_damage_id` text DEFAULT NULL,
  `date_at` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_purchases`
--

CREATE TABLE `fixed_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_id` text DEFAULT NULL,
  `invoice_no` text DEFAULT NULL,
  `purchase_date` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `total_amount` text DEFAULT NULL,
  `representative_id` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date_at` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_purchase_files`
--

CREATE TABLE `fixed_purchase_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `attachments` text DEFAULT NULL,
  `original_name` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fixed_purchase_id` int(11) DEFAULT NULL,
  `date_at` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_purchase_items`
--

CREATE TABLE `fixed_purchase_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `fixed_purchase_id` text DEFAULT NULL,
  `fixed_asset_id` text DEFAULT NULL,
  `qty` text DEFAULT NULL,
  `cost` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `floors`
--

CREATE TABLE `floors` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `floors`
--

INSERT INTO `floors` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Ground Floor', '2022-11-14 10:05:23', '2022-11-14 10:07:07'),
(2, 'First Floor', '2022-11-14 10:05:41', '2022-11-14 10:05:41');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `unit` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_code` text DEFAULT NULL,
  `category` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `unit`, `user_id`, `created_at`, `updated_at`, `item_code`, `category`) VALUES
(1, 'Fresh Watermelon', 'Pcs', 1, '2022-12-29 03:12:20', '2022-12-29 03:12:20', NULL, NULL),
(2, 'Absolute Raspberry', 'Ml', 1, '2022-12-29 03:12:30', '2022-12-29 03:12:30', NULL, NULL),
(3, 'Passion Fruit Puree', 'Ml', 1, '2022-12-29 03:12:42', '2022-12-29 03:12:42', NULL, NULL),
(4, 'Cheesecake', 'Ml', 1, '2022-12-29 03:12:56', '2022-12-29 03:12:56', NULL, NULL),
(5, 'Lemon Juice', 'Ml', 1, '2022-12-29 03:13:07', '2022-12-29 03:13:07', NULL, NULL),
(6, 'Passion Juice', 'MI', 1, '2022-12-29 03:13:19', '2022-12-29 03:13:19', NULL, NULL),
(7, 'Whisky', 'ml', 1, '2022-12-29 03:14:00', '2022-12-29 03:14:00', NULL, NULL),
(8, 'Bols Banana', 'ml', 1, '2022-12-29 03:14:06', '2022-12-29 03:14:06', NULL, NULL),
(9, 'Vanilla syrup', 'ml', 1, '2022-12-29 03:14:11', '2022-12-29 03:14:11', NULL, NULL),
(10, 'Banana Syrup', 'ml', 1, '2022-12-29 03:14:16', '2022-12-29 03:14:16', NULL, NULL),
(11, 'Pineapple Juice', 'ml', 1, '2022-12-29 03:14:22', '2022-12-29 03:14:22', NULL, NULL),
(12, 'Lime Juice', 'ml', 1, '2022-12-29 03:14:27', '2022-12-29 03:14:27', NULL, NULL),
(13, 'Pineapple Fruit & Brown', 'pcs', 1, '2022-12-29 03:14:34', '2022-12-29 03:15:05', NULL, NULL),
(14, 'Orange Juice', 'ml', 1, '2023-02-07 07:33:37', '2023-02-07 07:33:37', 'I001', 'Juice'),
(15, 'Ram', 'ml', 1, '2023-02-07 07:35:18', '2023-02-07 07:35:18', 'I002', 'Beverage');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_lists`
--

CREATE TABLE `ingredient_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  `menu_list_id` int(11) DEFAULT NULL,
  `ingredient_name` text DEFAULT NULL,
  `qty` text DEFAULT NULL,
  `one_kg_price` text DEFAULT NULL,
  `price_kg` text DEFAULT NULL,
  `total_amount` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gram_to_kg` text DEFAULT NULL,
  `unit` text DEFAULT NULL,
  `one_kg_per_price` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `login_time` text DEFAULT NULL,
  `login_ip` text DEFAULT NULL,
  `device` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`id`, `user_id`, `login_time`, `login_ip`, `device`, `created_at`, `updated_at`) VALUES
(1, 2, '2023-04-24 10:52:33', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-04-24 04:22:33', '2023-04-24 04:22:33'),
(2, 1, '2023-04-24 10:53:04', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-04-24 04:23:04', '2023-04-24 04:23:04'),
(3, 1, '2023-04-24 23:15:40', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-04-24 16:45:40', '2023-04-24 16:45:40'),
(4, 1, '2023-04-24 23:33:22', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-04-24 17:03:22', '2023-04-24 17:03:22'),
(5, 1, '2023-05-06 10:55:22', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-06 04:25:22', '2023-05-06 04:25:22'),
(6, 1, '2023-05-07 09:25:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-07 02:55:40', '2023-05-07 02:55:40'),
(7, 1, '2023-05-08 00:04:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-07 17:34:49', '2023-05-07 17:34:49'),
(8, 1, '2023-05-08 01:29:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-07 18:59:46', '2023-05-07 18:59:46'),
(9, 1, '2023-05-08 02:08:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-07 19:38:49', '2023-05-07 19:38:49'),
(10, 1, '2023-05-08 09:48:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-08 03:18:11', '2023-05-08 03:18:11'),
(11, 1, '2023-05-08 09:51:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-08 03:21:24', '2023-05-08 03:21:24'),
(12, 1, '2023-05-08 23:43:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-08 17:13:42', '2023-05-08 17:13:42'),
(13, 1, '2023-05-09 01:03:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-08 18:33:35', '2023-05-08 18:33:35'),
(14, 5, '2023-05-09 01:22:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-08 18:52:25', '2023-05-08 18:52:25'),
(15, 1, '2023-05-09 08:21:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-09 01:51:53', '2023-05-09 01:51:53'),
(16, 5, '2023-05-09 08:25:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-09 01:55:11', '2023-05-09 01:55:11'),
(17, 1, '2023-05-09 14:55:34', '104.28.251.153', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-09 07:55:34', '2023-05-09 07:55:34'),
(18, 2, '2023-05-09 15:26:29', '202.165.84.155', 'Mozilla/5.0 (Linux; Android 11; V2102) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Mobile Safari/537.36', '2023-05-09 08:26:29', '2023-05-09 08:26:29'),
(19, 3, '2023-05-09 15:27:34', '202.165.84.155', 'Mozilla/5.0 (Linux; U; Android 10; en-gb; Redmi Note 8 Pro Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/100.0.4896.127 Mobile Safari/537.36 XiaoMi/MiuiBrowser/13.28.0-gn', '2023-05-09 08:27:34', '2023-05-09 08:27:34'),
(20, 3, '2023-05-09 15:29:23', '202.165.84.155', 'Mozilla/5.0 (Linux; U; Android 10; en-gb; Redmi Note 8 Pro Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/100.0.4896.127 Mobile Safari/537.36 XiaoMi/MiuiBrowser/13.28.0-gn', '2023-05-09 08:29:23', '2023-05-09 08:29:23'),
(21, 1, '2023-05-10 00:54:12', '45.125.5.227', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-09 17:54:12', '2023-05-09 17:54:12'),
(22, 1, '2023-05-11 20:46:09', '45.125.5.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-11 13:46:09', '2023-05-11 13:46:09'),
(23, 1, '2023-05-12 09:27:51', '69.160.25.129', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-12 02:27:51', '2023-05-12 02:27:51'),
(24, 1, '2023-05-12 14:33:42', '45.125.5.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-12 07:33:42', '2023-05-12 07:33:42'),
(25, 1, '2023-05-13 12:34:37', '45.125.4.195', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-13 05:34:37', '2023-05-13 05:34:37'),
(26, 2, '2023-05-13 15:57:40', '204.157.172.68', 'Mozilla/5.0 (iPad; CPU OS 16_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/113.0.5672.69 Mobile/15E148 Safari/604.1', '2023-05-13 08:57:40', '2023-05-13 08:57:40'),
(27, 3, '2023-05-13 16:00:10', '204.157.172.68', 'Mozilla/5.0 (iPad; CPU OS 16_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/113.0.5672.69 Mobile/15E148 Safari/604.1', '2023-05-13 09:00:10', '2023-05-13 09:00:10'),
(28, 2, '2023-05-13 16:01:24', '204.157.172.68', 'Mozilla/5.0 (iPad; CPU OS 16_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/113.0.5672.69 Mobile/15E148 Safari/604.1', '2023-05-13 09:01:24', '2023-05-13 09:01:24'),
(29, 3, '2023-05-13 16:01:38', '204.157.172.68', 'Mozilla/5.0 (iPad; CPU OS 16_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/113.0.5672.69 Mobile/15E148 Safari/604.1', '2023-05-13 09:01:38', '2023-05-13 09:01:38'),
(30, 2, '2023-05-13 16:04:48', '204.157.172.68', 'Mozilla/5.0 (iPad; CPU OS 16_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/113.0.5672.69 Mobile/15E148 Safari/604.1', '2023-05-13 09:04:48', '2023-05-13 09:04:48'),
(31, 3, '2023-05-13 16:10:26', '204.157.172.68', 'Mozilla/5.0 (iPad; CPU OS 16_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/113.0.5672.69 Mobile/15E148 Safari/604.1', '2023-05-13 09:10:26', '2023-05-13 09:10:26'),
(32, 1, '2023-05-13 21:12:53', '45.125.5.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-13 14:12:53', '2023-05-13 14:12:53'),
(33, 1, '2023-05-14 17:05:21', '45.125.4.52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-14 10:05:21', '2023-05-14 10:05:21'),
(34, 2, '2023-05-15 17:18:51', '202.165.84.155', 'Mozilla/5.0 (iPad; CPU OS 16_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/113.0.5672.69 Mobile/15E148 Safari/604.1', '2023-05-15 10:18:51', '2023-05-15 10:18:51'),
(35, 3, '2023-05-15 17:19:05', '202.165.84.155', 'Mozilla/5.0 (iPad; CPU OS 16_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/113.0.5672.69 Mobile/15E148 Safari/604.1', '2023-05-15 10:19:05', '2023-05-15 10:19:05'),
(36, 2, '2023-05-16 07:54:53', '45.125.5.90', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-16 00:54:53', '2023-05-16 00:54:53'),
(37, 2, '2023-05-16 08:16:05', '202.165.84.155', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-16 01:16:05', '2023-05-16 01:16:05'),
(38, 2, '2023-05-16 08:18:37', '45.125.5.90', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-16 01:18:37', '2023-05-16 01:18:37'),
(39, 2, '2023-05-16 08:29:50', '45.125.5.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-16 01:29:50', '2023-05-16 01:29:50'),
(40, 3, '2023-05-16 08:33:24', '45.125.5.90', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-16 01:33:24', '2023-05-16 01:33:24'),
(41, 2, '2023-05-16 08:34:59', '45.125.5.90', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-16 01:34:59', '2023-05-16 01:34:59'),
(42, 2, '2023-05-16 09:01:16', '45.125.5.90', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-16 02:01:16', '2023-05-16 02:01:16'),
(43, 2, '2023-05-16 09:04:16', '202.165.84.155', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '2023-05-16 02:04:16', '2023-05-16 02:04:16'),
(44, 3, '2023-05-16 09:50:18', '204.157.172.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-16 02:50:18', '2023-05-16 02:50:18');

-- --------------------------------------------------------

--
-- Table structure for table `members_lists`
--

CREATE TABLE `members_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `members_list_file` text DEFAULT NULL,
  `original_name` text DEFAULT NULL,
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
  `menu_name` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `menu_name_mm` text DEFAULT NULL,
  `mm_short_menu` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `printer_name` text DEFAULT NULL,
  `ip_address` text DEFAULT NULL,
  `print_config_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_lists`
--

INSERT INTO `menu_lists` (`id`, `menu_name`, `price`, `categorie_id`, `created_at`, `updated_at`, `menu_name_mm`, `mm_short_menu`, `photo`, `type`, `printer_name`, `ip_address`, `print_config_id`) VALUES
(9, 'Crushing on you', '9800', 1, '2022-12-28 09:43:20', '2023-05-16 03:07:14', NULL, '', NULL, 'Bar', 'EPSONTM-T81III', '192.168.100.8', 2),
(10, 'Love Shackles', '13000', 1, '2022-12-28 09:43:30', '2023-05-16 03:06:44', NULL, '', NULL, 'Bar', 'EPSONTM-T81III', '192.168.100.8', 2),
(11, 'Bermuda Triangle', '15000', 1, '2022-12-28 09:43:39', '2023-05-16 03:08:36', NULL, '', NULL, 'Bar', 'EPSONTM-T81III', '192.168.100.8', 2),
(12, '4-Ex', '15000', 2, '2022-12-28 09:43:48', '2023-05-16 03:09:29', NULL, '', NULL, 'Bar', 'EPSONTM-T81III', '192.168.100.8', 2),
(13, 'LVA Rainbow Saphire', '15000', 2, '2022-12-28 09:43:58', '2023-01-17 08:16:02', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(14, 'Black Velvet', '8000', 3, '2022-12-28 09:44:16', '2023-01-17 08:17:57', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(17, 'Radler Melon', '8000', 3, '2022-12-28 09:44:45', '2023-01-17 08:18:08', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(18, 'Pussy Beer', '8000', 3, '2022-12-28 09:44:54', '2023-01-17 08:18:18', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(19, 'Raise Of The Moon', '10800', 4, '2022-12-28 09:45:18', '2023-01-17 08:32:34', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(20, 'Jack Rabbit', '10800', 4, '2022-12-28 09:45:28', '2023-01-17 08:32:51', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(21, 'Spaghetti Mafia', '10800', 4, '2022-12-28 09:45:37', '2023-01-17 08:22:34', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(22, 'Happier Melows', '10800', 4, '2022-12-28 09:45:46', '2023-01-17 09:01:18', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(26, 'Live In Luxury', '10800', 4, '2022-12-28 09:46:27', '2023-01-17 09:01:30', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(28, 'L-G-B-T', '10800', 4, '2022-12-28 09:46:45', '2023-01-17 09:01:49', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(29, 'Royal After Noon', '13000', 5, '2022-12-28 09:46:56', '2023-01-17 09:06:12', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(30, 'The Prince Consort', '13000', 5, '2022-12-28 09:47:05', '2023-01-17 09:06:53', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(32, 'Eastern Rocky Levitate', '13000', 5, '2022-12-28 09:47:25', '2023-01-17 09:07:14', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(33, 'Blossom Bottle', '130000', 5, '2022-12-28 09:47:33', '2023-01-17 09:07:32', NULL, NULL, NULL, 'Beverage', NULL, NULL, NULL),
(44, 'Chicken Mushroom cream soup', '6500', 8, '2022-12-28 09:57:59', '2023-02-09 13:14:15', 'ဥရောပစတိုင်ကြက်သားနှင့်မှိုဟင်းရည်', 'ဥရပစတငကကသနငမဟငရည', NULL, 'Food', NULL, NULL, NULL),
(45, 'Tom Zaab Soup', '9500', 8, '2022-12-28 09:58:09', '2023-02-09 13:14:21', 'ထိုင်းစတိုင်ဝက်နံရိုးနုချဉ်စပ်ဟင်းရည်', 'ထငစတငဝကနရနခဉစပဟငရည', NULL, 'Food', NULL, NULL, NULL),
(46, 'Pea & Ham soup', '7500', 8, '2022-12-28 09:59:09', '2023-01-17 04:40:45', 'ဥရောပစတိုင် ပဲနှင့်ဝက်ပေါင်ခြောက်ဟင်းရည်', NULL, NULL, 'Food', NULL, NULL, NULL),
(47, 'Lobster Soup', '7500', 8, '2022-12-28 09:59:20', '2023-02-09 13:14:35', 'ဥရောပစတိုင်ဝက်နံရိုးနုချဉ်စပ်ဟင်းရည်', 'ဥရပစတငဝကနရနခဉစပဟငရည', NULL, 'Food', NULL, NULL, NULL),
(48, 'Deep Fry Chicken wing', '7500', 9, '2022-12-28 09:59:41', '2023-01-17 04:44:48', 'ကြက်တောင်ပံအကြွပ်ကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(49, 'Chicken Satay/Pork Satay', '6500', 9, '2022-12-28 09:59:51', '2023-01-17 04:47:18', 'ကြက်ဝက်ဆာတေး', NULL, NULL, 'Food', NULL, NULL, NULL),
(50, 'Grill Chicken Butt', '6500', 9, '2022-12-28 10:00:07', '2023-01-17 04:47:56', 'ကြက်ဆီဘူးကင်', NULL, NULL, 'Food', NULL, NULL, NULL),
(52, 'Deep Fried Eel', '8500', 9, '2022-12-28 10:00:25', '2023-01-17 04:49:46', 'ငါးရှည့်ခြောက်စပ်', NULL, NULL, 'Food', NULL, NULL, NULL),
(53, 'Corn Creakers with Hot and  Spicy Sauce', '5000', 9, '2022-12-28 10:00:39', '2023-01-17 04:50:35', 'ပြောင်းဖူးကြော်နှင့် မန်ကျည်းသီးဆော့စ်', NULL, NULL, 'Food', NULL, NULL, NULL),
(62, 'Crapes with Brandy sauce', '7000', 10, '2022-12-28 10:02:15', '2023-01-17 05:13:29', 'ဘရန်ဒီခေါက်မုန့်', NULL, NULL, 'Food', NULL, NULL, NULL),
(63, 'Cream brulee', '8500', 10, '2022-12-28 10:02:25', '2023-01-17 05:15:06', 'ပူတင်း', NULL, NULL, 'Food', NULL, NULL, NULL),
(64, 'Deep Fried Ice Cream', '6500', 10, '2022-12-28 10:02:36', '2023-01-17 05:07:38', 'ရေခဲမုန့်ကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(101, 'Tom Yum Soup', '9500', 8, '2023-01-17 04:41:45', '2023-01-17 04:41:45', 'တုံယမ်းဟင်းရည်', NULL, NULL, 'Food', NULL, NULL, NULL),
(102, 'Scotch Egg', '8500', 9, '2023-01-17 04:57:12', '2023-01-17 04:57:12', 'စကောတလန် စတိုင်အသားလုံးကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(103, 'Deep fried loach with sauces', '6500', 9, '2023-01-17 04:58:02', '2023-01-17 04:58:02', 'ငါးသလဲထိုး အကြွပ်ကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(104, 'Tea leaf salad with dry mutton', '9500', 9, '2023-01-17 04:58:45', '2023-01-17 04:58:45', 'ဆိတ်လဖက်ထောင်း', NULL, NULL, 'Food', NULL, NULL, NULL),
(105, 'Prawn Tempura', '9500', 9, '2023-01-17 05:00:40', '2023-01-17 05:00:40', 'ပုစွန်ပေါင်မုန့်ကပ်ကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(106, 'Deep fried fish finger', '8500', 9, '2023-01-17 05:01:27', '2023-01-17 05:01:27', 'ငါးအသားချောင်းကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(107, 'Crispy prawn spring roll', '10500', 9, '2023-01-17 05:02:11', '2023-01-17 05:02:11', 'ပုစွန်ကော်ပြန့်လိပ်အကြွပ်ကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(108, 'Prawn cake with plum sauce', '9500', 9, '2023-01-17 05:03:12', '2023-01-17 05:03:12', 'ထိုင်းပုစွန်ကြော်နှင့် ဇီးသီးဆော့စ်', NULL, NULL, 'Food', NULL, NULL, NULL),
(109, 'Deep fried pork ball Tai style', '8000', 9, '2023-01-17 05:03:53', '2023-01-17 05:03:53', 'ထိုင်းစတိုင်ဝက်သားလုံးကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(110, 'Varity of chip with 4 dipping sauce', '7500', 9, '2023-01-17 05:04:53', '2023-01-17 05:04:53', 'အားလူးကြော်အစုံနှင့် ဆော့စ် (၄) မျိုး', NULL, NULL, 'Food', NULL, NULL, NULL),
(111, 'Banga & Mash', '10500', 9, '2023-01-17 05:05:31', '2023-01-17 05:05:31', 'ဥရောပစတိုင် ဝက်အူချောင်းကြော်နှင့် အာလူးထောင်း', NULL, NULL, 'Food', NULL, NULL, NULL),
(112, 'Brownnie', '9500', 10, '2023-01-17 05:16:41', '2023-01-17 05:16:41', 'ဘရောင်နီ', NULL, NULL, 'Food', NULL, NULL, NULL),
(113, 'Soft bone pork rib stew', '9500', 11, '2023-01-17 05:36:18', '2023-01-17 05:36:18', 'နံရိုးပေါင်းနှင့် စပါယ်ရှယ်ဆော့စ်', NULL, NULL, 'Food', NULL, NULL, NULL),
(114, 'Deep fried fish with red curry sauce', '18000', 11, '2023-01-17 05:38:29', '2023-01-17 05:38:29', 'ငါးအကြွပ်ကြော်နှင့် ယိုးဒယားအနီရောင်ဟင်းအနှစ်', NULL, NULL, 'Food', NULL, NULL, NULL),
(115, 'Deep fried soft crab with curry sauce', '8500', 11, '2023-01-17 05:43:15', '2023-01-17 05:43:15', 'ဂဏန်းပျော့်အကြွပ်ကြော်ထိုင်းမဆလာဟင်း', NULL, NULL, 'Food', NULL, NULL, NULL),
(116, 'Crispy prok bell with spicy sauce', '8000', 11, '2023-01-17 05:44:15', '2023-01-17 05:44:15', 'ဝက်ခေါက်အကြွပ်ကြော်နှင့် စပါယ်ရှယ်ချဉ်စပ်ဆော့စ်', NULL, NULL, 'Food', NULL, NULL, NULL),
(117, 'Mapo tofu', '5500', 11, '2023-01-17 06:24:49', '2023-01-17 06:24:49', 'မာပိုတို့ဟူး', NULL, NULL, 'Food', NULL, NULL, NULL),
(118, 'Kung pao chicken', '8000', 11, '2023-01-17 06:25:22', '2023-01-17 06:25:22', 'စီချွမ်စတိုင်ကြက်ကုန်းဘောင်', NULL, NULL, 'Food', NULL, NULL, NULL),
(119, 'Sweet & sour pork ball', '8500', 11, '2023-01-17 06:25:58', '2023-01-17 06:25:58', 'ဝက်သားလုံးချိုချဉ်', NULL, NULL, 'Food', NULL, NULL, NULL),
(120, 'Mala chicken', '7500', 11, '2023-01-17 06:26:35', '2023-01-17 06:26:35', 'စီချွမ်စတိုင် မာလာကြက်သား', NULL, NULL, 'Food', NULL, NULL, NULL),
(121, 'Green curyy fried rice', '7500', 12, '2023-01-17 06:30:12', '2023-01-17 06:30:12', 'ထိုင်းစတိုင် အစိမ်းရောင်ဟင်းနှင့်ထမင်းကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(122, 'Pineapple fried rice', '8500', 12, '2023-01-17 06:30:48', '2023-01-17 06:30:48', 'နာနတ်သီးထမင်းကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(123, 'Pad thai', '7500', 12, '2023-01-17 06:31:18', '2023-01-17 06:31:18', 'ယိုးဒယားဖက်ထိုင်းကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(124, 'Big Mac', '15000', 13, '2023-01-17 06:34:21', '2023-01-17 06:34:21', 'အမဲသားနှစ်ထပ်ဘာဂါ', NULL, NULL, 'Food', NULL, NULL, NULL),
(125, 'Chicken burger', '9000', 13, '2023-01-17 06:34:48', '2023-01-17 06:34:48', 'ကြက်သားဘာဂါ', NULL, NULL, 'Food', NULL, NULL, NULL),
(126, 'Calzone pizza', '11000', 13, '2023-01-17 06:35:21', '2023-01-19 15:16:45', 'Calzone ပီဇာ', 'Calzone ပဇ', NULL, 'Food', NULL, NULL, NULL),
(127, 'Hawaiian pizza', '12000', 13, '2023-01-17 06:35:42', '2023-01-17 06:35:42', 'Hawaiian ပီဇာ', NULL, NULL, 'Food', NULL, NULL, NULL),
(128, 'BBQ pork rib', '18000', 14, '2023-01-17 06:38:32', '2023-01-17 06:38:32', 'ဝက်နံရိုးကင်', NULL, NULL, 'Food', NULL, NULL, NULL),
(129, 'Fish & chips', '9500', 14, '2023-01-17 06:39:08', '2023-01-17 06:39:08', 'ငါးအသားပြားနှင့် အာလူးချောင်းကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(130, 'Beef steak with 3 choices sauce', '18000', 14, '2023-01-17 06:39:47', '2023-01-17 06:39:47', 'အမဲသားကင်နှင့် ဆော့စ် (၃) မျိုး', NULL, NULL, 'Food', NULL, NULL, NULL),
(131, 'Mix grill', '27000', 14, '2023-01-17 06:40:20', '2023-01-17 06:40:20', 'ဥရောပစတိုင်အသားစုံကင်', NULL, NULL, 'Food', NULL, NULL, NULL),
(132, 'Pork steak with season veg & sauce', '15000', 14, '2023-01-17 06:41:13', '2023-01-17 06:41:13', 'ဥရောပစတိုင်ဝက်သားကင်', NULL, NULL, 'Food', NULL, NULL, NULL),
(133, 'Surf & turf', '15000', 14, '2023-01-17 06:42:33', '2023-01-17 06:42:33', 'ပုစွန်အမဲသား အာလူးကိတ်', NULL, NULL, 'Food', NULL, NULL, NULL),
(134, 'Chicken parmigiana', '15000', 14, '2023-01-17 06:43:08', '2023-01-17 06:43:08', 'ကြက်သားပြားပါမဆန်ချိစ် အကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(135, 'Chicken Shawarma', '7500', 14, '2023-01-17 06:43:39', '2023-01-17 06:43:39', 'ကြက်သား Shawarma', NULL, NULL, 'Food', NULL, NULL, NULL),
(136, 'Japanese style chicken', '8500', 15, '2023-01-17 07:41:28', '2023-01-17 07:41:28', 'ဂျပန်စတိုင်ကြက်သားသုပ်', NULL, NULL, 'Food', NULL, NULL, NULL),
(137, 'Grill pork neck salad', '9500', 15, '2023-01-17 07:42:10', '2023-01-17 07:42:10', 'ဝက်ဂုတ်သားကင်သုပ်', NULL, NULL, 'Food', NULL, NULL, NULL),
(138, 'Yam talay seafood', '9500', 15, '2023-01-17 07:42:44', '2023-02-09 13:14:02', 'ထိုင်းစတိုင်ပင်လယ်စာသုပ်', 'ထငစတငပငလယစသပ', NULL, 'Food', NULL, NULL, NULL),
(139, 'laab muu', '6500', 15, '2023-01-17 07:43:18', '2023-01-17 07:43:18', 'ထိုင်းစတိုင် ဝက်သားစင်းကောသုပ်', NULL, NULL, 'Food', NULL, NULL, NULL),
(140, 'Prawn cocktail', '10500', 15, '2023-01-17 07:43:56', '2023-01-17 07:43:56', 'ပုစွန်ကော့တေး', NULL, NULL, 'Food', NULL, NULL, NULL),
(141, 'Tai style fruit salad', '5000', 15, '2023-01-17 07:44:41', '2023-01-17 07:44:41', 'ထိုင်းစတိုင်သစ်သီးစုံသုပ်', NULL, NULL, 'Food', NULL, NULL, NULL),
(142, 'Papaya salad', '6500', 15, '2023-01-17 07:45:23', '2023-01-17 07:45:23', 'ယိုးဒယားသင်္ဘောသီးထောင်း', NULL, NULL, 'Food', NULL, NULL, NULL),
(143, 'Caprese salad', '8500', 15, '2023-01-17 07:46:07', '2023-01-17 07:46:07', 'ခရမ်းချဉ်သီးနှင့် chees salad', NULL, NULL, 'Food', NULL, NULL, NULL),
(144, 'Raw prawn salad', '9000', 15, '2023-01-17 07:46:56', '2023-01-17 07:46:56', 'ပုစွန်အစိမ်းသုပ်', NULL, NULL, 'Food', NULL, NULL, NULL),
(145, 'Pork intestine salad', '8500', 15, '2023-01-17 07:47:28', '2023-01-19 15:16:28', 'ဝက်အူအစုံသုပ်', 'ဝကအအစသပ', NULL, 'Food', NULL, NULL, NULL),
(146, 'Stir fried beef with asian demiglace', '8500', 16, '2023-01-17 07:49:41', '2023-01-17 07:49:41', 'ဥရောပအာရှအရောအမဲသားပန်းပွင့်စိမ်းကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(147, 'Stir fried pork liver with chinese chive', '8000', 16, '2023-01-17 07:50:26', '2023-01-17 07:50:26', 'ဝက်အသည်းနှင့်ကုဆိုင်ကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(148, 'Stir fried asparagus with gingko nuts', '11000', 16, '2023-01-17 07:51:32', '2023-01-17 07:51:32', 'ကညွတ်ပုစွန်နှင့် နှစ်တစ်ရာသီးကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(149, 'Tofu stew', '6000', 16, '2023-01-17 07:52:19', '2023-01-17 07:52:19', 'တို့ဟူးစတူး', NULL, NULL, 'Food', NULL, NULL, NULL),
(150, 'Stir fried morning glory with mushroom', '4500', 16, '2023-01-17 07:52:53', '2023-01-17 07:52:53', 'မှိုကန်စွန်းကြော်', NULL, NULL, 'Food', NULL, NULL, NULL),
(151, 'Wukong', '9800', 1, '2023-01-17 08:13:05', '2023-05-16 02:42:23', 'ဝူခုန်း', 'ဝခန', NULL, 'Bar', 'EPSONTM-T81III', '192.168.100.8', 2),
(152, 'Passionate Kiss', '9800', 1, '2023-01-17 08:13:21', '2023-05-16 02:42:53', NULL, '', NULL, 'Bar', 'EPSONTM-T81III', '192.168.100.8', 2),
(153, 'Love Shackles', '13000', 1, '2023-01-17 08:13:34', '2023-05-16 02:43:24', NULL, '', NULL, 'Bar', 'EPSONTM-T81III', '192.168.100.8', 2),
(154, 'Lotaya', '13000', 1, '2023-01-17 08:13:54', '2023-05-16 02:44:15', 'လိုတရ', 'လတရ', NULL, 'Bar', 'EPSONTM-T81III', '192.168.100.8', 2),
(155, 'Yin Yang', '9800', 1, '2023-01-17 08:14:12', '2023-05-16 02:44:41', NULL, '', NULL, 'Bar', 'EPSONTM-T81III', '192.168.100.8', 2),
(156, 'Zein', '9800', 1, '2023-01-19 15:16:05', '2023-05-16 03:01:50', 'ဇိမ်', 'ဇမ', NULL, 'Bar', 'EPSONTM-T81III', '192.168.100.8', 2),
(159, '0001 A Wine', '10000', 18, '2023-05-16 01:17:20', '2023-05-16 01:17:20', NULL, '', '', 'Bar', NULL, NULL, NULL),
(160, '00002 B Wine', '12000', 18, '2023-05-16 01:17:35', '2023-05-16 01:17:35', NULL, '', '', 'Bar', NULL, NULL, NULL),
(161, '00003 C Wine', '10000', 18, '2023-05-16 01:17:49', '2023-05-16 01:17:49', NULL, '', '', 'Bar', NULL, NULL, NULL),
(162, '00004 D Wine', '10000', 18, '2023-05-16 01:18:01', '2023-05-16 01:18:01', NULL, '', '', 'Bar', NULL, NULL, NULL),
(163, '00005 E Wine', '120000', 18, '2023-05-16 01:18:13', '2023-05-16 01:18:13', NULL, '', '', 'Bar', NULL, NULL, NULL),
(164, 'Test', '100', 2, '2023-05-16 04:21:37', '2023-05-16 04:21:37', NULL, '', '', 'Bar', '', '192.168.100.8', 1),
(165, 'test', '100', 2, '2023-05-16 04:22:51', '2023-05-16 04:22:51', NULL, '', '', 'Bar', '', '192.168.100.8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
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
(68, '2022_12_29_103714_add_one_kg_per_price_to_ingredient_lists_table', 51),
(69, '2023_01_08_115522_add_order_minutes_to_order_infos_table', 52),
(70, '2023_01_08_115724_add_order_user_name_to_order_infos_table', 52),
(71, '2023_01_19_214052_add_mm_short_title_to_menu_lists_table', 52),
(72, '2023_01_25_134122_add_photo_to_menu_lists_table', 53),
(73, '2023_01_25_140055_add_photo_to_categories_table', 54),
(75, '2023_01_25_150853_add_split_qty_to_order_items_table', 55),
(76, '2023_01_26_001411_create_void_items_table', 56),
(77, '2023_01_26_173136_add_order_no_to_bill_infos_table', 57),
(79, '2023_01_26_175846_create_table_transfer_histories_table', 58),
(80, '2023_01_26_180557_add_first_table_to_order_infos_table', 59),
(81, '2023_01_26_181125_add_first_table_to_bill_infos_table', 60),
(82, '2023_01_26_214511_add_table_list_id_to_void_items_table', 61),
(83, '2023_01_26_224737_add_account_type_to_payment_methods_table', 62),
(84, '2023_01_27_004253_add_order_date_to_order_items_table', 63),
(85, '2023_01_27_104530_create_notice_boards_table', 64),
(86, '2023_02_07_131913_add_store_type_to_stores_table', 65),
(87, '2023_02_07_133915_create_store_types_table', 66),
(88, '2023_02_07_135831_add_more_fields_v1_to_ingredients_table', 67),
(89, '2023_02_07_145300_create_stock_openings_table', 68),
(91, '2023_02_07_160233_create_stock_ins_table', 69),
(92, '2023_02_07_165503_create_stock_transfers_table', 70),
(93, '2023_02_07_173441_create_damages_table', 71),
(94, '2023_02_07_174559_create_damage_files_table', 71),
(95, '2023_02_08_083137_add_discount_amount_to_bill_infos_table', 72),
(97, '2023_02_08_090154_add_manager_status_to_void_items_table', 73),
(98, '2023_02_08_093113_add_order_item_id_to_void_items_table', 74),
(99, '2023_02_09_114751_add_void_status_to_order_infos_table', 75),
(100, '2023_02_09_125439_add_refund_amount_to_bill_infos_table', 76),
(101, '2023_02_09_193758_add_type_to_menu_lists_table', 77),
(102, '2023_02_12_170014_create_discounts_table', 78),
(103, '2023_02_13_074900_add_type_to_order_items_table', 79),
(104, '2023_04_24_231905_create_service_charges_table', 80),
(105, '2023_04_24_234853_add_service_charge_to_bill_infos_table', 81),
(106, '2023_05_10_091100_create_print_bill_histories_table', 82),
(107, '2023_05_10_092718_add_print_status_to_order_infos_table', 83),
(108, '2023_05_11_182636_add_categorie_id_to_order_items_table', 84);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notice_boards`
--

CREATE TABLE `notice_boards` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notice_boards`
--

INSERT INTO `notice_boards` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Customers\' return', '2023-02-10 07:28:41', '2023-02-10 07:28:41'),
(2, 'Customers\' time issue', '2023-02-10 07:28:46', '2023-02-10 07:28:46'),
(3, 'Mistake operation', '2023-02-10 07:28:50', '2023-02-10 07:28:50'),
(4, 'Modifiers or kitchen remarks are incorrect', '2023-02-10 07:28:55', '2023-02-10 07:28:55'),
(5, 'No seating', '2023-02-10 07:28:59', '2023-02-10 07:28:59'),
(6, 'System error', '2023-02-10 07:29:03', '2023-02-10 07:29:03'),
(7, 'Other', '2023-02-10 07:29:07', '2023-02-10 07:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `order_infos`
--

CREATE TABLE `order_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` text DEFAULT NULL,
  `table_list_id` text DEFAULT NULL,
  `order_no` text DEFAULT NULL,
  `inv_no` text DEFAULT NULL,
  `order_date_time` text DEFAULT NULL,
  `order_date` text DEFAULT NULL,
  `order_time` text DEFAULT NULL,
  `check_out_status` text DEFAULT NULL,
  `check_out_time` text DEFAULT NULL,
  `payment_type` text DEFAULT NULL,
  `total_amount` text DEFAULT NULL,
  `tax_amount` text DEFAULT NULL,
  `discount` text DEFAULT NULL,
  `service_charges` text DEFAULT NULL,
  `net_amount` text DEFAULT NULL,
  `received_amount` text DEFAULT NULL,
  `cashier_user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `waiter_user_id` text DEFAULT NULL,
  `guest_no` text DEFAULT NULL,
  `change_amount` text DEFAULT NULL,
  `order_minutes` text DEFAULT NULL,
  `order_user_name` text DEFAULT NULL,
  `first_table_id` text DEFAULT NULL,
  `void_status` text DEFAULT NULL,
  `print_status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_infos`
--

INSERT INTO `order_infos` (`id`, `customer_id`, `table_list_id`, `order_no`, `inv_no`, `order_date_time`, `order_date`, `order_time`, `check_out_status`, `check_out_time`, `payment_type`, `total_amount`, `tax_amount`, `discount`, `service_charges`, `net_amount`, `received_amount`, `cashier_user_id`, `created_at`, `updated_at`, `waiter_user_id`, `guest_no`, `change_amount`, `order_minutes`, `order_user_name`, `first_table_id`, `void_status`, `print_status`) VALUES
(1, '0', '1', '000001', 'INV-13052023-0001', '2023-05-13 03:58:39 PM', '2023-05-13', '03:58:39 PM', 'paid', NULL, NULL, '43500', NULL, NULL, NULL, NULL, NULL, '2', '2023-05-13 08:58:39', '2023-05-13 09:03:09', '2', '2', NULL, '03:58 PM', 'Waiter1', NULL, NULL, 'print'),
(2, '0', '2', '000003', 'INV-13052023-0003', '2023-05-13 03:59:48 PM', '2023-05-13', '03:59:48 PM', 'paid', NULL, NULL, '40500', NULL, NULL, NULL, NULL, NULL, '2', '2023-05-13 08:59:48', '2023-05-13 09:15:34', '2', '2', NULL, '03:59 PM', 'Waiter1', NULL, NULL, 'print'),
(3, '0', '1', '000003', 'INV-16052023-0003', '2023-05-16 08:33:02 AM', '2023-05-16', '08:33:02 AM', 'paid', NULL, NULL, '90000', NULL, NULL, NULL, NULL, NULL, '2', '2023-05-16 01:33:02', '2023-05-16 01:34:01', '2', '1', NULL, '08:33 AM', 'Waiter1', NULL, NULL, NULL),
(4, '0', '1', '000004', 'INV-16052023-0004', '2023-05-16 09:50:56 AM', '2023-05-16', '09:50:56 AM', 'paid', NULL, NULL, '18500', NULL, NULL, NULL, NULL, NULL, '3', '2023-05-16 02:50:56', '2023-05-16 02:55:15', '3', '3', NULL, '09:50 AM', 'Cashier1', NULL, NULL, 'print');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_info_id` int(11) DEFAULT NULL,
  `menu_list_id` int(11) DEFAULT NULL,
  `qty` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `waiter_user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `preparation_status` text DEFAULT NULL,
  `preparation_date` text DEFAULT NULL,
  `preparation_user_id` text DEFAULT NULL,
  `difference_time` text DEFAULT NULL,
  `manager_remark` text DEFAULT NULL,
  `menu_name` text DEFAULT NULL,
  `split_qty` int(11) NOT NULL DEFAULT 0,
  `order_date` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `categorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_info_id`, `menu_list_id`, `qty`, `price`, `remark`, `waiter_user_id`, `created_at`, `updated_at`, `preparation_status`, `preparation_date`, `preparation_user_id`, `difference_time`, `manager_remark`, `menu_name`, `split_qty`, `order_date`, `type`, `categorie_id`) VALUES
(1, 1, 151, '1', '9000', NULL, '2', '2023-05-13 08:58:39', '2023-05-13 08:58:39', NULL, NULL, NULL, NULL, NULL, 'Crazy Monkey', 0, '2023-05-13', 'Beverage', 1),
(2, 1, 115, '1', '8500', NULL, '2', '2023-05-13 08:58:39', '2023-05-13 08:58:39', NULL, NULL, NULL, NULL, NULL, 'Deep fried soft crab with curry sauce', 0, '2023-05-13', 'Food', 11),
(3, 1, 114, '1', '18000', NULL, '2', '2023-05-13 08:58:39', '2023-05-13 08:58:39', NULL, NULL, NULL, NULL, NULL, 'Deep fried fish with red curry sauce', 0, '2023-05-13', 'Food', 11),
(4, 1, 116, '1', '8000', NULL, '2', '2023-05-13 08:58:39', '2023-05-13 08:58:39', NULL, NULL, NULL, NULL, NULL, 'Crispy prok bell with spicy sauce', 0, '2023-05-13', 'Food', 11),
(5, 2, 45, '1', '9500', NULL, '2', '2023-05-13 08:59:48', '2023-05-13 08:59:48', NULL, NULL, NULL, NULL, NULL, 'Tom Zaab Soup', 0, '2023-05-13', 'Food', 8),
(6, 2, 153, '1', '9000', NULL, '2', '2023-05-13 08:59:48', '2023-05-13 08:59:48', NULL, NULL, NULL, NULL, NULL, 'LVA Sangaria', 0, '2023-05-13', 'Beverage', 1),
(7, 2, 152, '1', '9000', NULL, '2', '2023-05-13 08:59:48', '2023-05-13 08:59:48', NULL, NULL, NULL, NULL, NULL, 'Passionate Kiss', 0, '2023-05-13', 'Beverage', 1),
(8, 2, 12, '1', '5000', NULL, '2', '2023-05-13 09:09:53', '2023-05-13 09:09:53', NULL, NULL, NULL, NULL, NULL, 'Atomic Bomb', 0, '2023-05-13', 'Beverage', 2),
(9, 2, 18, '1', '8000', NULL, '2', '2023-05-13 09:10:09', '2023-05-13 09:10:09', NULL, NULL, NULL, NULL, NULL, 'Pussy Beer', 0, '2023-05-13', 'Beverage', 3),
(10, 3, 151, '10', '9000', NULL, '2', '2023-05-16 01:33:02', '2023-05-16 01:33:02', NULL, NULL, NULL, NULL, NULL, 'Crazy Monkey', 0, '2023-05-16', 'Beverage', 1),
(11, 4, 44, '1', '6500', NULL, '3', '2023-05-16 02:50:56', '2023-05-16 02:50:56', NULL, NULL, NULL, NULL, NULL, 'Chicken Mushroom cream soup', 0, '2023-05-16', 'Food', 8),
(12, 4, 160, '1', '12000', NULL, '3', '2023-05-16 02:50:56', '2023-05-16 02:50:56', NULL, NULL, NULL, NULL, NULL, '00002 B Wine', 0, '2023-05-16', 'Bar', 18);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` text DEFAULT NULL,
  `account_type` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `remark`, `user_id`, `created_at`, `updated_at`, `status`, `account_type`) VALUES
(1, 'Cash Down', 'Cash Down', 1, '2022-12-22 04:53:26', '2023-01-26 16:23:54', 'Active', 'Cash'),
(2, 'KPay', 'KPay', 1, '2022-12-22 04:53:36', '2023-01-26 16:24:09', 'Active', 'OnlinePayAccount'),
(3, 'AYA banking', 'Banking', 1, '2023-01-17 04:22:11', '2023-01-26 16:24:17', 'Active', 'Banking'),
(4, 'KBZ banking', 'Banking', 1, '2023-01-17 04:22:44', '2023-01-26 16:24:26', 'Active', 'Banking'),
(5, 'CB banking', 'Banking', 1, '2023-01-17 04:23:11', '2023-01-26 16:24:57', 'Active', 'Banking'),
(6, 'VISA', 'Card', 1, '2023-01-17 04:23:46', '2023-01-26 16:24:35', 'Active', 'Banking'),
(7, 'Master', 'Card', 1, '2023-01-17 04:23:57', '2023-01-26 16:24:43', 'Active', 'Banking'),
(8, 'Aya - Pay', 'Aya - Pay', 1, '2023-01-26 16:25:22', '2023-01-26 16:25:22', 'Active', 'OnlinePayAccount'),
(9, 'CB - Pay', 'CB - Pay', 1, '2023-01-26 16:25:32', '2023-01-26 16:25:32', 'Active', 'OnlinePayAccount');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` text DEFAULT NULL
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
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `print_bill_histories`
--

CREATE TABLE `print_bill_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_info_id` text DEFAULT NULL,
  `customer_id` text DEFAULT NULL,
  `table_list_id` text DEFAULT NULL,
  `bill_date_time` text DEFAULT NULL,
  `bill_time` text DEFAULT NULL,
  `payment_type` text DEFAULT NULL,
  `total_amount` text DEFAULT NULL,
  `tax_amount` text DEFAULT NULL,
  `discount` text DEFAULT NULL,
  `service_charges` text DEFAULT NULL,
  `net_amount` text DEFAULT NULL,
  `received_amount` text DEFAULT NULL,
  `cashier_user_id` text DEFAULT NULL,
  `change_amount` text DEFAULT NULL,
  `waiter_user_id` text DEFAULT NULL,
  `date_only` text DEFAULT NULL,
  `order_no` text DEFAULT NULL,
  `inv_no` text DEFAULT NULL,
  `first_table_id` text DEFAULT NULL,
  `discount_amount` text DEFAULT NULL,
  `refund_amount` text DEFAULT NULL,
  `service_charge_amount` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `print_bill_histories`
--

INSERT INTO `print_bill_histories` (`id`, `order_info_id`, `customer_id`, `table_list_id`, `bill_date_time`, `bill_time`, `payment_type`, `total_amount`, `tax_amount`, `discount`, `service_charges`, `net_amount`, `received_amount`, `cashier_user_id`, `change_amount`, `waiter_user_id`, `date_only`, `order_no`, `inv_no`, `first_table_id`, `discount_amount`, `refund_amount`, `service_charge_amount`, `created_at`, `updated_at`) VALUES
(1, '1', '0', '1', '2023-05-13 04:00:44 PM', '04:00:44 PM', '0', '43500', '3', '5', '0', '42630', '0', '3', '0', '2', '2023-05-13', '000001', 'INV-13052023-0001', NULL, '0', '42630', '0', '2023-05-13 09:00:44', '2023-05-13 09:00:44'),
(2, '2', '0', '2', '2023-05-13 04:10:36 PM', '04:10:36 PM', '0', '40500', '0', '0', '0', '40500', '0', '3', '0', '2', '2023-05-13', '000003', 'INV-13052023-0003', NULL, '0', '40500', '0', '2023-05-13 09:10:36', '2023-05-13 09:10:36'),
(3, '2', '0', '2', '2023-05-13 04:15:34 PM', '04:15:34 PM', '0', '40500', '0', '0', '0', '40500', '0', '3', '0', '2', '2023-05-13', '000003', 'INV-13052023-0003', NULL, '0', '40500', '0', '2023-05-13 09:15:34', '2023-05-13 09:15:34'),
(4, '4', '0', '1', '2023-05-16 09:54:41 AM', '09:54:41 AM', '2', '18500', '5', '0', '0', '19425', '0', '3', '0', '3', '2023-05-16', '000004', 'INV-16052023-0004', NULL, '0', '19425', '0', '2023-05-16 02:54:41', '2023-05-16 02:54:41');

-- --------------------------------------------------------

--
-- Table structure for table `print_configs`
--

CREATE TABLE `print_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `ip_address` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `print_configs`
--

INSERT INTO `print_configs` (`id`, `name`, `ip_address`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'POS-80', '192.168.100.8', '1', '2023-05-13 15:49:19', '2023-05-13 15:50:25'),
(2, 'EPSONTM-T81III', '192.168.100.8', '1', '2023-05-15 04:44:44', '2023-05-15 04:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
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
-- Table structure for table `service_charges`
--

CREATE TABLE `service_charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `rate` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_charges`
--

INSERT INTO `service_charges` (`id`, `name`, `rate`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '0%', '0', 'Active', 1, '2023-04-24 16:56:51', '2023-04-24 16:58:02'),
(2, '5%', '5', 'Active', 1, '2023-04-24 16:57:17', '2023-04-24 16:57:17');

-- --------------------------------------------------------

--
-- Table structure for table `stock_ins`
--

CREATE TABLE `stock_ins` (
  `id` int(10) UNSIGNED NOT NULL,
  `ingredient_id` text DEFAULT NULL,
  `stock_in_date` text DEFAULT NULL,
  `purchase_unit` text DEFAULT NULL,
  `price_per_unit` text DEFAULT NULL,
  `total_stock_value` text DEFAULT NULL,
  `store_id` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `session_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_ins`
--

INSERT INTO `stock_ins` (`id`, `ingredient_id`, `stock_in_date`, `purchase_unit`, `price_per_unit`, `total_stock_value`, `store_id`, `user_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, '15', '2023-02-09', '1000', '10', '10000', '1', '1', NULL, '2023-02-09 12:59:34', '2023-02-09 12:59:35');

-- --------------------------------------------------------

--
-- Table structure for table `stock_openings`
--

CREATE TABLE `stock_openings` (
  `id` int(10) UNSIGNED NOT NULL,
  `ingredient_id` text DEFAULT NULL,
  `opening_date` text DEFAULT NULL,
  `opening_unit` text DEFAULT NULL,
  `price_per_unit` text DEFAULT NULL,
  `total_stock_value` text DEFAULT NULL,
  `store_id` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `session_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_openings`
--

INSERT INTO `stock_openings` (`id`, `ingredient_id`, `opening_date`, `opening_unit`, `price_per_unit`, `total_stock_value`, `store_id`, `user_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, '1', '2023-04-24', '10', '10', '100', '1', '1', NULL, '2023-04-24 17:02:12', '2023-04-24 17:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfers`
--

CREATE TABLE `stock_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `ingredient_id` text DEFAULT NULL,
  `transfer_date` text DEFAULT NULL,
  `transfer_unit` text DEFAULT NULL,
  `location_from_store_id` text DEFAULT NULL,
  `to_location_store_id` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `code_name` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_types` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `code_name`, `address`, `user_id`, `created_at`, `updated_at`, `store_types`) VALUES
(1, 'FEZ', 'W01', 'In Kitchen', '1', '2022-12-21 17:49:37', '2023-02-07 07:21:50', '4'),
(2, 'RAW', 'W02', 'In Kitchen', '1', '2022-12-21 17:49:50', '2023-02-07 07:22:30', '1'),
(3, 'SPE', 'W03', 'Behind the Bar', '1', '2023-02-07 07:22:17', '2023-02-07 07:22:17', '3');

-- --------------------------------------------------------

--
-- Table structure for table `store_types`
--

CREATE TABLE `store_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_types`
--

INSERT INTO `store_types` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Frezzer', '2023-02-07 07:14:34', '2023-02-07 07:17:01'),
(2, 'Refrigerator', '2023-02-07 07:14:44', '2023-02-07 07:14:44'),
(3, 'Racking', '2023-02-07 07:14:48', '2023-02-07 07:14:48'),
(4, 'Store Rooms', '2023-02-07 07:14:54', '2023-02-07 07:14:54'),
(5, 'Box', '2023-02-07 07:14:58', '2023-02-07 07:14:58'),
(6, 'Cupboard', '2023-02-07 07:15:03', '2023-02-07 07:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `shop_name` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_lists`
--

CREATE TABLE `table_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` text DEFAULT NULL,
  `floor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_lists`
--

INSERT INTO `table_lists` (`id`, `table_name`, `floor_id`, `created_at`, `updated_at`) VALUES
(1, 'G1', 1, '2022-10-12 07:34:30', '2023-05-16 02:05:00'),
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
(14, 'G14', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(15, 'G15', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(16, 'G16', 1, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(18, 'VIP1', 1, '2022-10-12 07:34:30', '2023-05-16 02:05:39'),
(19, 'VIP2', 1, '2022-10-12 07:34:30', '2023-05-16 02:06:12'),
(20, 'VIP3', 1, '2022-10-12 07:34:30', '2023-05-16 02:07:14'),
(21, 'VIP4', 1, '2022-10-12 07:34:30', '2023-05-16 02:07:52'),
(22, 'VIP5', 1, '2022-10-12 07:34:30', '2023-05-16 02:08:19'),
(23, 'VIP6', 1, '2022-10-12 07:34:30', '2023-05-16 02:08:37'),
(24, 'VIP7', 1, '2022-10-12 07:34:30', '2023-05-16 02:09:12'),
(25, 'VIP8', 1, '2022-10-12 07:34:30', '2023-05-16 02:09:48'),
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
(44, 'F14', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(45, 'F15', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(46, 'F16', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(47, 'F17', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(48, 'F18', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(49, 'F19', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(50, 'F20', 2, '2022-10-12 07:34:30', '2022-10-12 07:34:30'),
(51, 'VVIP', 2, '2022-10-12 07:34:30', '2023-05-16 02:14:22');

-- --------------------------------------------------------

--
-- Table structure for table `table_transfer_histories`
--

CREATE TABLE `table_transfer_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_info_id` text DEFAULT NULL,
  `first_table` text DEFAULT NULL,
  `main_table` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxrates`
--

CREATE TABLE `taxrates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `taxrate` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxrates`
--

INSERT INTO `taxrates` (`id`, `name`, `taxrate`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '5%', '5', 'Active', 1, '2022-12-22 03:47:54', '2023-05-16 02:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `temp_fixed_purchase_items`
--

CREATE TABLE `temp_fixed_purchase_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `temp_id` int(11) DEFAULT NULL,
  `temp_name` text DEFAULT NULL,
  `qty` text DEFAULT NULL,
  `cost` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `session_id` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `nrc_number` varchar(255) DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `department_id` text DEFAULT NULL,
  `is_banned` int(11) NOT NULL DEFAULT 1,
  `last_login_at` text DEFAULT NULL,
  `last_login_ip` text DEFAULT NULL,
  `agent` text DEFAULT NULL,
  `nrc_front` text DEFAULT NULL,
  `nrc_back` text DEFAULT NULL,
  `members_list_file` text DEFAULT NULL,
  `other_file` text DEFAULT NULL,
  `leave_date` text DEFAULT NULL,
  `leave_remark` text DEFAULT NULL,
  `leave_by` text DEFAULT NULL,
  `contact_person` text DEFAULT NULL,
  `emergency_contact` text DEFAULT NULL,
  `passport_photo` text DEFAULT NULL,
  `join_date` text DEFAULT NULL,
  `employment_type` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `employee_id`, `phone`, `nrc_number`, `gender`, `address`, `department_id`, `is_banned`, `last_login_at`, `last_login_ip`, `agent`, `nrc_front`, `nrc_back`, `members_list_file`, `other_file`, `leave_date`, `leave_remark`, `leave_by`, `contact_person`, `emergency_contact`, `passport_photo`, `join_date`, `employment_type`, `remember_token`, `created_at`, `updated_at`, `pin_code`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$H4Dl/7aFMsm1xck7mqa.PehZTR5oWppsGZ09pO7VHsE7euBe.sCQi', '00001', '09123123122', '1/agc(N)991223', 'male', 'YGN', '1', 1, '2023-05-16 10:49:56', '192.168.88.158', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Probation', NULL, '2023-01-27 00:37:41', '2023-05-16 04:19:56', 123458),
(2, 'Waiter1', 'waiter@gmail.com', NULL, '$2y$10$YlWrTGwZXqnf1/D4ifbXu.xDm5kdkbG4uNrbfqll.RIb3xHWUwKzG', '00002', '0912312313', '1/abc(n)009221', 'male', 'YGN', '4', 1, '16/05/2023 09:04:16 am', '202.165.84.155', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Probation', 'fkNd8kLKGkbcJNJqbicLxFLeWcBBvEp7Z1jbyV4ZW1GcRrULyaOHpNSrnKYj', '2023-01-26 23:30:19', '2023-05-16 02:04:16', 123456),
(3, 'Cashier1', 'cashier@gmail.com', NULL, '$2y$10$KL/3ZNF1BfbUI4ElchzP9uWxwfagZcAxiq9ISNMas439.IvR8ewrK', '00003', '09123123123', '1/abc(N)009221', 'male', 'YGN', '5', 1, '16/05/2023 09:50:18 am', '204.157.172.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Probation', NULL, '2022-11-14 03:17:19', '2023-05-16 02:50:18', 123457),
(4, 'Waiter2', 'waiter2@gmail.com', NULL, '$2y$10$37k4qpRw/3UTDJcuOWYz4O0Y0VzSGBmWPzQeqh4dqttW89g7zbNGW', '00004', '0912312312', '1/abc(N)009221', 'male', 'YGN', '4', 1, '26/01/2023 20:22:57 pm', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '2023-01-26 08:21 PM', 'Probation', NULL, '2023-01-26 13:52:34', '2023-01-26 13:52:57', 123123),
(5, 'Manager', 'manager@gmail.com', NULL, '$2y$10$AP0zY7YegX7vga/tIVvjyetYiwVTAjTXpenwFpwx3XIBHIVTrcHAy', 'EMP-00005', '09777181776', '-', 'male', '-', '2', 1, '09/05/2023 08:25:11 am', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '2023-05-09 01:16 AM', 'Probation', NULL, '2023-05-08 18:47:35', '2023-05-09 01:55:11', 123450);

-- --------------------------------------------------------

--
-- Table structure for table `variable_assets`
--

CREATE TABLE `variable_assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `inventory_code` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `unit` text DEFAULT NULL,
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
  `variable_asset_id` text DEFAULT NULL,
  `damage_qty` text DEFAULT NULL,
  `causes_of_accidents` text DEFAULT NULL,
  `compensation` text DEFAULT NULL,
  `voucher_attach` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `date_at` text DEFAULT NULL,
  `damage_date` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variable_damange_files`
--

CREATE TABLE `variable_damange_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `attachments` text DEFAULT NULL,
  `original_name` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `variable_damage_id` text DEFAULT NULL,
  `date_at` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variable_purchases`
--

CREATE TABLE `variable_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_id` text DEFAULT NULL,
  `invoice_no` text DEFAULT NULL,
  `purchase_date` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `total_amount` text DEFAULT NULL,
  `representative_id` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `date_at` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variable_purchase_files`
--

CREATE TABLE `variable_purchase_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `attachments` text DEFAULT NULL,
  `original_name` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `date_at` text DEFAULT NULL,
  `variable_purchase_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variable_purchase_items`
--

CREATE TABLE `variable_purchase_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `variable_purchase_id` text DEFAULT NULL,
  `fixed_asset_id` text DEFAULT NULL,
  `qty` text DEFAULT NULL,
  `cost` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `void_items`
--

CREATE TABLE `void_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_info_id` int(11) DEFAULT NULL,
  `menu_list_id` int(11) DEFAULT NULL,
  `qty` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `waiter_user_id` text DEFAULT NULL,
  `preparation_status` text DEFAULT NULL,
  `preparation_date` text DEFAULT NULL,
  `preparation_user_id` text DEFAULT NULL,
  `difference_time` text DEFAULT NULL,
  `manager_remark` text DEFAULT NULL,
  `menu_name` text DEFAULT NULL,
  `split_qty` text DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `void_by` text DEFAULT NULL,
  `void_date` text DEFAULT NULL,
  `void_time` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `table_list_id` text DEFAULT NULL,
  `manager_status` text DEFAULT NULL,
  `order_item_id` text DEFAULT NULL
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
-- Indexes for table `damages`
--
ALTER TABLE `damages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `damage_files`
--
ALTER TABLE `damage_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
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
-- Indexes for table `notice_boards`
--
ALTER TABLE `notice_boards`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `print_bill_histories`
--
ALTER TABLE `print_bill_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `print_configs`
--
ALTER TABLE `print_configs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `service_charges`
--
ALTER TABLE `service_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_ins`
--
ALTER TABLE `stock_ins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_openings`
--
ALTER TABLE `stock_openings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_transfers`
--
ALTER TABLE `stock_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_types`
--
ALTER TABLE `store_types`
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
-- Indexes for table `table_transfer_histories`
--
ALTER TABLE `table_transfer_histories`
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
-- Indexes for table `void_items`
--
ALTER TABLE `void_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_infos`
--
ALTER TABLE `bill_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart_temps`
--
ALTER TABLE `cart_temps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `damages`
--
ALTER TABLE `damages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damage_files`
--
ALTER TABLE `damage_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ingredient_lists`
--
ALTER TABLE `ingredient_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `members_lists`
--
ALTER TABLE `members_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_lists`
--
ALTER TABLE `menu_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `notice_boards`
--
ALTER TABLE `notice_boards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_infos`
--
ALTER TABLE `order_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- AUTO_INCREMENT for table `print_bill_histories`
--
ALTER TABLE `print_bill_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `print_configs`
--
ALTER TABLE `print_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_charges`
--
ALTER TABLE `service_charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stock_ins`
--
ALTER TABLE `stock_ins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_openings`
--
ALTER TABLE `stock_openings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_transfers`
--
ALTER TABLE `stock_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `store_types`
--
ALTER TABLE `store_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT for table `table_transfer_histories`
--
ALTER TABLE `table_transfer_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxrates`
--
ALTER TABLE `taxrates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `temp_fixed_purchase_items`
--
ALTER TABLE `temp_fixed_purchase_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT for table `void_items`
--
ALTER TABLE `void_items`
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
