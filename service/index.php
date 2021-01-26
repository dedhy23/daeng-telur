<?php
// session_start();
$server = "localhost";
$username = "root";
$password = "";
$database = "db_apt";

// Koneksi dan memilih database di server
// echo "$database";
$koneksi = mysqli_connect($server,$username,$password,$database) or die("Koneksi gagal");
//mysqli_select_db($koneksi, $database) or die("Database tidak bisa dibuka");
date_default_timezone_set('Asia/Makassar');
// buat variabel untuk validasi dari file fungsi_validasi.php
// $val = new TerasKreasivalidasi;
// include 'fungsi/upload_gambar.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$errors = array();
$pesan = array();
// Getting posted data and decodeing json
$_POST = json_decode(file_get_contents('php://input'), true);


$aksi= isset($_GET['aksi']) && !empty($_GET['aksi']) ? $_GET['aksi'] : '';
	switch ($aksi) {
		
		case 'details':
			$id = $_GET['id'];
			$sql = mysqli_query($koneksi,"SELECT * FROM data_telur WHERE id_telur = $id");
			while ($d = mysqli_fetch_assoc($sql)) {
				$pesan['data'] = $d; 
			}
			if ($sql){
				$pesan['pesan'] = "Sukses" ;
			}else{
				$pesan['error'] = mysqli_error($koneksi);
			}
		break;
		case 'getKategori':
			$sql = mysqli_query($koneksi,"SELECT * FROM data_kategori order by id_kategori desc");
			while ($d = mysqli_fetch_assoc($sql)) {
				$pesan['data'][] = $d; 
			}
			if ($sql){
				$pesan['pesan'] = "Sukses" ;
			}else{
				$pesan['error'] = mysqli_error($koneksi);
		 	}
		break;
		case 'getDetailsKategori':
			$id = $_GET['id']; 
			$sql = mysqli_query($koneksi,"SELECT * FROM data_kategori INNER JOIN data_telur on data_kategori.id_kategori = data_telur.id_kategori WHERE data_kategori.id_kategori = " + $id);
			while ($d = mysqli_fetch_assoc($sql)) {
				$pesan['data'][] = $d; 
			}
			if ($sql){
				$pesan['pesan'] = "Sukses" ;
			}else{
				$pesan['error'] = mysqli_error($koneksi);
		 	}
		break;
		default:
			$sql = mysqli_query($koneksi,"SELECT * FROM data_telur order by id_telur desc");
			while ($d = mysqli_fetch_assoc($sql)) {
				$pesan['data'][] = $d; 
			}
			if ($sql){
				$pesan['pesan'] = "Sukses" ;
			}else{
				$pesan['error'] = mysqli_error($koneksi);
		 	}
		break;
	}
  echo json_encode($pesan);
  
  // print_r($pesan);
  // $conn->close();

?>