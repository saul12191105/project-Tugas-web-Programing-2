-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2020 at 02:44 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(5) NOT NULL,
  `nama_admin` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `username`, `password`) VALUES
(8, 'saul hutabarat', 'saul', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(5) NOT NULL,
  `nama_anggota` varchar(45) NOT NULL,
  `gender` enum('Laki-Laki','Perempuan') NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `gender`, `no_telp`, `alamat`, `email`, `password`) VALUES
(3, 'saul', 'Laki-Laki', '082360175508', 'salemba', 'saul', 'saul'),
(4, 'nebula', 'Laki-Laki', '082360175508', 'paseban', 'saul', 'saul');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(5) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `pengarang` varchar(35) NOT NULL,
  `thn_terbit` date NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `isbn` varchar(25) NOT NULL,
  `jumlah_buku` int(3) NOT NULL,
  `lokasi` enum('Rak 1','Rak 2','Rak 3') NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `tgl_input` date NOT NULL,
  `status_buku` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_kategori`, `judul_buku`, `pengarang`, `thn_terbit`, `penerbit`, `isbn`, `jumlah_buku`, `lokasi`, `gambar`, `tgl_input`, `status_buku`) VALUES
(16, 4, 'Trik SQL', 'Ahdim Makaren', '2014-07-07', 'Wacana Ria', '54234762', 10, 'Rak 1', 'gambar1603881152.jpg', '2020-12-15', '0'),
(17, 3, 'buku kehidupan', 'saul', '2020-12-09', 'nebula', '12345', 2, 'Rak 3', 'gambar1608038911.jpg', '2020-12-15', '0'),
(18, 3, 'buku pribadi', 'hutabarat', '1998-11-11', 'saul', 'abcd', 1, 'Rak 2', 'gambar1608039361.jpeg', '2020-12-15', '0'),
(19, 3, 'belajar lagi', 'ando', '2011-05-03', 'Erlangga', '2345', 5, 'Rak 1', 'gambar1608039654.jpeg', '2020-12-15', '1');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `id_pinjam` int(5) NOT NULL,
  `id_buku` int(5) NOT NULL,
  `tgl_pengambilan` date NOT NULL,
  `denda` double NOT NULL,
  `status_kembali` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(3, 'novel'),
(4, 'pendidikan ');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_anggota` int(5) NOT NULL,
  `nama_anggota` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_anggota`, `nama_anggota`, `username`, `password`) VALUES
(1, 'abang jali', 'jali', '56934fbe4f5e369f903428ce98d75ed0');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id-pinjam` int(5) NOT NULL,
  `tanggal` date NOT NULL,
  `id_anggota` int(5) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `total_denda` varchar(255) NOT NULL,
  `status_pinjaman` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_pinjam` int(11) NOT NULL,
  `tgl_pencatatan` datetime NOT NULL,
  `id_anggota` int(4) NOT NULL,
  `id_buku` int(4) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `denda` double NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `total_denda` double NOT NULL,
  `status_pengembalian` varchar(15) NOT NULL,
  `status_peminjaman` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_pinjam`, `tgl_pencatatan`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`, `tgl_pengembalian`, `total_denda`, `status_pengembalian`, `status_peminjaman`) VALUES
(4, '2020-11-18 19:47:30', 1, 11, '2020-11-10', '2020-11-18', 10000, '0000-00-00', 0, '0', '0'),
(5, '2020-12-15 20:37:30', 3, 16, '2020-12-11', '2020-11-12', 10000, '0000-00-00', 0, '0', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id-pinjam`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_anggota` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id-pinjam` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
