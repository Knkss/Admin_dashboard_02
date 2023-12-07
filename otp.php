
<?php

include(login.php);



?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - OTP</title>


    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">OTP Verification:</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="exampleInputOTP" placeholder="Enter OTP">
                                        </div>
                                        
                                       

                                        

                                        <!-- <a href="index.html" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </a> -->
                                        <input type="button" id="logiinn" name="logiinn" value="submit" class="btn btn-primary btn-user btn-block" >
                                        <!-- <hr>
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a> -->
                                        <!-- <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a> -->
                                    </form>
                                    <hr>
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
       <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>


<script type="text/javascript">
    
        $("#confirm").click(function(){

           var email = $("#exampleInputEmail").val();
           var pass = $("#exampleInputPassword").val();
           
           var response = grecaptcha.getResponse();
           if(response.length==0)
    {
        alert("Please verify you are not a robot");
        return false;
    }

    else{



           var data_string = 'email='+email+'&pass='+pass; 

           
           $.ajax({  
              type: 'POST',  
              url: 'login.php', 
              data: data_string,
              dataType: 'json',
              success: function(response) {
                 if (response=="1") {
                    alert("Login successful");
                    window.location.href = "admin/";
                }
                else if (response==0) {
                    alert("Username doesn't exist. Please register.");
                }
                 else if (response==2) {
                
                alert("Incorrect username and password. Please try again");
            }
            else if (response==3) {
                
                alert("Invalid username and password. Please try again");
            }

            else if (response==4) {
                
                alert("Your account has been deactivated. Please contact the admin.");
            }
            else if (response==5) {
                
                alert("OTP has been sent to your email.");
                window.location.href = "otp.php";
            }

                else
                {
                    alert("Login Failed");
                }
            }
        });
       }

       })
</script>
 
</body>

</html>

