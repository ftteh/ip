<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bean.User" %>
<%@ page import="bean.Room" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${sessionScope.memberprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/terminate.html");%>
</c:if>

<jsp:useBean id="memberprofile" class="bean.User" scope="session" />
<jsp:useBean id="roomSelect" class="bean.Room" scope="session" />

<!DOCTYPE html>
<html>

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
            background:#ddc8b4;
            box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
        }
        .login-form-1 h3{
            text-align: center;
            margin-bottom:12%;
            color:#fff;
        }
        .login-form-2{
            padding: 9%;
            background: #f05837;
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
        body{
            margin: 100px;
        }
        </style>
</head>

<body>
            <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="home.jsp"><span class="glyphicon glyphicon-home"></span>Hostel</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/ip/GetRoomServlet"><span class="glyphicon glyphicon-usd"></span> Apply Room</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/ip/ViewAppServlet"><span class="glyphicon glyphicon-th-list"></span> View Application</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="glyphicon glyphicon-user"></span> Welcome
                            <jsp:getProperty name="memberprofile" property="fullName"/>
                            (Member)<b class="caret"></b>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/ip/memberprofile.jsp"><span class="glyphicon glyphicon-user"></span> User Profile</a>
                            <a class="dropdown-item" href="/ip/MemberSettingServlet"><span class="glyphicon glyphicon-cog"></span> Setting</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/ip/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    <div class="container login-container">

        <div class="row">
            <div class="col-md-6 login-form-1">
                <h3>Application Form</h3>
                <form class="form-horizontal" action="/ip/ApplicationServlet" method="post">

                    <div class="form-group">
                        <label for="room" class="col-lg-2 control-label">Room</label>
                        <div class="col-lg-10">
                            <select class="form-control" id="roomid" name="roomid" required onchange="window.location.replace('/ip/GetSelectedRoom?roomid='+this.value)">
                                <c:forEach items="${sessionScope.roomlist}" var="room" varStatus="loop">

                                    <c:url value="/GetSelectedRoom" var="selRoom">
                                        <c:param name="roomid" value="${room.rid}" />
                                    </c:url>

                                    <c:if test="${room.status == 'available'}">
                                        <option value="${room.rid}" ${room.rid==roomSelect.rid ? 'selected' : '' }>${room.rid}
                                            | ${room.type}</option>
                                    </c:if>

                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="login" value="<jsp:getProperty name="memberprofile" property="login"/>"/>  
                        <button type="reset" class="btnSubmit"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                        <button type="submit" class="btnSubmit"><span class="glyphicon glyphicon-ok"></span> Submit</button>
                    </div>

                </form>

            </div>
            <div class="col-md-6 login-form-2">
                <div class="login-logo">
                    <img src="https://files.qatarliving.com/2017/11/27/house-2374925_960_720.png?lGmzS23cJkttt.e2b6oRkgHPeTtdP5kY"
                        alt="" />
                </div>
                <h3>Room Information</h3>
                <div class="well">
                    Room Number: <c:out value="${roomSelect.rid}" /> <br />
                    Type: <c:out value="${roomSelect.type}" /> <br />
                    Gender: <c:out value="${roomSelect.fm}" /> <br/>
                    College: <c:out value="${roomSelect.college}" /> <br />
                    Price: RM <c:out value="${roomSelect.price}" /><br />
                </div>
            </div>
        </div>
    </div>
</body>

</html>