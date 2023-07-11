<%-- 
    Document   : index
    Created on : Jun 21, 2023, 4:29:51 PM
    Author     : sa608
--%>

<%@page import="com.technical.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            .card-text{
                font-weight: 500;
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <!-- banner -->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white">
                <div class="container">
                    <h3  class="display-3">Welcome to SA Blog</h3>
                    <h6><i>This website provides a platform to it's user to read and write blog corresponding to various fields listed below..</i></h6>
                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Register</a>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span> Login</a>
                </div>
            </div>
            
            
        </div>
        <!-- cards -->
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card-header text-center primary-background text-white">
                        <h5 class="card-title">Programming Blog</h5>
                    </div>
                    <div class="card-body">
                      <img class="card-img-top my-2" src="images/prg.jpg" alt="Card image cap">

                      <p class="card-text">You can post a blog on programming in this platform..</p>
                    </div>
                   </div>
                <div class="col-md-4">
                    <div class="card-header text-center primary-background text-white">
                      <h5 class="card-title">Sports Blog</h5>
                    </div>
                    <div class="card-body">
                      <img class="card-img-top my-2" src="images/sports.jpg" alt="Card image cap">

                      <p class="card-text">You can post a blog on sports in this platform..</p>
                    </div>
                   </div>
                <div class="col-md-4">
                    <div class="card-header text-center primary-background text-white">
                      <h5 class="card-title">Bollywood Blog</h5>
                    </div>
                    <div class="card-body">
                      <img class="card-img-top my-2" src="images/bollywood.jpg" alt="Card image cap">
                      <p class="card-text">You can post a blog on Bollywood in this platform</p>
                    </div>
                   </div>
                </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card-header text-center primary-background text-white">
                      <h5 class="card-title">Politics Blog</h5>
                    </div>
                    <div class="card-body">
                      <img class="card-img-top my-2" src="images/politics.jpg" alt="Card image cap">
                      <p class="card-text">You can post a blog on politics in this platform</p>
                    </div>
                   </div>
                <div class="col-md-4">
                    <div class="card-header text-center primary-background text-white">
                      <h5 class="card-title">Business Blog </h5>
                    </div>
                    <div class="card-body">
                      <img class="card-img-top my-2" src="images/business.jpg" alt="Card image cap">
                      <p class="card-text">You can post a blog on Business in this platform</p>
                    </div>
                   </div>
                <div class="col-md-4">
                    <div class="card-header text-center primary-background text-white">
                        <h5 class="card-title">Fitness Blog </h5>
                    </div>
                    <div class="card-body">
                      
                      <img class="card-img-top my-2" src="images/fitness.jpg" alt="Card image cap">
                      <p class="card-text">You can post a blog on programming in this platform</p>
                    </div>
                   </div>
                </div>
            </div>
            
        
        
        <!-- javascript -->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
