-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2020 at 05:38 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar_brg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar_brg`) VALUES
(2, 'Kamera', 'canon 600d', 'Elektronik', 5000000, 12, 'kamera.jpg'),
(3, 'Handphone', 'Samsung Galaxy A20', 'Elektronik', 2000000, 22, 'hp.jpg'),
(4, 'Laptop', 'macbook pro 13 inch', 'Elektronik', 14000000, 4, 'laptop.jpg'),
(6, 'dress', 'dress batik kombinasi', 'Pakaian Wanita', 30000, 19, 'dress.jpg'),
(7, 'Sepatu Anak1', 'merek ando', 'Pakaian Anak', 100000, 56, 'sepatuanak.jpg'),
(8, 'Lingerie', 'Pakaian Tidur Wanita', 'Pakaian Wanita', 600000, 55, 'lingerie.jpg'),
(9, 'Barbel', 'Barbel 50 kg', 'Peralatan Olahraga', 350000, 12, 'barbel.jpg'),
(10, 'Bola', 'Bola Sepak Bola', 'Peralatan Olahraga', 600000, 33, 'bola.jpg'),
(11, 'Tas Wanita', 'Tas Merek gucci', 'Pakaian Wanita', 64000000, 41, 'taswanita.jpg'),
(13, 'Radio', 'Radio Jadul', 'Elektronik', 23000, 2, 'radio.jpg'),
(14, 'Kaos Anak', 'Kaos Anak merek nevada', 'Pakaian Anak', 100000, 12, 'kaosanak.jpg'),
(15, 'Jaket Anak', 'Jaket Anak merek disney', 'Pakaian Anak', 350000, 56, 'jaketanak.jpg'),
(16, 'Tas Sekolah', 'Tas Sekolah Anak merek fila', 'Pakaian Anak', 64000000, 3, 'tasanak.jpg'),
(17, 'Sandal wanita', 'Sandal Wanita merek gucci', 'Pakaian Wanita', 44000000, 19, 'sepatuwanita.jpg'),
(18, 'Raket', 'Raket Badminton merek lining', 'Peralatan Olahraga', 100000, 12, 'raket.jpg'),
(19, 'Kabel', 'Kabel Lan', 'Elektronik', 20000, 13, 'Kabel');

-- --------------------------------------------------------

--
-- Table structure for table `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(1, 'juned', 'Jl. Taman AA No.10 , RT.006 RW.04, Kel. Cengkareng Barat, Kec. Cengkareng', '2020-09-21 18:31:36', '2020-09-22 18:31:36'),
(2, 'hilman', 'jakarta', '2020-09-21 18:35:26', '2020-09-22 18:35:26'),
(3, '', '', '2020-09-21 23:59:56', '2020-09-22 23:59:56'),
(4, '', '', '2020-09-25 18:38:24', '2020-09-26 18:38:24'),
(5, '', '', '2020-09-25 18:38:46', '2020-09-26 18:38:46'),
(6, '', '', '2020-09-25 18:39:56', '2020-09-26 18:39:56');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(1, 1, 2, 'Kamera', 2, 5000000, ''),
(2, 1, 3, 'Handphone', 1, 2000000, ''),
(3, 2, 3, 'Handphone', 1, 2000000, ''),
(4, 3, 1, 'sepatu Sniker', 1, 350000, ''),
(5, 3, 4, 'Laptop', 1, 14000000, ''),
(6, 4, 1, 'sepatu Sniker 21', 1, 350000, ''),
(7, 5, 8, 'Lingerie', 1, 600000, ''),
(8, 6, 13, 'Radio', 1, 23000, '');

--
-- Triggers `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', '1234', 1),
(2, 'user', 'user', '1234', 2),
(3, 'juned', 'rjunaedi', '1234', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
