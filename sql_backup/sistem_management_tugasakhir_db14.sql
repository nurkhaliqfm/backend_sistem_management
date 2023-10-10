-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2023 at 03:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_management_tugasakhir_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `document_logbook`
--

CREATE TABLE `document_logbook` (
  `id` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL,
  `id_jadwal_bimbingan` int(11) NOT NULL,
  `annotation_type` varchar(255) DEFAULT NULL,
  `annotation_content` longtext DEFAULT NULL,
  `annotation_page` int(11) DEFAULT NULL,
  `annotation_bounding` varchar(255) DEFAULT NULL,
  `annotation_rect` varchar(255) DEFAULT NULL,
  `annotation_comment` longtext DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` int(11) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_dosen` varchar(255) NOT NULL,
  `nip` varchar(255) NOT NULL,
  `nidn` varchar(255) NOT NULL,
  `dosen_type` varchar(255) NOT NULL,
  `dosen_profile` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `id_prodi`, `id_user`, `nama_dosen`, `nip`, `nidn`, `dosen_type`, `dosen_profile`, `createdAt`, `updatedAt`) VALUES
(2, 207, 182, 'Dr. Adi', '1234567666', '9994567477', 'Internal', 'URL_Gambar_Profile_Dosen', '2023-10-02 06:19:12', '2023-10-02 06:19:12'),
(3, 208, 183, 'Dr. Akbar', '1234567333', '7774567477', 'Internal', 'URL_Gambar_Profile_Dosen', '2023-10-02 06:19:57', '2023-10-02 06:19:57'),
(4, 207, 185, 'Dr. Kamril', '1234567223', '7774967477', 'Internal', 'URL_Gambar_Profile_Dosen', '2023-10-02 08:04:02', '2023-10-02 08:04:02'),
(5, 207, 186, 'Dr. Alucard', '1234567229', '7774967499', 'Internal', 'URL_Gambar_Profile_Dosen', '2023-10-02 08:04:02', '2023-10-02 08:04:02'),
(6, 207, 187, 'Dr. Jonson', '1234567339', '7774967410', 'Internal', 'URL_Gambar_Profile_Dosen', '2023-10-02 08:04:02', '2023-10-02 08:04:02'),
(7, 208, 188, 'Dr. Lilya', '1234567669', '7774967230', 'Internal', 'URL_Gambar_Profile_Dosen', '2023-10-02 08:04:02', '2023-10-02 08:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_bimbingan`
--

CREATE TABLE `jadwal_bimbingan` (
  `id` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL,
  `jadwal` datetime NOT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_bimbingan`
--

INSERT INTO `jadwal_bimbingan` (`id`, `id_mahasiswa`, `id_dosen`, `jadwal`, `document_name`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 2, '2023-09-29 03:00:00', '1695953649471-dummies.pdf', 0, '2023-09-28 16:56:20', '2023-09-29 02:14:09'),
(2, 2, 3, '2023-09-30 11:00:00', '1696041738067-dummies.pdf', 0, '2023-09-30 02:42:18', '2023-09-30 02:42:18'),
(3, 4, 4, '2023-09-30 15:00:00', '1696055820364-dummies.pdf', 1, '2023-09-30 06:37:00', '2023-09-30 06:37:00'),
(4, 5, 5, '2023-09-30 22:00:00', '1696055920440-dummies.pdf', 1, '2023-09-30 06:38:40', '2023-09-30 06:38:40'),
(5, 6, 6, '2023-09-30 22:00:00', '1696217483729-dummies10.pdf', 0, '2023-10-02 03:31:23', '2023-10-02 03:31:23'),
(6, 7, 7, '2023-09-30 22:00:00', NULL, 0, '2023-10-02 05:36:41', '2023-10-02 05:36:41');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_ujian`
--

CREATE TABLE `jadwal_ujian` (
  `id` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `jadwal` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_ujian`
--

INSERT INTO `jadwal_ujian` (`id`, `id_mahasiswa`, `id_prodi`, `id_dosen`, `type`, `jadwal`, `createdAt`, `updatedAt`) VALUES
(1, 1, 206, 5, 'ofline', '2023-10-07 10:00:00', '2023-10-06 02:16:01', '2023-10-09 13:04:46'),
(2, 1, 206, 4, 'ofline', '2023-10-07 10:00:00', '2023-10-06 02:16:01', '2023-10-09 13:04:46'),
(3, 1, 206, 3, 'ofline', '2023-10-07 10:00:00', '2023-10-06 02:16:01', '2023-10-09 13:03:22'),
(4, 1, 206, 6, 'ofline', '2023-10-07 10:00:00', '2023-10-06 02:16:01', '2023-10-09 13:05:29'),
(5, 2, 207, 2, 'online', '2023-10-07 10:00:00', '2023-10-07 06:22:20', '2023-10-07 15:01:00'),
(6, 2, 207, 4, 'online', '2023-10-07 10:00:00', '2023-10-07 06:22:20', '2023-10-07 15:01:00'),
(7, 2, 207, 3, 'online', '2023-10-07 10:00:00', '2023-10-07 06:22:20', '2023-10-07 15:01:00'),
(8, 2, 207, 5, 'online', '2023-10-07 10:00:00', '2023-10-07 06:22:20', '2023-10-07 15:01:00');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `id_neosia` int(11) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_mahasiswa` varchar(255) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `angkatan` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `pembimbing` varchar(255) DEFAULT NULL,
  `penguji` varchar(255) DEFAULT NULL,
  `judul` text DEFAULT NULL,
  `mahasiswa_profile` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `id_neosia`, `id_prodi`, `id_user`, `nama_mahasiswa`, `nim`, `angkatan`, `status`, `pembimbing`, `penguji`, `judul`, `mahasiswa_profile`, `createdAt`, `updatedAt`) VALUES
(1, 1, 206, 181, 'lancelot', '12345667', '2017', 0, '2|3', '4|5', 'Analisis Data Menggunakan Algoritma XYZ', 'https://example.com/profile/johndoe.jpg', '2023-09-22 03:35:21', '2023-10-06 05:17:11'),
(2, 1, 207, 184, 'heril', '12345645', '2022', 1, '3|6', '5|7', 'Analisis Data Menggunakan Algoritma KDR', 'https://example.com/profile/johndoe.jpg', '2023-09-27 02:42:38', '2023-09-27 02:42:38'),
(4, 1, 209, 189, 'albert', '12345688', '2021', 0, '3|6', '5|7', 'Analisis Data Menggunakan Algoritma KLX', 'https://example.com/profile/johndoe.jpg', '2023-09-27 02:42:38', '2023-09-27 02:42:38'),
(5, 1, 210, 190, 'clay', '12345699', '2018', 1, '2|3', '4|5', 'Analisis Data Menggunakan Algoritma KYY', 'https://example.com/profile/johndoe.jpg', '2023-09-27 02:42:38', '2023-09-27 02:42:38'),
(6, 1, 211, 191, 'ronaldo', '12345644', '2018', 0, '2|3', '4|5', 'Analisis Data Menggunakan Algoritma KOL', 'https://example.com/profile/johndoe.jpg', '2023-09-27 02:42:38', '2023-09-27 02:42:38'),
(7, 1, 212, 192, 'messi', '12345600', '2018', 1, '3|6', '5|7', 'Analisis Data Menggunakan Algoritma KBA', 'https://example.com/profile/johndoe.jpg', '2023-09-27 02:42:38', '2023-09-27 02:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `id_user_from` int(11) NOT NULL,
  `id_user_to` int(11) NOT NULL,
  `notif_content` text NOT NULL,
  `date` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `id_user_from`, `id_user_to`, `notif_content`, `date`, `createdAt`, `updatedAt`) VALUES
(1, 1, 181, 'Belum ada notifikasi', '2023-09-25 12:00:00', '2023-09-25 02:23:30', '2023-09-25 14:51:22'),
(2, 182, 181, 'Belum ada notifikasi', '2023-10-05 12:00:00', '2023-10-04 16:10:40', '2023-10-04 16:10:40'),
(3, 181, 1, 'Belum ada notifikasi', '2023-10-05 12:00:00', '2023-10-05 04:44:12', '2023-10-05 04:44:12'),
(4, 176, 1, 'Belum ada notifikasi', '2023-10-05 12:00:00', '2023-10-05 04:44:12', '2023-10-05 04:44:12'),
(5, 182, 176, 'Belum ada notifikasi', '2023-10-05 12:00:00', '2023-10-05 04:44:12', '2023-10-05 04:44:12'),
(6, 1, 181, 'Proposal di terima', '2023-10-05 12:00:00', '2023-10-05 08:19:50', '2023-10-05 08:19:50'),
(7, 181, 1, 'Proposal di terima', '2023-10-05 12:00:00', '2023-10-05 11:29:49', '2023-10-05 11:29:49'),
(8, 181, 182, 'Proposal belum di terima', '2023-10-05 12:00:00', '2023-10-05 11:31:20', '2023-10-05 11:31:20');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_proposal`
--

CREATE TABLE `pengajuan_proposal` (
  `id` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `dosen_pembimbing` varchar(255) DEFAULT NULL,
  `dosen_penguji` varchar(255) DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengajuan_proposal`
--

INSERT INTO `pengajuan_proposal` (`id`, `id_mahasiswa`, `judul`, `dosen_pembimbing`, `dosen_penguji`, `document`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Analisis Dampak Lingkungan Pabrik Y', '2|3', '4|5', '1695780994334-dummies10.pdf', 0, '2023-09-22 14:47:36', '2023-09-29 02:06:38'),
(2, 2, 'Analisis Dampak Lingkungan Pabrik X', '3|6', '5|7', '1695700119400-dummies10.pdf', 0, '2023-09-26 03:48:39', '2023-09-26 03:48:39'),
(3, 4, 'Dampak Lingkungan Pabrik H', '3|6', '5|7', '1695904130923-dummies.pdf', 0, '2023-09-27 12:36:52', '2023-09-28 12:28:50'),
(4, 5, 'Dampak Lingkungan Pabrik G', '2|3', '4|5', NULL, 1, '2023-10-02 16:54:05', '2023-10-02 16:54:05'),
(5, 6, 'Dampak Lingkungan Pabrik D', '2|3', '4|5', NULL, 1, '2023-10-02 16:54:32', '2023-10-02 16:54:32'),
(6, 7, 'Dampak Lingkungan Pabrik Z', '3|6', '5|7', NULL, 1, '2023-10-02 16:55:12', '2023-10-02 16:55:12');

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id` int(11) NOT NULL,
  `id_neosia` int(11) DEFAULT NULL,
  `nama_resmi` varchar(255) NOT NULL,
  `nama_singkat` varchar(255) DEFAULT NULL,
  `nama_asing` varchar(255) DEFAULT NULL,
  `nama_asing_singkat` varchar(255) DEFAULT NULL,
  `is_eksakta` int(11) DEFAULT NULL,
  `prodi_jenjang_kode` varchar(255) NOT NULL,
  `prodi_jenjang_nama` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id`, `id_neosia`, `nama_resmi`, `nama_singkat`, `nama_asing`, `nama_asing_singkat`, `is_eksakta`, `prodi_jenjang_kode`, `prodi_jenjang_nama`, `createdAt`, `updatedAt`) VALUES
(206, 1, 'ILMU EKONOMI - S1', 'Ilmu Ekonomi', 'Economics', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(207, 2, 'MANAJEMEN - S1', NULL, '', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(208, 3, 'AKUNTANSI - S1', 'Akuntansi', 'Accounting Department', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(209, 4, 'PROG. PROFESI AKUNTANSI', 'Profesi Akuntansi', 'Accounting Department', NULL, 0, 'PR', 'Profesi', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(210, 85, 'EKONOMI SUMBERDAYA - S2', NULL, '', NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(211, 88, 'ILMU EKONOMI - S3', NULL, '', NULL, 0, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(212, 91, 'EKONOMI PEMBANGUNAN DAN PERENCANAAN - S2', NULL, '', NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(213, 105, 'MANAJEMEN KEUANGAN - S2', NULL, '', NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(214, 110, 'MAGISTER MANAJEMEN - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(215, 131, 'MAGISTER KEUANGAN DAERAH - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(216, 139, 'MAGISTER AKUNTANSI - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(217, 192, 'KEUANGAN MIKRO - S2', NULL, NULL, NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(218, 200, 'ILMU AKUNTANSI - S3', NULL, NULL, NULL, 0, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(219, 5, 'ILMU HUKUM - S1', '', 'Faculty of Law', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(220, 86, 'ILMU HUKUM - S3', '', '', NULL, 0, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(221, 95, 'ILMU HUKUM - S2', '', '', NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(222, 159, 'HUKUM ADMINISTRASI NEGARA - S1', NULL, NULL, NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(223, 172, 'KENOTARIATAN - S2', NULL, NULL, NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(224, 6, 'PENDIDIKAN DOKTER - S1', NULL, 'medic', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(225, 7, 'KEPERAWATAN (HAPUS)', NULL, 'Nursing', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(226, 9, 'PSIKOLOGI - S1', NULL, NULL, NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(227, 81, 'ILMU KEDOKTERAN - S3', NULL, '', NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(228, 115, 'PPDS ILMU BEDAH', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(229, 116, 'PPDS ILMU PENYAKIT MATA', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(230, 117, 'PPDS OBSTETRI DAN GINEKOLOGI', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(231, 118, 'PPDS ILMU PENYAKIT DALAM', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(232, 119, 'PPDS ILMU KESEHATAN ANAK', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(233, 120, 'PPDS ILMU PENYAKIT THT', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(234, 121, 'PPDS ILMU PENYAKIT KULIT DAN KELAMIN', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(235, 122, 'PPDS ILMU PATOLOGI KLINIK', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(236, 123, 'PPDS PATOLOGI ANATOMI', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(237, 124, 'PPDS ILMU RADIOLOGI', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(238, 125, 'PPDS ILMU KEDOKTERAN JIWA - PSIKIATRI', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(239, 126, 'PPDS ILMU PENYAKIT SARAF', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(240, 127, 'PPDS ILMU KEDOKTERAN FORENSIK DAN MEDIKOLEGAL', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(241, 128, 'PPDS ANESTESIOLOGI', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(242, 129, 'PPDS ORTHOPEDI', NULL, '', NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(243, 146, 'PENDIDIKAN DOKTER HEWAN', '', '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(244, 147, 'PROFESI DOKTER', 'FK', 'Faculty Medicine', NULL, 1, 'PR', 'Profesi', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(245, 164, 'PROFESI DOKTER HEWAN', NULL, NULL, NULL, 1, 'PR', 'Profesi', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(246, 178, 'PPDS - ILMU PENYAKIT JANTUNG DAN PEMBULUH DARAH', NULL, NULL, NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(247, 179, 'PPDS - ILMU GIZI KLINIK', NULL, NULL, NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(248, 180, 'PPDS - PULMONOLOGI', NULL, NULL, NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(249, 181, 'PPDS - MIKROBIOLOGI KLINIK', NULL, NULL, NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(250, 182, 'PPDS - ILMU BEDAH SARAF', NULL, NULL, NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(251, 203, 'VOKASI KESEHATAN', NULL, NULL, NULL, 1, 'D3', 'Diploma 3', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(252, 10, 'TEKNIK SIPIL - S1', '', 'civil', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(253, 11, 'TEKNIK LINGKUNGAN - S1', '', 'Teknik Lingkungan', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(254, 12, 'TEKNIK MESIN - S1', '', 'Machine', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(255, 13, 'TEKNIK INDUSTRI - S1', 'ME', 'Mechanical Engineering', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(256, 14, 'TEKNIK PERKAPALAN - S1', '', '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(257, 15, 'TEKNIK KELAUTAN - S1', 'TK', 'OCEAN ENGINEERING', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(258, 16, 'TEKNIK SISTEM PERKAPALAN - S1', '', '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(259, 17, 'TEKNIK ELEKTRO - S1', '', 'Electrical Engineering', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(260, 18, 'TEKNIK INFORMATIKA - S1', '', '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(261, 19, 'TEKNIK ARSITEKTUR - S1', 'ARS', 'Architecture', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(262, 20, 'TEKNIK PERENCANAAN WILAYAH KOTA - S1', 'pwk', '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(263, 21, 'TEKNIK GEOLOGI - S1', 'GEO', 'Geology Engineering', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(264, 22, 'TEKNIK PERTAMBANGAN - S1', 'MINE', 'Mining Engineering', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(265, 94, 'TEKNIK SIPIL - S3', 'TS', 'Ilmu Teknik Sipil', NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(266, 111, 'TEKNIK MESIN - S2', '', '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(267, 112, 'T. Mesin/Konstruksi Mesin (HAPUS)', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(268, 113, 'TEKNIK SIPIL - S2', '', '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(269, 132, 'TEKNIK ELEKTRO - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(270, 135, 'TEKNIK GEOLOGI - S2', 'GEO', 'Geology Engineering', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(271, 136, 'TEKNIK PERKAPALAN - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(272, 137, 'ARSITEKTUR - S2', '', '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(273, 151, 'TEKNIK LINGKUNGAN (hapus)', 'TEKNIK LINGKUNGAN', 'ENVIRONMENTAL ENGINEERING', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(274, 165, 'ILMU ARSITEKTUR - S3', '', '', NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(275, 166, 'TEKNOLOGI KEBUMIAN DAN LINGKUNGAN - S3', NULL, NULL, NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(276, 167, 'TEKNIK ELEKTRO - S3', NULL, NULL, NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(277, 168, 'TEKNIK MESIN - S3', NULL, NULL, NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(278, 196, 'PROFESI INSINYUR', NULL, NULL, NULL, 1, 'PR', 'Profesi', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(279, 201, 'TEKNIK INDUSTRI - S2', NULL, NULL, NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(280, 204, 'Magister Teknik Informatika', 'Teknik Informatika S2', 'Master of Informatics', 'Master of Informatics', 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(281, 24, 'ILMU POLITIK - S1', '', '', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(282, 25, 'ILMU PEMERINTAHAN - S1', NULL, '', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(283, 26, 'ILMU HUB. INTERNASIONAL - S1', NULL, '', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(284, 27, 'ILMU ADMINISTRASI NEGARA - S1', 'AN', 'Public Administration', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(285, 28, 'ILMU KOMUNIKASI - S1', '', '', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(286, 29, 'SOSIOLOGI - S1', NULL, '', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(287, 30, 'ANTROPOLOGI SOSIAL - S1', NULL, '', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(288, 90, 'ILMU SOSIAL - S3 (HAPUS)', NULL, '', NULL, 0, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(289, 93, 'ADMINISTRASI PEMBANGUNAN - S2', NULL, '', NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(290, 96, 'ILMU ADMINISTRASI PUBLIK - S3', NULL, '', NULL, 0, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(291, 101, 'ILMU KOMUNIKASI - S2', NULL, '', NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(292, 103, 'SOSIOLOGI - S2', NULL, '', NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(293, 107, 'ANTROPOLOGI - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(294, 108, 'ILMU ANTROPOLOGI - S3', NULL, '', NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(295, 174, 'ILMU POLITIK - S2', NULL, NULL, NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(296, 186, 'ILMU KOMUNIKASI -S3', NULL, NULL, NULL, 0, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(297, 190, 'SOSIOLOGI - S3', NULL, NULL, NULL, 0, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(298, 191, 'ILMU PEMERINTAHAN - S2', NULL, NULL, NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(299, 31, 'SASTRA INDONESIA - S1', 'Sindo', '', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(300, 32, 'SASTRA INGGRIS - S1', NULL, '', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(301, 33, 'SASTRA PRANCIS - S1', 'JSBR', 'Departement de Francais, UNHAS', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(302, 34, 'SASTRA ASIA BARAT - S1', 'Arab', 'Western Asian Languages', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(303, 35, 'SASTRA BUGIS-MAKASSAR - S1', 'SBM', '', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(304, 36, 'ARKEOLOGI - S1', 'ARKEO', 'Archaeology', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(305, 37, 'ILMU SEJARAH - S1', '', 'Science of History', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(306, 38, 'SASTRA JEPANG - S1', '', 'Japanese Language', NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(307, 84, 'ILMU LINGUISTIK - S3', NULL, '', NULL, 0, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(308, 87, 'LINGUISTIK - S2', NULL, '', NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(309, 89, 'BAHASA INGGRIS - S2', '', '', NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(310, 99, 'BAHASA INDONESIA - S2', NULL, '', NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(311, 188, 'ARKEOLOGI - S2', NULL, NULL, NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(312, 189, 'BAHASA MANDARIN', NULL, NULL, NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(313, 197, 'BAHASA MANDARIN DAN KEBUDAYAAN TIONGKOK', NULL, NULL, NULL, 0, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(314, 205, 'BAHASA INGGRIS - S3', NULL, NULL, NULL, 0, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(315, 39, 'BUDIDAYA PERTANIAN [LAMA]', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(316, 40, 'ILMU TANAH [LAMA]', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(317, 41, 'AGRIBISNIS [LAMA]', '', 'Farm Agribusiness', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(318, 42, 'ILMU HAMA DAN PENY. TUMBUHAN [LAMA]', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(319, 43, 'ILMU DAN TEKNOLOGI PANGAN [LAMA]', '', 'Food Science & Technology', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(320, 44, 'TEKNIK PERTANIAN [LAMA]', 'Tekper', 'Agricultural Engineering', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(321, 72, 'Teknologi Hasil Hutan', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(322, 143, 'Agroteknologi (HAPUS)', 'Agritek', '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(323, 144, 'Keteknikan Pertanian (HAPUS)', 'Tekpert', 'Agricultural Engineering', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(324, 152, 'AGROTEKNOLOGI - S1', 'AGROTEK', '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(325, 153, 'AGRIBISNIS - S1', NULL, NULL, NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(326, 154, 'ILMU DAN TEKNOLOGI PANGAN - S1', NULL, NULL, NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(327, 155, 'KETEKNIKAN PERTANIAN - S1', NULL, NULL, NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(328, 156, 'ILMU DAN TEKNOLOGI PANGAN - S2', NULL, NULL, NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(329, 157, 'KETEKNIKAN PERTANIAN - S2', NULL, NULL, NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(330, 158, 'ILMU HAMA DAN PENYAKIT TUMBUHAN - S2', 'IHPT', 'PLANT PESTS AND DIASESE SCIENCE', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(331, 175, 'AGROTEKNOLOGI - S2', NULL, NULL, NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(332, 176, 'TEKNIK AGROINDUSTRI - S2', NULL, NULL, NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(333, 45, 'MATEMATIKA - S1', 'MAT', 'Mathematics', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(334, 46, 'STATISTIKA - S1', 'STAT', 'Statistics', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(335, 47, 'FISIKA - S1', 'Fisika', 'Physics Department', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(336, 48, 'GEOFISIKA - S1', '', '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(337, 49, 'KIMIA - S1', 'ChemDept', 'Chemistry Departement', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(338, 50, 'BIOLOGI - S1', 'BI', 'BIOLOGY', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(339, 92, 'ILMU KIMIA - S3', NULL, '', NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(340, 98, 'KIMIA - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(341, 140, 'MATEMATIKA TERAPAN - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(342, 160, 'ILMU KOMPUTER - S1', NULL, NULL, NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(343, 162, 'GEOFISIKA - S2', NULL, NULL, NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(344, 163, 'FISIKA - S2', NULL, NULL, NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(345, 194, 'BIOLOGI - S2', NULL, NULL, NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(346, 202, 'ILMU AKTUARIA', NULL, NULL, NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(347, 51, 'PETERNAKAN - S1', 'AH', 'Animal Husbandry', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(348, 52, 'Nutrisi Dan Makanan Ternak', 'NMT', 'Animal Nutrition Department', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(349, 53, 'Sosek Peternakan', 'sosek', 'economic and social of Animal Science', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(350, 54, 'Teknologi Hasil peternakan', 'THT', 'animal product technology', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(351, 78, 'ILMU DAN TEKNOLOGI PETERNAKAN - S2', 'AST', ' Animal Science and Technology', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(352, 193, 'PETERNAKAN - S3', NULL, NULL, NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(353, 55, 'PENDIDIKAN DOKTER GIGI - S1', NULL, 'Dentistry', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(354, 56, 'PROFESI DOKTER GIGI', NULL, 'Dentistry', NULL, 1, 'PR', 'Profesi', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(355, 183, 'PPDGS - PROSTODONSIA', NULL, NULL, NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(356, 184, 'PPDGS - ILMU KONSERVASI GIGI', NULL, NULL, NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(357, 185, 'PPDGS - DOKTER GIGI PERIODONSIA', NULL, NULL, NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(358, 198, 'PPDGS - BEDAH MULUT DAN MAKSILOFASIAL', NULL, NULL, NULL, 1, 'SP1', 'Spesialis 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(359, 57, 'KESEHATAN MASYARAKAT (S1)', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(360, 58, 'BIOSTATISTIK/KKB (HAPUS)', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(361, 59, 'EPIDEMIOLOGI (HAPUS)', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(362, 60, 'GIZI KES-MAS (HAPUS)', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(363, 61, 'KESEHATAN & KESELAMATAN KERJA (HAPUS)', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(364, 62, 'KESEHATAN LINGKUNGAN (HAPUS)', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(365, 63, 'PKIP (HAPUS)', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(366, 64, 'MANAJEMEN RUMAH SAKIT (HAPUS)', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(367, 65, 'ILMU GIZI - S1', 'GIZI', 'NUTRITIONAL SCIENCE', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(368, 106, 'ILMU  KESEHATAN MASYARAKAT - S2', 'KESMAS', 'PUBLIC HEALTH', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(369, 150, 'KESEHATAN MASYARAKAT (S1) (HAPUS)', 'Kesmas', 'Publich Health', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(370, 173, 'KESEHATAN MASYARAKAT - S3', NULL, NULL, NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(371, 199, 'MAGISTER ADMINISTRASI RUMAH SAKIT', NULL, NULL, NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(372, 23, 'TEKNIK KELAUTAN (HAPUS)', '', '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(373, 66, 'ILMU KELAUTAN - S1', 'IKL', 'Marine Science', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(374, 67, 'MANAJEMEN S.DAYA PERAIRAN - S1', 'MSP', 'Aquatic Resources Nanagement', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(375, 68, 'BUDIDAYA PERAIRAN - S1', 'BDP', 'Aquaculture', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(376, 69, 'PEMANF. S. DAYA PERIKANAN - S1', 'PSP', 'Fisheries resources utilization', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(377, 70, 'SOSEK PERIKANAN - S1', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(378, 79, 'ILMU PERIKANAN - S3', NULL, '', NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(379, 138, 'ILMU PERIKANAN - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(380, 169, 'PENGELOLAAN SUMBERDAYA PESISIR TERPADU - S2', NULL, NULL, NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(381, 75, 'SISTEM-SISTEM PERTANIAN - S2', '', '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(382, 76, 'ILMU PERTANIAN - S3', NULL, '', NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(383, 80, 'PERENCANAAN DAN PENGEMBANGAN WILAYAH - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(384, 82, 'PERENCANAAN DAN PENGEMBANGAN WILAYAH (HAPUS)', NULL, '', NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(385, 83, 'PENGELOLAAN LINGKUNGAN HIDUP - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(386, 97, 'AGRIBISNIS - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(387, 100, 'MANAJEMEN PERKOTAAN - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(388, 102, 'ILMU BIOMEDIK - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(389, 104, 'PERENCANAAN PEMBANGUNAN SOSIAL - S2 (HAPUS)', NULL, '', NULL, 0, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(390, 109, 'JENDER DAN PEMBANGUNAN - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(391, 114, 'PROGRAM PENDIDIKAN DOKTER SPESIALIS I (HAPUS)', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(392, 133, 'TEKNIK PERENCANAAN PRASARANA - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(393, 134, 'TEKNIK TRANSPORTASI - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(394, 171, 'ILMU KEBIDANAN - S2', NULL, NULL, NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(395, 71, 'KEHUTANAN - S1', 'Forestry', 'Forestry', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(396, 77, 'KEHUTANAN - S2', NULL, '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(397, 195, 'KEHUTANAN - S3', NULL, NULL, NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(398, 73, 'FARMASI - S1', 'Farmasi', 'Pharmacy', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(399, 74, 'PROG. PROFESI APOTEKER', 'Apoteker', 'Apoteker', NULL, 1, 'PR', 'Profesi', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(400, 130, 'FARMASI - S2', '', '', NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(401, 187, 'ILMU FARMASI - S3', NULL, NULL, NULL, 1, 'S3', 'Doktor', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(402, 141, 'MKU  Eksakta', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(403, 142, 'MKU  Non-Eksakta', NULL, '', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(404, 177, 'P2KKN', NULL, NULL, NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(405, 8, 'KEPERAWATAN - S1', '', 'Nursing', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(406, 145, 'FISIOTERAPI', 'Fisioterapi', 'Physiotheraphy', NULL, 1, 'S1', 'Sarjana', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(407, 148, 'PROFESI KEPERAWATAN', '', '', NULL, 0, 'PR', 'Profesi', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(408, 149, 'Fisioterapi (A)  (Hapus)', '', '', NULL, 1, 'D1', 'Diploma 1', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(409, 161, 'PROFESI FISIOTERAPI', NULL, NULL, NULL, 1, 'PR', 'Profesi', '2023-07-07 03:52:37', '2023-07-07 03:52:37'),
(410, 170, 'ILMU KEPERAWATAN - S2', NULL, NULL, NULL, 1, 'S2', 'Magister', '2023-07-07 03:52:37', '2023-07-07 03:52:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `session_date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_prodi`, `username`, `password`, `role`, `refresh_token`, `session_date`, `createdAt`, `updatedAt`) VALUES
(1, 206, 'ilmuekonomis1', '$2b$10$NGr25sviu9hGUOO5wz7gnucawLtOZmygFqm5NNbkQPdEmvLaPCQdS', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJpbG11ZWtvbm9taXMxIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk2Njg5NTMzLCJleHAiOjE2OTY3NzU5MzN9.TxQxr8E8nt1PlPm4NpJq3Ebz9ocHKtUYbpdrIKmHEro', NULL, '2023-09-27 20:28:59', '2023-10-07 14:38:53'),
(2, 207, 'manajemens1', '$2b$10$snpsqy7gQuW7uxEzeOgYR.mrUZhGEXpmEobrPNKBHBmeaZ/MNjuOe', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(3, 208, 'akuntansis1', '$2b$10$0xQKGKZ4trDEI27NXonUtOLtiCibIKJ1rtDh/Snls1oXWzZ57us2q', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(4, 209, 'prog.profesiakuntansi', '$2b$10$BVK6Ghf4xHFyezCxpoiute2D3f..JccwgCP25mV5EcZ6eIjqp.xQS', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(5, 210, 'ekonomisumberdayas2', '$2b$10$CHLFMpjNQ/MCk2hxgLIR0uOYpDg8fQQLcbGVkrEiUYKcArXkGSM6u', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(6, 211, 'ilmuekonomis3', '$2b$10$nMUamu44.SMIXykiyGqexu2TptAuQTetfvp1bskcpRm1QpDfVzXQy', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(7, 212, 'ekonomipembangunandanperencanaans2', '$2b$10$XwBCOKblnbx7Rvg.AfoLNuFdTff4FX9QaIuVfzI7Mcqgrav1.43qK', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(8, 213, 'manajemenkeuangans2', '$2b$10$hN9JKX/Tn8AKfZDiVL3a.u9cp.buHUedSJJzBFnh9.l3Z9WGO1/0K', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(9, 214, 'magistermanajemens2', '$2b$10$LOcwXr5I8/w.L3r2b2f/hOQ6I0.KawXdRcGKCjF2IKl9p.t94Ox/q', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(10, 215, 'magisterkeuangandaerahs2', '$2b$10$I5kVB6Z8YM/8x5Gy/20heO8LBAuF3x0byIw08BgDouZdwSAxAXDuO', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(11, 216, 'magisterakuntansis2', '$2b$10$3qss4QJ132i2qnEUDpXyoeAmfflg5.eOujKCgmiEoZCbHoW4MTmXu', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(12, 217, 'keuanganmikros2', '$2b$10$ecZfqBhZdl9xLz5SF0p0O.tvkR.IBFassBxkxA8AqMfWeoLJOTEsG', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(13, 218, 'ilmuakuntansis3', '$2b$10$omlQbWs2Dy6ifDf5lNmXy.DyjrguV7JWPHdIH6YhFO1ruKprQDIEW', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(14, 219, 'ilmuhukums1', '$2b$10$PPcNDhT7EeM81d2z7k/00OotQ4lxsn1n8UVAdqaElWdpXaOJSrfFO', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(15, 220, 'ilmuhukums3', '$2b$10$o2XdI3xiMw4nx2gWgqQxkuhuiMcaG2jwvwrRfQnZIRY8PL8e8eVi2', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(16, 221, 'ilmuhukums2', '$2b$10$OhIqIWg2aUs.Mk04zEUs7.j.QRRT6j1Jl.zHNUfjGI93HaKdCoPki', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(17, 222, 'hukumadministrasinegaras1', '$2b$10$QI8EmfZ6w.DYiaClgfLUAu.j8aon/Tsf7loBOXjtemhYccBSaXdLe', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(18, 223, 'kenotariatans2', '$2b$10$QUH1aSxWELzZ7tX7iSbMq.Ti1hVAFsJ724sJvtOnw.lREOELJVYFi', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(19, 224, 'pendidikandokters1', '$2b$10$.WBMVaoB7lMvVQfPSoZhPOQNq9oDemibpHgEIif6l.eA20NKRgE3i', 'admin', '', NULL, '2023-09-27 20:29:00', '2023-10-07 08:41:44'),
(20, 225, 'psikologis1', '$2b$10$DgBLLrVXk07EK/jJzBPUeeiErkuI9HTFlaUnhSyU3q7KKOgKVBZpy', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:44'),
(21, 226, 'ilmukedokterans3', '$2b$10$NcoSosFYcP2hCEYJHzs4uO2ELIvgSzRdZuQnNX6G4XSYPfIbeGyJG', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:44'),
(22, 227, 'ppdsilmubedah', '$2b$10$IKYpy/DR8ljIiQmgsNMKXuYfshsHYn3Y8rHlqB4FYaRuFtVPmRD7e', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:44'),
(23, 228, 'ppdsilmupenyakitmata', '$2b$10$Tf8PKjHvZZQw2sqeFCEK1Oh0mm7PSdi.7lz8JOAqyAiNPXT6DPw2m', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:44'),
(24, 229, 'ppdsobstetridanginekologi', '$2b$10$xRs7u5t3ogl2PCefRhwecegncDm2o9pLiXKBgDg/Ik7ajFUuWkxmm', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:44'),
(25, 230, 'ppdsilmupenyakitdalam', '$2b$10$LwFwdZ9Hd50/CY/tcS1laev6ZHvNHLWUEcsDPfQo45rGmyb318IkG', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:44'),
(26, 231, 'ppdsilmukesehatananak', '$2b$10$DY9gEV5.d3ePbOo/9YlPpOtPmSJsu6QnqCvk.iBwttfNSvdBaAYt.', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:44'),
(27, 232, 'ppdsilmupenyakittht', '$2b$10$ztidKz0nIX4EeMfUUZfgTukiT67PDC7W7x53BOAomP/t5npdPkzTm', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:44'),
(28, 233, 'ppdsilmupenyakitkulitdankelamin', '$2b$10$Kb7K.sA9UaDWvfH30fUtyui9hbsVdhyd4QZ0zCZdekLd4/8wRaelW', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:44'),
(29, 234, 'ppdsilmupatologiklinik', '$2b$10$nDJ24aNhuXlom.9uyNRTne0e.bR97P6K/YUSH18JmdaTPUdUBX.iq', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:45'),
(30, 235, 'ppdspatologianatomi', '$2b$10$barQ.5tlWUF1cjNqzKBuv.IrBIafgSUYyhSHYCAhpZieD4iUQc/k2', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:45'),
(31, 236, 'ppdsilmuradiologi', '$2b$10$YHDhHHXxM9cOeYaOaGD/NO11ZLm9mnaCTjp5qDSnfnkOsoZi7g6uS', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:45'),
(32, 237, 'ppdsilmukedokteranjiwapsikiatri', '$2b$10$wMRCsouvaRT1oEsu1GwQcum/ZIwWCsPNZVrgzCoD3IkaVlTa./5LO', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:45'),
(33, 238, 'ppdsilmupenyakitsaraf', '$2b$10$aZIPVuZ/mfSTVuwK5LYrleidUu59rV8qwvWtuQY.C4nYEO4m8D8Mu', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:45'),
(34, 239, 'ppdsilmukedokteranforensikdanmedikolegal', '$2b$10$uYwLngZ3ifaOlJQFDeorgOK0ov.f3fCof/n4iUXzfoYWeQfSSbeba', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:45'),
(35, 240, 'ppdsanestesiologi', '$2b$10$P90by6OTx8/Z5ZCipS/x5ejwFvft6gSL0xJ/Xk0bzvXMgYbInDKPK', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:45'),
(36, 241, 'ppdsorthopedi', '$2b$10$cdzpOBvaq4alinGwtnkyse0gHJLJC1nQu1lw4xunwVrnDKUIOIsy2', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:45'),
(37, 242, 'pendidikandokterhewan', '$2b$10$DNW3.jxro5y.Bxg/mcNQo.TLVygiLNWBSLThgvzMjFc.dXad2NYDa', 'admin', '', NULL, '2023-09-27 20:29:01', '2023-10-07 08:41:45'),
(38, 243, 'profesidokter', '$2b$10$odGEccmgy55Ogr44LbBdYeaTykQSeUmaLAfLk2fwS3SpqHVEFlIai', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(39, 244, 'profesidokterhewan', '$2b$10$iTQQsEDjSRvrIwiHddxDzeeNDw6weftOeljsWA3aXaHFtnGi6VRHi', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(40, 245, 'ppdsilmupenyakitjantungdanpembuluhdarah', '$2b$10$QupgiO.O1WUGISedKNRJmuMWR6UEL.rG/tFXYQBXh7ROy8TlzJLFi', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(41, 246, 'ppdsilmugiziklinik', '$2b$10$k4dgT01y71wNYL7vqmUuZOJJp7XyMa9JDI0G32pbr0gYc72wPDEN2', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(42, 247, 'ppdspulmonologi', '$2b$10$6LbX9t3JSJb4vo8.WaKrweYjEJI6mqSDGh9uraRA/ohqEK4bBYke.', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(43, 248, 'ppdsmikrobiologiklinik', '$2b$10$RjLQyCD68LP8wzlK356fa.Q2QourYpYpSzoup.H.0l8AyoclwZIAG', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(44, 249, 'ppdsilmubedahsaraf', '$2b$10$Xp.L2mxJ4OOXy5ze2/oc4eq7lH4P6XOKzGsHRbbT48/zS7ffgzTwG', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(45, 250, 'vokasikesehatan', '$2b$10$5L6TlcJwaQtOn4QoroNY1uuFhT9ovmohBHzSM7O70T791Yn5eMzae', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(46, 251, 'tekniksipils1', '$2b$10$vjr0xXGdzWPOrt.jkJqhtup4/9CodsDNwj.hSJ9pLBC3DbCuWTTpu', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(47, 252, 'tekniklingkungans1', '$2b$10$Vkdrm7cBpy9YGfTV3i7UHuGlTBoQdQ0ebraPzXgmu/rgrxN8tJoPu', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(48, 253, 'teknikmesins1', '$2b$10$xMmz0Ptt1bas/MklSX/lLe50zCgsbEBUPH4qkNfoOzQkB.iXvWCFG', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(49, 254, 'teknikindustris1', '$2b$10$a/G.r7j1tj1Wd0On57to9u7zsFh0FmTj3BrjvlcoWNvliLDbbP4yC', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(50, 255, 'teknikperkapalans1', '$2b$10$KXR./tVkWaeF0JrJ27oTP.CIRUiIa6x6qc2U95DbUoIlDowASebo2', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(51, 256, 'teknikkelautans1', '$2b$10$Pd7H3REO.fJXpN8N8e6mVenNREtLUnfoLUGforExi76EHZAjKmtYG', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(52, 257, 'tekniksistemperkapalans1', '$2b$10$npTeCWQQdshbQD84gVkLL.2Tmt6xNV/1foyhYvdORhqB0JYL3SRxq', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(53, 258, 'teknikelektros1', '$2b$10$FozzxwneiVdgVMkfomjM6.PAZQXNSlAdYTlhNMN65NVDff/WOb6jy', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(54, 259, 'teknikinformatikas1', '$2b$10$kRBN1GrFbvwfZ5Tr8b.DnuHRKuTD7u5kXhX.ebozYP8ttMXbBeqL2', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(55, 260, 'teknikarsitekturs1', '$2b$10$yaKGZbV4SwkHPlNI7/84r.pwAUvrluOgBuJ4N7zB1X086fOSC9EPa', 'admin', '', NULL, '2023-09-27 20:29:02', '2023-10-07 08:41:45'),
(56, 261, 'teknikperencanaanwilayahkotas1', '$2b$10$x9qMpo9j8UOVGh7Lg19kdOjZXa18ZwdX/IlChMu8kTlm0FQ.LR2me', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:45'),
(57, 262, 'teknikgeologis1', '$2b$10$zThGdSZ.7CEezpcd2/FPmuScmkceDUdTu2nmDy63TABh1csSj9SU.', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:45'),
(58, 263, 'teknikpertambangans1', '$2b$10$fe6pXRXJV5wFIcQ6KzkPm.CZN/ViWClJBN7wscc1eMj1Cm4V9Ioqi', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:45'),
(59, 264, 'tekniksipils3', '$2b$10$y5eASqRAYfoV8ZVApeMVDeIctQEX9yxBKHFl7U3JkEcPIbQ4XHAsq', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:45'),
(60, 265, 'teknikmesins2', '$2b$10$Tg1QoYaP97X1D5hqMThqhuEyK/.R2SnzrKKo9zhWw3/TtgxZlgFMm', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:45'),
(61, 266, 'tekniksipils2', '$2b$10$PikfGoHegbrDUIILBRhWsOUEqNFWDlbTYQa55rzv/uYPVw2fXFNTK', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:45'),
(62, 267, 'teknikelektros2', '$2b$10$9aI8LGeE2NeptcVOkus23eYpu99F9VEMd8zz9Ol1KjNxyWbpejTAW', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:45'),
(63, 268, 'teknikgeologis2', '$2b$10$w0XqZt.8A75IF3IhRUovhu9qHk/Xk95WcrWFUnPO0mEJj2SxLTz2C', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:45'),
(64, 269, 'teknikperkapalans2', '$2b$10$iKK/ms5CyizMInGDf4SXfuwuOrig0gplcgQxoLGYlsXUxZcb6yVkG', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:45'),
(65, 270, 'arsitekturs2', '$2b$10$TZe4Z16xjQZXog9uOXRDA.rv0.cd8nJLxiUobCEe4SkRlFs67vRWS', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:45'),
(66, 271, 'ilmuarsitekturs3', '$2b$10$5m1OgD.hpO14GMnth6qk/uOcWLheMuBohMuWKldqSZw.KpatxvhOK', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:45'),
(67, 272, 'teknologikebumiandanlingkungans3', '$2b$10$7JYUSJakTs6Kxg1tUo.c1eyxMvWEx/tl7MhzBewaUTksVu3i0vQL6', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:45'),
(68, 273, 'teknikelektros3', '$2b$10$rqMooSWYFr/BltQsRPNNaepDybQEtqWQATU2aBIvXrCieLaqgSflS', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:45'),
(69, 274, 'teknikmesins3', '$2b$10$aCVqBPezXwM9bpeES52rReT6Czt9ZFm.bWPhUAdUZOYorEwbqR7X6', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:46'),
(70, 275, 'profesiinsinyur', '$2b$10$frLeqMsj7eJLCucNmyd9SuhvYeoV/XGEXW4io78LNdRRL4w81nsnm', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:46'),
(71, 276, 'teknikindustris2', '$2b$10$evxQ6t38G3p8yJBulpZvweFW8ocwobP9WDgEZ49Ia0zh7IF7pN2p.', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:46'),
(72, 277, 'magisterteknikinformatika', '$2b$10$7P0tEFsx61gkS3o7hXhU2OoKUDYf/b5XMqKGIQ3XETbt/cwp7H01q', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:46'),
(73, 278, 'ilmupolitiks1', '$2b$10$1RoSveSLS/jdhyQp4e2jSeibFLNbJ4WunoaEsZ.4sW85oDBEMwB1i', 'admin', '', NULL, '2023-09-27 20:29:03', '2023-10-07 08:41:46'),
(74, 279, 'ilmupemerintahans1', '$2b$10$OeKnumXi967vEp0vZyTopOoSkI3h5j0PHzju1cL99idIxtuCo1zh6', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(75, 280, 'ilmuhub.internasionals1', '$2b$10$944WnoNF.woIWhXErW4Bge96OVXsYktF9fmIX20eWTLSZhjM6mZX.', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(76, 281, 'ilmuadministrasinegaras1', '$2b$10$v7Dpf7mf8X.D5vQ9xkSapup8cBj60kInplI61QSvKcJZM89OP6T4C', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(77, 282, 'ilmukomunikasis1', '$2b$10$p3GbPMpsAXCEABMbf.GZq..qvaFwv3Y5.KBZ0VPjShKdWIx3marLW', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(78, 283, 'sosiologis1', '$2b$10$bZcspO70RoOGn4Vhnshh2OVEPfwsao1eM96Vng25hz7KePm93vDLq', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(79, 284, 'antropologisosials1', '$2b$10$./TMgy797X.yfMreWPAkaObXT28fbSHw4EpeMEKPl6GMAiIoxDp9y', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(80, 285, 'administrasipembangunans2', '$2b$10$x8c3I2S0bCXHmwXunyY.PuMEMKjUqzrQ/YEgCGZfBP.FDLnVTvAR6', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(81, 286, 'ilmuadministrasipubliks3', '$2b$10$Dmw5EJr7y0Y5Up1ZmLXLgOq/Vkr/mOG/UmiGnmWnquObX69d8tCfa', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(82, 287, 'ilmukomunikasis2', '$2b$10$xkDmm1n6KCf6ZbQOy7zEbOyGaKQ17cy/rvRVNr72B.UIuCng0TAhW', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(83, 288, 'sosiologis2', '$2b$10$VAssfRNu8OMXjvrpdeMuEeHrNGu4Q.kW7rR2kgM/sO8n8bobn8ISe', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(84, 289, 'antropologis2', '$2b$10$6P2LC0h6El6WZp.D1vPFF.vlCyAQsqp5N.DWjo2CTrJwk5a6l906K', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(85, 290, 'ilmuantropologis3', '$2b$10$kXmEr2Ai4JIo5vPRf7aoGOmxEbZhHfAZKSHBixrXMfcyQ.iVP0nua', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(86, 291, 'ilmupolitiks2', '$2b$10$KmzZ4tXlds00U6wbW7pF9OOUf0wdMx2VdOlocQmDjMYYhBB8Unqz2', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(87, 292, 'ilmukomunikasis3', '$2b$10$4Z1BVpdlPYT52GroTa9g5uxnFNsX01gv.7L44gwB9y9r5Pk4TKx9O', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(88, 293, 'sosiologis3', '$2b$10$KB8Gvt020GCaP5yBv2dfXOUh4tP/2yLb7fnlHrNvWhCMFQUw4OdYm', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(89, 294, 'ilmupemerintahans2', '$2b$10$wUuxXUJqrQXbq5EfnJLtF.XMTqneS9fo/KQXjHKzBbBV0cmRqcABq', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(90, 295, 'sastraindonesias1', '$2b$10$LKBMZrYF1viR0D4bFcuxguLpf49uVsFqB3A86X2j1bAmsB2q0yt6i', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(91, 296, 'sastrainggriss1', '$2b$10$mCqx3Gi9zTalWf01PfBGfulFh3GDqdBgPW0Y.Z5cBTjfWvV.VeMnq', 'admin', '', NULL, '2023-09-27 20:29:04', '2023-10-07 08:41:46'),
(92, 297, 'sastrapranciss1', '$2b$10$a68ZXpUtbs9Hd8Yl6ZjJVeMteoBO8g6BqU6OeizSk02TmdFhKvCmi', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(93, 298, 'sastraasiabarats1', '$2b$10$iL3nkOSGmS0hJ0i5wx/S3OclwO3XT0qhSuwdoWRVO5F4lhd/KxFlO', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(94, 299, 'sastrabugismakassars1', '$2b$10$Z3B/dut9AKeCwUo4.KxzVOcAmMneAex.8O8ftqlZ7pOyXXCEVlG2i', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(95, 300, 'arkeologis1', '$2b$10$9aI.ecLmUkjHGLZn44h2h.awfn0gWKdkmeR3hHc50hrI6StchBsRO', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(96, 301, 'ilmusejarahs1', '$2b$10$zN6Wn9O4KFq4Yl.XU4zBi.mQ6fA0.vDr4VTU11X418w8yehRPvQ0q', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(97, 302, 'sastrajepangs1', '$2b$10$Z3XMOlHjR0BjcQWxs8Hke.bdZNuacyKJVWHTb1E0veNaqOi2YU0qW', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(98, 303, 'ilmulinguistiks3', '$2b$10$yPtYoo8HUBGQH8/FeglMhO8gSW34PvBd8Ao89iMURXBVMeKhYGLUm', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(99, 304, 'linguistiks2', '$2b$10$oiY9sh0LdnmXQcY8ZeuHYebJys4E1l5054TJGm0FZFbgORef3hQPW', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(100, 305, 'bahasainggriss2', '$2b$10$EeXMR2H7/7in0WSq9tyHS.tcHqcJG491u32d76GzO9PGivBx4GbJC', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(101, 306, 'bahasaindonesias2', '$2b$10$Nsa2ibjTCH5abfgeIijBduj3EObEEqT5AbdS8h2Qitj/vLXgcGTcq', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(102, 307, 'arkeologis2', '$2b$10$2gzDf3YnLfMlcmKJFhv9Eumbntr0Po.FzElX2Hes78khiKGfys6rq', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(103, 308, 'bahasamandarin', '$2b$10$xnyWCTPjqOiCAn4MHS1DI.oD.VTbCOvLsTgzLJJBkEQ5Z4uezSlBC', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(104, 309, 'bahasamandarindankebudayaantiongkok', '$2b$10$TNPXJO1hIQQqnG9zQM6hG..7A1XM7iOxNPq6/ROlET2CjI3GPRtfS', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(105, 310, 'bahasainggriss3', '$2b$10$5bUjcholfznkaKkoICYtD.Rmv7MjC0e3pJMIopaUsQngmQhkWUi.6', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(106, 311, 'teknologihasilhutan', '$2b$10$gGE33XvCts2jf.bD9sdfF.9L73ko09/2Ama/SU3juHTMYwzfcVTwi', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(107, 312, 'agroteknologis1', '$2b$10$dluuDk05./C2Zshs0o5R1.REZMPx2lmQAjW70VHfWz9DCqls1khm6', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(108, 313, 'agribisniss1', '$2b$10$ZccmFJQFWsMS/ZoSehHaL.jI0egG8ZXnm9W5NKt16lx9xxy81eRYu', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:46'),
(109, 314, 'ilmudanteknologipangans1', '$2b$10$pwU3r60m/KZhSfQCl0BXmemH5aVw2Hi/aSV540dd3QiQK5rC4sI1W', 'admin', '', NULL, '2023-09-27 20:29:05', '2023-10-07 08:41:47'),
(110, 315, 'keteknikanpertanians1', '$2b$10$QbUub0A.6Hw9E4j5SuMpfebMHFME34dnFtD4q1btk2vNpwt/SdhOa', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(111, 316, 'ilmudanteknologipangans2', '$2b$10$nqZnh/yueL7RN23kulCwC.KhWk2Sh.JCQiIXrQySCpqJ13Iu0jDLW', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(112, 317, 'keteknikanpertanians2', '$2b$10$ULTBkdSizwNfBv2iZWIdmeB.RYRrYcLCu7lTED7qC8vPqacNlYDfy', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(113, 318, 'ilmuhamadanpenyakittumbuhans2', '$2b$10$h4Qeit9.TrO1hyxpozMUTOFwf3yuZkVNW9e39LJ7.qvZX93eet6fm', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(114, 319, 'agroteknologis2', '$2b$10$gP.v2KSVJZq1X9vlZXLLWuPjM3LTLipfR8GFc3DPgq3R.c2.w.kfC', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(115, 320, 'teknikagroindustris2', '$2b$10$1kddUGcnQ2oBbjrhMJN1h.s1scPCJndbaGC1xfN0cbjMz/gKQNda.', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(116, 321, 'matematikas1', '$2b$10$7C2f.pHDFuWQpEsFzMVwF.i.DO3NUhE5r1T3CXLQe08Wxrr/Gy.r2', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(117, 322, 'statistikas1', '$2b$10$AV.dbkGOn313wQovCTApIufZRE0n.IpcnfhoRy4hzJqWeN.V3d5Jq', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(118, 323, 'fisikas1', '$2b$10$cMA9T5O4Vp0ucSNckWU.nepbRou71ZlJ0x27aO6zjSBMx0gspXTVC', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(119, 324, 'geofisikas1', '$2b$10$lgd/vL0qzniG0etHh4wNDeX6gzMW6ICjP4qZ/qOFWs93wAdkcD0Ly', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(120, 325, 'kimias1', '$2b$10$w/K2UUTYqgaeDQ.TJ9zYd.os2x2qYIT/xEDja79Z1WvJQDhhn9bgm', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(121, 326, 'biologis1', '$2b$10$Qrjpap5J/A3M4Bvw2QTCXO9MEEIuTtPTIeFK13it1PhZieUqzqz.e', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(122, 327, 'ilmukimias3', '$2b$10$YH4ziLcQVYfswk87iB3htu04XHhNwQxj9t84QzIBfbOU3PQEyKXDe', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(123, 328, 'kimias2', '$2b$10$3n8hPPmunZ2PNcwar8gIfua3zh1PH7V67NkbvVjleurNEt4g5L8se', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(124, 329, 'matematikaterapans2', '$2b$10$v9RGigjdCOV5BqazVv9V2uc5JI9Wc1J8zqQJKI6y1Kdi2xdbpnV1i', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(125, 330, 'ilmukomputers1', '$2b$10$U5i72jz6N6b/jynkbbF1KerLtOPtwJceTGQeMY9abq4d1g1tD8oR2', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(126, 331, 'geofisikas2', '$2b$10$/Ejxi3xd0SHR8Xcx/htP8eY/iLXkimeLAWVLrWQDAsATEyv6JXAqG', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(127, 332, 'fisikas2', '$2b$10$ip6MJT4qq0Gkt79SsGg8QenOgP3ldkpxpvKgyGNOYCfAIm4EycwdG', 'admin', '', NULL, '2023-09-27 20:29:06', '2023-10-07 08:41:47'),
(128, 333, 'biologis2', '$2b$10$Mzk62jMuZEgsT/QLBmxAj.x0UNY31/D674uphvuXt4XRRZQbaLEsq', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(129, 334, 'ilmuaktuaria', '$2b$10$Z2dSUSMugaV.cs5psETkK.5NfhmjziZPxKo7T03nKSbTsHTjvPPFO', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(130, 335, 'peternakans1', '$2b$10$s9ZasQNb.m4.yKZAFNLjdOSFqsC6XbJVAXZrM7564I54TViAyVzuS', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(131, 336, 'nutrisidanmakananternak', '$2b$10$7C0mXFjWjW50cfObUrKFh.aUDzGNgMk9zPq8V5.7AaAaQiQhEArDK', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(132, 337, 'sosekpeternakan', '$2b$10$hS2on70KAyFsF1xOVkeo5eWEuRWPrit5mffqfrObTEKLeocTqcMSC', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(133, 338, 'teknologihasilpeternakan', '$2b$10$h8eKOzCi.kfqhGz0vcFIUu3VHC44cBsSG6O1ebqAOHcZhW1jR1OMS', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(134, 339, 'ilmudanteknologipeternakans2', '$2b$10$qdNaXSMb7ymWprvC3T3Lse.9QE/Wtyd1/RStvFmwGT0UolcuYa5Uu', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(135, 340, 'peternakans3', '$2b$10$ZuGasOlBP9Gfnc1ndj4JaOcMtwgAYPhaUiK6jwzgNgwN5/QIwdTs6', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(136, 341, 'pendidikandoktergigis1', '$2b$10$oYusqXKi/6lGToGMieltFOLLJbBxdmGhFtno6ylhzVun.iWzzjKai', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(137, 342, 'profesidoktergigi', '$2b$10$jBm1Rxz8/zJfCbf9gZveT.8D/dEii5CtSsUuOQGw4sL.F2TtV.O5O', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(138, 343, 'ppdgsprostodonsia', '$2b$10$C57HCaKUyBvLUIyWms7weeCdm74dphT7J5xCPFaVS9Rkj/ZkOncge', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(139, 344, 'ppdgsilmukonservasigigi', '$2b$10$vtxvPUWY3TBuLYvmMtrZIu/Wxmvccdz9RO1zts.KlW3vBYEaJ2agO', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(140, 345, 'ppdgsdoktergigiperiodonsia', '$2b$10$JIZDmn8ZAhZSGd2XQ9VKHuaRKiJ09FA/K.Ah4pBbTNqXg3Ju1NDeq', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(141, 346, 'ppdgsbedahmulutdanmaksilofasial', '$2b$10$oqqir1fDN4C8is6Dphy0ke.oCB7yhQ9ik4wcw5AOUdJ5BLHKbnjOy', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(142, 347, 'kesehatanmasyarakats1', '$2b$10$kxVHwA7Uw6P6yWfqZIBK3O1nc4douXqpI.gw8fLYN/itfnR2yBx/G', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(143, 348, 'ilmugizis1', '$2b$10$rDYoUqGx62MWhOlREbPpK.2uPzRF8U2C8dCly37M0eeso84jrgjFu', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(144, 349, 'ilmukesehatanmasyarakats2', '$2b$10$stWNl9sIflg0UqN9J5peK.nkUoiEEAvDLEVbr0H2TB95EQDYyHQ/W', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(145, 350, 'kesehatanmasyarakats3', '$2b$10$V0FS3vQB70SLdt7wnio6DOjo3j.u34pYBprfa9lrQqxlPBTQgw6mK', 'admin', '', NULL, '2023-09-27 20:29:07', '2023-10-07 08:41:47'),
(146, 351, 'magisteradministrasirumahsakit', '$2b$10$6KH6OHpJkxgWMjymEOQKxuc0jhiZ3O9U5bPVcE/CsYKODCGQVsi0i', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:47'),
(147, 352, 'ilmukelautans1', '$2b$10$aoFDQcejcXQdx3XzQgpwguiobs/3UXclTGxkV6likaDv9I5bcXk6.', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:47'),
(148, 353, 'manajemens.dayaperairans1', '$2b$10$caNhangLjfO6bT.12EdKEujkEM.X3WktA9riKSa44Ss0j9nnZNuHG', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:47'),
(149, 354, 'budidayaperairans1', '$2b$10$Zlk.2JqeTMj5arqCl5XcQeJp9qoCUmgiQbFDzjxd7GQX0FT6X0LlC', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(150, 355, 'pemanf.s.dayaperikanans1', '$2b$10$tiyy1CbWJIsR9IGlebjuduJpEeqVHTn1vU6gV7MWT/V4yOfT2OD4.', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(151, 356, 'sosekperikanans1', '$2b$10$p/eQU8fmbxkBp7BhQjeftupFiZVfji9oJ79lZf9Qa.zMEQV1g5nOK', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(152, 357, 'ilmuperikanans3', '$2b$10$yPZZGysyFFAKIWWm89sEGe6WPZkOVxcOmh535t5u1Rw49B97tbCXK', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(153, 358, 'ilmuperikanans2', '$2b$10$EUoOoQykixEUnJ4gLcICg.Jzpp0rZffExCNe/1pGlQL6M5IOrzZSq', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(154, 359, 'pengelolaansumberdayapesisirterpadus2', '$2b$10$yz/mbXD9w4xTJYSTBs6bpOF956H3NSVAoCu6Sr2NhRUBRKvC2zLsm', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(155, 360, 'sistemsistempertanians2', '$2b$10$j01Mn0iK0xQWhSitMf9c5uuaZh5jAjzb9BfyG6rwf/OlYAeDrrHLK', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(156, 361, 'ilmupertanians3', '$2b$10$1ibN4loTaeLQaR9lOG7H/e2s1k8oAcIMw4Q/KvKv217vbIEpQTbsu', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(157, 362, 'perencanaandanpengembanganwilayahs2', '$2b$10$6Hu1PdsEdYXsv8qarebCvOwAh7RgU6jot4WxRBV6Fcsicob9AZPgC', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(158, 363, 'pengelolaanlingkunganhidups2', '$2b$10$NV3Lnxzxd6OUSZPprbQBMuhyKE75JrIVIKxxkb.ZkUcoEIcNmwwF2', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(159, 364, 'agribisniss2', '$2b$10$w6sp3c0p2KVNDRabluoipubdn0squGlLcZrlK29JOqL2/NNsXiYE6', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(160, 365, 'manajemenperkotaans2', '$2b$10$pJLhVMj4fd3vU4Knc5JQE.IbkX38yciLRhX37pHfAWsrGCnfAa3Su', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(161, 366, 'ilmubiomediks2', '$2b$10$YD1SCV59SithmGj676/OJOLyVyc1tynGnNAHHB/uMoKf60ubmMfM2', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(162, 367, 'jenderdanpembangunans2', '$2b$10$hRKs9rTHIOXMpr7gISOU6efN6KYHsYz4KCryzRkZaD5ajZCLAR7xO', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(163, 368, 'teknikperencanaanprasaranas2', '$2b$10$1KJGN3k4I/8PRhfX4fgsmuVwXxJjBtq4aZ.9qDrXyB.6X0UrKKYXe', 'admin', '', NULL, '2023-09-27 20:29:08', '2023-10-07 08:41:48'),
(164, 369, 'tekniktransportasis2', '$2b$10$DGD0kgPRu9XOUnd6bUsnl.nPEf33qIy3Pi51ef.zZhPp2RXpxEJf.', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(165, 370, 'ilmukebidanans2', '$2b$10$IOPtoVUaVK4414hrRubUd.zrUhN/1qo4FV60.NIAT01SRcQP7ZKve', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(166, 371, 'kehutanans1', '$2b$10$TOGn3cOWPExR7TVxvXe4jenY7M0Qrt3mZDJmn8HnscNaAkYBx84KW', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(167, 372, 'kehutanans2', '$2b$10$.C7wT0Qeh2/hT.gzLoGzRu3tImlHcglr0UEaXLSytXZmlVNs3PQze', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(168, 373, 'kehutanans3', '$2b$10$AZOTB/DVVmbjEjm5swwUZeB2v4XwXFKW0tdf2GD7DaY/sWFaBd1zm', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(169, 374, 'farmasis1', '$2b$10$Be161LQi.vQrovAEWWKj8.IxqylQ3y6yjlkigX7zzQMZfFl8VaEUW', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(170, 375, 'prog.profesiapoteker', '$2b$10$EcVH5jmrhEfPCllyCdRSHuO6/kC8zeDhyhS1GetWqWUo2eI4LSDq.', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(171, 376, 'farmasis2', '$2b$10$vZsQFS472qoWt3MctbFDMO78i/JY3OkFufxX8vk1BrslS8eVVNnAe', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(172, 377, 'ilmufarmasis3', '$2b$10$3ABG4v5/1W/oMePkX2/ABuGHDTz59xJAI6bU8PQYXisMwE6nnVfvO', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(173, 378, 'mkueksakta', '$2b$10$lDaCaUN2ugiWX2N0shx.HesTpWN6Efm0BSu5Pxxk7XY54lA8jZwc2', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(174, 379, 'mkunoneksakta', '$2b$10$cP3k0w5cEh8MjebyU/SsEeM59qBorzVVY51pwH4Kz62/dIZm.4rbq', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(175, 380, 'p2kkn', '$2b$10$cKI6OJDIYTXXLE.KEqlDD.gdVNZP4JFz9CSyanCcj0dddcrjOL2He', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(176, 381, 'keperawatans1', '$2b$10$hJd7v.xfYrI1cjIhDuk1uOb52/oduiumuamSHdbv3QPanJphHMvni', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTc2LCJ1c2VybmFtZSI6ImtlcGVyYXdhdGFuczEiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE2OTY2NjczODgsImV4cCI6MTY5Njc1Mzc4OH0.ewfBTiOWnGWizs2_R9MWN2g93pLTXCPE8Y5LKnOglig', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(177, 382, 'fisioterapi', '$2b$10$RrMrPMqeK647uSfnzmepLu3ua.PGCpBoiEBhhFQEvwJV.sOD5SnJy', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(178, 383, 'profesikeperawatan', '$2b$10$VaoPPEE.bvGF1D0tNXvvMut.TblFfMa4KuZEprgb8XPr0V/SgD5Km', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(179, 384, 'profesifisioterapi', '$2b$10$2YmJOwqDRA9u5W6iykMpuOmaix.buG15cTYjstvjZqb6.e5oTViEu', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(180, 385, 'ilmukeperawatans2', '$2b$10$HKHPn81rDmqPzZuRXSIOjuneReWuAHXCFHUYzTq4Rh7Rm5T3AMZGa', 'admin', '', NULL, '2023-09-27 20:29:09', '2023-10-07 08:41:48'),
(181, 206, 'D041171508', '$2b$10$6nZlt6i9ulPlSVwzOJA0CeLGoWzMLhR4.NaDEDsoqtGGQyuPcqGC6', 'mahasiswa', NULL, NULL, '2023-09-25 02:52:49', '2023-09-25 02:52:49'),
(182, 206, '13749202', '$2b$10$btupVqZoP0..yAB8PzdICu.H/vpqnHJldjjWah741umU8iVsjEBgS', 'dosen', NULL, NULL, '2023-09-25 02:55:19', '2023-09-25 02:55:19'),
(183, 206, '38293023', '$2b$10$PImJlBfmOLtkeZC3ZjZI7.ACoJcKgixaM/I9sPUZPRspNsbW2PKqS', 'dosen', NULL, NULL, '2023-09-25 02:57:17', '2023-09-25 02:57:17'),
(184, 207, 'H21115302', '$2b$10$ZosFmVVJ3D3LeHdi9bVB9.aiFRfI3W/qKbyweV7xl3j6Eb6oxhXii', 'mahasiswa', NULL, NULL, '2023-10-05 08:09:05', '2023-10-05 08:09:05'),
(185, 207, '38293024', '$2b$10$PImJlBfmOLtkeZC3ZjZI7.ACoJcKgixaM/I9sPUZPRspNsbW2PKqS', 'dosen', NULL, NULL, '2023-09-25 02:57:17', '2023-09-25 02:57:17'),
(186, 207, '38293329', '$2b$10$PImJlBfmOLtkeZC3ZjZI7.ACoJcKgixaM/I9sPUZPRspNsbW2PKqS', 'dosen', NULL, NULL, '2023-09-25 02:57:17', '2023-09-25 02:57:17'),
(187, 207, '38277662', '$2b$10$PImJlBfmOLtkeZC3ZjZI7.ACoJcKgixaM/I9sPUZPRspNsbW2PKqS', 'dosen', NULL, NULL, '2023-09-25 02:57:17', '2023-09-25 02:57:17'),
(188, 208, '38233662', '$2b$10$PImJlBfmOLtkeZC3ZjZI7.ACoJcKgixaM/I9sPUZPRspNsbW2PKqS', 'dosen', NULL, NULL, '2023-09-25 02:57:17', '2023-09-25 02:57:17'),
(189, 209, 'H29995302', '$2b$10$FU7WKLButIDqip.Vpg0UDOo9k1HYwMybcHAKDEfSIcdtS4ARkqk.i', 'mahasiswa', NULL, NULL, '2023-10-09 01:52:54', '2023-10-09 01:52:54'),
(190, 210, 'H28885301', '$2b$10$61lPdF4zRsJzVQXzZ4VjJOGGxEIVN2IEEFYSrT2APo/GXnKSAEvPa', 'mahasiswa', NULL, NULL, '2023-10-09 01:53:52', '2023-10-09 01:53:52'),
(191, 211, 'B27775301', '$2b$10$zH56wGBJxOf5/hsqQQkL2.YiAHVapHkvRcdjoQ3HKYZM5kiPOw.Oe', 'mahasiswa', NULL, NULL, '2023-10-09 01:54:38', '2023-10-09 01:54:38'),
(192, 212, 'G23335301', '$2b$10$Q3dHeaDyr2Xzz38o7XPw3.R2Jl5d8nFX9F.wLIRctCk13YiCDqMAe', 'mahasiswa', NULL, NULL, '2023-10-09 01:55:32', '2023-10-09 01:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `users_backup`
--

CREATE TABLE `users_backup` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `session_date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_backup`
--

INSERT INTO `users_backup` (`id`, `username`, `password`, `session_date`, `createdAt`, `updatedAt`) VALUES
(1, 'prodiekonomi', '$2b$10$RUkhwEK8l2UQkucy8PTNvOrkS/VohjnGA8sMGiD/oDHoaP3n0i68y', NULL, '2023-09-22 03:17:04', '2023-10-02 03:18:15'),
(2, 'D041171508', '$2b$10$6nZlt6i9ulPlSVwzOJA0CeLGoWzMLhR4.NaDEDsoqtGGQyuPcqGC6', NULL, '2023-09-25 02:52:49', '2023-09-25 02:52:49'),
(3, '13749202', '$2b$10$btupVqZoP0..yAB8PzdICu.H/vpqnHJldjjWah741umU8iVsjEBgS', NULL, '2023-09-25 02:55:19', '2023-09-25 02:55:19'),
(4, '38293023', '$2b$10$PImJlBfmOLtkeZC3ZjZI7.ACoJcKgixaM/I9sPUZPRspNsbW2PKqS', NULL, '2023-09-25 02:57:17', '2023-09-25 02:57:17'),
(5, 'H21115302', '$2b$10$ZosFmVVJ3D3LeHdi9bVB9.aiFRfI3W/qKbyweV7xl3j6Eb6oxhXii', NULL, '2023-10-05 08:09:05', '2023-10-05 08:09:05'),
(6, 'prodiekonomi1', '$2b$10$RUkhwEK8l2UQkucy8PTNvOrkS/VohjnGA8sMGiD/oDHoaP3n0i68y', NULL, '2023-09-22 03:17:04', '2023-10-02 03:18:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `document_logbook`
--
ALTER TABLE `document_logbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_bimbingan`
--
ALTER TABLE `jadwal_bimbingan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_ujian`
--
ALTER TABLE `jadwal_ujian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asdasdas` (`id_user`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengajuan_proposal`
--
ALTER TABLE `pengajuan_proposal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_backup`
--
ALTER TABLE `users_backup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `document_logbook`
--
ALTER TABLE `document_logbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jadwal_bimbingan`
--
ALTER TABLE `jadwal_bimbingan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jadwal_ujian`
--
ALTER TABLE `jadwal_ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pengajuan_proposal`
--
ALTER TABLE `pengajuan_proposal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `users_backup`
--
ALTER TABLE `users_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
