<?php
include 'koneksi.php';

$query = "SELECT suhu FROM suhu ORDER BY id DESC";

$hasil = mysqli_fetch_assoc(mysqli_query($conn,$query));

echo json_encode($hasil);

?>