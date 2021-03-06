<%-- 
    Document   : memberprofile
    Created on : Nov 9, 2014, 11:45:53 AM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bean.User" %>


<%--<c:if test="${sessionScope.memberprofile != null}">
    <% response.sendRedirect(request.getContextPath() + "/terminate.html"); %>
</c:if>--%>

<jsp:useBean id="memberprofile" class="bean.User" scope="session" ></jsp:useBean>

<!DOCTYPE html>
<html>
 
<head>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <!--font awesome-->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

</head>

<style>
@import url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css");
.login-block{
background: #DE6262;  /* fallback for old browsers */
background: -webkit-linear-gradient(to bottom, #FFB88C, #DE6262);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to bottom, #FFB88C, #DE6262); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

width:100%;
padding: 150px;
}

.container{background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);position:relative;width:60%;height:100%;}

.login-sec{padding: 50px 30px; position:relative;}
.login-sec .copy-text{position:absolute; width:80%; bottom:20px; font-size:13px; text-align:center;}
.login-sec .copy-text i{color:#FEB58A;}
.login-sec .copy-text a{color:#E36262;}
.login-sec h2{margin-bottom:30px; font-weight:800; font-size:30px; color: #DE6262;}
.login-sec h2:after{content:" "; width:100px; height:5px; background:#FEB58A; display:block; margin-top:20px; border-radius:3px; margin-left:auto;margin-right:auto}
.btn-login{background: #DE6262; color:#fff; font-weight:600;}
.btn-upload{background: bisque; color:black; font-weight:600; width: 20px;}
.imageStyle{ margin-left:auto;
    margin-right:auto;
    width:180px;
    height:200px;
}

.input-group {
    margin-top:10px;
    width:60%;
    display:flex;
    justify-content:space-between;
    flex-wrap:wrap;
    margin-left:auto;
    margin-right:auto;
    
}
label, input {
    flex-basis:100px;
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
                        <a class="nav-link" href="/ip/GetRoomServlet"><i class="fas fa-edit"></i> Apply Room</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/ip/ViewAppServlet"><i class="fas fa-envelope-open-text"></i> View Application</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user"></i> Welcome
                            <jsp:getProperty name="memberprofile" property="fullName"/>
                            (Member)<b class="caret"></b>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/ip/viewProfileServlet"><i class="fas fa-user-edit"></i> User Profile</a>
                            <a class="dropdown-item" href="/ip/MemberSettingServlet"><i class="fas fa-cog"></i> Setting</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/ip/logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <section class="login-block">
            <div class="container">
            <div>
                <div class=" login-sec">
                    <h2 class="text-center">User Profile</h2>
             
               <div class="input-group">
                   <c:set var="photo" value="${memberprofile.getImage()}"/>
               <img src="img/profile/${photo}" class="imageStyle">
               </div>
         
            <br/>
            <div class="input-group">
                <label for="name">USERNAME</label>
                <input type="text" id="username" value="<jsp:getProperty name="memberprofile" property="login"/>" class="form-control" placeholder="" readonly>
            </div>
            
            <div class="input-group">
                <label for="name">FULL NAME</label>
                <input type="text" id="fullname" value="<jsp:getProperty name="memberprofile" property="fullName"/>"  class="form-control" placeholder="" readonly>
             </div>
               
            <div class="input-group">
                <label for="email">EMAIL</label>
                <input type="email" id="email" value="<jsp:getProperty name="memberprofile" property="email"/>" class="form-control" placeholder="" readonly>
             </div>
             <br/>
            <div class="col-md-6 btn-menu">   
                 <button class="btn btn-info btn-lg" data-toggle="modal" data-target="#edit" >Edit Profile</button>
                <button class="btn btn-info btn-lg" data-toggle="modal" data-target="#changepassword">Change Password</button>

            </div>
          
       
                </div>
                </div>
            </div>
        </section>
    

<div id="edit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="background-color:whitesmoke">
            <div class="modal-header" style="background-color:lightgrey">
                <h4 class="modal-title" id="myModalLabel">Edit User Profile</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
            </div>
            <div class="modal-body">  
                
                <div class="input-group">
                    
                   <img src="img/profile/<c:out value='${memberprofile.getImage()}'/>"  class="imageStyle">
                </div>
               
                 <form action = "UploadServlet" method = "post"  enctype = "multipart/form-data">
                <div class="input-group">
                    <input type="file" id="image" name="image" class="form-control" >
                 </div>
                        
                 <div class="input-group">
                       <input type="submit" id="submitImage" value="Upload Image" class="btn-upload" >
                  </div>
            </div>
                </form>    
                
                <form id="formedit" action="updateProfile" method="POST">
                <div class="input-group">
                         <label for="fullname">FULL NAME</label>
                         <input type="text" id="fullname" name="fullname" placeholder="${memberprofile.getFullName()}"  class="form-control" >
                </div>
                 <div class="input-group">
                         <label for="email">EMAIL</label>
                         <input type="text" id="email"  name="email" placeholder="${memberprofile.getEmail()}" class="form-control">   
                </form>
                </div>
                <div class="modal-footer ">
                         <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                         <button type="submit" form="formedit" class="btn btn-primary">Save </button>
                </div>
        </div>
    </div>
</div>
                
<div id="changepassword" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="background-color:whitesmoke">
            <div class="modal-header" style="background-color:lightgrey">
                <h4 class="modal-title" id="myModalLabel">Change password</h4>
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
            </div>
            <div class="modal-body">  
                <form id="formchangepassword" action="updateProfile" method="POST">

                    <label for="oldpassword">Old Password</label>
                    <input type="password" class="form-control" name="oldpassword" id="oldpassword" placeholder="Enter Old Password" required>                    
                    <label for="newpassword">New Password</label>
                    <input type="password" class="form-control" name="newpassword" id="newpassword" placeholder="Enter New Password"required>    
                    <label for="cnewpassword">Confirm New Password</label>
                    <input type="password" class="form-control" name="cnewpassword" id="cnewpassword" placeholder="Enter Confirmed Password" required>    
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                <button type="submit" form="formchangepassword" class="btn btn-primary">Save </button>
            </div>
        </div>
    </div>
</div>
<div id="message" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="margin-top:100px">

        <c:if test="${not empty changeSuccess}">
          
            <div class="alert alert-success"
            <p>${changeSuccess}</p>
            </div>     
             
        </c:if>
        <c:if test="${not empty passNotMatch}">
            <div class="alert alert-danger">
                <span><i class="fa fa-exclamation-circle"></i></span> ${passNotMatch}
            </div>
         
        </c:if>
    
    </div>
</div>
                
 <c:if test="${not empty passNotMatch || not empty changeSuccess}">
    <script>

        $().ready(function () {
            $('#message').modal('show');
           
        });
    </script>
</c:if>
</body>
</html>

