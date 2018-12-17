<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bean.User" %>
<%@ page import="bean.Application" %>
<%@ page import="bean.Room" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${sessionScope.adminprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/admin/terminate.html"); %>
</c:if>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
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
            </style>
</head>
<body>
<div class="container">
    <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="home.jsp"><span class="glyphicon glyphicon-home"></span>Hostel</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/ip/admin/viewUser"><span class="glyphicon glyphicon-usd"></span>Manage
                        Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ip/admin/viewRoom"><span class="glyphicon glyphicon-th-list"></span>
                        Manage Room</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ip/admin/viewApp"><span class="glyphicon glyphicon-th-list"></span>
                        Manage Applications</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ip/admin/viewInit"><span class="glyphicon glyphicon-th-list"></span>
                        Manage Backend</a>
                </li>
            </ul>
            <ul class="nav navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        <span class="glyphicon glyphicon-user"></span> Welcome
                        <c:if test="${sessionScope.adminprofile != null}">
                            <jsp:useBean id="adminprofile" class="bean.User" scope="session" />
                            <span style="color:#FFFF00">
                                <jsp:getProperty name="adminprofile" property="fullName" /></span>
                        </c:if>
                        (Admin) <b class="caret"></b></a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/ip/memberprofile.jsp"><span class="glyphicon glyphicon-user"></span>
                            User Profile</a>
                        <a class="dropdown-item" href="/ip/MemberSettingServlet"><span class="glyphicon glyphicon-cog"></span>
                            Setting</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>
                            Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <div class="jumbotron">
        <h1>Admin Portal</h1>
    </div>


    <div class="row">
            <div class="col-md-6 login-form-1">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3>Room List</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-condensed" style="border-collapse:collapse;">
        
                            <thead>
                                <tr>
                                    <th> </th>
                                    <th>rid</th>
                                    <th>action</th>
                                </tr>
                            </thead>
        
                            <tbody>
                                <c:forEach items="${sessionScope.roomList}" var="currentcurr" varStatus="loop">
        
                                    <tr data-toggle="collapse" data-target="#<c:out value="${currentcurr.college}" /><c:out value="${currentcurr.rid}" />" class="accordion-toggle">
                                    <td><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-eye-open"></span></button></td>
                                    <td>
                                        <c:out value="${currentcurr.rid}" />
                                    </td>
                                    <c:if test="${currentcurr.status == 'owned'}">
                                        <c:url value="/updateRoomStatus" var="upRoom">
                                            <c:param name="rid" value="${currentcurr.rid}" />
                                            <c:param name="status" value="available" />
                                        </c:url>
                                        <td><a href="<c:out value='${upRoom}' />">
                                                <c:out value="${currentcurr.status}" /></a></td>
                                    </c:if>
                                    <c:if test="${currentcurr.status == 'available'}">
                                        <c:url value="/updateRoomStatus" var="upRoom">
                                            <c:param name="rid" value="${currentcurr.rid}" />
                                            <c:param name="status" value="owned" />
                                        </c:url>
                                        <td><a href="<c:out value='${upRoom}' />">
                                                <c:out value="${currentcurr.status}" /></a></td>
                                    </c:if>
                                    </tr>
                                    <tr>
                                        <td colspan="12" class="hiddenRow">
                                            <div class="accordian-body collapse" id="<c:out value="${currentcurr.college}" /><c:out value="${currentcurr.rid}" />">
                                            <table class="table table-striped">
                                                <tr>
                                                    <td>
                                                        <c:out value="${currentcurr.fm}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${currentcurr.type}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${currentcurr.college}" />
                                                    </td>
                                                    <td>
                                                        RM:<c:out value="${currentcurr.price}" />
                                                    </td>
                                                </tr>
                                            </table>
        
                    </div>
                    </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                    </table>
                </div>
        
            </div>
        
        </div>
        <div class="col-md-6 login-form-2">
            <h3>Add New Room</h3>
            <div class="well">
                <form class="form-horizontal" action="/ip/admin/insertRoom" method="post">
                    <fieldset>
                        <div class="form-group">
                            <label for="rid" class="col-lg-2 control-label">RID</label>
                            <div class="col-lg-10">
                                <input class="form-control" id="rid" name="rid" placeholder="rid" type="text" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="status" class="col-lg-2 control-label">status</label>
                            <div class="col-lg-10">
                                <select class="form-control" id="status" name="status" required>
                                    <option value="available">available</option>
                                    <option value="owned">owned</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="fm" class="col-lg-2 control-label">fm</label>
                            <div class="col-lg-10">
                                <select class="form-control" id="fm" name="fm" required>
                                    <option value="female">female</option>
                                    <option value="male">male</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="type" class="col-lg-2 control-label">type</label>
                            <div class="col-lg-10">
                                <select class="form-control" id="type" name="type" required>
                                    <option value="single">single</option>
                                    <option value="double">double</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="college" class="col-lg-2 control-label">college</label>
                            <div class="col-lg-10">
                                <input class="form-control" id="college" name="college" placeholder="college" type="text"
                                    required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="price" class="col-lg-2 control-label">price</label>
                            <div class="col-lg-10">
                                <input class="form-control" id="price" name="price" placeholder="price" type="text" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <button class="btn btn-default">Cancel</button>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        
        </div>
        </div>



        <div class="row">
                <div class="col-md-6 login-form-1">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3>User List</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table table-condensed" style="border-collapse:collapse;">
            
                                <thead>
                                    <tr>
                                        <th> </th>
                                        <th>login</th>
                                        <th>password</th>
                                    </tr>
                                </thead>
            
                                <tbody>
                                    <c:forEach items="${sessionScope.userList}" var="currentcurr" varStatus="loop">
            
                                        <tr data-toggle="collapse" data-target="#<c:out value="${currentcurr.fullName}" /><c:out value="${currentcurr.login}" />"
                                        class="accordion-toggle">
                                        <td><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-eye-open"></span></button></td>
                                        <td>
                                            <c:out value="${currentcurr.login}" />
                                        </td>
                                        <td>
                                            <c:out value="${currentcurr.password}" />
                                        </td>
            
                                        </tr>
                                        <tr>
                                            <td colspan="12" class="hiddenRow">
                                                <div class="accordian-body collapse" id="<c:out value="${currentcurr.fullName}" /><c:out value="${currentcurr.login}" />">
                                                <table class="table table-striped">
                                                    <tr>
                                                        <td>
                                                            Type: <c:out value="${currentcurr.userType}" />
                                                        </td>
                                                        <td>
                                                            fName:<c:out value="${currentcurr.fullName}" />
                                                        </td>
                                                        <td>
                                                            Image:<c:out value="${currentcurr.image}" />
                                                        </td>
                                                    </tr>
                                                </table>
            
                        </div>
                        </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                        </table>
                    </div>
            
                </div>
            
            </div>
            <div class="col-md-6 login-form-2">
                    <h3>Add New User</h3>
                <div class="well">
                        <form class="form-horizontal" action="/ip/admin/insertUser" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <label for="login" class="col-lg-2 control-label">login</label>
                                    <div class="col-lg-10">
                                        <input class="form-control" id="login" name="login" placeholder="login" type="text"
                                            required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-lg-2 control-label">password</label>
                                    <div class="col-lg-10">
                                        <input class="form-control" id="password" name="password" placeholder="password"
                                            type="text" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="usertype" class="col-lg-2 control-label">usertype</label>
                                    <div class="col-lg-10">
                                        <select class="form-control" id="usertype" name="usertype" required>
                                            <option value="admin">admin</option>
                                            <option value="normal">normal</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="fullname" class="col-lg-2 control-label">fullname</label>
                                    <div class="col-lg-10">
                                        <input class="form-control" id="fullname" name="fullname" placeholder="fullname"
                                            type="text" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-10 col-lg-offset-2">
                                        <button class="btn btn-default">Cancel</button>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                </div>
            
            </div>
            </div>




            <div class="row">
                    <div class="col-md-6 login-form-1">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3>Application List</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-condensed" style="border-collapse:collapse;">
                
                                    <thead>
                                        <tr>
                                            <th> </th>
                                            <th>room</th>
                                            <th>approval</th>
                                        </tr>
                                    </thead>
                
                                    <tbody>
                                        <c:forEach items="${sessionScope.appList}" var="currentcurr" varStatus="loop">
                
                                            <tr data-toggle="collapse" data-target="#<c:out value="${currentcurr.applicant}" /><c:out value="${currentcurr.id}" />" class="accordion-toggle">
                                            <td><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-eye-open"></span></button></td>
                                            <td>
                                                <c:out value="${currentcurr.room}" />
                                            </td>
                                            <td>
                                                <select class="form-control" id="approval" name="approval" required onchange=window.location.replace('/ip/updateApp?id=<c:out value="${currentcurr.id}" />&applicant=<c:out value="${currentcurr.applicant}" />&approval='+this.value)>
                                                <c:if test="${currentcurr.approval == 'approved'}">
                                                    <c:url value="/updateApp" var="upApp">
                                                        <c:param name="id" value="${currentcurr.id}" />
                                                        <c:param name="approval" value="approval" />
                                                    </c:url>
                                                    <c:out value='<option value="approved" selected >approved</option>' escapeXml="false" />
                                                    <c:out value='<option value="pending">pending</option>' escapeXml="false" />
                                                    <c:out value='<option value="rejected">rejected</option>' escapeXml="false" />
                                                </c:if>
                                                <c:if test="${currentcurr.approval == 'pending'}">
                                                    <c:url value="/updateApp" var="upApp">
                                                        <c:param name="id" value="${currentcurr.id}" />
                                                        <c:param name="approval" value="approval" />
                                                    </c:url>
                                                    <c:out value='<option value="approved"  >approved</option>' escapeXml="false" />
                                                    <c:out value='<option value="pending" selected>pending</option>' escapeXml="false" />
                                                    <c:out value='<option value="rejected">rejected</option>' escapeXml="false" />
                                                </c:if>
                                                <c:if test="${currentcurr.approval == 'rejected'}">
                                                    <c:url value="/updateApp" var="upApp">
                                                        <c:param name="id" value="${currentcurr.id}" />
                                                        <c:param name="approval" value="approval" />
                                                    </c:url>
                                                    <c:out value='<option value="approved" >approved</option>' escapeXml="false" />
                                                    <c:out value='<option value="pending">pending</option>' escapeXml="false" />
                                                    <c:out value='<option value="rejected" selected>rejected</option>' escapeXml="false" />
                                                </c:if>
                                                </select>
                                            </td>
                
                                            </tr>
                                            <tr>
                                                <td colspan="12" class="hiddenRow">
                                                    <div class="accordian-body collapse" id="<c:out value="${currentcurr.applicant}" /><c:out value="${currentcurr.id}" />">
                                                    <table class="table table-striped">
                                                        <tr>
                
                                                            <td>
                                                                id:<c:out value="${currentcurr.id}" />
                                                            </td>
                                                            <td>
                                                                Applicant:<c:out value="${currentcurr.applicant}" />
                                                            </td>
                                                        </tr>
                                                    </table>
                
                            </div>
                            </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            </table>
                        </div>
                
                    </div>
                
                </div>
                <div class="col-md-6 login-form-2">
                    <h3>Add New Application</h3>
                    <div class="well">
                        <form class="form-horizontal" action="/ip/admin/insertApp" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <label for="id" class="col-lg-2 control-label">ID</label>
                                    <div class="col-lg-10">
                                        <input class="form-control" id="id" name="id" placeholder="id" type="text" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="applicant" class="col-lg-2 control-label">applicant</label>
                                    <div class="col-lg-10">
                                        <input class="form-control" id="applicant" name="applicant" placeholder="applicant" type="text"
                                            required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="approval" class="col-lg-2 control-label">approval</label>
                                    <div class="col-lg-10">
                                        <select class="form-control" id="approval" name="approval" required>
                                            <option value="approved">approved</option>
                                            <option value="pending">pending</option>
                                            <option value="rejected">rejected</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="room" class="col-lg-2 control-label">room</label>
                                    <div class="col-lg-10">
                                        <input class="form-control" id="room" name="room" placeholder="room" type="text" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-10 col-lg-offset-2">
                                        <button class="btn btn-default">Cancel</button>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                
                </div>
                </div>
     
       
       



    </div>
</body>

</html>