<?php
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

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Your reCAPTCHA Secret
    $secret = "6LeLqhopAAAAAPJ7F0-WbnbmonaSAiSiD7Dn6SzA";

    // reCAPTCHA response sent from client
    $response_recap = $_POST['g-recaptcha-response'];

    // Verify the reCAPTCHA response
    $verifyResponse = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret='.$secret.'&response='.$response_recap);

    // Decode json data
    $responseData = json_decode($verifyResponse);

    // If reCAPTCHA response is valid (not a bot)
    if($responseData->success) {
        // Your form submission code goes here
    } else {
        echo "5";
        exit;
    }
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
    if (empty($user)) {
    echo "0";
    exit;
}
    // print_r($user);

    foreach ($user as $row){

    
    if(crypt($pass1, $row['pass_word'])==$row['pass_word'] &&  $row['status']!==3){

         unset($_SESSION['attempt']);

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
    $last_login = date('Y-m-d H:i:s');
    $sql2 = 'UPDATE last_login SET last_login = :last_login WHERE user_name = :email';
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    echo 2;


$lastLogin = date('Y-m-d H:i:s');

// First, get the user status
$stmt = $pdo->prepare("SELECT status FROM users WHERE user_name = :email");
$stmt->execute(['email' => $email]);
$user = $stmt->fetch();

if ($user['status'] == 1) {
    // If status is 1, insert the current date and time
    $sql = "INSERT INTO last_login (last_login, user_name) VALUES (:lastLogin, :email)";
} else {
    // If status is not 1, update the current date and time
    $sql = "UPDATE last_login SET last_login = :lastLogin WHERE user_name = :email";
}

$stmt = $pdo->prepare($sql);
$stmt->execute(['lastLogin' => $lastLogin, 'email' => $email]);


    
    }

    
}

}
?>