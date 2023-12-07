<?php
session_start();
require "connect.php";

if (isset($_SESSION['kshitij_first_name'])) {
  $sql = "SELECT * FROM adm WHERE user_name = '" . $_SESSION['kshitij_user_name'] . "' AND pass_word = '" . $_SESSION['kshitij_pass_word'] . "'";
$statement = $conn->query($sql);

$publishers = $statement->fetchAll(PDO::FETCH_ASSOC);

if ($publishers) {


}
else{
 header("Location: ../ ");
}
}
else{
    header("Location: ../ ");
}

?>