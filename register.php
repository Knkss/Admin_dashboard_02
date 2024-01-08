
<?php 

require("connect.php");

date_default_timezone_set('Asia/Kolkata');

$fname= $_POST['fname'];
$lname= $_POST['lname'];    
$email= $_POST['email'];  
$address= $_POST['address'];  
$dob = $_POST['dob'];
$gender = $_POST['gender'];  
$pass = $_POST['pass']; 
// $hashed_password  = $_POST['pass']; 
// $hashed_password = password_hash($pass, PASSWORD_DEFAULT);  

$salt = bin2hex(openssl_random_pseudo_bytes(22));
$hashed_password = crypt($pass, "$1$4$4$7$".$salt);
$last_login = date('Y-m-d H:i:s');

$acc_created = date('Y-m-d H:i:s');

 

if($fname==""||$lname==""||$email ==""||$address ==""||$dob==""||$gender ==""||$pass=="")
{
 header("Location: error404.html");
exit;
}



// else if(strlen($name) <3 or strlen($name) >20){
//   echo "Name should be between 3 and 20 chdobaracters";
// }

// else if(strlen($subject) >=200){
//   echo "Subject length should be less than 200";
// }
// else if(strlen($message) >=500){
//   echo "Message length should be less than 500";
// }

else{
   try{
$data = [
    'fname' => $fname,
    'lname' => $lname,
    'email' => $email,
    'address' => $address,
    'dob' => $dob,
    'gender' => $gender,
    'pass' => $hashed_password,
    'last_login' => $last_login,
    'acc_created' => $acc_created
    

];
    
      

$sqll = "SELECT * FROM adm WHERE user_name=:email";
$stm = $conn->prepare($sqll);
    // $stmt->execute([':email' => $email]);
      // $stm->execute($data);
   $stm->bindParam(':email', $email);
   $stm->execute();

    if ($stm->rowCount()==1) {
        
          echo 2;
    } 
 else {
  $sql = "INSERT INTO adm (first_name, last_name, user_name,address, dob, gender, pass_word,last_login,acc_created) VALUES(:fname,:lname, :email, :address, :dob,:gender,:pass,:last_login,:acc_created)";
$stmt= $conn->prepare($sql);
$stmt->execute($data);

  echo 1;
}
      
} 
catch(PDOException $e) {
  echo $sql . "<br>" . $e->getMessage();
}
}





?>
