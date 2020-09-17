-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 10 Sep 2020 pada 20.21
-- Versi Server: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `logins`
--

CREATE TABLE `logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_10_109940_create_user_memberships_table', 1),
(5, '2020_09_10_110336_create_user_akuns_table', 1),
(6, '2020_09_10_111646_create_logins_table', 1),
(7, '2020_09_10_112334_create_user_credit_cards_table', 1),
(8, '2020_09_10_112523_create_user_alamats_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_akuns`
--

CREATE TABLE `user_akuns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namaDepan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namaBelakang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ttl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('pria','wanita') COLLATE utf8mb4_unicode_ci NOT NULL,
  `membership` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user_akuns`
--

INSERT INTO `user_akuns` (`id`, `namaDepan`, `namaBelakang`, `ttl`, `gender`, `membership`, `created_at`, `updated_at`) VALUES
(1, 'riotinto', 'arjuna', 'bone 29 juni 1991', 'pria', 6, '2020-09-10 06:03:34', '2020-09-10 06:03:34'),
(2, 'riotinto', 'arjuna', 'bone 29 juni 1991', 'pria', 6, '2020-09-10 06:04:04', '2020-09-10 06:04:04'),
(3, 'riotinto', 'arjuna', 'bone 29 juni 1991', 'pria', 6, '2020-09-10 06:05:20', '2020-09-10 06:05:20'),
(4, 'riotinto', 'arjuna', 'bone 29 juni 1991', 'pria', 6, '2020-09-10 06:07:39', '2020-09-10 06:07:39'),
(5, 'riotinto', 'arjuna', 'bone 29 juni 1991', 'pria', 6, '2020-09-10 06:08:12', '2020-09-10 06:08:12'),
(6, 'riotinto', 'arjuna', 'bone 29 juni 1991', 'pria', 6, '2020-09-10 06:16:17', '2020-09-10 06:16:17'),
(7, 'riotinto', 'arjuna', 'bone 29 juni 1991', 'pria', 6, '2020-09-10 06:17:02', '2020-09-10 06:17:02'),
(8, 'riotinto', 'arjuna', 'bone 29 juni 1991', 'pria', 6, '2020-09-10 06:17:29', '2020-09-10 06:17:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_alamats`
--

CREATE TABLE `user_alamats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user_alamats`
--

INSERT INTO `user_alamats` (`id`, `user`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 3, 'depok', '2020-09-10 06:05:20', '2020-09-10 06:05:20'),
(2, 4, 'depok', '2020-09-10 06:07:39', '2020-09-10 06:07:39'),
(3, 5, 'depok', '2020-09-10 06:08:12', '2020-09-10 06:08:12'),
(4, 6, 'depok', '2020-09-10 06:16:18', '2020-09-10 06:16:18'),
(5, 7, 'depok', '2020-09-10 06:17:02', '2020-09-10 06:17:02'),
(6, 8, 'depok', '2020-09-10 06:17:29', '2020-09-10 06:17:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_credit_cards`
--

CREATE TABLE `user_credit_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe` enum('visa','master') COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user_credit_cards`
--

INSERT INTO `user_credit_cards` (`id`, `user`, `number`, `tipe`, `expired`, `created_at`, `updated_at`) VALUES
(1, 3, '0987654321', 'visa', '29-06-2029', '2020-09-10 06:05:20', '2020-09-10 06:05:20'),
(2, 4, '0987654321', 'visa', '29-06-2029', '2020-09-10 06:07:39', '2020-09-10 06:07:39'),
(3, 5, '0987654321', 'visa', '29-06-2029', '2020-09-10 06:08:12', '2020-09-10 06:08:12'),
(4, 6, '0987654321', 'visa', '29-06-2029', '2020-09-10 06:16:17', '2020-09-10 06:16:17'),
(5, 7, '0987654321', 'visa', '29-06-2029', '2020-09-10 06:17:02', '2020-09-10 06:17:02'),
(6, 8, '0987654321', 'visa', '29-06-2029', '2020-09-10 06:17:29', '2020-09-10 06:17:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_memberships`
--

CREATE TABLE `user_memberships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user_memberships`
--

INSERT INTO `user_memberships` (`id`, `tipe`, `harga`, `created_at`, `updated_at`) VALUES
(1, 'Silver', '100.000', '2020-09-10 05:17:15', '2020-09-10 05:17:15'),
(2, 'Gold', '200.000', '2020-09-10 05:19:01', '2020-09-10 05:19:01'),
(3, 'Platinum', '300.000', '2020-09-10 05:19:43', '2020-09-10 05:19:43'),
(4, 'Black', '500.000', '2020-09-10 05:20:06', '2020-09-10 05:20:06'),
(5, 'VIP', '1.000.000', '2020-09-10 05:20:28', '2020-09-10 05:20:28'),
(6, 'VVIP', '2.000.000', '2020-09-10 05:20:46', '2020-09-10 05:20:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `@` (`email`),
  ADD KEY `logins_user_foreign` (`user`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_akuns`
--
ALTER TABLE `user_akuns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_akuns_membership_foreign` (`membership`);

--
-- Indexes for table `user_alamats`
--
ALTER TABLE `user_alamats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_alamats_user_foreign` (`user`);

--
-- Indexes for table `user_credit_cards`
--
ALTER TABLE `user_credit_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_credit_cards_user_foreign` (`user`);

--
-- Indexes for table `user_memberships`
--
ALTER TABLE `user_memberships`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_akuns`
--
ALTER TABLE `user_akuns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user_alamats`
--
ALTER TABLE `user_alamats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_credit_cards`
--
ALTER TABLE `user_credit_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_memberships`
--
ALTER TABLE `user_memberships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `logins`
--
ALTER TABLE `logins`
  ADD CONSTRAINT `logins_user_foreign` FOREIGN KEY (`user`) REFERENCES `user_akuns` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_akuns`
--
ALTER TABLE `user_akuns`
  ADD CONSTRAINT `user_akuns_membership_foreign` FOREIGN KEY (`membership`) REFERENCES `user_memberships` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_alamats`
--
ALTER TABLE `user_alamats`
  ADD CONSTRAINT `user_alamats_user_foreign` FOREIGN KEY (`user`) REFERENCES `user_akuns` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_credit_cards`
--
ALTER TABLE `user_credit_cards`
  ADD CONSTRAINT `user_credit_cards_user_foreign` FOREIGN KEY (`user`) REFERENCES `user_akuns` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
