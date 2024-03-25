-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2022 at 12:53 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharma_last`
--

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` int(10) UNSIGNED NOT NULL,
  `batch_quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `expired_date` date NOT NULL,
  `date_of_entry` date NOT NULL,
  `pharmacy_id` int(10) UNSIGNED NOT NULL,
  `drug_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `batch_quantity`, `expired_date`, `date_of_entry`, `pharmacy_id`, `drug_id`, `created_at`, `updated_at`) VALUES
(1, 285, '2022-06-20', '2022-07-11', 1, 1, '2022-07-11 00:59:15', '2022-08-04 12:14:43'),
(2, 68, '2022-06-20', '2022-07-11', 1, 1, '2022-07-11 00:59:15', '2022-08-12 19:19:35'),
(3, 300, '2022-11-14', '2022-07-14', 1, 1, '2022-07-14 11:22:22', '2022-07-14 11:22:22'),
(4, 100, '2023-04-14', '2022-07-14', 1, 1, '2022-07-14 11:22:23', '2022-07-14 11:22:23'),
(5, 300, '2022-12-14', '2022-07-14', 1, 1, '2022-07-14 11:24:25', '2022-07-14 11:24:25'),
(6, 100, '2022-12-14', '2022-07-14', 1, 1, '2022-07-14 11:24:25', '2022-07-14 11:24:25'),
(7, 300, '2023-04-14', '2022-07-14', 1, 1, '2022-07-14 11:27:20', '2022-07-14 11:27:20'),
(8, 100, '2023-02-14', '2022-07-14', 1, 1, '2022-07-14 11:27:20', '2022-07-14 11:27:20'),
(9, 300, '2023-03-14', '2022-07-14', 1, 1, '2022-07-14 11:37:31', '2022-07-14 11:37:31'),
(10, 100, '2022-11-14', '2022-07-14', 1, 1, '2022-07-14 11:37:32', '2022-07-14 11:37:32'),
(11, 300, '2023-01-01', '2022-07-14', 1, 1, '2022-07-14 11:54:56', '2022-07-14 11:54:56'),
(12, 100, '2022-10-01', '2022-07-14', 1, 1, '2022-07-14 11:54:57', '2022-07-14 11:54:57'),
(13, 300, '2022-12-01', '2022-08-04', 1, 1, '2022-08-04 12:09:25', '2022-08-04 12:09:25'),
(14, 100, '2023-06-01', '2022-08-04', 1, 1, '2022-08-04 12:09:25', '2022-08-04 12:09:25'),
(15, 300, '2022-10-01', '2022-08-09', 1, 1, '2022-08-09 08:03:22', '2022-08-09 08:03:22'),
(16, 100, '2023-08-01', '2022-08-09', 1, 1, '2022-08-09 08:03:23', '2022-08-09 08:03:23'),
(17, 300, '2023-01-01', '2022-08-09', 1, 1, '2022-08-09 08:09:14', '2022-08-09 08:09:14'),
(18, 100, '2023-04-01', '2022-08-09', 1, 1, '2022-08-09 08:09:14', '2022-08-09 08:09:14');

-- --------------------------------------------------------

--
-- Table structure for table `buy_bill_orders`
--

