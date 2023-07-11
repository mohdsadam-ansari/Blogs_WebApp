

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <!-- css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background: url(images/backg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <!-- navbar -->
        <%@include file="navbar.jsp" %>
        <main class="d-flex align-items-center" style="height: 90vh">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background">
                        <span class="fa fa-user-circle fa-3x"></span>
                        <p><big>Register</big></p>
                        </div>
                        <div class="card-body">
                            <form  id="reg-form" action="RegisterServlet" method="post">
                                <div class="form-group">
                                  <label for="username">User Name</label>
                                  <input type="text" name="user_name" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input type="email"  name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select Gender</label><br>
                                  <input type="radio" id="gender" name="gender" value="male">Male
                                  <input type="radio" id="gender" name="gender" value="female">Female
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                </div><br>
                                <div class="container text-center" id="loader" style="display:none">
                                <span class="fa fa-refresh fa-2x fa-spin"></span>
                                <h5>Please wait..</h5>
                                </div><br>
                                <button id="submit-btn" type="submit" class="btn primary-background">Register</button>
                              </form>
                        </div>
                    </div>
                    
                </div>
            </div>
        </main>
        <!-- javascript -->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        <!-- Asyncronous Javascript and XML for client side validation -->
        <script>
            $(document).ready(function(){
                console.log("loaded..");
            });
            $("#reg-form").on('submit',function (event){
                event.preventDefault();
                let form=new FormData(this);
                $("#submit-btn").hide();
                $("#loader").show();
                $.ajax({
                   url:"RegisterServlet",
                   type:'POST',
                   data:form,
                   success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        
                        $("#submit-btn").show();
                        $("#loader").hide();
                        if(data.trim()==='done'){
                        
                        swal("Registered successfully..We are going to Redirect you to Login page..")
                            .then((value) => {
                                window.location="login_page.jsp";
                                });
                            }else{
                                swal(data);
                            }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $("#submit-btn").show();
                        $("#loader").hide();
                        swal("something went wrong try again");
                    },
                    processData: false,
                    contentType: false
                });
            }) ;
        </script>
        
    </body>
</html>
