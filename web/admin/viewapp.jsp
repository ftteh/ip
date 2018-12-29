<%-- 
    Document   : admin viewcash
    Created on : Nov 7, 2014, 3:05:39 PM
    Author     : cool man
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
                h2,td,th {
                    text-align: center;
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
                              <jsp:useBean id="adminprofile" class="bean.User" scope="session" />
                              <span style="color:#FFFF00">
                                  <jsp:getProperty name="adminprofile" property="fullName" /></span>
                          </c:if>
                          (Admin) <b class="caret"></b></a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="/ip/admin/memberprofile.jsp"><i class="fas fa-user-edit"></i>
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

    <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
<h1>View Applications</h1>
      </div>
      
      <div class="well">
        <div class="row">
            <div class="col-md-12"> 
                <div class="table-responsive">
                    <table class="table  table-hover ">
                        <thead>
                            <tr>
                                <th>Index</th>
                                <!--<th>id</th>-->
                                <th>Room</th>
                                <th>Applicant</th>
                                <th>Apply Date</th>
                                <th>Status</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.appList}" var="i" varStatus="loop">                                
                                <tr>
                                    <td><c:out value="${loop.index + 1}" /></td>    
                                    <!--<td><c:out value="${i.id}" /></td>-->
                                    <td><c:out value="${i.room}" /></td>
                                    <td><c:out value="${i.applicant}" /></td>
                                    <td><c:out value="${i.bookingdate}" /></td>
                                    <!--<td><c:out value="${i.approval}" /></td>-->
                                    
                                    
                                    <c:if test="${i.approval == 'approved'}">
                                        <td><c:out value="${i.approval}" /></td>
                                    </c:if>
                                    <c:if test="${i.approval == 'rejected'}">
                                        <td><c:out value="${i.approval}" /></td>
                                    </c:if>
                                    <c:if test="${i.approval == 'pending'}">
                                    <td>
                                        <select class="form-control" id="approval" name="approval" required style="width:70%;" onchange=window.location.replace('/ip/updateApp?id=<c:out value="${i.id}" />&applicant=<c:out value="${i.applicant}" />&approval='+this.value)>
                                            <c:url value="/updateApp" var="upApp">
                                                <c:param name="id" value="${i.id}" />
                                                <c:param name="approval" value="approval" />
                                            </c:url>
                                            <c:out value='<option value="approved"  >approved</option>' escapeXml="false" />
                                            <c:out value='<option value="pending" selected>pending</option>' escapeXml="false" />
                                            <c:out value='<option value="rejected">rejected</option>' escapeXml="false" />
                                        </select>
                                    </td>
                                    </c:if>
                                        
                                        
                                    <c:url value="deleteApp" var="displayURL">
                                        <c:param name="id" value="${i.id}" /> 
                                    </c:url>
                                    <td><a href="<c:out value='${displayURL}' />"><i class="fas fa-trash-alt"></i></a></td>

                                  
                                </tr>
                            </c:forEach>
                        </tbody> 
                    </table>    
                </div> <!-- table-responsive -->
            </div>
        </div>
      </div>      
      


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