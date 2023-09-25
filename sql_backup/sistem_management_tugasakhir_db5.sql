-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2023 at 05:36 AM
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
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` int(11) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_dosen` varchar(255) NOT NULL,
  `nip` varchar(255) NOT NULL,
  `dosen_type` varchar(255) NOT NULL,
  `dosen_profile` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `id_prodi`, `id_user`, `nama_dosen`, `nip`, `dosen_type`, `dosen_profile`, `createdAt`, `updatedAt`) VALUES
(1, 206, 3, 'Dr. Rahmat', '13749202', 'Internal', 'URL_Gambar_Profiles_Dosen', '2023-09-24 09:34:41', '2023-09-24 11:14:16'),
(2, 206, 4, 'Dr. Adi', '38293023', 'Internal', 'URL_Gambar_Profile_Dosen', '2023-09-25 02:42:02', '2023-09-25 02:42:02');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_bimbingan`
--

CREATE TABLE `jadwal_bimbingan` (
  `id` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL,
  `jadwal` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_bimbingan`
--

INSERT INTO `jadwal_bimbingan` (`id`, `id_mahasiswa`, `id_dosen`, `jadwal`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, '2023-09-26 10:00:00', 'Approve', '2023-09-24 15:59:47', '2023-09-24 16:16:43');

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
  `status` varchar(255) NOT NULL,
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
(1, 1, 206, 2, 'Fernand', 'D041171508', '2023', '0', 'Dr. Smith|JohnDoe S.Pd., M.Pd ', 'Dr. Jane|Heril ST', 'Analisis Data Menggunakan Algoritma XYZ', 'https://example.com/profile/johndoe.jpg', '2023-09-22 03:35:21', '2023-09-22 03:35:21');

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
(1, 1, 1, '3 notifikasi belum di baca', '2023-09-25 12:00:00', '2023-09-25 02:23:30', '2023-09-25 02:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_proposal`
--

CREATE TABLE `pengajuan_proposal` (
  `id` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `dosen_pembimbing` varchar(255) NOT NULL,
  `dosen_penguji` varchar(255) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengajuan_proposal`
--

INSERT INTO `pengajuan_proposal` (`id`, `id_mahasiswa`, `judul`, `dosen_pembimbing`, `dosen_penguji`, `document`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Analisis Dampak Lingkungan Pabrik Y', '1', '2', 'assets\\1695397862202-dummies10.pdf', '0', '2023-09-22 14:47:36', '2023-09-22 15:51:02');

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

INSERT INTO `users` (`id`, `username`, `password`, `role`, `refresh_token`, `session_date`, `createdAt`, `updatedAt`) VALUES
(1, 'prodiekonomi', '$2b$10$RUkhwEK8l2UQkucy8PTNvOrkS/VohjnGA8sMGiD/oDHoaP3n0i68y', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTY5NTQ3Njk0NSwiZXhwIjoxNjk1NTYzMzQ1fQ.0c5QwF-8MYAdZwr0ZTqB0rhMkUWPn-h8dbnDeb9OxO0', NULL, '2023-09-22 03:17:04', '2023-09-23 13:49:05'),
(2, 'D041171508', '$2b$10$6nZlt6i9ulPlSVwzOJA0CeLGoWzMLhR4.NaDEDsoqtGGQyuPcqGC6', 'mahasiswa', NULL, NULL, '2023-09-25 02:52:49', '2023-09-25 02:52:49'),
(3, '13749202', '$2b$10$btupVqZoP0..yAB8PzdICu.H/vpqnHJldjjWah741umU8iVsjEBgS', 'dosen', NULL, NULL, '2023-09-25 02:55:19', '2023-09-25 02:55:19'),
(4, '38293023', '$2b$10$PImJlBfmOLtkeZC3ZjZI7.ACoJcKgixaM/I9sPUZPRspNsbW2PKqS', 'dosen', NULL, NULL, '2023-09-25 02:57:17', '2023-09-25 02:57:17');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jadwal_bimbingan`
--
ALTER TABLE `jadwal_bimbingan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pengajuan_proposal`
--
ALTER TABLE `pengajuan_proposal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
