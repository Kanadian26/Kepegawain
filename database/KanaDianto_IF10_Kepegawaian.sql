-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Feb 2025 pada 04.42
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kepegawaian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--

CREATE TABLE `departemen` (
  `id` int(11) NOT NULL,
  `nama_departemen` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `departemen`
--

INSERT INTO `departemen` (`id`, `nama_departemen`, `deskripsi`) VALUES
(9, 'HR', 'Mengelola sumber daya manusia, rekrutmen, dan kesejahteraan karyawan'),
(10, 'Keuangan', 'Mengatur keuangan perusahaan, termasuk penggajian dan anggaran'),
(11, 'IT', 'Bertanggung jawab atas infrastruktur teknologi dan pengembangan perangkat lunak'),
(12, 'Pemasaran', 'Mengelola strategi pemasaran dan promosi produk'),
(13, 'Penjualan', 'Bertanggung jawab atas penjualan produk dan layanan perusahaan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL,
  `id_departemen` int(11) DEFAULT NULL,
  `gaji` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama_jabatan`, `id_departemen`, `gaji`) VALUES
(28, 'HR Manager', 9, 12000000.00),
(29, 'HR Staff', 9, 7000000.00),
(30, 'Finance Manager', 10, 15000000.00),
(31, 'Accountant', 10, 9000000.00),
(32, 'IT Manager', 11, 18000000.00),
(33, 'Software Engineer', 11, 12000000.00),
(34, 'Marketing Manager', 12, 14000000.00),
(35, 'Marketing Executive', 12, 8000000.00),
(36, 'Sales Manager', 13, 13500000.00),
(37, 'Sales Representative', 13, 7500000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_departemen` int(11) DEFAULT NULL,
  `id_jabatan` int(11) DEFAULT NULL,
  `gaji` decimal(10,2) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `nip`, `nama`, `id_departemen`, `id_jabatan`, `gaji`, `jenis_kelamin`, `tanggal_masuk`) VALUES
(17, '1023456789', 'Budi Santoso', 9, 28, 12000000.00, 'Laki-laki', '2020-03-15'),
(18, '1987654321', 'Siti Aisyah', 9, 29, 7000000.00, 'Perempuan', '2021-06-10'),
(19, '1234509876', 'Andi Wijaya', 10, 30, 15000000.00, 'Laki-laki', '2019-09-01'),
(20, '1092837465', 'Dewi Lestari', 10, 31, 9000000.00, 'Perempuan', '2022-02-20'),
(21, '1567894320', 'Rahmat Hidayat', 11, 32, 18000000.00, 'Laki-laki', '2018-11-05'),
(22, '1345678902', 'Fitri Ananda', 11, 33, 12000000.00, 'Perempuan', '2020-08-12'),
(23, '1765432109', 'Joko Prasetyo', 12, 34, 14000000.00, 'Laki-laki', '2017-04-30'),
(24, '1456789230', 'Lina Marlina', 12, 35, 8000000.00, 'Perempuan', '2021-12-18'),
(26, '1324678905', 'Rina Septiani', 13, 37, 7500000.00, 'Perempuan', '2023-01-05'),
(28, '1234567891', 'Sarah', 11, 32, 18000000.00, 'Perempuan', '2025-02-03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(3, 'admin', '$2y$10$XVumsH1Km4a8qFlxqER7LucYD5mEnew2X/eTN61HtcJ7yFCDU5UBy');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_departemen` (`id_departemen`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `id_departemen` (`id_departemen`),
  ADD KEY `id_jabatan` (`id_jabatan`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD CONSTRAINT `jabatan_ibfk_1` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id`);

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id`),
  ADD CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
