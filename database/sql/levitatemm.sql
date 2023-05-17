-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2023 at 09:51 PM
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
-- Database: `levitatemm`
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
(1, 'SIGNATURE COCKTAILS', 'Beverage', '2022-12-27 20:37:14', '2023-05-17 17:49:55', '#e68619', '1.png'),
(3, 'BEER COCKTAIL', 'Beverage', '2022-12-27 20:38:31', '2023-05-17 08:57:32', '#c7c10f', '3.png'),
(4, 'CLASSIC COCKTAILS', 'Beverage', '2022-12-27 20:38:41', '2023-05-17 09:07:38', '#8ec7ff', '4.png'),
(5, 'HEALTHY JUICE', 'Beverage', '2022-12-27 20:38:51', '2023-05-17 17:58:07', '#3bae0a', 'viber_image_2023-02-03_14-04-14-796.png'),
(6, 'Soup', 'Food', '2022-12-27 20:55:27', '2023-02-07 15:45:59', '#b7ffb7', '6.png'),
(7, 'Peachy Patato', 'Food', '2022-12-27 20:55:47', '2023-05-15 12:55:10', '#00f5f5', '7.png'),
(8, 'ပေါ့ပေါ့ပါးပါး', 'Food', '2022-12-27 20:56:01', '2023-05-17 08:55:28', '#dd9873', '8.png'),
(9, 'Rice & Noodle', 'Food', '2022-12-27 20:56:54', '2023-05-17 08:56:00', '#d0a2ff', '10.png'),
(10, 'Vegetable', 'Food', '2022-12-27 20:57:12', '2023-05-15 12:58:37', '#42d93f', '11.png'),
(11, 'Salad', 'Food', '2022-12-27 21:06:37', '2023-02-07 15:48:07', '#ffbbff', '13.png'),
(12, 'SOFT DRINKS', 'Beverage', '2023-05-15 12:11:37', '2023-05-17 09:08:50', '#c9b6b6', 'soft-drink.png'),
(13, 'DRAUGHT BEER', 'Beverage', '2023-05-15 12:37:06', '2023-05-17 09:04:11', '#0781df', 'beers.png'),
(14, 'BEER BOTTLES', 'Beverage', '2023-05-15 12:42:50', '2023-05-17 09:06:53', '#3762c8', 'beer.png'),
(15, 'SHISHA', 'Beverage', '2023-05-15 12:43:35', '2023-05-17 09:11:30', '#ccc7c7', 'shisha.png'),
(16, 'COGNAC', 'Beverage', '2023-05-17 09:15:23', '2023-05-17 09:15:23', '#e2d9cb', 'cognac.png'),
(17, 'American Whiskey', 'Beverage', '2023-05-17 09:29:06', '2023-05-17 09:29:06', '#dbcccc', 'whiskey (3).png'),
(18, 'JAPANESE WHISKY', 'Beverage', '2023-05-17 09:30:52', '2023-05-17 09:30:52', '#cbc3cb', 'whiskey (2).png'),
(19, 'SINGLE MALT WHISKY', 'Beverage', '2023-05-17 09:32:48', '2023-05-17 09:33:14', '#cedfd7', 'whiskey (4).png'),
(20, 'BLENDED WHISKY', 'Beverage', '2023-05-17 09:36:51', '2023-05-17 09:36:51', '#afb8ca', 'whiskey (5).png'),
(21, 'BLENDED MALT WHISKY', 'Beverage', '2023-05-17 09:44:26', '2023-05-17 09:44:26', '#dadcc7', 'whisky.png'),
(22, 'GIN', 'Beverage', '2023-05-17 09:46:28', '2023-05-17 09:46:28', '#cdeecf', 'gin-tonic.png'),
(23, 'RUM', 'Beverage', '2023-05-17 09:46:54', '2023-05-17 09:46:54', '#dbdec4', 'rum.png'),
(24, 'VODKA', 'Beverage', '2023-05-17 09:49:42', '2023-05-17 09:49:42', '#c8d8df', 'vodka.png'),
(25, 'TEQUILAS', 'Beverage', '2023-05-17 09:53:09', '2023-05-17 09:53:09', '#b8c7d6', 'tequila.png'),
(26, 'LIQUEURS', 'Beverage', '2023-05-17 09:56:56', '2023-05-17 09:56:56', '#d7ccdb', 'kahlua.png'),
(27, 'CHAMPANGNE', 'Beverage', '2023-05-17 09:59:30', '2023-05-17 09:59:30', '#b2d2b1', 'champagne (2).png'),
(28, 'SPARKLING WINE', 'Beverage', '2023-05-17 10:01:39', '2023-05-17 10:01:39', '#dde1bc', 'sparkling-wine.png'),
(29, 'WHITE WINE', 'Beverage', '2023-05-17 10:04:30', '2023-05-17 10:04:54', '#a9a8cc', 'wine-bottle (1).png'),
(30, 'RED WINE', 'Beverage', '2023-05-17 10:06:27', '2023-05-17 10:06:27', '#e6d0d0', 'red-wine.png'),
(31, 'MOLECULAR COCKTAIL', 'Beverage', '2023-05-17 17:36:56', '2023-05-17 17:36:56', '#e5cdd6', 'cocktail.png'),
(32, 'LVA INFUSE COCKTAIL', 'Beverage', '2023-05-17 17:37:24', '2023-05-17 17:37:24', '#d2d8e4', 'drink.png'),
(33, 'SHOOTER', 'Beverage', '2023-05-17 17:39:01', '2023-05-17 17:39:01', '#ece4e4', 'shooter.png'),
(34, 'SMOOTHIES', 'Beverage', '2023-05-17 18:01:15', '2023-05-17 18:01:15', '#c9bddb', 'smoothie.png'),
(35, 'ITALIAN SODA', 'Beverage', '2023-05-17 18:03:33', '2023-05-17 18:03:33', '#c6d3e2', 'soft-drink (1).png'),
(36, 'MOCKTAILS', 'Beverage', '2023-05-17 18:04:42', '2023-05-17 18:04:42', '#b0d4b4', 'drink (2).png');

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
(2, 'First Floor', '2022-11-14 10:05:41', '2022-11-14 10:05:41'),
(3, 'Second Floor', '2022-11-14 10:05:45', '2022-11-14 10:05:45');

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
(1, 1, '2023-05-18 01:48:32', '192.168.100.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-17 19:18:32', '2023-05-17 19:18:32');

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
(1, 'Deep Fried Chicken Wing', '8500', 8, '2023-05-17 16:49:49', '2023-05-17 16:49:49', 'ကြက်တောင်ပံအကြွပ်ကြော်', 'ကကတငပအကပက', '', 'Food', '', '192.168.100.8', 1),
(2, 'Mexican style Chicken Wings', '9000', 8, '2023-05-17 16:50:38', '2023-05-17 16:50:38', 'ကြက်တောင်ပံ မက်စီကန်စတိုင်', 'ကကတငပ မကစကနစတင', '', 'Food', '', '192.168.100.8', 1),
(3, 'Chicken satay', '8500', 8, '2023-05-17 16:51:12', '2023-05-17 16:51:12', 'ကြက်ဆာတေး', 'ကကဆတ', '', 'Food', '', '192.168.100.8', 1),
(4, 'Grill Chicken butt', '6500', 8, '2023-05-17 16:51:37', '2023-05-17 16:51:37', 'ကြက်ဆီဘူးကင်', 'ကကဆဘကင', '', 'Food', '', '192.168.100.8', 1),
(5, 'Crispy fried Quails', '9500', 8, '2023-05-17 16:53:18', '2023-05-17 16:53:18', 'ငုံးကြော်', 'ငက', '', 'Food', '', '192.168.100.8', 1),
(6, 'Crispy Pork Belly', '950', 8, '2023-05-17 16:53:50', '2023-05-17 16:53:50', '၀က်သုံးထပ်သားကြွပ်ကြော်', '၀ကသထပသကပက', '', 'Food', '', '192.168.100.8', 1),
(7, 'Soft Bone  pork ribs', '9000', 8, '2023-05-17 16:54:16', '2023-05-17 16:54:16', '၀က်နံရိုးနုကြော်', '၀ကနရနက', '', 'Food', '', '192.168.100.8', 1),
(8, 'Deep Fried Sun Dried  Beef', '8500', 8, '2023-05-17 16:56:10', '2023-05-17 16:56:10', 'အမဲနေတစ်လှန်းကြော်', 'အမနတစလနက', '', 'Food', '', '192.168.100.8', 1),
(9, 'Calamari ring', '8500', 8, '2023-05-17 16:56:35', '2023-05-17 16:56:35', 'ကင်းမွန်ကွင်းကြော်', 'ကငမနကငက', '', 'Food', '', '192.168.100.8', 1),
(10, 'Crispy prawn spring roll', '9900', 8, '2023-05-17 16:57:07', '2023-05-17 16:57:07', 'ပုစွန်ကော်ပြန့်လိပ်အကြွပ်ကြော်', 'ပစနကပနလပအကပက', '', 'Food', '', '192.168.100.8', 1),
(11, 'Prawn Tempura', '8500', 8, '2023-05-17 16:57:37', '2023-05-17 16:57:37', 'ပုစွန်တန်ပူရာကြော်', 'ပစနတနပရက', '', 'Food', '', '192.168.100.8', 1),
(12, 'Fish-wrapped curry', '6500', 8, '2023-05-17 16:58:00', '2023-05-17 16:58:00', 'ငါးပေါင်းထုပ်', 'ငပငထပ', '', 'Food', '', '192.168.100.8', 1),
(13, 'Deep Fried Eel', '10500', 8, '2023-05-17 16:58:24', '2023-05-17 16:58:24', 'ငါးရှဥ်.ခြောက်စပ်', 'ငရဥ.ခကစပ', '', 'Food', '', '192.168.100.8', 1),
(14, 'Deep fried loach with Sauces', '9500', 8, '2023-05-17 16:58:46', '2023-05-17 16:58:46', 'ငါးသလဲထိုးအကြွပ်ကြော်', 'ငသလထအကပက', '', 'Food', '', '192.168.100.8', 1),
(15, 'Deep fried fish finger', '8500', 8, '2023-05-17 16:59:07', '2023-05-17 16:59:07', 'ငါးအသားချောင်းကြော်', 'ငအသခငက', '', 'Food', '', '192.168.100.8', 1),
(16, 'Dry fish (snake head fish )', '8500', 8, '2023-05-17 16:59:30', '2023-05-17 16:59:30', 'ငါးရံ့ခြောက်ဆီဆမ်း', 'ငရခကဆဆမ', '', 'Food', '', '192.168.100.8', 1),
(17, 'Potato Chips', '5500', 7, '2023-05-17 16:59:59', '2023-05-17 16:59:59', 'ပေါ့ပေါ့ပါးပါးကြော်', 'ပပပပက', '', 'Food', '', '192.168.100.8', 1),
(18, 'French Fries', '7500', 7, '2023-05-17 17:00:23', '2023-05-17 17:00:23', 'အာလူးချောင်းကြော်', 'အလခငက', '', 'Food', '', '192.168.100.8', 1),
(19, 'Varity of chip with 4 dipping sauce', '7500', 7, '2023-05-17 17:00:46', '2023-05-17 17:00:46', 'အာလူးကြော်အစုံနှင့်ဆော့စ်(၄)မျိုး', 'အလကအစနငဆစ(၄)မ', '', 'Food', '', '192.168.100.8', 1),
(20, 'Potato Mala', '6500', 7, '2023-05-17 17:01:10', '2023-05-17 17:01:10', 'အာလူးချောင်းမာလာ', 'အလခငမလ', '', 'Food', '', '192.168.100.8', 1),
(21, 'Corn cracker with tamarind sauce', '5500', 7, '2023-05-17 17:01:37', '2023-05-17 17:01:37', 'ပြောင်းဖူးကြော်နှင့်မန်ကျည်းသီးဆော့စ်', 'ပငဖကနငမနကညသဆစ', '', 'Food', '', '192.168.100.8', 1),
(22, 'Grilled Chicken Salad', '5500', 11, '2023-05-17 17:03:29', '2023-05-17 17:03:29', 'ကြက်ကင်သုပ်', 'ကကကငသပ', '', 'Food', '', '192.168.100.8', 1),
(23, 'Mince Chicken Salad', '5500', 11, '2023-05-17 17:03:53', '2023-05-17 17:03:53', 'ကြက်စဥ်းကောသုပ်', 'ကကစဥကသပ', '', 'Food', '', '192.168.100.8', 1),
(24, 'Grill pork neck salad', '9500', 11, '2023-05-17 17:04:19', '2023-05-17 17:04:19', '၀က်ဂုတ်သားကင်သုပ်', '၀ကဂတသကငသပ', '', 'Food', '', '192.168.100.8', 1),
(25, 'Pork Ear Salad', '8500', 11, '2023-05-17 17:04:41', '2023-05-17 17:04:41', '၀က်နားရွက်သုပ်', '၀ကနရကသပ', '', 'Food', '', '192.168.100.8', 1),
(26, 'Yam Talay seafood', '11500', 11, '2023-05-17 17:05:54', '2023-05-17 17:05:54', 'ထိုင်းစတိုင်ပင်လယ်စာသုပ်', 'ထငစတငပငလယစသပ', '', 'Food', '', '192.168.100.8', 1),
(27, 'Laab muu', '5500', 11, '2023-05-17 17:06:16', '2023-05-17 17:06:16', 'ထိုင်းစတိုင်ဝက်အသားစင်းကောသုပ်', 'ထငစတငဝကအသစငကသပ', '', 'Food', '', '192.168.100.8', 1),
(28, 'Tea leaf pounded with dry mutton', '7500', 11, '2023-05-17 17:07:14', '2023-05-17 17:07:14', 'ဆိတ်လက်ဖက်ထောင်း', 'ဆတလကဖကထင', '', 'Food', '', '192.168.100.8', 1),
(29, 'Grilled Beef Salad', '8500', 11, '2023-05-17 17:07:36', '2023-05-17 17:07:36', 'အမဲကင်သုပ်', 'အမကငသပ', '', 'Food', '', '192.168.100.8', 1),
(30, 'Stuff Fish Cake', '7500', 11, '2023-05-17 17:07:58', '2023-05-17 17:07:58', 'ငါးဖယ်အစာသွပ်', 'ငဖယအစသပ', '', 'Food', '', '192.168.100.8', 1),
(31, 'Squid Salad', '8500', 11, '2023-05-17 17:08:16', '2023-05-17 17:08:16', 'ကင်းမွန်သုပ်', 'ကငမနသပ', '', 'Food', '', '192.168.100.8', 1),
(32, 'Fresh prawn salad', '8500', 11, '2023-05-17 17:08:39', '2023-05-17 17:08:39', 'ပုစွန်အစိမ်းသုပ်', 'ပစနအစမသပ', '', 'Food', '', '192.168.100.8', 1),
(33, 'Papaya salad seafood', '8500', 11, '2023-05-17 17:08:58', '2023-05-17 17:08:58', 'ယိုးဒယားသဘ်ောသီးထောင်း', 'ယဒယသဘသထင', '', 'Food', '', '192.168.100.8', 1),
(34, 'Street Style Tea leaf Salad', '6500', 11, '2023-05-17 17:09:16', '2023-05-17 17:09:16', 'လမ်းဘေးလက်ဖက်သုပ်', 'လမဘလကဖကသပ', '', 'Food', '', '192.168.100.8', 1),
(35, 'A Phoe Gyi Tea leave Salad', '6500', 11, '2023-05-17 17:09:37', '2023-05-17 17:09:37', 'အဖိုးကြီးလက်ဖက်သုပ်', 'အဖကလကဖကသပ', '', 'Food', '', '192.168.100.8', 1),
(36, 'Century Egg Salad', '5500', 11, '2023-05-17 17:10:02', '2023-05-17 17:10:02', 'ဆေးဘဲဥသုပ်', 'ဆဘဥသပ', '', 'Food', '', '192.168.100.8', 1),
(37, 'Tha Khut Salad', '5500', 11, '2023-05-17 17:10:27', '2023-05-17 17:10:27', 'သခွပ်ပွင့်သုပ်', 'သခပပငသပ', '', 'Food', '', '192.168.100.8', 1),
(38, 'Banana Bud Salad', '5000', 11, '2023-05-17 17:10:59', '2023-05-17 17:10:59', 'ငှက်ပျောဖူးသုပ်', 'ငကပဖသပ', '', 'Food', '', '192.168.100.8', 1),
(39, 'Hot & Sour chicken legs soup', '7500', 11, '2023-05-17 17:11:25', '2023-05-17 17:11:25', 'ကြက်ခြေထောက်ချဥ်စပ်', 'ကကခထကခဥစပ', '', 'Food', '', '192.168.100.8', 1),
(40, 'Chicken Beer', '17000', 11, '2023-05-17 17:11:49', '2023-05-17 17:11:49', 'ကြက်သားဘီယာချက်', 'ကကသဘယခက', '', 'Food', '', '192.168.100.8', 1),
(41, 'Chicken “Lal Tha Mar “ Soup', '7500', 6, '2023-05-17 17:12:09', '2023-05-17 17:12:09', 'ကြက်လယ်တော', 'ကကလယတ', '', 'Food', '', '192.168.100.8', 1),
(42, 'Soft Pork Ribs with Pickled Soup', '8500', 6, '2023-05-17 17:12:29', '2023-05-17 17:12:29', '၀က်နံရိုးနုကြံမဆိုင်', '၀ကနရနကမဆင', '', 'Food', '', '192.168.100.8', 1),
(43, 'Mutton  chickpea Soup', '8000', 6, '2023-05-17 17:12:48', '2023-05-17 17:12:48', 'ဆိတ်ပဲ', 'ဆတပ', '', 'Food', '', '192.168.100.8', 1),
(44, 'Tom yum soup Prawn)', '10500', 6, '2023-05-17 17:13:11', '2023-05-17 17:13:11', 'တုံယမ်းဟင်းရည်(ပုစွန်)', 'တယမဟငရည(ပစန)', '', 'Food', '', '192.168.100.8', 1),
(45, 'Stir-Fried Watercress', '4500', 10, '2023-05-17 17:13:38', '2023-05-17 17:13:38', 'ကန်စွန်း', 'ကနစန', '', 'Food', '', '192.168.100.8', 1),
(46, 'Stir-Fried Kale', '4500', 10, '2023-05-17 17:13:58', '2023-05-17 17:13:58', 'ကိုက်လန်', 'ကကလန', '', 'Food', '', '192.168.100.8', 1),
(47, 'Stir-Fried Chinese Chive', '6500', 10, '2023-05-17 17:14:21', '2023-05-17 17:14:21', 'ဂျူးဖူး', 'ဂဖ', '', 'Food', '', '192.168.100.8', 1),
(48, 'Stir-Fried asparagus', '7500', 10, '2023-05-17 17:14:40', '2023-05-17 17:14:40', 'ကညွန့်', 'ကညန', '', 'Food', '', '192.168.100.8', 1),
(49, 'Stir-Fried Cauliflower with egg', '5500', 10, '2023-05-17 17:15:00', '2023-05-17 17:15:00', 'ပန်းပွင့်ကြက်ဥ', 'ပနပငကကဥ', '', 'Food', '', '192.168.100.8', 1),
(50, 'Stir-Fried Chives', '4000', 10, '2023-05-17 17:15:18', '2023-05-17 17:15:18', 'ကုစိုင်', 'ကစင', '', 'Food', '', '192.168.100.8', 1),
(51, 'Stir-Fried hot & sour Japan Tofu', '8500', 10, '2023-05-17 17:15:39', '2023-05-17 17:15:39', 'ဂျပန်တို့ဖူးချဥ်စပ်', 'ဂပနတဖခဥစပ', '', 'Food', '', '192.168.100.8', 1),
(52, 'Stir-Fried Lady finger  with dry shrimps', '6500', 10, '2023-05-17 17:16:00', '2023-05-17 17:16:00', 'ရုံးပတီသီး ပုစွန်ခြောက်', 'ရပတသ ပစနခက', '', 'Food', '', '192.168.100.8', 1),
(53, 'Stir-Fried Gourd Leaves', '4500', 10, '2023-05-17 17:16:23', '2023-05-17 17:16:23', 'ဘူးညွန့်', 'ဘညန', '', 'Food', '', '192.168.100.8', 1),
(54, 'Stir-Fried Spinach', '4500', 10, '2023-05-17 17:16:46', '2023-05-17 17:16:46', 'ဟင်းနုနွယ်', 'ဟငနနယ', '', 'Food', '', '192.168.100.8', 1),
(55, 'pork (with extra)', '2000', 10, '2023-05-17 17:21:27', '2023-05-17 17:22:27', NULL, '', '', 'Food', 'POS-80', '192.168.100.8', 1),
(56, 'pork liver (with extra)', '2000', 10, '2023-05-17 17:23:01', '2023-05-17 17:23:01', NULL, '', '', 'Food', '', '192.168.100.8', 1),
(57, 'pork belly (with extra)', '2000', 10, '2023-05-17 17:23:25', '2023-05-17 17:23:25', NULL, '', '', 'Food', '', '192.168.100.8', 1),
(58, 'chicken (with extra)', '2000', 10, '2023-05-17 17:23:51', '2023-05-17 17:23:51', NULL, '', '', 'Food', '', '192.168.100.8', 1),
(59, 'beef (with extra)', '3000', 10, '2023-05-17 17:24:09', '2023-05-17 17:24:09', NULL, '', '', 'Food', '', '192.168.100.8', 1),
(60, 'prawn (with extra)', '2000', 10, '2023-05-17 17:24:30', '2023-05-17 17:24:30', NULL, '', '', 'Food', '', '192.168.100.8', 1),
(61, 'mushroom (with extra)', '1500', 10, '2023-05-17 17:24:57', '2023-05-17 17:24:57', NULL, '', '', 'Food', '', '192.168.100.8', 1),
(62, 'Ginko nut (with extra)', '2000', 10, '2023-05-17 17:25:21', '2023-05-17 17:25:21', NULL, '', '', 'Food', '', '192.168.100.8', 1),
(63, 'Pineapple fried rice', '9500', 9, '2023-05-17 17:25:55', '2023-05-17 17:25:55', 'နာနတ်သီးထမင်းကြော်', 'နနတသထမငက', '', 'Food', '', '192.168.100.8', 1),
(64, 'Brown fried rice', '7500', 9, '2023-05-17 17:26:12', '2023-05-17 17:26:12', NULL, '', '', 'Food', '', '192.168.100.8', 1),
(65, 'LVA fried rice', '8500', 9, '2023-05-17 17:26:29', '2023-05-17 17:26:29', NULL, '', '', 'Food', '', '192.168.100.8', 1),
(66, 'LVA Fried noddle', '9500', 9, '2023-05-17 17:26:50', '2023-05-17 17:26:50', NULL, '', '', 'Food', '', '192.168.100.8', 1),
(67, 'Drunken Monkey', '9800', 1, '2023-05-17 17:30:02', '2023-05-17 17:30:02', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(68, 'Passionate Kiss', '9800', 1, '2023-05-17 17:30:26', '2023-05-17 17:30:26', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(69, 'Levitate Sangria', '9800', 1, '2023-05-17 17:30:42', '2023-05-17 17:30:42', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(70, 'Chitmi Pyitshi', '9800', 1, '2023-05-17 17:30:55', '2023-05-17 17:30:55', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(72, 'Love Shackles', '13000', 32, '2023-05-17 17:31:43', '2023-05-17 17:41:05', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(73, 'Bermuda Triangle', '15000', 32, '2023-05-17 17:32:02', '2023-05-17 17:40:25', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(74, 'Crushing on You', '9800', 31, '2023-05-17 17:32:34', '2023-05-17 17:43:43', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(75, 'Zein', '9800', 31, '2023-05-17 17:32:53', '2023-05-17 17:42:49', 'ဇိမ်', 'ဇမ', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(76, 'Yin Yang', '9800', 1, '2023-05-17 17:33:06', '2023-05-17 17:44:35', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(78, 'Lotaya', '13000', 32, '2023-05-17 17:41:33', '2023-05-17 17:41:33', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(79, 'Levitation', '13000', 32, '2023-05-17 17:41:56', '2023-05-17 17:41:56', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(80, 'Rise Of The Moon', '12000', 31, '2023-05-17 17:45:36', '2023-05-17 17:45:36', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(81, 'Lava Lava', '12000', 31, '2023-05-17 17:45:50', '2023-05-17 17:45:50', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(82, 'Spaghetti Mafia', '12000', 31, '2023-05-17 17:46:11', '2023-05-17 17:46:11', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(83, 'L-G-B-T-Q', '12000', 31, '2023-05-17 17:46:30', '2023-05-17 17:46:30', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(84, 'Desire And Dignity', '29000', 33, '2023-05-17 17:47:03', '2023-05-17 17:47:03', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(85, 'Seventh Heaven', '6000', 33, '2023-05-17 17:47:25', '2023-05-17 17:47:25', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(86, 'Nebula', '6000', 33, '2023-05-17 17:47:42', '2023-05-17 17:47:42', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(87, 'Venom', '6000', 33, '2023-05-17 17:47:58', '2023-05-17 17:47:58', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(88, 'Antidote', '6000', 33, '2023-05-17 17:48:13', '2023-05-17 17:48:13', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(89, '4 Ex', '15000', 33, '2023-05-17 17:48:32', '2023-05-17 17:48:32', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(90, 'Bang Bang', '8000', 3, '2023-05-17 17:48:53', '2023-05-17 17:48:53', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(91, 'Sexidation', '8000', 3, '2023-05-17 17:49:09', '2023-05-17 17:49:09', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(92, 'Carpe Diem', '8000', 3, '2023-05-17 17:49:27', '2023-05-17 17:49:27', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(93, 'Heineken', '3500', 13, '2023-05-17 17:50:26', '2023-05-17 17:50:26', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(94, 'Tiger', '3000', 3, '2023-05-17 17:50:50', '2023-05-17 17:50:50', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(95, 'ABC', '3000', 13, '2023-05-17 17:51:13', '2023-05-17 17:51:13', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(96, 'Corona', '7000', 14, '2023-05-17 17:51:31', '2023-05-17 17:51:31', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(97, 'Budweiser', '6000', 14, '2023-05-17 17:51:52', '2023-05-17 17:51:52', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(98, 'Heineken', '5500', 14, '2023-05-17 17:52:05', '2023-05-17 17:52:05', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(99, 'Hoegaarden', '6000', 14, '2023-05-17 17:52:21', '2023-05-17 17:52:21', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(100, 'Tiger Crystal', '5000', 14, '2023-05-17 17:52:36', '2023-05-17 17:52:36', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(101, 'ABC can', '3500', 14, '2023-05-17 17:52:51', '2023-05-17 17:52:51', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(102, 'Bloody Mary', '8000', 4, '2023-05-17 17:53:09', '2023-05-17 17:53:09', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(103, 'Bullfrog', '8000', 4, '2023-05-17 17:53:20', '2023-05-17 17:53:20', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(104, 'Cosmopolitan', '8000', 4, '2023-05-17 17:53:34', '2023-05-17 17:53:34', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(105, 'Expresso Martini', '8000', 14, '2023-05-17 17:54:02', '2023-05-17 17:54:02', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(106, 'AK 47', '8000', 4, '2023-05-17 17:54:16', '2023-05-17 17:54:16', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(107, 'Margarita', '8000', 4, '2023-05-17 17:54:30', '2023-05-17 17:54:30', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(108, 'Coca Cola', '2000', 12, '2023-05-17 17:54:48', '2023-05-17 17:54:48', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(109, 'Soda', '2000', 12, '2023-05-17 17:55:06', '2023-05-17 17:55:06', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(110, 'Ginger Ale', '2000', 12, '2023-05-17 17:55:20', '2023-05-17 17:55:20', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(111, 'Tonic Water', '2000', 12, '2023-05-17 17:55:35', '2023-05-17 17:55:35', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(112, 'Sprite', '2000', 12, '2023-05-17 17:55:55', '2023-05-17 17:55:55', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(113, 'Red Bull', '2500', 12, '2023-05-17 17:56:21', '2023-05-17 17:56:21', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(114, 'Purified Drinking Water', '1000', 12, '2023-05-17 17:56:40', '2023-05-17 17:56:40', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(115, 'Single Flavor', '30000', 15, '2023-05-17 17:57:04', '2023-05-17 17:57:04', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(116, 'Mix Flavor', '40000', 15, '2023-05-17 17:57:19', '2023-05-17 17:57:19', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(117, 'Mango Tango Coulis', '6000', 5, '2023-05-17 18:05:37', '2023-05-17 18:05:37', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(118, 'Pink Grapefruit Ade', '6000', 5, '2023-05-17 18:05:51', '2023-05-17 18:05:51', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(119, 'Healthy Orange', '6000', 5, '2023-05-17 18:06:02', '2023-05-17 18:06:02', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(120, 'Creamy Carrot', '6000', 5, '2023-05-17 18:06:13', '2023-05-17 18:06:13', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(121, 'Beet Leamonate', '6000', 5, '2023-05-17 18:06:24', '2023-05-17 18:06:24', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(122, 'Mango', '6000', 34, '2023-05-17 18:06:41', '2023-05-17 18:06:41', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(123, 'Banana', '6000', 34, '2023-05-17 18:06:59', '2023-05-17 18:06:59', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(124, 'Strawberry', '6000', 34, '2023-05-17 18:07:31', '2023-05-17 18:07:31', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(125, 'Pineapple', '6000', 34, '2023-05-17 18:07:46', '2023-05-17 18:07:46', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(126, 'Passion', '6000', 34, '2023-05-17 18:08:04', '2023-05-17 18:08:04', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(127, 'Blueberry', '6000', 34, '2023-05-17 18:08:20', '2023-05-17 18:08:20', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(128, 'Raspberry', '6000', 34, '2023-05-17 18:08:36', '2023-05-17 18:08:36', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(129, 'Apple', '7000', 35, '2023-05-17 18:08:55', '2023-05-17 18:08:55', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(130, 'Strawberry', '7000', 35, '2023-05-17 18:09:12', '2023-05-17 18:09:12', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(131, 'Watermelon', '7000', 35, '2023-05-17 18:09:55', '2023-05-17 18:09:55', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(132, 'Kiwi', '7000', 35, '2023-05-17 18:10:08', '2023-05-17 18:10:08', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(133, 'Passion', '7000', 35, '2023-05-17 18:10:22', '2023-05-17 18:10:22', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(134, 'Lychee', '7000', 35, '2023-05-17 18:10:35', '2023-05-17 18:10:35', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(135, 'Lavender', '7000', 35, '2023-05-17 18:10:51', '2023-05-17 18:10:51', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(136, 'Blue Curacao', '7000', 35, '2023-05-17 18:11:08', '2023-05-17 18:11:08', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(137, 'Berry Sparkling', '7000', 36, '2023-05-17 18:11:35', '2023-05-17 18:11:35', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(138, 'Cosmo Mango Fizz', '7000', 36, '2023-05-17 18:11:55', '2023-05-17 18:11:55', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(139, 'Bloom Iced Tea', '7000', 36, '2023-05-17 18:12:10', '2023-05-17 18:12:10', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(140, 'Rose Chocolate Cookie', '7000', 36, '2023-05-17 18:12:34', '2023-05-17 18:12:34', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(141, 'Spicy Melon', '7000', 36, '2023-05-17 18:12:47', '2023-05-17 18:12:47', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(142, 'Kiwi Mint Smash', '7000', 36, '2023-05-17 18:13:01', '2023-05-17 18:13:01', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(143, 'Hennessey V.S.O.P   --------             1L', '335000', 16, '2023-05-17 18:14:10', '2023-05-17 18:24:57', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(144, 'Hennessy XO   --------       .7L', '732000', 16, '2023-05-17 18:14:30', '2023-05-17 18:25:21', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(145, 'Martell VSOP  --------        1L', '240000', 16, '2023-05-17 18:19:30', '2023-05-17 18:25:44', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(146, 'Martell XO   --------        1L', '952000', 16, '2023-05-17 18:20:09', '2023-05-17 18:26:05', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(147, 'Remy Martin XO  -------- 1L', '902000', 16, '2023-05-17 18:20:42', '2023-05-17 18:26:25', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(148, 'GentlemanJack -------    1L', '112000', 17, '2023-05-17 18:21:12', '2023-05-17 18:31:57', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(149, 'Jack   Daniel’s	 -------     1L', '78000', 17, '2023-05-17 18:21:54', '2023-05-17 18:35:13', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(150, 'Jack Daniel’s Fire -------     1L', '86000', 17, '2023-05-17 18:22:31', '2023-05-17 18:34:48', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(151, 'JD Single Barrel ------      .75L', '167000', 17, '2023-05-17 18:23:15', '2023-05-17 18:34:31', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(152, 'Maker’s Mark   --------                  1L', '112000', 17, '2023-05-17 18:23:44', '2023-05-17 18:34:07', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(153, 'W/T Rare Bread   -----             .7L', '106000', 17, '2023-05-17 18:28:56', '2023-05-17 18:33:48', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(154, 'Wild Turkey 101  -------              .7L', '45000', 17, '2023-05-17 18:29:16', '2023-05-17 18:33:26', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(155, 'Wild Turkey 101    --------             1L', '86000', 17, '2023-05-17 18:29:38', '2023-05-17 18:33:01', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(156, 'Jim Bean White   -------              1L', '53000', 17, '2023-05-17 18:30:07', '2023-05-17 18:32:37', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(157, 'Knob Creek --------                1L', '98000', 17, '2023-05-17 18:30:32', '2023-05-17 18:32:19', NULL, '', '', 'Beverage', 'POS-80', '192.168.100.8', 1),
(158, 'The Chita  --------                     .7L', '165000', 18, '2023-05-17 18:31:11', '2023-05-17 18:31:11', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(159, 'Hibiki Suntory Whisky -------   .7L', '535000', 18, '2023-05-17 18:35:59', '2023-05-17 18:35:59', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(160, 'Nikka Coffee Grain --------          .7L', '250000', 18, '2023-05-17 18:36:22', '2023-05-17 18:36:22', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(161, 'Glenfiddich 12 Yrs    --------             1L', '191000', 19, '2023-05-17 18:36:48', '2023-05-17 18:36:48', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(162, 'Glenfiddich 15 Yrs-------                 1L', '279000', 19, '2023-05-17 18:37:07', '2023-05-17 18:37:07', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(163, 'Glenfiddich 18 Yrs   -------              1L', '410000', 19, '2023-05-17 18:37:25', '2023-05-17 18:37:25', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(164, 'Glenfiddich 21Yrs     -------            .7L', '712000', 19, '2023-05-17 18:37:43', '2023-05-17 18:37:43', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(165, 'Singleton Dufftown 12 Yr --------   .7L', '99000', 19, '2023-05-17 18:38:02', '2023-05-17 18:38:02', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(166, 'Singleton 18 Yrs     --------                1L', '353000', 19, '2023-05-17 18:38:34', '2023-05-17 18:38:34', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(167, 'Talisker 10 Yrs  --------                      .75L', '156000', 19, '2023-05-17 18:38:55', '2023-05-17 18:38:55', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(168, 'Talisker Dark Storm  --------             1L', '156000', 19, '2023-05-17 18:39:15', '2023-05-17 18:39:15', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(169, 'Auchentoshan 12 Yrs   -------        .7L', '147000', 19, '2023-05-17 18:39:34', '2023-05-17 18:39:34', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(170, 'Jura Destiny          -------                .7L', '115000', 19, '2023-05-17 18:39:52', '2023-05-17 18:39:52', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(171, 'Balvenie Double 12 Yrs -------      .7L', '203000', 19, '2023-05-17 18:40:11', '2023-05-17 18:40:11', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(172, 'Aberfeldy 12 Yrs     ------              .7L', '122000', 19, '2023-05-17 18:40:48', '2023-05-17 18:40:48', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(173, 'Laphroaig PX Cask     -------         1L', '208000', 19, '2023-05-17 18:41:10', '2023-05-17 18:41:10', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(174, 'Lagavulin Islay 10 Yrs     -------      .7L', '344000', 19, '2023-05-17 18:41:36', '2023-05-17 18:41:36', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(175, 'The Classic Laddie          ------      .7L', '143000', 19, '2023-05-17 18:42:08', '2023-05-17 18:42:08', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(176, 'Ballantines Finest  ------- 1L', '52000', 20, '2023-05-17 18:44:20', '2023-05-17 18:44:20', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(177, 'Ballantines 12 Yrs ------ 1L', '91000', 20, '2023-05-17 18:44:42', '2023-05-17 18:44:42', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(178, 'Ballantines 15 Yrs ----- .75L', '119000', 20, '2023-05-17 18:45:12', '2023-05-17 18:45:12', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(179, 'Ballantines 17 Yrs ----- .7L', '193000', 20, '2023-05-17 18:45:43', '2023-05-17 18:45:43', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(180, 'Ballantines 21 Yrs -------- .7L', '336000', 20, '2023-05-17 18:46:12', '2023-05-17 18:46:12', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(181, 'Ballantines 30 Yrs ------- .7L', '871000', 20, '2023-05-17 18:46:53', '2023-05-17 18:46:53', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(182, 'Chivas Regal 12 Yrs ------- 1L', '97000', 20, '2023-05-17 18:47:16', '2023-05-17 18:47:16', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(183, 'Chivas Regal 18 Yrs ------1L', '251000', 20, '2023-05-17 18:47:41', '2023-05-17 18:47:41', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(184, 'Chivas Royal Salute 21 ------ 1L', '510000', 20, '2023-05-17 18:48:10', '2023-05-17 18:48:10', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(185, 'Famous Grouse ------ 1L', '49000', 20, '2023-05-17 18:48:30', '2023-05-17 18:48:30', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(186, 'Jameson Irish Whisky ------1L', '71000', 20, '2023-05-17 18:48:53', '2023-05-17 18:48:53', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(187, 'J/W Black Label ------- 1L', '102000', 20, '2023-05-17 18:49:12', '2023-05-17 18:49:12', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(188, 'J/W Double Black ------ 1L', '128000', 20, '2023-05-17 18:49:29', '2023-05-17 18:49:29', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(189, 'J/W Gold Reserve ------ 1L', '167000', 20, '2023-05-17 18:49:50', '2023-05-17 18:49:50', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(190, 'J/W White Walker ------ 1L', '90000', 20, '2023-05-17 18:50:15', '2023-05-17 18:50:15', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(191, 'J/W G.O.T.A -------1L', '90000', 20, '2023-05-17 18:50:31', '2023-05-17 18:50:31', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(192, 'J/W Blue Label ------- 1L', '672000', 20, '2023-05-17 18:50:54', '2023-05-17 18:50:54', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(193, 'Four Rose ------- .7L', '117000', 20, '2023-05-17 18:51:21', '2023-05-17 18:51:21', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(194, 'Four Rose Bourbon -------1L', '52000', 20, '2023-05-17 18:51:47', '2023-05-17 18:51:47', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(195, 'Machire Moor Edition------.7L', '136000', 20, '2023-05-17 18:52:08', '2023-05-17 18:52:08', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(196, 'Monkey Shoulder  ------        1L', '158000', 21, '2023-05-17 18:52:33', '2023-05-17 18:52:33', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(197, 'Copper Dog Speyside  ------  1L', '129000', 21, '2023-05-17 18:52:53', '2023-05-17 18:52:53', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(198, 'Bombay Sapphire  --------       1L', '68000', 22, '2023-05-17 18:53:10', '2023-05-17 18:53:10', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(199, 'Gordon’s          --------              1L', '45000', 22, '2023-05-17 18:53:30', '2023-05-17 18:53:30', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(200, 'Hendrick’s        --------              1L', '132000', 22, '2023-05-17 18:53:46', '2023-05-17 18:53:46', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(201, 'Tanqueray Dry     ------          1L', '64000', 22, '2023-05-17 18:54:09', '2023-05-17 18:54:09', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(202, 'Tanqueray Ten    -------           1L', '122000', 22, '2023-05-17 18:54:32', '2023-05-17 18:54:32', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(203, 'Roku          ---------                     .7L', '108000', 22, '2023-05-17 18:54:49', '2023-05-17 18:54:49', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(204, 'Bull Dog      --------                    1L', '77000', 22, '2023-05-17 18:55:09', '2023-05-17 18:55:09', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(205, 'Bacardi White        ------             1L', '48000', 23, '2023-05-17 18:55:29', '2023-05-17 18:55:29', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(206, 'Bacardi Gold      -------     1L', '47000', 23, '2023-05-17 18:55:57', '2023-05-17 18:55:57', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(207, 'Captain Morgan Black  ------    .75L', '38000', 23, '2023-05-17 18:56:17', '2023-05-17 18:56:17', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(208, 'Captain Morgan Gold  -------      1L', '50000', 23, '2023-05-17 18:56:37', '2023-05-17 18:56:37', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(209, 'Malibu Coconut         -------         1L', '55000', 23, '2023-05-17 18:56:59', '2023-05-17 18:56:59', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(210, 'Absolut Blue     -------                 1L', '45000', 24, '2023-05-17 18:57:20', '2023-05-17 18:57:20', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(211, 'Absolut Raspberry    ------        1L', '45000', 24, '2023-05-17 18:57:39', '2023-05-17 18:57:39', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(212, 'Absolut Vanilla      -------            1L', '49000', 24, '2023-05-17 18:57:59', '2023-05-17 18:57:59', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(213, 'Absolut Grapefruit    ------       1L', '54000', 24, '2023-05-17 18:58:19', '2023-05-17 18:58:19', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(214, 'Grey Goose         -------               1L', '105000', 24, '2023-05-17 18:58:50', '2023-05-17 18:58:50', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(215, 'Ketel One        -------                   1L', '118000', 24, '2023-05-17 18:59:10', '2023-05-17 18:59:10', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(216, 'Smirnoff Red       -----              1L', '45000', 24, '2023-05-17 18:59:29', '2023-05-17 18:59:29', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(217, 'Beluga Noble      ------               1L', '91000', 24, '2023-05-17 18:59:52', '2023-05-17 18:59:52', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(218, 'Skyy Original        ------              1L', '45000', 24, '2023-05-17 19:00:14', '2023-05-17 19:00:14', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(219, 'Don Julio Anejo   ------      .75L', '267000', 25, '2023-05-17 19:00:35', '2023-05-17 19:00:35', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(220, 'Don Julio Raposado -------- .75L', '297000', 25, '2023-05-17 19:01:10', '2023-05-17 19:01:10', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(221, 'Jose Cuervo Gold   -------    1L', '69000', 25, '2023-05-17 19:01:33', '2023-05-17 19:01:33', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(222, 'Jose Cuervo Silver   ------   1L', '69000', 25, '2023-05-17 19:02:02', '2023-05-17 19:02:02', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(223, 'Patron Anejo     ------          1L', '231000', 25, '2023-05-17 19:02:21', '2023-05-17 19:02:21', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(224, 'Patron Silver        -------        1L', '136000', 25, '2023-05-17 19:02:39', '2023-05-17 19:02:39', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(225, 'Dom Perignon Vintage Lumi', '904000', 27, '2023-05-17 19:03:07', '2023-05-17 19:03:07', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(226, 'Chandon Brut', '97500', 28, '2023-05-17 19:03:27', '2023-05-17 19:03:27', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(227, 'Chandon Brut Rose', '101500', 28, '2023-05-17 19:03:48', '2023-05-17 19:03:48', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(228, 'Mont Clair Brut', '50000', 28, '2023-05-17 19:04:01', '2023-05-17 19:04:01', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(229, 'Jagermeister     -------         1L', '59000', 26, '2023-05-17 19:04:20', '2023-05-17 19:04:20', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(230, 'Bailey’s         -------              1L', '71000', 26, '2023-05-17 19:04:39', '2023-05-17 19:04:39', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(231, 'Kahlua        --------                1L', '58000', 26, '2023-05-17 19:04:57', '2023-05-17 19:04:57', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(232, 'Cointreau    --------               1L', '82000', 26, '2023-05-17 19:05:15', '2023-05-17 19:05:15', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(233, 'LOS Vascos Sauvignon Blanc', '55000', 29, '2023-05-17 19:05:34', '2023-05-17 19:05:34', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(234, 'Altos Chardonnay', '76000', 29, '2023-05-17 19:05:48', '2023-05-17 19:05:48', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(235, 'Cloudy Bay Chardonay', '117000', 29, '2023-05-17 19:06:02', '2023-05-17 19:06:02', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(236, 'Cloudy Bay Sauvignon Blanc', '143000', 29, '2023-05-17 19:06:23', '2023-05-17 19:06:23', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(237, 'Aussieres Rouge', '45500', 30, '2023-05-17 19:06:39', '2023-05-17 19:06:39', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(238, 'Chateau d’Aussieres', '127500', 30, '2023-05-17 19:07:02', '2023-05-17 19:07:02', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(239, 'Legende Brodeaux Rouge', '45500', 30, '2023-05-17 19:07:28', '2023-05-17 19:07:28', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(240, 'Cape Mentella Cabernet Merlot', '127500', 30, '2023-05-17 19:07:49', '2023-05-17 19:07:49', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(241, 'Terrazas reserva Cabernet Sauvignon', '100000', 30, '2023-05-17 19:08:06', '2023-05-17 19:08:06', NULL, '', '', 'Beverage', '', '192.168.100.8', 1),
(242, 'Terrazas reserva Malbec', '100000', 30, '2023-05-17 19:08:25', '2023-05-17 19:08:25', NULL, '', '', 'Beverage', '', '192.168.100.8', 1);

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
(108, '2023_05_11_182636_add_categorie_id_to_order_items_table', 84),
(109, '2023_05_13_221609_create_print_configs_table', 85),
(110, '2023_05_13_232022_add_printer_info_to_menu_lists_table', 86),
(111, '2023_05_14_103027_add_printer_ip_id_to_menu_lists_table', 87);

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
(2, 'EPSONTMT81III', '192.168.88.128', '1', '2023-05-15 04:44:44', '2023-05-16 10:18:11');

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
(90, 'S30', 3, '2022-10-12 07:34:30', '2022-10-12 07:34:30');

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
(1, '3%', '3', 'Active', 1, '2022-12-22 03:47:54', '2022-12-22 04:41:02'),
(2, '6%', '6', 'Active', 1, '2022-12-22 03:48:16', '2022-12-22 03:48:16'),
(3, '10%', '10', 'Active', 1, '2023-01-17 04:25:09', '2023-01-17 04:25:09');

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
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$H4Dl/7aFMsm1xck7mqa.PehZTR5oWppsGZ09pO7VHsE7euBe.sCQi', '00001', '09123123122', '1/agc(N)991223', 'male', 'YGN', '1', 1, '2023-05-18 01:58:31', '192.168.100.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-18 01:58 AM', 'Probation', NULL, '2023-01-27 00:37:41', '2023-05-17 19:29:07', 123458),
(2, 'Waiter1', 'waiter@gmail.com', NULL, '$2y$10$YlWrTGwZXqnf1/D4ifbXu.xDm5kdkbG4uNrbfqll.RIb3xHWUwKzG', '00002', '0912312313', '1/abc(n)009221', 'male', 'YGN', '4', 1, '18/05/2023 00:48:44 am', '192.168.100.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Probation', 'nqdIc2vAJNuC7txwmSfDiVguqowJGVIbnv29GN5On1NtVAQRrE9JOnxJIQnA', '2023-01-26 23:30:19', '2023-05-17 18:18:44', 123456),
(3, 'Cashier1', 'cashier@gmail.com', NULL, '$2y$10$KL/3ZNF1BfbUI4ElchzP9uWxwfagZcAxiq9ISNMas439.IvR8ewrK', '00003', '09123123123', '1/abc(N)009221', 'male', 'YGN', '5', 1, '18/05/2023 00:49:57 am', '192.168.100.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Probation', NULL, '2022-11-14 03:17:19', '2023-05-17 18:19:57', 123457),
(4, 'Waiter2', 'waiter2@gmail.com', NULL, '$2y$10$37k4qpRw/3UTDJcuOWYz4O0Y0VzSGBmWPzQeqh4dqttW89g7zbNGW', '00004', '0912312312', '1/abc(N)009221', 'male', 'YGN', '4', 1, '18/05/2023 00:51:10 am', '192.168.100.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '2023-01-26 08:21 PM', 'Probation', NULL, '2023-01-26 13:52:34', '2023-05-17 18:21:10', 123123),
(5, 'Manager', 'manager@gmail.com', NULL, '$2y$10$AP0zY7YegX7vga/tIVvjyetYiwVTAjTXpenwFpwx3XIBHIVTrcHAy', 'EMP-00005', '09777181776', '-', 'male', '-', '2', 1, '18/05/2023 00:51:26 am', '192.168.100.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '2023-05-09 01:16 AM', 'Probation', NULL, '2023-05-08 18:47:35', '2023-05-17 18:21:26', 123451);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ingredient_lists`
--
ALTER TABLE `ingredient_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `members_lists`
--
ALTER TABLE `members_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_lists`
--
ALTER TABLE `menu_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `notice_boards`
--
ALTER TABLE `notice_boards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_infos`
--
ALTER TABLE `order_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_openings`
--
ALTER TABLE `stock_openings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