CREATE TABLE `buy_bill_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `total_buy_price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `distributor_id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `pharmacy_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buy_bill_orders`
--

INSERT INTO `buy_bill_orders` (`id`, `date`, `total_buy_price`, `distributor_id`, `admin_id`, `pharmacy_id`, `created_at`, `updated_at`) VALUES
(4, '2022-07-11', 80000, 1, 1, 1, '2022-07-11 00:59:15', '2022-07-11 00:59:16'),
(5, '2022-07-14', 0, 1, 1, 1, '2022-07-14 11:19:43', '2022-07-14 11:19:43'),
(6, '2022-07-14', 80000, 1, 1, 1, '2022-07-14 11:22:22', '2022-07-14 11:22:24'),
(7, '2022-07-14', 80000, 1, 1, 1, '2022-07-14 11:24:25', '2022-07-14 11:24:26'),
(8, '2022-07-14', 0, 1, 1, 1, '2022-07-14 11:26:47', '2022-07-14 11:26:47'),
(9, '2022-07-14', 80000, 1, 1, 1, '2022-07-14 11:27:20', '2022-07-14 11:27:21'),
(10, '2022-07-14', 0, 1, 1, 1, '2022-07-14 11:36:11', '2022-07-14 11:36:11'),
(11, '2022-07-14', 80000, 1, 1, 1, '2022-07-14 11:37:31', '2022-07-14 11:37:32'),
(12, '2022-07-14', 80000, 1, 1, 1, '2022-07-14 11:54:56', '2022-07-14 11:54:57'),
(13, '2022-08-04', 80000, 1, 1, 1, '2022-08-04 12:09:25', '2022-08-04 12:09:25'),
(14, '2022-08-09', 80000, 1, 1, 1, '2022-08-09 08:03:22', '2022-08-09 08:03:23'),
(15, '2022-08-09', 80000, 1, 1, 1, '2022-08-09 08:09:14', '2022-08-09 08:09:16');

-- --------------------------------------------------------

--
-- Table structure for table `buy_item_orders`
--

CREATE TABLE `buy_item_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `batch_id` int(10) UNSIGNED NOT NULL,
  `buy_item_quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `buy_item_price` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `buy_bill_order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buy_item_orders`
--

INSERT INTO `buy_item_orders` (`id`, `batch_id`, `buy_item_quantity`, `buy_item_price`, `buy_bill_order_id`, `created_at`, `updated_at`) VALUES
(1, 1, 300, 200, 4, '2022-07-11 00:59:15', '2022-07-11 00:59:15'),
(2, 2, 100, 200, 4, '2022-07-11 00:59:15', '2022-07-11 00:59:15'),
(3, 3, 300, 200, 6, '2022-07-14 11:22:23', '2022-07-14 11:22:23'),
(4, 4, 100, 200, 6, '2022-07-14 11:22:23', '2022-07-14 11:22:23'),
(5, 5, 300, 200, 7, '2022-07-14 11:24:25', '2022-07-14 11:24:25'),
(6, 6, 100, 200, 7, '2022-07-14 11:24:25', '2022-07-14 11:24:25'),
(7, 7, 300, 200, 9, '2022-07-14 11:27:20', '2022-07-14 11:27:20'),
(8, 8, 100, 200, 9, '2022-07-14 11:27:20', '2022-07-14 11:27:20'),
(9, 9, 300, 200, 11, '2022-07-14 11:37:32', '2022-07-14 11:37:32'),
(10, 10, 100, 200, 11, '2022-07-14 11:37:32', '2022-07-14 11:37:32'),
(11, 11, 300, 200, 12, '2022-07-14 11:54:56', '2022-07-14 11:54:56'),
(12, 12, 100, 200, 12, '2022-07-14 11:54:57', '2022-07-14 11:54:57'),
(13, 13, 300, 200, 13, '2022-08-04 12:09:25', '2022-08-04 12:09:25'),
(14, 14, 100, 200, 13, '2022-08-04 12:09:25', '2022-08-04 12:09:25'),
(15, 15, 300, 200, 14, '2022-08-09 08:03:22', '2022-08-09 08:03:22'),
(16, 16, 100, 200, 14, '2022-08-09 08:03:23', '2022-08-09 08:03:23'),
(17, 17, 300, 200, 15, '2022-08-09 08:09:14', '2022-08-09 08:09:14'),
(18, 18, 100, 200, 15, '2022-08-09 08:09:15', '2022-08-09 08:09:15');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'pills', NULL, NULL),
(2, 'Liquid', NULL, NULL),
(3, 'Tablets', NULL, NULL),
(4, 'Drops', NULL, NULL),
(5, 'Suppositories', NULL, NULL),
(6, 'Inhalers', NULL, NULL),
(7, 'Injections', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'UNIPHARMA', NULL, NULL),
(2, 'uniph', '2022-08-06 13:33:10', '2022-08-06 13:33:10'),
(3, 'test company', '2022-08-12 10:47:57', '2022-08-12 10:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `distributors`
--

CREATE TABLE `distributors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `distributors`
--

