<?php
$servername = "localhost";
$username = "_username";
$password = "_password";
$port = 3325;

try {
  $conn = new PDO("mysql:host=$servername;dbname=admin;port=3325", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 		
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
?>