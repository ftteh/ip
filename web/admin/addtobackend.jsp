<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bean.User" %>
<%@ page import="bean.Application" %>
<%@ page import="bean.Room" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--<c:if test="${sessionScope.adminprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/admin/terminate.html"); %>
</c:if>--%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>Cash - Admin - Manage Currency</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/navbar-fixed-top.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
                                                                                                                                                <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
                                                                                                                                                <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                                                                                                                                                <![endif]-->
</head>

<body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="home.jsp"><span class="glyphicon glyphicon-home"></span> <span style="color:#FFFF00">CashWeb</span></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/ip/admin/viewUser"><span class="glyphicon glyphicon-th-list"></span>Manage Users</a></li>
                    <li><a href="/ip/admin/viewRoom"><span class="glyphicon glyphicon-th-list"></span>Manage Room</a></li>
                    <li><a href="/ip/admin/viewApp"><span class="glyphicon glyphicon-th-list"></span>Manage
                            Applications</a></li>
                    <li><a href="/ip/admin/viewInit"><span class="glyphicon glyphicon-th-list"></span>Manage
                            Backend</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a aria-expanded="false" href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>
                            Welcome
                            <c:if test="${sessionScope.adminprofile != null}">
                                <jsp:useBean id="adminprofile" class="bean.User" scope="session" />
                                <span style="color:#FFFF00">
                                    <jsp:getProperty name="adminprofile" property="fullName" /></span>
                            </c:if>
                            (Admin) <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="/ip/admin/UserProfileServlet"><span class="glyphicon glyphicon-user"></span>
                                    User Profile</a></li>
                            <li><a href="/ip/admin/SettingServlet"><span class="glyphicon glyphicon-cog"></span>
                                    Setting</a></li>
                            <li class="divider"></li>
                            <li><a href="/ip/admin/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>

    <div class="container">

        <!-- Main component for a primary marketing message or call to action -->
        <div class="jumbotron">
            <h1>Cash Web-App example</h1>
        </div>

        <div class="well">
            <div class="row">
                <div class="col-md-7">
                    <h3>Room List</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover ">
                            <thead>
                                <tr>
                                    <th>rid</th>
                                    <th>fm</th>
                                    <th>type</th>
                                    <th>college</th>
                                    <th>price</th>
                                    <th>action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sessionScope.roomList}" var="currentcurr" varStatus="loop">
                                    <tr>

                                        <td>
                                            <c:out value="${currentcurr.rid}" />
                                        </td>
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
                                            <c:out value="${currentcurr.price}" />
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
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="col-md-5">
                    <h3>Add New Room</h3>
                    <div class="well">
                        <form class="form-horizontal" action="/ip/admin/insertRoom" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <label for="rid" class="col-lg-2 control-label">RID</label>
                                    <div class="col-lg-10">
                                        <input class="form-control" id="rid" name="rid" placeholder="rid" type="text"
                                            required>
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
                                        <input class="form-control" id="college" name="college" placeholder="college"
                                            type="text" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="price" class="col-lg-2 control-label">price</label>
                                    <div class="col-lg-10">
                                        <input class="form-control" id="price" name="price" placeholder="price" type="text"
                                            required>
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
        <div class="well">
            <div class="row">
                <div class="col-md-7">
                    <h3>Application List</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover ">
                            <thead>
                                <tr>
                                    <th>id</th>
                                    <th>applicant</th>
                                    <th>approval</th>
                                    <th>room</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sessionScope.appList}" var="currentcurr" varStatus="loop">
                                    <tr>

                                        <td>
                                            <c:out value="${currentcurr.id}" />
                                        </td>
                                        <td>
                                            <c:out value="${currentcurr.applicant}" />
                                        </td>
                                        <td>
                                            <div class="col-sm-10">

                                                <select class="form-control" id="approval" name="approval" required
                                                    onchange=window.location.replace('/ip/updateApp?id=<c:out value="${currentcurr.id}" />&applicant=<c:out value="${currentcurr.applicant}"/>&approval='+this.value)>
                                                    <c:if test="${currentcurr.approval == 'approved'}">
                                                        <c:url value="/updateApp" var="upApp">
                                                            <c:param name="id" value="${currentcurr.id}" />
                                                            <c:param name="approval" value="approval" />
                                                        </c:url>
                                                        <c:out value='<option value="approved" selected >approved</option>'
                                                            escapeXml="false" />
                                                        <c:out value='<option value="pending">pending</option>'
                                                            escapeXml="false" />
                                                        <c:out value='<option value="rejected">rejected</option>'
                                                            escapeXml="false" />
                                                    </c:if>
                                                    <c:if test="${currentcurr.approval == 'pending'}">
                                                        <c:url value="/updateApp" var="upApp">
                                                            <c:param name="id" value="${currentcurr.id}" />
                                                            <c:param name="approval" value="approval" />
                                                        </c:url>
                                                        <c:out value='<option value="approved"  >approved</option>'
                                                            escapeXml="false" />
                                                        <c:out value='<option value="pending" selected>pending</option>'
                                                            escapeXml="false" />
                                                        <c:out value='<option value="rejected">rejected</option>'
                                                            escapeXml="false" />
                                                    </c:if>
                                                    <c:if test="${currentcurr.approval == 'rejected'}">
                                                        <c:url value="/updateApp" var="upApp">
                                                            <c:param name="id" value="${currentcurr.id}" />
                                                            <c:param name="approval" value="approval" />
                                                        </c:url>
                                                        <c:out value='<option value="approved" >approved</option>'
                                                            escapeXml="false" />
                                                        <c:out value='<option value="pending">pending</option>'
                                                            escapeXml="false" />
                                                        <c:out value='<option value="rejected" selected>rejected</option>'
                                                            escapeXml="false" />
                                                    </c:if>
                                                </select>

                                            </div>
                                        </td>
                    </div>
                    <td>
                        <c:out value="${currentcurr.room}" />
                    </td>

                    </tr>
                    </c:forEach>
                    </tbody>
                    </table>
                </div>

            </div>
            <div class="col-md-5">
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
                                    <input class="form-control" id="applicant" name="applicant" placeholder="applicant"
                                        type="text" required>
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
                                    <input class="form-control" id="room" name="room" placeholder="room" type="text"
                                        required>
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

    <div class="well">
        <div class="row">
            <div class="col-md-7">
                <h3>User List</h3>
                <div class="table-responsive">
                    <table class="table table-striped table-hover ">
                        <thead>
                            <tr>
                                <th>login</th>
                                <th>password</th>
                                <th>usertype</th>
                                <th>fullname</th>
                                <th>image</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.userList}" var="currentcurr" varStatus="loop">
                                <tr>

                                    <td>
                                        <p>something for login here</p>
                                    </td>
                                    <td>
                                        <c:out value="${currentcurr.password}" />
                                    </td>
                                    <td>
                                        <c:out value="${currentcurr.userType}" />
                                    </td>
                                    <td>
                                        <c:out value="${currentcurr.fullName}" />
                                    </td>
                                    <td>
                                        <c:out value="${currentcurr.image}" />
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div> <!-- table-responsive -->

            </div>
            <div class="col-md-5">
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
    </div>

    <footer>
        <p>&copy; RBK 2014 - SCJ/SCSJ 2303/3303</p>
    </footer>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
                                                                                                                                                ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/vendor/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
</body>

</html>