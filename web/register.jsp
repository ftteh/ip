<!DOCTYPE html>
<html>

    <head>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!------ Include the above in your HEAD tag ---------->
        <style>
            body {
                margin: 0;
                padding: 0;
                background:#eee;
                font-family: roboto;
                display:flex; /* You delete it on your web page */
                justify-content:center;/* and this - delete */
            }
            a:hover,
            a:focus {
                text-decoration: none;
                color: #eee;
            }
            .login-card {
                min-height: 100vh;
                background-image: url('https://selimdoyranli.com/cdn/material-form/img/bg.jpg');
                background-size: cover;
                -moz-background-size: cover;
                -ms-background-size: cover;
                -wenkit-background-size: cover;
                background-position: center center;
                background-repeat: no-repeat;
                position: relative;
                border-radius: 5px;
                -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
                box-shadow: 0 1px 6px 0 rgba(0, 0, 0, 0.12), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
                z-index: 2;
                padding: 0;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                -webkit-box-pack: center;
                -ms-flex-pack: center;
                justify-content: center;
                font-family: roboto!important;
            }
            .login-card:after {
                background: linear-gradient(-135deg, rgb(63, 81, 181), rgb(233, 30, 99));
                /* Login Card Arkaplan Rengi */

                background: -webkit-linear-gradient(-135deg, rgb(63, 81, 181), rgb(233, 30, 99));
                /* Login Card Arkaplan Rengi */

                width: 100%;
                height: 100%;
                position: absolute;
                top: 0;
                left: 0;
                content: "";
                opacity: 0.8;
                z-index: 3;
            }
            .login-card > form {
                z-index: 4;
                position: relative;
                padding: 0px 25px;
                width: 100%;
            }
            .logo-kapsul {
                text-align: center;
                position: relative;
                opacity: 0.8;
            }
            .logo {
                height: auto;
                padding: 50px 0px;
            }
            /* form ba?lang?ç stiller ------------------------------- */

            .group {
                position: relative;
                margin-bottom: 45px;
            }
            .group input {
                font-size: 18px;
                padding: 10px 10px 10px 10px;
                display: block;
                width: 100%;
                border: none;
                border-bottom: 1px solid rgba(255, 255, 255, 0.3);
                background: none;
                color: #eee;
            }
            .group input:focus {
                outline: none;
            }
            /* LABEL ======================================= */

            .group label {
                color: rgba(255, 255, 255, 0.5);
                font-size: 18px;
                font-weight: normal;
                position: absolute;
                pointer-events: none;
                left: 5px;
                top: 5px;
                transition: 0.2s ease all;
                -moz-transition: 0.2s ease all;
                -webkit-transition: 0.2s ease all;
            }
            /* active durum */

            .group input:focus ~ label,
            input:valid ~ label {
                top: -20px;
                font-size: 14px;
                color: rgba(255, 255, 255, 0.7);
            }
            /* BOTTOM BARS ================================= */

            .bar {
                position: relative;
                display: block;
                width: 100%;
            }
            .bar:before,
            .bar:after {
                content: '';
                height: 2px;
                width: 0;
                bottom: 1px;
                position: absolute;
                background: rgba(255, 255, 255, 0.7);
                transition: 0.2s ease all;
                -moz-transition: 0.2s ease all;
                -webkit-transition: 0.2s ease all;
            }
            .bar:before {
                left: 50%;
            }
            .bar:after {
                right: 50%;
            }
            /* active durum bar */

            .group input:focus ~ .bar:before,
            .group input:focus ~ .bar:after {
                width: 50%;
            }
            /* HIGHLIGHTER ================================== */

            .highlight {
                position: absolute;
                height: 0%;
                width: 100px;
                top: 25%;
                left: 0;
                pointer-events: none;
                opacity: 0.5;
            }
            /* active durum */

            .group input:focus ~ .highlight {
                -webkit-animation: inputHighlighter 0.3s ease;
                -moz-animation: inputHighlighter 0.3s ease;
                animation: inputHighlighter 0.3s ease;
            }
            /* form animasyon ================ */

            @-webkit-keyframes inputHighlighter {
                from {
                    background: rgba(255, 255, 255, 0.7);
                }
                to {
                    width: 0;
                    background: transparent;
                }
            }
            @-moz-keyframes inputHighlighter {
                from {
                    background: rgba(255, 255, 255, 0.7);
                }
                to {
                    width: 0;
                    background: transparent;
                }
            }
            @keyframes inputHighlighter {
                from {
                    background: rgba(255, 255, 255, 0.7);
                }
                to {
                    width: 0;
                    background: transparent;
                }
            }
            .input-ikon {
                font-size: 25px!important;
                position: relative;
            }
            .input-sifre-ikon {
                font-size: 22px!important;
                position: relative;
            }
            .span-input {
                margin-left: 10px;
                position: relative;
                top: -5px;
            }
            .giris-yap-buton,
            .sifre-hatirlat-buton {
                background: linear-gradient(-135deg, rgb(63, 81, 181), rgb(233, 30, 99));
                background: -webkit-linear-gradient(-135deg, rgb(63, 81, 181), rgb(233, 30, 99));
                display: block;
                text-align: center;
                text-decoration: none;
                color: #eee;
                font-family: roboto;
                font-weight: 100;
                padding: 10px;
                border-radius: 3px;
                outline: none;
                opacity: 0.8;
            }
            .forgot-and-create {
                margin: 20px 0px;
            }
            .forgot-and-create a {
                color: #bbb;
                font-size: 12px;
                text-decoration: none;
                font-weight: 100;
                margin-right: 10px;
            }
            /* Geçi? Links Forgot and Create */

            .zaten-hesap-var-link {
                color: #bbb;
                font-size: 14px;
                padding: 20px 0px;
                text-decoration: none;
                display: block;
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
            </div>
        </nav>

        <div class="col-lg-4 col-md-7 col-sm-6 col-xs-12 login-card">

            <!-- Login (giri?) Form Sayfas? -->
            <form id="login-form" class="col-lg-12" action="/ip/RegisterServlet" method="POST">

                <!-- Logo -->
                <div class="col-lg-12 logo-kapsul">
                    <img width="100" class="logo" src="https://selimdoyranli.com/cdn/material-form/img/logo.png" alt="Logo" />
                </div>
                <!-- #Logo Biti? -->

                <div style="clear:both;"></div>

                <!-- Kullan?c? Ad? Giri? ?nput -->
                <div class="group">
                    <input type="text" required>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label><i class="material-icons input-ikon">person_outline</i><span class="span-input">Login ID</span></label>
                </div>
                <!-- #Kullan?c? Ad? Giri? ?nput Biti? -->

                <!-- ?ifre ?nput Giri?-->
                <div class="group">
                    <input type="password" required>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label><i class="material-icons input-sifre-ikon">lock</i><span class="span-input">Password</span></label>
                </div>
                <!-- ?ifre ?nput Giri? Biti?-->

                <button type="submit" class="giris-yap-buton"><span class="glyphicon glyphicon-ok"></span> Submit</button>

            </form>

        </div>

    </body>
</html>