<%-- 
    Document   : home
    Created on : Nov 5, 2014, 5:03:36 PM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bean.User" %>

<c:if test="${sessionScope.adminprofile == null}">
  <% response.sendRedirect(request.getContextPath() + "/admin/terminate.html"); %>
</c:if>

<jsp:useBean id="adminprofile" class="bean.User" scope="session" />

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Permanent+Marker">
   
  <!--font awesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <!-- Popper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <!------ Include the above in your HEAD tag ---------->
  
   <link href='https://fonts.googleapis.com/css?family=Audiowide|Iceland|Monoton|Pacifico|Press+Start+2P|Vampiro+One' rel='stylesheet' type='text/css'>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  <style>
    @import url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css");
                        .login-container{
                    margin-top: 5%;
                    margin-bottom: 5%;
                }
                .login-logo{
                    position: relative;
                    margin-left: -41.5%;
                }
                .login-logo img{
                    position: absolute;
                    width: 20%;
                    margin-top: 19%;
                    background: #282726;
                    border-radius: 4.5rem;
                    padding: 5%;
                }
                .login-form-1{
                    padding: 9%;
                    background: white;
                    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
                }
                .login-form-1 h3{
                    text-align: center;
                    margin-bottom:12%;
                    color:#fff;
                }
                .login-form-2{
                    background: #f05837;
                    padding: 9%;
                    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
                }
      
                .login-form-2 h3{
                    text-align: center;
                    margin-bottom:12%;
                    color: #fff;
                }
                .btnSubmit{
                    font-weight: 600;
                    width: 50%;
                    color: #282726;
                    background-color: #fff;
                    border: none;
                    border-radius: 1.5rem;
                    padding:2%;
                }
                .btnForgetPwd{
                    color: #fff;
                    font-weight: 600;
                    text-decoration: none;
                }
                .btnForgetPwd:hover{
                    text-decoration:none;
                    color:#fff;
                }
                h2{
                    text-align: center;
                }

/* animation  */
body, .jumbotron{
  background-color: #222222;
  background: repeating-linear-gradient(45deg, #2b2b2b 0%, #2b2b2b 10%, #222222 0%, #222222 50%) 0 / 15px 15px;
}


/*Neon*/
p {
  text-align: center;
  font-size: 7em;
  margin: 20px 0 20px 0;
}

a {
  text-decoration: none;
  transition: all 0.5s;
}

p:nth-child(1) a {
  color: #fff;
  font-family: Monoton;
  -webkit-animation: neon1 1.5s ease-in-out infinite alternate;
  animation: neon1 1.5s ease-in-out infinite alternate;
}

p:nth-child(1) a:hover {
  color: #FF1177;
  -webkit-animation: none;
  animation: none;
}

p:nth-child(2) a {
  font-size: 1.5em;
  color: #228DFF;
  font-family: Iceland;
}

p:nth-child(2) a:hover {
  -webkit-animation: neon2 1.5s ease-in-out infinite alternate;
  animation: neon2 1.5s ease-in-out infinite alternate;
}

p:nth-child(3) a {
  color: #FFDD1B;
  font-family: Pacifico;
}

p:nth-child(3) a:hover {
  -webkit-animation: neon3 1.5s ease-in-out infinite alternate;
  animation: neon3 1.5s ease-in-out infinite alternate;
}

p:nth-child(4) a {
  color: #B6FF00;
  font-family: "Press Start 2P";
  font-size: 0.8em;
}

p:nth-child(4) a:hover {
  -webkit-animation: neon4 1.5s ease-in-out infinite alternate;
  animation: neon4 1.5s ease-in-out infinite alternate;
}

p:nth-child(5) a {
  color: #FF9900;
  font-family: Audiowide;
}

p:nth-child(5) a:hover {
  -webkit-animation: neon5 1.5s ease-in-out infinite alternate;
  animation: neon5 1.5s ease-in-out infinite alternate;
}

p:nth-child(6) a {
  color: #BA01FF;
  font-family: Vampiro One;
}

p:nth-child(6) a:hover {
  -webkit-animation: neon6 1.5s ease-in-out infinite alternate;
  animation: neon6 1.5s ease-in-out infinite alternate;
}

p a:hover {
  color: #ffffff;
}
/*glow for webkit*/

@-webkit-keyframes neon1 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FF1177, 0 0 70px #FF1177, 0 0 80px #FF1177, 0 0 100px #FF1177, 0 0 150px #FF1177;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FF1177, 0 0 35px #FF1177, 0 0 40px #FF1177, 0 0 50px #FF1177, 0 0 75px #FF1177;
  }
}

@-webkit-keyframes neon2 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #228DFF, 0 0 70px #228DFF, 0 0 80px #228DFF, 0 0 100px #228DFF, 0 0 150px #228DFF;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #228DFF, 0 0 35px #228DFF, 0 0 40px #228DFF, 0 0 50px #228DFF, 0 0 75px #228DFF;
  }
}