INSERT INTO `distributors` (`id`, `name`, `email`, `phone`, `admin_id`, `location_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'dasd', 'dsa2s7@gmail.com', '0025324525', 1, 1, NULL, '2022-07-11 00:59:10', '2022-07-11 00:59:10'),
(2, 'dasd', 'dsa2g7@gmail.com', '0025324525', 1, 1, '2022-08-04 10:09:26', '2022-08-04 10:08:56', '2022-08-04 10:09:26'),
(3, '112233', 'dsa2g7555@gmail.com', '0123456789', 1, 3, NULL, '2022-08-04 13:11:33', '2022-08-12 15:53:20');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sell_price` int(11) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `scientific_material_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `name`, `barcode_number`, `sell_price`, `category_id`, `scientific_material_id`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'setamol', '00010100', 150, 1, 1, 1, '2022-08-09 15:28:16', '2022-08-12 18:47:35'),
(2, 'test drug', '00000011', 300, 2, 4, 3, '2022-08-12 10:47:57', '2022-08-12 10:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `pharmacy_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `user_id`, `pharmacy_id`, `date`, `created_at`, `updated_at`) VALUES
(6, 7, 1, '2022-08-04', '2022-08-04 10:12:25', '2022-08-04 10:12:25'),
(7, 8, 1, '2022-08-04', '2022-08-04 10:16:40', '2022-08-04 10:16:40'),
(8, 9, 1, '2022-08-12', '2022-08-12 12:24:12', '2022-08-12 12:24:12');

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
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'midan', '2022-07-11 00:47:59', '2022-07-11 00:47:59'),
(2, 'damas', '2022-08-11 14:25:02', '2022-08-11 14:25:02'),
(3, '1122', '2022-08-12 15:53:20', '2022-08-12 15:53:20');

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
(5, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(7, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(8, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(9, '2016_06_01_000004_create_oauth_clients_table', 1),
(10, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(47, '2014_10_11_090652_create_roles_table', 2),
(125, '2014_05_24_091040_create_locations_table', 3),
(129, '2022_05_24_080950_create_categories_table', 3),
(130, '2022_05_24_090302_create_scientific_materials_table', 3),
(131, '2022_05_24_090332_create_companies_table', 3),
(133, '2022_05_24_090442_create_batches_table', 3),
(134, '2022_05_24_091128_create_buy_bill_orders_table', 3),
(135, '2022_05_24_091208_create_buy_item_orders_table', 3),
(136, '2022_06_02_203536_create_storages_table', 3),
(137, '2022_06_02_203755_create_employees_table', 3),
(142, '2014_06_02_203340_create_pharmacies_table', 4),
(143, '2014_10_12_000000_create_users_table', 4),
(144, '2020_06_02_202053_create_distributors_table', 4),
(145, '2022_06_02_204036_create_sell_bell_orders_table', 5),
(146, '2022_06_02_204116_create_sell_item_orders_table', 5),
(147, '2022_06_02_205541_create_return_bell_orders_table', 5),
(148, '2022_06_02_210132_create_return_item_orders_table', 5),
(150, '2022_05_24_090440_create_drugs_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('01243b8daef03aa31ae891e8b007c945be616012bb1d95f00e77644e181d9aaccbb190a1db19b0d8', 4, '9676afab-da45-4877-957c-2bd366ef5ee6', 'Personal Access Token', '[]', 1, '2022-06-04 16:11:18', '2022-06-04 16:11:18', '2023-06-04 19:11:18'),
('05cf73b26144fb53268edd664c5c82ca2e9c5c014d4e0f309744244585e78d68e72c63be7f78c408', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-08-11 14:06:06', '2022-08-11 14:06:06', '2023-08-11 17:06:06'),
('1127f74d8235c051025f4f8f70a4f8513a5d76792a539ac19ee8ee198c13a5c81cc8b57f15ebc5ff', 4, '9676afab-da45-4877-957c-2bd366ef5ee6', 'Personal Access Token', '[]', 1, '2022-06-04 16:13:29', '2022-06-04 16:13:29', '2023-06-04 19:13:29'),
('12632bbaa5554dcb6f3446394be8c8dd89bf4970707618f8cbdc28f01aecb4cacf8c5d6d783d69d9', 4, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 1, '2022-06-04 18:34:36', '2022-06-04 18:34:36', '2023-06-04 21:34:36'),
('15e47392024277bd04e0aa1d117212b3ad6642655640949ec0b9762db0b3b22b14f78f30ec3f9571', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 1, '2022-07-05 11:46:11', '2022-07-05 11:46:11', '2023-07-05 14:46:11'),
('16daf9b78e83f68dd26a9876067f504ddb7f2ceb743b48ae48ea96316e02b4fbbd8966f6c498a0ab', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-08-12 16:42:26', '2022-08-12 16:42:26', '2023-08-12 19:42:26'),
('250f83671fd6486251e5b9b6bac0d31cc997b74ce1c02ee1cc54bf4f199fe96f21cdf6b1b828d539', 4, '9676afab-da45-4877-957c-2bd366ef5ee6', 'Personal Access Token', '[]', 1, '2022-06-04 16:18:50', '2022-06-04 16:18:50', '2023-06-04 19:18:50'),
('2616dfd322b8378550a2945bd8e4bf5ea7e0cda40423d5b40b8b1c7945dd649afbd41bb65a1bc5c2', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 1, '2022-07-05 15:03:38', '2022-07-05 15:03:38', '2023-07-05 18:03:38'),
('29b6e081e47cff584d89a12eec0cd5e0b3a7e4d6d515c7735df97f88cc5b8058668f2464990fd4b6', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-08-12 19:40:05', '2022-08-12 19:40:05', '2023-08-12 22:40:05'),
('369671220656c504f66c7b23c67e12c546b1a8c030ae9eda614f1050ab1728bb48ba8c1e4acf2240', 2, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 1, '2022-06-04 14:49:53', '2022-06-04 14:49:53', '2023-06-04 17:49:53'),
('38baedbb636f795e5a6e43636cfc593ecf50abb586cab66d3c57d17fa4eeb3f151eb592ff188d9a0', 4, '9676afab-da45-4877-957c-2bd366ef5ee6', 'Personal Access Token', '[]', 1, '2022-06-04 16:13:08', '2022-06-04 16:13:08', '2023-06-04 19:13:08'),
('39961c6f3761c4abc9073e34d06cbb012f90bcf1df36a57dee2f813d968caf1a5d0b32596cfc702e', 2, '9676afab-da45-4877-957c-2bd366ef5ee6', 'Personal Access Token', '[]', 1, '2022-06-04 16:08:30', '2022-06-04 16:08:30', '2023-06-04 19:08:30'),
('3c7065747c604d33acc5e5dac097ab1a1ea81f1396a8e37837c757cd265bcd421f6390151f9040db', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-08-12 16:54:08', '2022-08-12 16:54:08', '2023-08-12 19:54:08'),
('3ebc4b4911e7072443322a25087e57a52d9a54a5f34ca3a45dbab61d599195b8d59f69c2a03492ef', 2, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 1, '2022-06-04 15:57:46', '2022-06-04 15:57:46', '2023-06-04 18:57:46'),
('3fde50d99503d646912a075986fa6dac15028f3d15eebe55dbfd70f719fa28863dcd4348e4b92e22', 9, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-08-12 12:24:30', '2022-08-12 12:24:30', '2023-08-12 15:24:30'),
('44b2d16e51dbe5a2c45388f9630ec04a90bfb5cda8d0bf238707637fc931d865f6463bb1c076592a', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-07-11 00:48:12', '2022-07-11 00:48:12', '2023-07-11 03:48:12'),
('4c89f79fb5ade500f3f524dcc77f4cd4c3bce990eb434f188d3cd0dd5510561ce72481b503dee647', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-08-12 15:13:12', '2022-08-12 15:13:12', '2023-08-12 18:13:12'),
('5b197ea736fbb552a9369f774709e6c9c42bf9dd6ebd7a5974705bf0792d670af30965112f51ced0', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 1, '2022-07-10 09:23:54', '2022-07-10 09:23:54', '2023-07-10 12:23:54'),
('6f60a88edd445607e4f45a27694a5ab0f5a588ef506b67369def7791389d6f34305e3283686e5576', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-08-12 16:39:11', '2022-08-12 16:39:11', '2023-08-12 19:39:11'),
('739ba646c9742ad950ae50a2a5ca4c62d2d1fee37f3b65c46c29e8b7748f399a891b36eb2dddf2a0', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-08-12 12:25:22', '2022-08-12 12:25:22', '2023-08-12 15:25:22'),
('7fccdd59c05e445f510c346bdd3ad9d4f0588d2b9cdc97558ee25a8b7885c400622b7606faecded2', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 1, '2022-06-06 22:05:52', '2022-06-06 22:05:52', '2023-06-07 01:05:52'),
('82e6f18cf290a92a830fd83d6f47f8ef9866aeeeadadf731b3c1e3a378810264ab6516b8a249f609', 4, '9676afab-da45-4877-957c-2bd366ef5ee6', 'Personal Access Token', '[]', 1, '2022-06-04 16:12:26', '2022-06-04 16:12:26', '2023-06-04 19:12:26'),
('8db096656b73c26626d805d15bc5f793cecf41e26700edbb6407323ee0a6172cd1a619b0ac5a0cb1', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 1, '2022-07-06 14:28:58', '2022-07-06 14:28:58', '2023-07-06 17:28:58'),
('a358ac527f4839c1f7e6d73096c50c8fab1df0119076831965c56796b2b2fba96c9e67c5849c499c', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-07-11 00:56:13', '2022-07-11 00:56:13', '2023-07-11 03:56:13'),
('a4812da1b940223a124694febec9a1ac02ba978ba16d21d2b10d9eac85e95271e8dec2320edafab5', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-08-12 16:38:11', '2022-08-12 16:38:11', '2023-08-12 19:38:11'),
('ab4b582357acc6dc685a4557c1d2f14b79b89d58b66b8bd5fca3216632e1b1c8f3576f96034c2877', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-08-09 08:08:32', '2022-08-09 08:08:32', '2023-08-09 11:08:32'),
('b233c3c05c44e437d0e00745db0b6d89858ad086222f412689ad428ac5d6c3568437cec30c59e553', 4, '9676afab-da45-4877-957c-2bd366ef5ee6', 'Personal Access Token', '[]', 1, '2022-06-04 16:22:32', '2022-06-04 16:22:32', '2023-06-04 19:22:32'),
('cadd1c088b071afbe34d28627a60912d5cae6c2eec49aa7df1fba15b407c4729d3e317d375c22f89', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-08-11 14:02:45', '2022-08-11 14:02:45', '2023-08-11 17:02:45'),
('ce7902583014db4ac6e04c30e8159cf9bb3bb69a34c0cdae8981fdf601321bf1422e5a43ed96738d', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-08-12 16:40:35', '2022-08-12 16:40:35', '2023-08-12 19:40:35'),
('d9cad8137fee0f0aa3ab75d38ff99f378cc8ad2c97b80c42e9d9ffac6f6688843ab2560e5e16951b', 4, '9676afab-da45-4877-957c-2bd366ef5ee6', 'Personal Access Token', '[]', 1, '2022-06-04 16:20:57', '2022-06-04 16:20:57', '2023-06-04 19:20:57'),
('e32e1676800bfaa0294c938257e66efcf41fcbef5c06a105196447c396789e45165a32b43ccda27b', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'Enas', '[]', 0, '2022-08-06 12:18:03', '2022-08-06 12:18:03', '2023-08-06 15:18:03'),
('ecf5b149d6e02d838ebbc3d2f589cada94a50c19e72634756d8d9fe6b2212a474d016062d1bc932e', 4, '9676afab-da45-4877-957c-2bd366ef5ee6', 'Personal Access Token', '[]', 1, '2022-06-04 16:11:51', '2022-06-04 16:11:51', '2023-06-04 19:11:51'),
('eeab7821043cb04e14a028776193387450040375aa04269dce713a99c9631eef4bb55aac1780b07d', 4, '9676afab-da45-4877-957c-2bd366ef5ee6', 'Personal Access Token', '[]', 1, '2022-06-04 16:22:12', '2022-06-04 16:22:12', '2023-06-04 19:22:12'),
('f9a67e3e262540c4dbf6ee218cb9d147bce715448224504353c57f01ccf53419602d74de9443713b', 2, '9676afab-da45-4877-957c-2bd366ef5ee6', 'Personal Access Token', '[]', 1, '2022-06-04 16:10:30', '2022-06-04 16:10:30', '2023-06-04 19:10:30'),
('fa521ea31b83e1489a185be36ca30812b60cbdfb1bc951aa5b54f46dd1d627e92b255ae02e02f345', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-07-10 10:02:04', '2022-07-10 10:02:04', '2023-07-10 13:02:04'),
('fed9d008f633be19b4108c8dd860320491be15b88547d946d925f46ca9322bf55026ea90a4821dd7', 1, '9676afab-da45-4877-957c-2bd366ef5ee6', 'A7med', '[]', 0, '2022-08-12 12:32:05', '2022-08-12 12:32:05', '2023-08-12 15:32:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('9676afab-da45-4877-957c-2bd366ef5ee6', NULL, 'Laravel Personal Access Client', 'ymiGd1p4ElQf6Pq8EExYNba3ROe6PCGmw6ow2wTX', NULL, 'http://localhost', 1, 0, 0, '2022-06-04 14:49:35', '2022-06-04 14:49:35'),
('9676afad-622c-4ea5-aefc-f7ec15924091', NULL, 'Laravel Password Grant Client', 'GLwOtKMYPhYasYL9UE3kXM61Fltd2C7eMd6lddFZ', 'users', 'http://localhost', 0, 1, 0, '2022-06-04 14:49:36', '2022-06-04 14:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '9676afab-da45-4877-957c-2bd366ef5ee6', '2022-06-04 14:49:36', '2022-06-04 14:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `pharmacies`
--

CREATE TABLE `pharmacies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `warning_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pharmacies`
--

INSERT INTO `pharmacies` (`id`, `name`, `location_id`, `warning_status`, `created_at`, `updated_at`) VALUES
(1, 'مريم', 1, 0, '2022-07-11 00:56:07', '2022-07-11 00:56:07');

-- --------------------------------------------------------

--
-- Table structure for table `return_bell_orders`
--

CREATE TABLE `return_bell_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `total_return_price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sell_bell_order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `pharmacy_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `return_bell_orders`
--

INSERT INTO `return_bell_orders` (`id`, `date`, `total_return_price`, `sell_bell_order_id`, `user_id`, `pharmacy_id`, `created_at`, `updated_at`) VALUES
(3, '2022-08-09', 6000, 1, 1, 1, '2022-08-09 10:55:01', '2022-08-09 10:55:01'),
(8, '2022-08-11', 200, 1, 1, 1, '2022-08-11 10:59:53', '2022-08-11 10:59:54'),
(11, '2022-08-11', 100, 2, 1, 1, '2022-08-11 14:27:54', '2022-08-11 14:27:54'),
(12, '2022-08-12', 750, 3, 1, 1, '2022-08-12 19:03:46', '2022-08-12 19:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `return_item_orders`
--

CREATE TABLE `return_item_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_item_quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `return_item_price` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `return_bell_order_id` int(10) UNSIGNED NOT NULL,
  `batch_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `return_item_orders`
--

INSERT INTO `return_item_orders` (`id`, `return_item_quantity`, `return_item_price`, `return_bell_order_id`, `batch_id`, `created_at`, `updated_at`) VALUES
(5, 30, 100, 3, 1, '2022-08-09 10:55:01', '2022-08-09 10:55:01'),
(6, 30, 100, 3, 1, '2022-08-09 10:55:01', '2022-08-09 10:55:01'),
(7, 1, 100, 8, 2, '2022-08-11 10:59:53', '2022-08-11 10:59:53'),
(8, 1, 100, 8, 2, '2022-08-11 10:59:53', '2022-08-11 10:59:53'),
(11, 1, 100, 11, 2, '2022-08-11 14:27:54', '2022-08-11 14:27:54'),
(12, 5, 150, 12, 2, '2022-08-12 19:03:46', '2022-08-12 19:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'employee', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scientific_materials`
--

CREATE TABLE `scientific_materials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scientific_materials`
--

INSERT INTO `scientific_materials` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'para', '2022-07-11 00:50:41', '2022-07-11 00:50:41'),
(2, 'par', '2022-08-10 01:40:37', '2022-08-10 01:40:37'),
(3, 'pra', '2022-08-10 03:11:26', '2022-08-10 03:11:26'),
(4, 'test SN', '2022-08-12 10:47:57', '2022-08-12 10:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `sell_bell_orders`
--

CREATE TABLE `sell_bell_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `total_sell_price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL,
  `pharmacy_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sell_bell_orders`
--

INSERT INTO `sell_bell_orders` (`id`, `date`, `total_sell_price`, `user_id`, `pharmacy_id`, `created_at`, `updated_at`) VALUES
(1, '2022-08-09', 500, 1, 1, '2022-08-09 10:49:08', '2022-08-09 10:49:08'),
(2, '2022-08-11', 500, 1, 1, '2022-08-11 14:26:17', '2022-08-11 14:26:17'),
(3, '2022-08-12', 500, 9, 1, '2022-08-12 12:25:02', '2022-08-12 12:25:02'),
(4, '2022-08-12', 300, 1, 1, '2022-08-12 19:19:35', '2022-08-12 19:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `sell_item_orders`
--

CREATE TABLE `sell_item_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `batch_id` int(10) UNSIGNED NOT NULL,
  `sell_item_quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `sell_item_price` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `sell_bell_order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sell_item_orders`
--

INSERT INTO `sell_item_orders` (`id`, `batch_id`, `sell_item_quantity`, `sell_item_price`, `sell_bell_order_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 100, 1, '2022-08-09 10:49:08', '2022-08-09 10:49:08'),
(2, 2, 3, 100, 1, '2022-08-09 10:49:08', '2022-08-09 10:49:08'),
(3, 2, 5, 100, 2, '2022-08-11 14:26:17', '2022-08-11 14:26:17'),
(4, 2, 5, 100, 3, '2022-08-12 12:25:02', '2022-08-12 12:25:02'),
(5, 2, 2, 150, 4, '2022-08-12 19:19:35', '2022-08-12 19:19:35');

-- --------------------------------------------------------

--
-- Table structure for table `storages`
--

CREATE TABLE `storages` (
  `id` int(10) UNSIGNED NOT NULL,
  `storage_quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `pharmacy_id` int(10) UNSIGNED NOT NULL,
  `drug_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `storages`
--

INSERT INTO `storages` (`id`, `storage_quantity`, `pharmacy_id`, `drug_id`, `created_at`, `updated_at`) VALUES
(1, 3565, 1, 1, '2022-07-11 00:59:15', '2022-08-12 19:19:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pharmacy_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `pharmacy_id`, `role_id`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ahmed', 'ahmedal@gmail.com', '094545684', NULL, '$2y$10$e8oshOT9A1vNarlijWJ7dOjOFU7hH5TafPIe7ZOcktHy4IFpwA.Di', 1, 1, NULL, NULL, '2022-07-11 00:56:07', '2022-07-11 00:56:07'),
(3, 'ahmedeeee', 'ahmedl@gmail.com', '094789453', NULL, '$2y$10$N7iWFVkXNHTnFDQusMtHCury111EZIkPR5f05kwgtPZmrkN5dZuBC', 1, 1, NULL, NULL, '2022-08-04 10:00:44', '2022-08-04 10:00:44'),
(4, 'ahmedeeee', 'ahmeddl@gmail.com', '094789453', NULL, '$2y$10$0qBl39pdifV8rHPPqu5vNu60Yggj/bsvHhTA9nbgSkFeJRM7RVZqK', 1, 1, NULL, '2022-08-04 10:10:16', '2022-08-04 10:02:55', '2022-08-04 10:10:16'),
(6, 'ahmedeeee', 'ahmedd7lh@gmail.com', '094789453', NULL, '$2y$10$Zf1ZPQ0Q2t.6E8strpSVzeBPPmOjVrpRx7b5HcXTU1D2dKYGq8X8W', 1, 1, NULL, NULL, '2022-08-04 10:11:30', '2022-08-04 10:11:30'),
(7, 'ahmedeeee', 'ahmedd7l@gmail.com', '094789453', NULL, '$2y$10$q4tGPP3MWpM0IpwsQU72deJ3ULDX.L2Ujjt7qEee9jVX7Ozks24wi', 1, 2, NULL, NULL, '2022-08-04 10:12:25', '2022-08-04 10:12:25'),
(8, '13335', '121222@gmail.com', '0123456789', NULL, '$2y$10$sW9FiiIPnvcZ7O7IVsV7DOWsAzvFYhDcTbwG5/wUnIszQaBCVs9gq', 1, 2, NULL, NULL, '2022-08-04 10:16:40', '2022-08-12 15:52:57'),
(9, 'Muhammad', 'muhammad@gmail.com', '0947079045', NULL, '$2y$10$JMFbZiGa4K4KB4TBYeogJ.RUuw2KA/iAZ7vXqpgLs9nsmXv6yGZu6', 1, 2, NULL, NULL, '2022-08-12 12:24:12', '2022-08-12 12:24:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batches_pharmacy_id_foreign` (`pharmacy_id`),
  ADD KEY `batches_drug_id_foreign` (`drug_id`);

--
-- Indexes for table `buy_bill_orders`
--
ALTER TABLE `buy_bill_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buy_bill_orders_distributor_id_foreign` (`distributor_id`),
  ADD KEY `buy_bill_orders_admin_id_foreign` (`admin_id`),
  ADD KEY `buy_bill_orders_pharmacy_id_foreign` (`pharmacy_id`);

--
-- Indexes for table `buy_item_orders`
--
ALTER TABLE `buy_item_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buy_item_orders_batch_id_foreign` (`batch_id`),
  ADD KEY `buy_item_orders_buy_bill_order_id_foreign` (`buy_bill_order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `distributors`
--
ALTER TABLE `distributors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `distributors_email_unique` (`email`),
  ADD KEY `distributors_admin_id_foreign` (`admin_id`),
  ADD KEY `distributors_location_id_foreign` (`location_id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `drugs_barcode_number_unique` (`barcode_number`),
  ADD KEY `drugs_category_id_foreign` (`category_id`),
  ADD KEY `drugs_scientific_material_id_foreign` (`scientific_material_id`),
  ADD KEY `drugs_company_id_foreign` (`company_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_user_id_foreign` (`user_id`),
  ADD KEY `employees_pharmacy_id_foreign` (`pharmacy_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pharmacies`
--
ALTER TABLE `pharmacies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharmacies_location_id_foreign` (`location_id`);

--
-- Indexes for table `return_bell_orders`
--
ALTER TABLE `return_bell_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_bell_orders_sell_bell_order_id_foreign` (`sell_bell_order_id`),
  ADD KEY `return_bell_orders_user_id_foreign` (`user_id`),
  ADD KEY `return_bell_orders_pharmacy_id_foreign` (`pharmacy_id`);

--
-- Indexes for table `return_item_orders`
--
ALTER TABLE `return_item_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_item_orders_return_bell_order_id_foreign` (`return_bell_order_id`),
  ADD KEY `return_item_orders_batch_id_foreign` (`batch_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scientific_materials`
--
ALTER TABLE `scientific_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sell_bell_orders`
--
ALTER TABLE `sell_bell_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_bell_orders_user_id_foreign` (`user_id`),
  ADD KEY `sell_bell_orders_pharmacy_id_foreign` (`pharmacy_id`);

--
-- Indexes for table `sell_item_orders`
--
ALTER TABLE `sell_item_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_item_orders_batch_id_foreign` (`batch_id`),
  ADD KEY `sell_item_orders_sell_bell_order_id_foreign` (`sell_bell_order_id`);

--
-- Indexes for table `storages`
--
ALTER TABLE `storages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `storages_pharmacy_id_foreign` (`pharmacy_id`),
  ADD KEY `storages_drug_id_foreign` (`drug_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_pharmacy_id_foreign` (`pharmacy_id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `buy_bill_orders`
--
ALTER TABLE `buy_bill_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `buy_item_orders`
--
ALTER TABLE `buy_item_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `distributors`
--
ALTER TABLE `distributors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharmacies`
--
ALTER TABLE `pharmacies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `return_bell_orders`
--
ALTER TABLE `return_bell_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `return_item_orders`
--
ALTER TABLE `return_item_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `scientific_materials`
--
ALTER TABLE `scientific_materials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sell_bell_orders`
--
ALTER TABLE `sell_bell_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sell_item_orders`
--
ALTER TABLE `sell_item_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `storages`
--
ALTER TABLE `storages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batches`
--
ALTER TABLE `batches`
  ADD CONSTRAINT `batches_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `batches_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `buy_bill_orders`
--
ALTER TABLE `buy_bill_orders`
  ADD CONSTRAINT `buy_bill_orders_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buy_bill_orders_distributor_id_foreign` FOREIGN KEY (`distributor_id`) REFERENCES `distributors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buy_bill_orders_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `buy_item_orders`
--
ALTER TABLE `buy_item_orders`
  ADD CONSTRAINT `buy_item_orders_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buy_item_orders_buy_bill_order_id_foreign` FOREIGN KEY (`buy_bill_order_id`) REFERENCES `buy_bill_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `distributors`
--
ALTER TABLE `distributors`
  ADD CONSTRAINT `distributors_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `distributors_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drugs`
--
ALTER TABLE `drugs`
  ADD CONSTRAINT `drugs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `drugs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `drugs_scientific_material_id_foreign` FOREIGN KEY (`scientific_material_id`) REFERENCES `scientific_materials` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pharmacies`
--
ALTER TABLE `pharmacies`
  ADD CONSTRAINT `pharmacies_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `return_bell_orders`
--
ALTER TABLE `return_bell_orders`
  ADD CONSTRAINT `return_bell_orders_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `return_bell_orders_sell_bell_order_id_foreign` FOREIGN KEY (`sell_bell_order_id`) REFERENCES `sell_bell_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `return_bell_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `return_item_orders`
--
ALTER TABLE `return_item_orders`
  ADD CONSTRAINT `return_item_orders_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `return_item_orders_return_bell_order_id_foreign` FOREIGN KEY (`return_bell_order_id`) REFERENCES `return_bell_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sell_bell_orders`
--
ALTER TABLE `sell_bell_orders`
  ADD CONSTRAINT `sell_bell_orders_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sell_bell_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sell_item_orders`
--
ALTER TABLE `sell_item_orders`
  ADD CONSTRAINT `sell_item_orders_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sell_item_orders_sell_bell_order_id_foreign` FOREIGN KEY (`sell_bell_order_id`) REFERENCES `sell_bell_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `storages`
--
ALTER TABLE `storages`
  ADD CONSTRAINT `storages_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `storages_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
