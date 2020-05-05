<?php
include 'koneksi.php';

$query = "SELECT tanggal,suhu FROM suhu LIMIT 10";

$hasil = array();

$result = mysqli_query($conn,$query);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
		$hasil[] = $row;
	}
}
		
echo json_encode($hasil);

?>