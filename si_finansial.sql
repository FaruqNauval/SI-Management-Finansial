-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Apr 2023 pada 02.29
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_finansial`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `ID_BARANG` int(11) NOT NULL,
  `ID_KATAGORI_BARANG` int(11) NOT NULL,
  `ID_STOK_BARANG` int(11) NOT NULL,
  `ID_GUDANG` int(11) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `HARGA` int(255) NOT NULL,
  `TGL_MASUK` varchar(255) NOT NULL,
  `TGL_KELUAR` varchar(255) NOT NULL,
  `DESKRIPSI` varchar(255) NOT NULL,
  `FOTO` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gudang`
--

CREATE TABLE `gudang` (
  `ID_GUDANG` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `DESKRIPSI` varchar(255) NOT NULL,
  `ALAMAT` varchar(255) NOT NULL,
  `KAPASITAS` int(255) NOT NULL,
  `TGL_BARANG_MASUK` varchar(255) NOT NULL,
  `TGL_BARANG_KELUAR` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `katagori_barang`
--

CREATE TABLE `katagori_barang` (
  `ID_KATAGORI_BARANG` int(11) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `DESKRIPSI` varchar(255) NOT NULL,
  `TGL_BUAT` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `muatasi_stok`
--

CREATE TABLE `muatasi_stok` (
  `ID_MUTASI` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `ID_PENGIRIMAN` int(11) NOT NULL,
  `JUMLAH_MUTASI` int(11) NOT NULL,
  `KETERANGAN` varchar(255) NOT NULL,
  `TGL_MUTASI` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `ID_OUTLET` int(11) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `DESKRIPSI` varchar(255) NOT NULL,
  `TIPE` varchar(255) NOT NULL,
  `NO_TELP` varchar(255) NOT NULL,
  `ALAMAT` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `ID_PEGAWAI` int(11) NOT NULL,
  `ID_PENGGUNA` int(11) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `ALAMAT` varchar(255) NOT NULL,
  `NO_HP` varchar(255) NOT NULL,
  `FOTO` varchar(255) NOT NULL,
  `JABATAN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `ID_PENGGUNA` int(11) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `JABATAN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengiriman`
--

CREATE TABLE `pengiriman` (
  `ID_ROUTE` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `ASAL` varchar(255) NOT NULL,
  `TUJUAN` varchar(255) NOT NULL,
  `ONGKOS_KIRIM` varchar(255) NOT NULL,
  `METODE_PENGIRIMAN` varchar(255) NOT NULL,
  `TGL_PENGIRIMAN` varchar(255) NOT NULL,
  `TGL_DITERIMA` varchar(255) NOT NULL,
  `STATUS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_barang`
--

CREATE TABLE `stok_barang` (
  `ID_STOK_BARANG` int(11) NOT NULL,
  `JUMLAH_STOK` int(11) NOT NULL,
  `SATUAN` varchar(255) NOT NULL,
  `SUPPLIER` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `ID_SUPPLIER` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `ALAMAT` varchar(255) NOT NULL,
  `NO_TELP` varchar(255) NOT NULL,
  `JUMLAH_BARANG` int(11) NOT NULL,
  `TGL_SUPPLY` varchar(255) NOT NULL,
  `HARGA_SUPPLY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_TRANSAKSI` int(11) NOT NULL,
  `ID_OUTLET` int(11) NOT NULL,
  `ID_PENGIRIMAN` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `ID_PEGAWAI` int(11) NOT NULL,
  `JUMLAH_BARANG` int(11) NOT NULL,
  `TOTAL_HARGA` int(11) NOT NULL,
  `METODE_BAYAR` varchar(255) NOT NULL,
  `KETERANGAN` varchar(255) NOT NULL,
  `TGL_TRANSAKSI` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_BARANG`),
  ADD KEY `ID_KATAGORI_BARANG` (`ID_KATAGORI_BARANG`),
  ADD KEY `ID_STOK_BARANG` (`ID_STOK_BARANG`),
  ADD KEY `ID_GUDANG` (`ID_GUDANG`);

--
-- Indeks untuk tabel `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`ID_GUDANG`),
  ADD KEY `ID_BARANG` (`ID_BARANG`);

--
-- Indeks untuk tabel `katagori_barang`
--
ALTER TABLE `katagori_barang`
  ADD PRIMARY KEY (`ID_KATAGORI_BARANG`);

--
-- Indeks untuk tabel `muatasi_stok`
--
ALTER TABLE `muatasi_stok`
  ADD PRIMARY KEY (`ID_MUTASI`),
  ADD KEY `ID_BARANG` (`ID_BARANG`),
  ADD KEY `ID_PENGIRIMAN` (`ID_PENGIRIMAN`);

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`ID_OUTLET`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`ID_PEGAWAI`),
  ADD KEY `ID_PENGGUNA` (`ID_PENGGUNA`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`ID_PENGGUNA`);

--
-- Indeks untuk tabel `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`ID_ROUTE`),
  ADD KEY `ID_BARANG` (`ID_BARANG`);

--
-- Indeks untuk tabel `stok_barang`
--
ALTER TABLE `stok_barang`
  ADD PRIMARY KEY (`ID_STOK_BARANG`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`ID_SUPPLIER`),
  ADD KEY `ID_BARANG` (`ID_BARANG`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_TRANSAKSI`),
  ADD KEY `ID_OUTLET` (`ID_OUTLET`),
  ADD KEY `ID_PENGIRIMAN` (`ID_PENGIRIMAN`),
  ADD KEY `ID_BARANG` (`ID_BARANG`),
  ADD KEY `ID_PEGAWAI` (`ID_PEGAWAI`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`ID_KATAGORI_BARANG`) REFERENCES `katagori_barang` (`ID_KATAGORI_BARANG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`ID_STOK_BARANG`) REFERENCES `stok_barang` (`ID_STOK_BARANG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_ibfk_3` FOREIGN KEY (`ID_GUDANG`) REFERENCES `gudang` (`ID_GUDANG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `gudang`
--
ALTER TABLE `gudang`
  ADD CONSTRAINT `gudang_ibfk_1` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `muatasi_stok`
--
ALTER TABLE `muatasi_stok`
  ADD CONSTRAINT `muatasi_stok_ibfk_1` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`ID_PENGGUNA`) REFERENCES `pengguna` (`ID_PENGGUNA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD CONSTRAINT `pengiriman_ibfk_1` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_OUTLET`) REFERENCES `outlet` (`ID_OUTLET`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_PEGAWAI`) REFERENCES `pegawai` (`ID_PEGAWAI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
