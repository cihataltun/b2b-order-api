-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: mysql
-- Üretim Zamanı: 04 Ağu 2025, 13:37:39
-- Sunucu sürümü: 8.0.32
-- PHP Sürümü: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `laravel`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_03_145758_create_products_table', 1),
(5, '2025_08_03_150135_create_orders_table', 1),
(6, '2025_08_03_150149_create_order_items_table', 1),
(7, '2025_08_04_095108_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` enum('pending','approved','shipped') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 2, 'pending', 3051.00, '2025-08-04 13:13:25', '2025-08-04 13:13:25'),
(2, 6, 'pending', 1875.00, '2025-08-04 13:14:58', '2025-08-04 13:14:58');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 1500.00, '2025-08-04 13:13:25', '2025-08-04 13:13:25'),
(2, 1, 2, 2, 25.50, '2025-08-04 13:13:25', '2025-08-04 13:13:25'),
(3, 2, 3, 5, 75.00, '2025-08-04 13:14:58', '2025-08-04 13:14:58'),
(4, 2, 4, 5, 300.00, '2025-08-04 13:14:58', '2025-08-04 13:14:58');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'auth_token', 'aabbe67c40fe8241c2ed88b7d9bb25deabdb3344908bf87f8aa9cf369603b6f8', '[\"*\"]', NULL, NULL, '2025-08-04 13:09:57', '2025-08-04 13:09:57'),
(2, 'App\\Models\\User', 2, 'auth_token', '88a2cf61fd1978bbf8d09ddfa33a9de788c23cb16d099015494562d313b657ac', '[\"*\"]', '2025-08-04 13:13:25', NULL, '2025-08-04 13:12:20', '2025-08-04 13:13:25'),
(3, 'App\\Models\\User', 6, 'auth_token', 'abe81ef5bce57f3dcdb37ebe8f86b7d4891ace177343ed249fa17c9cf8bd4d00', '[\"*\"]', '2025-08-04 13:14:58', NULL, '2025-08-04 13:14:22', '2025-08-04 13:14:58'),
(4, 'App\\Models\\User', 1, 'auth_token', '527c572367e4b57ea387cfd796dc9cb03b9243e39c914d9798138fa5d90a038b', '[\"*\"]', '2025-08-04 13:26:21', NULL, '2025-08-04 13:16:15', '2025-08-04 13:26:21');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `stock_quantity` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `price`, `stock_quantity`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', 'LAP-101', 1500.00, 48, '2025-08-04 13:07:56', '2025-08-04 13:13:25'),
(2, 'Mouse', 'MOU-202', 25.50, 198, '2025-08-04 13:07:56', '2025-08-04 13:13:25'),
(3, 'Akıllı Saat', 'SAAT-456', 1000.00, 95, '2025-08-04 13:07:56', '2025-08-04 13:23:42'),
(4, 'Monitor', 'MON-404', 300.00, 70, '2025-08-04 13:07:56', '2025-08-04 13:14:58');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','customer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@example.com', NULL, '$2y$12$UEyvVVy7T72dvbpnfLuD4edXDKMuF9gVHGMo/wY/NRqde4XrttM1.', 'admin', NULL, '2025-08-04 13:07:53', '2025-08-04 13:07:53'),
(2, 'Customer 1', 'customer1@example.com', NULL, '$2y$12$P3jD/Q/AjcuPrdgjRBgNneEcEbReqvEoyI./IVbhjIgvTT8A1eZD2', 'customer', NULL, '2025-08-04 13:07:54', '2025-08-04 13:07:54'),
(3, 'Customer 2', 'customer2@example.com', NULL, '$2y$12$RIhHKtX3vas5sz70wfREDeBNh1i1K.IEeRfbalxXI.wVI7VqmYu/2', 'customer', NULL, '2025-08-04 13:07:54', '2025-08-04 13:07:54'),
(4, 'Customer 3', 'customer3@example.com', NULL, '$2y$12$6d5IJO6P4T5W0qTic.APGuw11qF5VaCvwYb8mQci4GZ20tqEnj6gy', 'customer', NULL, '2025-08-04 13:07:54', '2025-08-04 13:07:54'),
(5, 'Customer 4', 'customer4@example.com', NULL, '$2y$12$VgMoK5ym9mJvEP77qktlp.2ZPuAgePJjwESeI4uABM49yp3UKfUi2', 'customer', NULL, '2025-08-04 13:07:54', '2025-08-04 13:07:54'),
(6, 'Customer 5', 'customer5@example.com', NULL, '$2y$12$uaAacGn9dOzQQIpKDewosumk/.lp1EsJMQKIOUotG8UDOQPGjnKDG', 'customer', NULL, '2025-08-04 13:07:55', '2025-08-04 13:07:55'),
(7, 'Customer 6', 'customer6@example.com', NULL, '$2y$12$9temsEQUQidtNOkwzgcN0.Y2./Pme1fBO0NGT2ma7giiaFk1JjzRu', 'customer', NULL, '2025-08-04 13:07:55', '2025-08-04 13:07:55'),
(8, 'Customer 7', 'customer7@example.com', NULL, '$2y$12$vkc5amGiTpjs08hJhBCRsemTxxEW7yp8cvs7O3RAfTZzFBkM1pq42', 'customer', NULL, '2025-08-04 13:07:55', '2025-08-04 13:07:55'),
(9, 'Customer 8', 'customer8@example.com', NULL, '$2y$12$oahkJA2iH1Pemet4NE1bn.1fCWOOVJOS5zhnpuWy3/HOUXD0nkQBa', 'customer', NULL, '2025-08-04 13:07:55', '2025-08-04 13:07:55'),
(10, 'Customer 9', 'customer9@example.com', NULL, '$2y$12$ovENCwHoUxT7M1xJj7iAq.63dSz2CNEa4nBMaP2LdQwa4PZUHr72i', 'customer', NULL, '2025-08-04 13:07:56', '2025-08-04 13:07:56');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Tablo için indeksler `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Tablo için indeksler `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Tablo için indeksler `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Tablo için indeksler `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Tablo için indeksler `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`);

--
-- Tablo için indeksler `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
