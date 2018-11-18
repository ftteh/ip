<%-- 
    Document   : admin viewcash
    Created on : Nov 7, 2014, 3:05:39 PM
    Author     : U
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bean.User" %>
<%@ page import="bean.Application" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${sessionScope.adminprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/admin/terminate.html"); %>
</c:if>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>Cash - Admin</title>

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
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"></span> <span style="color:#FFFF00">CashWeb</span></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="/cash/admin/viewUser"><span class="glyphicon glyphicon-th-list"></span>Manage Users</a></li>
            <li><a href="/cash/admin/viewRoom"><span class="glyphicon glyphicon-th-list"></span>Manage Room</a></li>
            <li><a href="/cash/admin/viewApp"><span class="glyphicon glyphicon-th-list"></span>Manage Applications</a></li> 
          </ul>
          <ul class="nav navbar-nav navbar-right">
      		<li class="dropdown">
		        <a aria-expanded="false" href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> Welcome 
                            <span style="color:#FFFF00"><jsp:getProperty name="adminprofile" property="fullName"/></span>
                            (Admin) <b class="caret"></b></a>
			        <ul class="dropdown-menu">
			          <li><a href="/cash/admin/UserProfileServlet"><span class="glyphicon glyphicon-user"></span> User Profile</a></li>
			          <li><a href="/cash/admin/SettingServlet"><span class="glyphicon glyphicon-cog"></span> Setting</a></li>
			          <li class="divider"></li>
			          <li><a href="/cash/admin/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			        </ul>
		  	</li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Cash Web-App example</h1>
        <ul>
          <li>Responsive application</li>
          <li>Bootstrap CSS</li>
          <li>MVC
            <ul>
              <li>(M)odel - JavaBeans</li>
              <li>(V)iew - JSP for input and output</li>
              <li>(C)ontroller - Servlet</li>
            </ul>
          </li>
        </ul>
      </div>
      
      <div class="well">
        <div class="row">
            <div class="col-md-12"> 
                <h3>user</h3>                
                <div class="table-responsive">
                    <table class="table table-striped table-hover ">
                        <thead>
                            <tr>
                                <th>index</th>
                                <th>id</th>
                                <th>applicant</th>
                                <th>approval</th>
                                <th>room</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- <c:set var="amountinprocess" scope="page" value="${0}"/> -->
                            <!-- <c:set var="amountapprove" scope="page" value="${0}"/> -->
                            <c:forEach items="${sessionScope.appList}" var="i" varStatus="loop">                                
                                <tr>
                                    <td><c:out value="${loop.index + 1}" /></td>    
                                    <td><c:out value="${i.id}" /></td>
                                    <td><c:out value="${i.applicant}" /></td>
                                    <td><c:out value="${i.approval}" /></td>
                                    <td><c:out value="${i.room}" /></td>
                                    <c:url value="deleteApp" var="displayURL">
                                        <c:param name="id" value="${i.id}" /> 
                                    </c:url>
                                    <td><a href="<c:out value='${displayURL}' />"><span class="glyphicon glyphicon-remove">remove</span></a></td>

                                    
                                    <!-- <c:if test="${currentrqc.status == 'in process'}">
                                        <c:url value="crqapproval.jsp" var="displayURL">
                                            <c:param name="requestid" value="${currentrqc.requestId}" /> 
                                            <c:param name="login" value="${currentrqc.login}" /> 
                                            <c:param name="symbol" value="${currentrqc.symbol}" />
                                            <c:param name="amount" value="${currentrqc.amount}" />
                                        </c:url>
                                        <td><a href="<c:out value='${displayURL}' />"><c:out value="${currentrqc.status}" /></a></td>
                                    </c:if> -->
                                            
                                    <!-- <c:if test="${currentrqc.status == 'approve'}">
                                        <td><c:out value="${currentrqc.status}" /></td>
                                    </c:if>
                                        
                                    <c:if test="${currentrqc.status == 'rejected'}">
                                        <td><c:out value="${currentrqc.status}" /></td>
                                    </c:if>     -->
                                </tr>
                            </c:forEach>
                        </tbody> 
                    </table>    
                </div> <!-- table-responsive -->
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