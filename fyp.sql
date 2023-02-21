-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2023 at 04:05 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fyp`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kid` int(11) NOT NULL,
  `ktg` varchar(30) NOT NULL,
  `jbtuan` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kid`, `ktg`, `jbtuan`) VALUES
(2, 'BELIA BUJANG', 'WANG'),
(3, 'SISWA', 'PERANTI');

-- --------------------------------------------------------

--
-- Table structure for table `kerani`
--

CREATE TABLE `kerani` (
  `noKp` varchar(15) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `ktL` varchar(10) NOT NULL,
  `trkDftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kerani`
--

INSERT INTO `kerani` (`noKp`, `nama`, `ktL`, `trkDftar`) VALUES
('031210110499', 'Wan Iqbal Zulkhairie Bin Wan Mohd Sakri', '123', '2023-01-20');

-- --------------------------------------------------------

--
-- Table structure for table `pemohon`
--

CREATE TABLE `pemohon` (
  `noKp` varchar(15) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `ktL` varchar(10) NOT NULL,
  `trkDftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemohon`
--

INSERT INTO `pemohon` (`noKp`, `nama`, `ktL`, `trkDftar`) VALUES
('030109011270', 'MELLINA BINTI ABDULLAH', '123', '2023-01-08'),
('030301050355', 'MUHAMMAD MIFTAHUDDIN BIN RUSMI', '123', '2023-01-17'),
('030303110299', 'MUHAMMAD ASHRAF FAHMI BIN AZMI', '123', '2023-01-20'),
('030321070075', 'MUHAMMAD AIZAT BIN ADNAN', '123', '2023-01-08'),
('030807030233', 'MUHAMMAD SYAHRULNIZAM BIN RAZMI', '123', '2023-01-17'),
('981231117232', 'FARIDATUL ADAWIAH BINTI AZMI', '123', '2022-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `permohonan`
--

CREATE TABLE `permohonan` (
  `pid` int(11) NOT NULL,
  `noKp` varchar(15) DEFAULT NULL,
  `kid` int(11) NOT NULL,
  `pendapatan` varchar(20) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `poskod` varchar(10) NOT NULL,
  `daerah` varchar(10) NOT NULL,
  `sts` int(3) DEFAULT 0,
  `trkMohon` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permohonan`
--

INSERT INTO `permohonan` (`pid`, `noKp`, `kid`, `pendapatan`, `alamat`, `poskod`, `daerah`, `sts`, `trkMohon`) VALUES
(12, '030321070075', 3, 'RM0', 'Kg Tembila', '22000', 'Besut', 0, '2023-01-08'),
(22, '030301050355', 2, 'RM1700', 'Kg Pengkalan Berangan', '21600', 'Marang', 1, '2023-01-17'),
(23, '030807030233', 3, 'RM0', 'Kg Temiang', '22000', 'Besut', 0, '2023-01-17'),
(29, '981231117232', 3, 'RM1700', 'Kg Temiang', '21600', 'Marang', 0, '2023-01-20'),
(30, '030303110299', 3, 'RM0', 'Kg Temiang', '21600', 'Marang', 0, '2023-01-20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kid`);

--
-- Indexes for table `kerani`
--
ALTER TABLE `kerani`
  ADD PRIMARY KEY (`noKp`);

--
-- Indexes for table `pemohon`
--
ALTER TABLE `pemohon`
  ADD PRIMARY KEY (`noKp`);

--
-- Indexes for table `permohonan`
--
ALTER TABLE `permohonan`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `noKp` (`noKp`),
  ADD KEY `permohonan_ibfk_1` (`kid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `permohonan`
--
ALTER TABLE `permohonan`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permohonan`
--
ALTER TABLE `permohonan`
  ADD CONSTRAINT `noKp` FOREIGN KEY (`noKp`) REFERENCES `pemohon` (`noKp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permohonan_ibfk_1` FOREIGN KEY (`kid`) REFERENCES `kategori` (`kid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
