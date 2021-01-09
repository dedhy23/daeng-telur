-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2021 at 07:43 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_apt`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_biaya_kerusakan`
--

CREATE TABLE `data_biaya_kerusakan` (
  `id_biaya_kerusakan` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_biaya_kerusakan`
--

INSERT INTO `data_biaya_kerusakan` (`id_biaya_kerusakan`, `id_transaksi`, `keterangan`, `jumlah`) VALUES
(1, 1, 'C1', 1000),
(2, 1, 'C2', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `data_biaya_tambahan`
--

CREATE TABLE `data_biaya_tambahan` (
  `id_biaya_tambahan` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_biaya_tambahan`
--

INSERT INTO `data_biaya_tambahan` (`id_biaya_tambahan`, `id_transaksi`, `keterangan`, `jumlah`) VALUES
(1, 1, 'Biaya Administrasi.', 20000),
(2, 7, 'Biaya Administrasi.', 20000),
(3, 8, 'Biaya Administrasi.', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `data_kategori`
--

CREATE TABLE `data_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(25) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_kategori`
--

INSERT INTO `data_kategori` (`id_kategori`, `nama_kategori`, `deskripsi`) VALUES
(1, 'telur burung', 'ini telur burung puyuh'),
(2, 'telur asin', 'kjmi');

-- --------------------------------------------------------

--
-- Table structure for table `data_konfigurasi_menu_pelanggan`
--

CREATE TABLE `data_konfigurasi_menu_pelanggan` (
  `id_konfigurasi_menu_pelanggan` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `parent` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `konfigurasi_css` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_konfigurasi_menu_pelanggan`
--

INSERT INTO `data_konfigurasi_menu_pelanggan` (`id_konfigurasi_menu_pelanggan`, `nama`, `parent`, `url`, `konfigurasi_css`) VALUES
(1, 'Beranda', 0, '/apt', ''),
(2, 'Produk', 0, '/apt/?content=produk', ''),
(3, 'Transaksi', 0, '/apt/?content=transaksi', ''),
(12, 'Kontak', 0, '/apt/?content=kontak', ''),
(13, '&lt;i class=&quot;fa fa-cog&quot;&gt;&lt;/i&gt;', 0, '#', 'fz-18'),
(14, 'Profil', 13, '/apt/?content=profil', ''),
(15, 'Login', 13, 'login.php', ''),
(16, 'Register', 13, 'register.php', ''),
(17, 'Logout', 13, '/apt/?content=login_proses&amp;proses=logout', '');

-- --------------------------------------------------------

--
-- Table structure for table `data_konfigurasi_umum`
--

CREATE TABLE `data_konfigurasi_umum` (
  `id_konfigurasi_umum` int(11) NOT NULL,
  `nama_konfigurasi` varchar(255) NOT NULL,
  `nilai_konfigurasi` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_konfigurasi_umum`
--

INSERT INTO `data_konfigurasi_umum` (`id_konfigurasi_umum`, `nama_konfigurasi`, `nilai_konfigurasi`, `keterangan`) VALUES
(1, 'biaya_administrasi', '20000', 'Biaya administrasi untuk setiap transaksi.'),
(2, 'no_rek_transaksi', '0901111111111111111', 'Bank BRI Atas Nama : Bla bla bla'),
(3, 'biaya_administrasi', '20000', 'Biaya panjar bagi pelanggan.'),
(4, 'office_address', 'Jl. Griya Pajjaiyang Indah Blok C No.1, Kel. Sudiang Raya, Kec. Biringkanaya, Kota Makassar, Sulawesi Selatan 90324', 'Alamat Kantor : Jl. Griya Pajjaiyang Indah Blok C No.1, Kel. Sudiang Raya, Kec. Biringkanaya, Kota Makassar, Sulawesi Selatan 90324'),
(5, 'phone_number', '+62 852 1029 1210', 'No. Telp : +62 852 1029 1210'),
(6, 'official_website', 'http://www.aryanspider.blogspot.com', 'Situs Resmi : http://www.aryanspider.blogspot.com'),
(7, 'official_email', 'aryan@stimednp.ac.id', 'Email Resmi : aryan@stimednp.ac.id'),
(8, 'open_hours', 'Senin-Jumat, pukul 08:00 AM â€“ 06:00 PM WITA', 'Jam Kerja : Senin-Jumat, pukul 08:00 AM â€“ 06:00 PM WITA');

-- --------------------------------------------------------

--
-- Table structure for table `data_kurir`
--

CREATE TABLE `data_kurir` (
  `id_kurir` int(11) NOT NULL,
  `nama_kurir` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `status_akun` enum('aktif','non_aktif') NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_kurir`
--

INSERT INTO `data_kurir` (`id_kurir`, `nama_kurir`, `username`, `password`, `alamat`, `status_akun`, `email`, `no_hp`, `foto`) VALUES
(1, 'irma', 'irma', '76af47488ac4ecce7c29005f15cf7d0e', 'jl hikkeh ', 'aktif', 'ariantampan@ymail.com', '085341725235', 'assets/img/kurir/cdec8f020bd6caa8ad7669ff80503a388d310c90.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `data_pelanggan`
--

CREATE TABLE `data_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `status_akun` enum('aktif','non_aktif','blokir') NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_pelanggan`
--

INSERT INTO `data_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `username`, `password`, `alamat`, `status_akun`, `email`, `no_hp`, `foto`) VALUES
(2, 'irma', 'irma', '76af47488ac4ecce7c29005f15cf7d0e', 'jl hikkeh ahh', 'aktif', 'ariantampan@ymail.com', '085341725235', 'assets/img/pelanggan/eb998a13168da0cb1fe51ba116ae6c4888069bbe.png');

-- --------------------------------------------------------

--
-- Table structure for table `data_pengguna`
--

CREATE TABLE `data_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `jenis_akun` enum('admin') NOT NULL,
  `status_akun` enum('aktif','non_aktif') NOT NULL,
  `email` varchar(30) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_pengguna`
--

INSERT INTO `data_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `jenis_akun`, `status_akun`, `email`, `no_hp`, `foto`) VALUES
(1, 'irma', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'aktif', 'arians999@gmail.com', '085341725235', 'assets/img/pengguna/c62f3b30b46254ccd345438aa56b58aa4f194075.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `data_riwayat_pembayaran`
--

CREATE TABLE `data_riwayat_pembayaran` (
  `id_riwayat_pembayaran` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL DEFAULT 0,
  `jumlah` int(11) NOT NULL DEFAULT 0,
  `bukti_pembayaran` varchar(255) NOT NULL,
  `info_pembayaran` enum('transfer','ditempat') NOT NULL DEFAULT 'ditempat',
  `tgl_pembayaran` date NOT NULL DEFAULT '0000-00-00',
  `konfirmasi_admin` enum('belum','ya','tidak') NOT NULL DEFAULT 'belum'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_riwayat_pembayaran`
--

INSERT INTO `data_riwayat_pembayaran` (`id_riwayat_pembayaran`, `id_transaksi`, `jumlah`, `bukti_pembayaran`, `info_pembayaran`, `tgl_pembayaran`, `konfirmasi_admin`) VALUES
(1, 1, 8000, '', 'ditempat', '0000-00-00', 'belum'),
(2, 3, 20000, '', 'ditempat', '0000-00-00', 'belum'),
(3, 4, 2000, 'assets/img/bukti_pembayaran/187361c5b2d0f1b0add6924a5e2de23a4834c4d3.png', 'transfer', '0000-00-00', 'belum'),
(4, 8, 30000, '', 'ditempat', '0000-00-00', 'belum');

-- --------------------------------------------------------

--
-- Table structure for table `data_telur`
--

CREATE TABLE `data_telur` (
  `id_telur` int(11) NOT NULL,
  `nama_telur` varchar(50) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `persediaan` int(11) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `tgl_awal_diskon` date DEFAULT NULL,
  `tgl_akhir_diskon` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_telur`
--

INSERT INTO `data_telur` (`id_telur`, `nama_telur`, `id_kategori`, `harga_jual`, `persediaan`, `deskripsi`, `diskon`, `tgl_awal_diskon`, `tgl_akhir_diskon`) VALUES
(1, 'Telur Asin Cap 666', 2, 2000, 6, '<p>Blablablabla...</p>\r\n', NULL, NULL, NULL),
(2, 'Telur Asin Cap 666', 2, 2000, 6, '<p>Blablablabla...</p>\r\n', NULL, NULL, NULL),
(3, 'Telur Asin Cap 666', 2, 2000, 6, '<p>Blablablabla...</p>\r\n', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_telur_foto`
--

CREATE TABLE `data_telur_foto` (
  `id_foto` int(11) NOT NULL,
  `id_telur` int(11) NOT NULL,
  `url_foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_telur_foto`
--

INSERT INTO `data_telur_foto` (`id_foto`, `id_telur`, `url_foto`) VALUES
(1, 5, 'assets/img/telur/fd7a1dde8a665fc704ea02888b2c603cd4d71e53.png'),
(2, 5, 'assets/img/telur/fbd97662a8f45082c705173fdff7214efeb5f093.png'),
(3, 5, 'assets/img/telur/1f1a230edd6e1c80acd5bdc62e43b5939a71fc11.png'),
(4, 5, 'assets/img/telur/ef3e0bad1c7c6ab1436edff6dc585305d2729007.png');

-- --------------------------------------------------------

--
-- Table structure for table `data_telur_masuk`
--

CREATE TABLE `data_telur_masuk` (
  `id_telur_masuk` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `id_telur` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_telur_masuk`
--

INSERT INTO `data_telur_masuk` (`id_telur_masuk`, `tanggal`, `id_telur`, `jumlah`, `harga_beli`) VALUES
(8, '2019-07-09 00:00:00', 5, 55, 5500000);

-- --------------------------------------------------------

--
-- Table structure for table `data_transaksi`
--

CREATE TABLE `data_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `no_transaksi` varchar(32) DEFAULT NULL,
  `tgl_transaksi` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pelanggan` int(11) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `status_transaksi` enum('tunggu','proses','selesai','batal') NOT NULL DEFAULT 'tunggu',
  `diantarkan` enum('ya','tidak') NOT NULL DEFAULT 'tidak',
  `tgl_pengantaran` date DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `longlat` varchar(255) DEFAULT NULL,
  `id_kurir` int(11) DEFAULT NULL,
  `kurir_check` enum('belum','sudah','selesai') NOT NULL DEFAULT 'belum'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_transaksi`
--

INSERT INTO `data_transaksi` (`id_transaksi`, `no_transaksi`, `tgl_transaksi`, `id_pelanggan`, `no_telp`, `keterangan`, `status_transaksi`, `diantarkan`, `tgl_pengantaran`, `alamat`, `longlat`, `id_kurir`, `kurir_check`) VALUES
(1, 'TR-20190715212411', '2019-07-15 21:24:11', 2, '085341725235', '', 'selesai', 'ya', '2019-07-16', 'Jl. Daeng Tata 1. BTN. Tabaria Blok G8 No. 6', '119.43921690713383,-5.174376889312322', 1, 'sudah'),
(2, 'TR-20190719165148', '2019-07-19 16:51:49', 2, '085341725235', 'Dgdg', 'batal', 'ya', '2019-07-20', 'Jjjj it', '119.52165035534688,-5.10636183661318', 0, 'belum'),
(3, 'TR-20190719165843', '2019-07-19 16:58:43', 2, '085341725235', 'Sangat butuh', 'batal', 'ya', '2019-07-19', 'Bro blok g no 123', '', 0, 'belum'),
(4, 'TR-20190719175231', '2019-07-19 17:52:31', 2, '085341725235', 'hjhk', 'batal', 'ya', '2019-07-20', 'Jl. Daeng Tata 1. BTN. Tabaria Blok G8 No. 6', '119.42826880419919,-5.1839093985134586', 0, 'belum'),
(5, 'TR-20190719194943', '2019-07-19 19:49:43', 2, '085341725235', '', 'batal', 'ya', '2019-07-20', 'BTN. Tamarunnang 2. Gowa. Sulawesi Selatan', '119.44277419055173,-5.176299906483712', 0, 'belum'),
(6, 'TR-20190719195532', '2019-07-19 19:55:32', 2, '085341725235', 'vdlsv', 'batal', 'ya', '0000-00-00', 'scasd', '119.45178641284177,-5.17120008702127', 0, 'belum'),
(7, 'TR-20190719195631', '2019-07-19 19:56:31', 2, '085341725235', 'vdlsv', 'batal', 'ya', '0000-00-00', 'scasd', '119.45178641284177,-5.17120008702127', 0, 'belum'),
(8, 'TR-20190719195757', '2019-07-19 19:57:57', 2, '085341725235', '', 'tunggu', 'ya', '2019-07-20', 'dsv', '119.44603575671384,-5.166727760463113', 0, 'belum');

-- --------------------------------------------------------

--
-- Table structure for table `data_transaksi_detail`
--

CREATE TABLE `data_transaksi_detail` (
  `id_transaksi_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_telur` int(11) NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `kuantitas` int(11) NOT NULL,
  `jumlah_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_transaksi_detail`
--

INSERT INTO `data_transaksi_detail` (`id_transaksi_detail`, `id_transaksi`, `id_telur`, `harga_satuan`, `kuantitas`, `jumlah_harga`) VALUES
(1, 1, 5, 2000, 4, 8000),
(2, 2, 5, 2000, 4, 8000),
(3, 3, 5, 2000, 10, 20000),
(4, 4, 5, 2000, 1, 2000),
(5, 5, 5, 2000, 4, 8000),
(6, 6, 5, 2000, 3, 6000),
(7, 8, 5, 2000, 5, 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_biaya_kerusakan`
--
ALTER TABLE `data_biaya_kerusakan`
  ADD PRIMARY KEY (`id_biaya_kerusakan`) USING BTREE;

--
-- Indexes for table `data_biaya_tambahan`
--
ALTER TABLE `data_biaya_tambahan`
  ADD PRIMARY KEY (`id_biaya_tambahan`);

--
-- Indexes for table `data_kategori`
--
ALTER TABLE `data_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `data_konfigurasi_menu_pelanggan`
--
ALTER TABLE `data_konfigurasi_menu_pelanggan`
  ADD PRIMARY KEY (`id_konfigurasi_menu_pelanggan`);

--
-- Indexes for table `data_konfigurasi_umum`
--
ALTER TABLE `data_konfigurasi_umum`
  ADD PRIMARY KEY (`id_konfigurasi_umum`);

--
-- Indexes for table `data_kurir`
--
ALTER TABLE `data_kurir`
  ADD PRIMARY KEY (`id_kurir`);

--
-- Indexes for table `data_pelanggan`
--
ALTER TABLE `data_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `data_pengguna`
--
ALTER TABLE `data_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `data_riwayat_pembayaran`
--
ALTER TABLE `data_riwayat_pembayaran`
  ADD PRIMARY KEY (`id_riwayat_pembayaran`);

--
-- Indexes for table `data_telur`
--
ALTER TABLE `data_telur`
  ADD PRIMARY KEY (`id_telur`);

--
-- Indexes for table `data_telur_foto`
--
ALTER TABLE `data_telur_foto`
  ADD PRIMARY KEY (`id_foto`);

--
-- Indexes for table `data_telur_masuk`
--
ALTER TABLE `data_telur_masuk`
  ADD PRIMARY KEY (`id_telur_masuk`);

--
-- Indexes for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `data_transaksi_detail`
--
ALTER TABLE `data_transaksi_detail`
  ADD PRIMARY KEY (`id_transaksi_detail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_biaya_kerusakan`
--
ALTER TABLE `data_biaya_kerusakan`
  MODIFY `id_biaya_kerusakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_biaya_tambahan`
--
ALTER TABLE `data_biaya_tambahan`
  MODIFY `id_biaya_tambahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_kategori`
--
ALTER TABLE `data_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_konfigurasi_menu_pelanggan`
--
ALTER TABLE `data_konfigurasi_menu_pelanggan`
  MODIFY `id_konfigurasi_menu_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `data_konfigurasi_umum`
--
ALTER TABLE `data_konfigurasi_umum`
  MODIFY `id_konfigurasi_umum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `data_kurir`
--
ALTER TABLE `data_kurir`
  MODIFY `id_kurir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_pelanggan`
--
ALTER TABLE `data_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_pengguna`
--
ALTER TABLE `data_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_riwayat_pembayaran`
--
ALTER TABLE `data_riwayat_pembayaran`
  MODIFY `id_riwayat_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_telur`
--
ALTER TABLE `data_telur`
  MODIFY `id_telur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `data_telur_foto`
--
ALTER TABLE `data_telur_foto`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_telur_masuk`
--
ALTER TABLE `data_telur_masuk`
  MODIFY `id_telur_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `data_transaksi_detail`
--
ALTER TABLE `data_transaksi_detail`
  MODIFY `id_transaksi_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
