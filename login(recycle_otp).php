<?php

//LOGIN.php


session_start();

require("connect.php");

// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);

$email = $_POST['email'];
$pass1 = $_POST['pass'];

if ($email == "" || $pass1 == "") {
    
    echo 3;
    exit;
} 

if(!isset($_SESSION['attempt'])){
      $_SESSION['attempt'] = 0;
    }


if($_SESSION['attempt'] == 3){
      
      echo "4";
    }



else {

    $sql = 'SELECT * FROM adm where user_name="'.$email.'"';
    $stm = $conn->query($sql);
    $user = $stm->fetchAll(PDO::FETCH_ASSOC);
    // print_r($user);

    foreach ($user as $row){

    
    if(crypt($pass1, $row['pass_word'])==$row['pass_word'] &&  $row['status']!==3){

        if()
        {
            $eemail= $_POST["email"];

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'C:\Users\DELL\Downloads\PHPMailer\src\Exception.php';
require 'C:\Users\DELL\Downloads\PHPMailer\src\PHPMailer.php';
require 'C:\Users\DELL\Downloads\PHPMailer\src\SMTP.php';

try {
    $mail = new PHPMailer();
    // $mail->SMTPDebug = 2;
    $mail->isSMTP();
    $mail->Host = "smtp.gmail.com";
    $mail->SMTPAuth = true;
    $mail->Username = "abc@gmail.com";
    $mail->Password = "abcabcabcxyzxyzxyz";
    $mail->SMTPSecure = 'tls';
    $mail->Port = 587;
    
    $mail->setFrom($eemail, $ename);
    $mail->addAddress($eemail, $ename);
    
    $mail->isHTML(true);
     $subject="verify-account-otp";
     // $message=strval($otp);
     $otp=rand(100000,999999);
    $mail->Body =  "Your otp is:".strval($otp);
    $mail->AltBody = 'Alt text';
    
    if($mail->send()){
        echo '5';
    } else {
        echo 'Message could not be sent.';
        echo 'Mailer Error: ' . $mail->ErrorInfo;
    }
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: ".$e->getMessage();
}
        }

        //  unset($_SESSION['attempt']);

        // $_SESSION['kshitij_first_name'] = $row['first_name'];
        // $_SESSION['kshitij_last_name'] = $row['last_name'];
        // $_SESSION['kshitij_user_name'] = $row['user_name'];
        // $_SESSION['kshitij_pass_word'] = $row['pass_word'];
        // $_SESSION['kshitij_id'] = $row['id'];
        // $_SESSION['kshitij_status'] = $row['status'];
        // $_SESSION['kshitij_type'] = $row['type'];

        // echo "1";
    } 

    else if( $row['status']==3) {

        echo "4";
  
    }
    else {
        
          //this is where we put our 3 attempt limit
      $_SESSION['attempt'] += 1;
      
      if($_SESSION['attempt'] == 3){
        
        
        $sql2 = 'UPDATE adm SET status = 3 WHERE user_name= :email';

        $stm = $conn->prepare($sql2);
        ;
        $stm->bindParam(':email', $email);
        $stm->execute();
        
        echo "4";
    }

    echo 2;
    
    }

    
}

}
?>