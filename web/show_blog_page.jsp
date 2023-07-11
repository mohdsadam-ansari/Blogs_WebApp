<%-- 
    Document   : show_blog_page
    Created on : Jul 10, 2023, 10:07:56 AM
    Author     : sa608
--%>
<%@page import="com.technical.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.technical.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.technical.blog.entities.Category"%>
<%@page import="com.technical.blog.entities.Post"%>
<%@page import="com.technical.blog.helper.ConnectionProvider"%>
<%@page import="com.technical.blog.dao.PostDao"%>
<%@page import="com.technical.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>

<% 
    int postId=Integer.parseInt(request.getParameter("post_id"));
    PostDao pd=new PostDao(ConnectionProvider.getConnecton());
    Post post=pd.getPostByPostId(postId);

%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=post.getpTitle()%></title>
        <!-- css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <style>
            .post-title{
                font-weight: 100;
                font-size: 30px;
                font-weight: 300;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            .post-date{
                font-style: italic;
                font-size: 18px;

            }
            .post-info{
                font-size: 20px;
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }
            body{
                background: url(images/backg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            #code{
                color: white !important;
                font-size: 25px;

            }
            </style>
            
    </head>
    <body>
        <!-- nav bar -->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="#"> <span class="fa fa-sticky-note"></span> Technical Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#"><span class="fa fa-file-code-o"></span> Programming Languages</a>
                            <a class="dropdown-item" href="#"><span class="fa fa-laptop"></span> Project Implementation</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-envelope-o"></span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-plus-square fa-1.5x"></span> POST</a>
                    </li>


                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
                    </li>

                </ul>
            </div>
        </nav>
        <!--end navbar-->
                    
        <!--main body-->
        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-3">
                    <div class="card-header primary-background text-white">
                        <h4 class="post-title"><%=post.getpTitle()%></h4>
                    </div>
                    <div class="card-body bg-dark text-white">
                        <img class="card-img-top my-2" src="blog_pics/<%=post.getpPic() %>" alt="Card image cap">
                        <div class="row my-3 row-user">
                            <div class="col-md-8">
                                <%
                                    UserDao ud=new UserDao(ConnectionProvider.getConnecton());
                                %>
                                <p class="post-info"><a href="#"><%= ud.getUserByUserId(post.getUserId()).getName()%></a> has posted</p>
                            </div>
                            <div class="col-md-4">
                                <p class="post-date"><%= DateFormat.getDateTimeInstance().format(post.getpDate())%></p>
                            </div>
                        </div>
                        <p class="post-content"><%=post.getpContent()%></p>
                        <div class="post-code">
                        <pre id="code"><%=post.getpCode()%></pre>
                        </div>
                    </div>
                    <div class="card-footer primary-background">
                        <% LikeDao ld=new LikeDao(ConnectionProvider.getConnecton());
                        
                        %>
                
                        <a href="#" onclick="doLike(<%=post.getpId()%>,<%=user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ld.countLike(post.getpId())%></span></i></a>
                    <!--<a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>30</span></i></a>-->
                </div>
            </div>
            
        </div>
     </div>            
        
        <!--end main body-->
        
        
        <!-- profile modal -->

        <!-- Modal -->
        <div class="modal fade " id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Technical Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-center">
                        <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%;max-width: 150px;">

                        <div id="profile-details" class="container text-center">
                            <h5 class="modal-title mt-3"><%= user.getName()%></h5>
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID</th>
                                        <td><%= user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email</th>
                                        <td><%= user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender</th>
                                        <td><%= user.getGender().toUpperCase()%></td>

                                    </tr>
                                    <tr>


                                        <th scope="row">Registered on:</th>
                                        <td><%= user.getDate().toString()%></td>

                                    </tr>
                                </tbody>
                            </table>

                        </div>
                        <div id="profile-edit"  class="container text-center" style="display: none">
                            <h3 class="mt-2">Please Edit Carefully</h3>

                            <form action="UpdateServlet" method="POST" enctype="multipart/form-data">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td>ID:</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Name:</td>
                                            <td><input class="form-control" type="text" name="name" value="<%= user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td><input class="form-control" type="email" name="email" value="<%= user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Gender:</td>
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td><input class="form-control" type="password" name="password" value="<%= user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Profile Pic:</td>
                                            <td><input class="form-control" type="file"  name="image"></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="container">
                                    <button type="submit"  name="submit" class="btn btn-outline-primary">Save</button>
                                </div>
                            </form>

                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-btn" type="button" class="btn primary-background text-white">Edit</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- end profile modal -->

        <!-- post modal -->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide Post details....</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="AddPostServlet" enctype="multipart/form-data" id="add-post-form">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disable>----Select Category----</option>
                                    <%
                                        PostDao postDao = new PostDao(ConnectionProvider.getConnecton());
                                        ArrayList<Category> list = postDao.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%=c.getCid()%>"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>

                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text"  class="form-control" placeholder="Enter the Title" required name="pTitle">   
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="pContent" style="height: 200px;" placeholder="Enter the Content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="pCode" style="height: 200px;" placeholder="Enter the Code(if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select Pic</label><br>
                                <input type="file" name="pPic"class="form-control">
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>

                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>







        <!-- end post modal -->







        <!-- javascript -->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-btn').click(function () {
                    if (editStatus === false) {
                        $('#profile-details').hide();
                        $('#profile-edit').show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $('#profile-details').show();
                        $('#profile-edit').hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }
                });
            });

        </script>

        <!-- Post js -->
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    event.preventDefault();
                    console.log("Submited");
                    let form = new FormData(this);
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === 'done') {
                                swal("Good job!", "Saved Successfully", "success");
                            } else {
                                swal("Opps!", "Something went wrong try again", "error");

                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Opps!", "Something went wrong try again", "error");

                        },
                        processData: false,
                        contentType: false

                    });
                });

            });

        </script>
    </body>
</html>