@-webkit-keyframes neon3 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FFDD1B, 0 0 70px #FFDD1B, 0 0 80px #FFDD1B, 0 0 100px #FFDD1B, 0 0 150px #FFDD1B;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FFDD1B, 0 0 35px #FFDD1B, 0 0 40px #FFDD1B, 0 0 50px #FFDD1B, 0 0 75px #FFDD1B;
  }
}

@-webkit-keyframes neon4 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #B6FF00, 0 0 70px #B6FF00, 0 0 80px #B6FF00, 0 0 100px #B6FF00, 0 0 150px #B6FF00;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #B6FF00, 0 0 35px #B6FF00, 0 0 40px #B6FF00, 0 0 50px #B6FF00, 0 0 75px #B6FF00;
  }
}

@-webkit-keyframes neon5 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FF9900, 0 0 70px #FF9900, 0 0 80px #FF9900, 0 0 100px #FF9900, 0 0 150px #FF9900;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FF9900, 0 0 35px #FF9900, 0 0 40px #FF9900, 0 0 50px #FF9900, 0 0 75px #FF9900;
  }
}

@-webkit-keyframes neon6 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #ff00de, 0 0 70px #ff00de, 0 0 80px #ff00de, 0 0 100px #ff00de, 0 0 150px #ff00de;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #ff00de, 0 0 35px #ff00de, 0 0 40px #ff00de, 0 0 50px #ff00de, 0 0 75px #ff00de;
  }
}
/*glow for mozilla*/
/*glow*/

@keyframes neon1 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FF1177, 0 0 70px #FF1177, 0 0 80px #FF1177, 0 0 100px #FF1177, 0 0 150px #FF1177;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FF1177, 0 0 35px #FF1177, 0 0 40px #FF1177, 0 0 50px #FF1177, 0 0 75px #FF1177;
  }
}

@keyframes neon2 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #228DFF, 0 0 70px #228DFF, 0 0 80px #228DFF, 0 0 100px #228DFF, 0 0 150px #228DFF;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #228DFF, 0 0 35px #228DFF, 0 0 40px #228DFF, 0 0 50px #228DFF, 0 0 75px #228DFF;
  }
}

@keyframes neon3 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FFDD1B, 0 0 70px #FFDD1B, 0 0 80px #FFDD1B, 0 0 100px #FFDD1B, 0 0 150px #FFDD1B;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FFDD1B, 0 0 35px #FFDD1B, 0 0 40px #FFDD1B, 0 0 50px #FFDD1B, 0 0 75px #FFDD1B;
  }
}

@keyframes neon4 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #B6FF00, 0 0 70px #B6FF00, 0 0 80px #B6FF00, 0 0 100px #B6FF00, 0 0 150px #B6FF00;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #B6FF00, 0 0 35px #B6FF00, 0 0 40px #B6FF00, 0 0 50px #B6FF00, 0 0 75px #B6FF00;
  }
}

@keyframes neon5 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FF9900, 0 0 70px #FF9900, 0 0 80px #FF9900, 0 0 100px #FF9900, 0 0 150px #FF9900;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FF9900, 0 0 35px #FF9900, 0 0 40px #FF9900, 0 0 50px #FF9900, 0 0 75px #FF9900;
  }
}

@keyframes neon6 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #ff00de, 0 0 70px #ff00de, 0 0 80px #ff00de, 0 0 100px #ff00de, 0 0 150px #ff00de;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #ff00de, 0 0 35px #ff00de, 0 0 40px #ff00de, 0 0 50px #ff00de, 0 0 75px #ff00de;
  }
}
/*REEEEEEEEEEESPONSIVE*/

@media (max-width: 650px) {
  #container {
    width: 100%;
  }
  p {
    font-size: 3.5em;
  }
}






            </style>
</head>

<body>

    <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="home.jsp"><i class="fas fa-bed"></i> Hostel</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                  <li class="nav-item">
                      <a class="nav-link" href="/ip/admin/viewApp"><i class="fas fa-envelope-open-text"></i>
                          View Applications</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="/ip/admin/viewInit"><i class="fas fa-list"></i>
                          Manage Backend Data</a>
                  </li>
              </ul>
      <ul class="nav navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user"></i> Welcome
            <c:if test="${sessionScope.adminprofile != null}">

              <span style="color:#FFFF00">
                <jsp:getProperty name="adminprofile" property="fullName" /></span>
            </c:if>
            (Admin) <b class="caret"></b></a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="/ip/admin/viewProfileServlet"><i class="fas fa-user-edit"></i>
              User Profile</a>
            <a class="dropdown-item" href="/ip/MemberSettingServlet"><i class="fas fa-cog"></i>
              Setting</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="logout.jsp"><i class="fas fa-sign-out-alt"></i>
              Logout</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
  <div class="jumbotron" id="jumbo">
  <p><a href="home.jsp">
    ADMIN PORTAL
  </a></p>

 


  </div>






</body>

</html>