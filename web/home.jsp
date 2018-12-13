<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bean.User" %>

<c:if test="${sessionScope.memberprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/terminate.html");%>
</c:if>

<jsp:useBean id="memberprofile" class="bean.User" scope="session" />

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Home</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <style>
            /*
        Removes white gap between slides
            */
            .carousel {
                background:#444;
            }

            /*
            Forces image to be 100% width and not max width of 100%
            */
            .carousel-item .img-fluid {
                width:100%;
                height:auto;
            }
            h2, p{
                color: black;
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

        <!--
          ####################################################
          C A R O U S E L
          ####################################################
        -->
        <div id="carousel-2" class="carousel slide carousel-fade" data-ride="carousel" data-interval="6000">
            <ol class="carousel-indicators">
                <li data-target="#carousel-2" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-2" data-slide-to="1"></li>
                <li data-target="#carousel-2" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">

                <div class="carousel-item active">
                        <img src="https://architectenweb.nl/media/illustrations/2016/11/bb9b9e71-bd19-4931-94fc-78376729d95a_400.jpg" alt="responsive image" class="d-block img-fluid">

                        <div class="carousel-caption">
                            <div>
                                <h2>Common Area</h2>
                                <p>A place to meet with friends for discussion</p>
                            </div>
                        </div>
                </div>
                <!-- /.carousel-item -->


                <div class="carousel-item">
                        <img src="http://www.happynesthostel.com/uploads/fade/2016-10-2714775737970.23136700%201477573797_.jpg" alt="responsive image" class="d-block img-fluid">

                        <div class="carousel-caption justify-content-center align-items-center">
                            <div>
                                <h2>Room for Everyone</h2>
                                <p>A place like home</p>
                            </div>
                        </div>
                </div>
                <!-- /.carousel-item -->
                <div class="carousel-item">
                        <img src="https://i.pinimg.com/originals/50/c8/9c/50c89c2a077cd3c03cb1186ebe731dcf.jpg" alt="responsive image" class="d-block img-fluid">


                        <div class="carousel-caption justify-content-center align-items-center">
                            <div>
                                <h2>Car Park</h2>
                                <p>A place convenience to everyone</p>
                            </div>
                        </div>
                </div>
                <!-- /.carousel-item -->
            </div>
            <!-- /.carousel-inner -->
            <a class="carousel-control-prev" href="#carousel-2" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel-2" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- /.carousel -->
        <script>
            var heightSlider = $('.navbar').height();
            $('#carousel-2').css({ marginTop : heightSlider + 40 + 'px' });
        </script>
    </body>
</html>