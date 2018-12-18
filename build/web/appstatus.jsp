<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bean.User" %>
<%@ page import="bean.Application" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${sessionScope.memberprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/index.html"); %>
</c:if>

<jsp:useBean id="memberprofile" class="bean.User" scope="session" />
<jsp:useBean id="app" class="bean.Application" scope="session" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- for-mobile-apps -->
    <meta http-equiv="Content-Type" content="text/html">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    
    <!--font awesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
    
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!------ Include the above in your HEAD tag ---------->
    <style>
        html,body{
			height: 100%;
			margin: 0;
			background: rgb(2,0,36);
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(149,199,20,1) 0%, rgba(0,212,255,1) 96%);
		
		}
                h3{
                    text-align: center;
                    color: red;
                }
   .myForm{
   	background-color: rgba(0,0,0,0.5) !important;
   	padding: 15px !important;
   border-radius: 15px !important;
   color: white;
   
   }

   input{
   	border-radius:0 15px 15px 0 !important;

   }
   input:focus{
       outline: none;
box-shadow:none !important;
border:1px solid #ccc !important;

   }

   .br-15{
   	border-radius: 15px 0 0 15px !important;
   }


   #back{
   	color: white !important;
   	background-color: #fa8231 !important;
   	border-radius: 15px !important;
   	border: 0 !important;

   }

    </style>
</head>

<body>
    <!--nav bar-->
    <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="home.jsp"><i class="fas fa-bed"></i> Hostel</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/ip/GetRoomServlet"><i class="fas fa-edit"></i> Apply
                        Room</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ip/ViewAppServlet"><i class="fas fa-envelope-open-text"></i>
                        View Application</a>
                </li>
            </ul>
            <ul class="nav navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user"></i> Welcome
                        <jsp:getProperty name="memberprofile" property="fullName" />
                        (Member)<b class="caret"></b>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/ip/viewProfileServlet"><i class="fas fa-user-edit"></i>
                            User Profile</a>
                        <a class="dropdown-item" href="/ip/MemberSettingServlet"><i class="fas fa-cog"></i>
                            Setting</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/ip/logout.jsp"><i class="fas fa-sign-out-alt"></i>
                            Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <br><br>
    <dvi class="container h-100">
        <div class="d-flex justify-content-center">
            <div class="card mt-5 col-md-4 animated bounceInDown myForm">
                <div class="card-header">
                    <h4>Room Application Status</h4>
                </div>
                <div class="card-body">
                    <h3>SUCCESSFUL!</h3><br>
                    <form>
                        <div id="dynamic_container">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text br-15">Room&nbsp;&nbsp;&nbsp;</span>
                                </div>
                                <span class="form-control"><jsp:getProperty name="app" property="room"/></span>
                            
                            </div>
                            <div class="input-group mt-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text br-15">College</span>
                                </div>
                                <span class="form-control"><jsp:getProperty name="app" property="college"/></span>  
                                </div>
                            <div class="input-group mt-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text br-15">Type&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                </div>
                                <span class="form-control"><jsp:getProperty name="app" property="type"/></span>                            
                                </div>
                            <div class="input-group mt-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text br-15">Gender</span>
                                </div>
                                <span class="form-control"><jsp:getProperty name="app" property="gender"/>                            
                                </div>
                            <div class="input-group mt-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text br-15">Price&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                </div>
                                <span class="form-control"><jsp:getProperty name="app" property="price"/></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="card-footer">
                    <a class="btn btn-secondary btn-sm" id="back" href="/ip/GetRoomServlet"><i class="fas fa-plus-circle"></i>
                        Back to Apply Room</a>
                </div>
            </div>
        </div>
    </dvi>


</body>

</html>