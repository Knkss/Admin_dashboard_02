<?php
session_start();
require("../../connect.php");
$year = date("Y");

$data = array();
for ($i = 1; $i <= 12; $i++) {
    $sql = "SELECT * FROM contact WHERE YEAR(date_time) = :year AND MONTH(date_time) = :month";
    $stm = $conn->prepare($sql);
    $stm->execute(['year' => $year, 'month' => $i]);
    $data[$i-1] = $stm->rowCount();
}

$json = json_encode($data);
echo $json;
?>