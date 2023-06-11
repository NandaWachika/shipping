-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 11, 2023 at 01:14 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deliverystore`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_customer` int(11) NOT NULL,
  `alamat_pengirim` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_penerima` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_pengiriman` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berat_barang` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga_ongkir` decimal(13,2) DEFAULT NULL,
  `matauang` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_customer`, `alamat_pengirim`, `alamat_penerima`, `jenis_pengiriman`, `berat_barang`, `harga_ongkir`, `matauang`) VALUES
(1, 'Jakarta Selatan', 'Jakarta Pusat', 'Yes', '8kg', '18000.00', 'IDR'),
(2, 'Jakarta Selatan', 'Jakarta Timur', 'Yes', '8kg', '18000.00', 'IDR'),
(3, 'Jakarta Selatan', 'Jakarta Timur', 'Yes', '8kg', '18000.00', 'IDR'),
(4, 'Jakarta Selatan', 'Jakarta Timur', 'Yes', '8kg', '18000.00', 'IDR');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id_order` int(11) NOT NULL COMMENT 'id_order',
  `id_customer` int(11) NOT NULL COMMENT 'id customer',
  `alamat_penerima` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'alamat_penerima',
  `jenis_pengiriman` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'jenis_pengiriman',
  `jadwal_pengiriman` date DEFAULT NULL,
  `total_harga` decimal(13,2) DEFAULT NULL,
  `matauang` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'matauang'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE `shipment` (
  `nomer_resi` int(11) NOT NULL COMMENT 'nomer_resi',
  `id_order` int(11) NOT NULL COMMENT 'id_order',
  `id_customer` int(11) NOT NULL COMMENT 'id customer',
  `alamat_penerima` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'alamat_penerima',
  `jenis_pengiriman` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'jenis_pengiriman',
  `jadwal_pengiriman` date NOT NULL,
  `total_harga` decimal(13,2) DEFAULT NULL,
  `matauang` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'matauang',
  `status_pengiriman` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'status_pengiriman',
  `estimasi_pengiriman` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'estimasi_pengiriman',
  `lokasi_barang` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'lokasi_barang',
  `konfirmasi_pengiriman` enum('Terima Barang','Tidak Terima Barang','Kembalikan Barang','Proses Pengiriman') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Proses Pengiriman'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipment`
--

INSERT INTO `shipment` (`nomer_resi`, `id_order`, `id_customer`, `alamat_penerima`, `jenis_pengiriman`, `jadwal_pengiriman`, `total_harga`, `matauang`, `status_pengiriman`, `estimasi_pengiriman`, `lokasi_barang`, `konfirmasi_pengiriman`) VALUES
(1, 112, 1, 'Jakarta Timur', 'Yes', '2013-06-10', '18000.00', 'IDR', 'Trans', '3 hari', 'Gudang Jakarta', 'Terima Barang'),
(2, 112, 2, 'Jakarta Timur', 'Yes', '2013-06-10', '18000.00', 'IDR', 'Kurir', '3 hari', NULL, 'Proses Pengiriman'),
(3, 115, 4, 'Jakarta Timur', 'Yes', '2013-06-10', '18000.00', 'IDR', NULL, NULL, NULL, 'Proses Pengiriman'),
(4, 112, 2, 'Jakarta Timur', 'Yes', '2013-06-10', '18000.00', 'IDR', 'Trans Pelabuhan', '3 hari', NULL, 'Proses Pengiriman');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_customer`) USING BTREE;

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id_order`,`id_customer`,`alamat_penerima`,`jenis_pengiriman`);

--
-- Indexes for table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`nomer_resi`,`id_order`,`id_customer`,`jadwal_pengiriman`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id_order';

--
-- AUTO_INCREMENT for table `shipment`
--
ALTER TABLE `shipment`
  MODIFY `nomer_resi` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomer_resi', AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
