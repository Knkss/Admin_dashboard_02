<?php
session_start();

require("connect.php");

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$email = $_POST['email'];
$pass1 = $_POST['pass'];

if ($email == "" || $pass1 == "") {
    
    echo 3;
    exit;
} 


else {

    $sql = 'SELECT * FROM adm where user_name="'.$email.'"';
    $stm = $conn->query($sql);
    $user = $stm->fetchAll(PDO::FETCH_ASSOC);
    // print_r($user);

    foreach ($user as $row){

    
    if(crypt($pass1, $row['pass_word'])==$row['pass_word'] &&  $row['status']!==3){

        $_SESSION['kshitij_first_name'] = $row['first_name'];
        $_SESSION['kshitij_last_name'] = $row['last_name'];
        $_SESSION['kshitij_user_name'] = $row['user_name'];
        $_SESSION['kshitij_pass_word'] = $row['pass_word'];
        $_SESSION['kshitij_id'] = $row['id'];
        $_SESSION['kshitij_status'] = $row['status'];
        $_SESSION['kshitij_type'] = $row['type'];

        echo "1";
    } 

    else if( $row['status']==3) {

        echo "4";
  
    }
    else {
        
        echo 2;
    }
    
    }

    
}
?>