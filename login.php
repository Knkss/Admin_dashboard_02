<?php
session_start();

require("connect.php");

date_default_timezone_set('Asia/Kolkata');

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

        $lastLogin = date('Y-m-d H:i:s');

            // Update the last_login field
            $sql = "UPDATE adm SET last_login = :lastLogin WHERE user_name = :email";
            $stmt = $conn->prepare($sql);
            $stmt->execute(['lastLogin' => $lastLogin, 'email' => $email]);

            // Check if the user is new
            $accountCreated = new DateTime($row['acc_created']); // Assuming 'account_created' is the column name
            $lastLoginDate = new DateTime($lastLogin);
            $interval = $accountCreated->diff($lastLoginDate);
            $daysDifference = $interval->days;

            if($daysDifference < 30) {
                // Update the status to 2 (new user)
                $sql = "UPDATE adm SET status = 2 WHERE user_name = :email";
                $stmt = $conn->prepare($sql);
                $stmt->execute(['email' => $email]);

            }


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
    
    echo 2;


    
    }

    
}

}


?>