<%-- 
    Document   : login
    Created on : Oct 14, 2021, 11:38:07 PM
    Author     : truon
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Register</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="/DuniExchange/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="/DuniExchange/resource/css/styleLog.css">
    <!-- base.css -->
    <link rel="stylesheet" href="/DuniExchange/resource/css/base.css">
    <!-- noto sans font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form method="POST" class="register-form" id="register-form" action="registerServlet">
                            <div class="form-group">
                                <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="username" id="username" placeholder="Username" value="${username}" required=""/>
                            </div>
                            <div class="form-group">
                                <label for="fullname"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="fullname" id="fullname" placeholder="Fullname" value="${fullname}" required=""/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Email" value="${email}" />
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="passwordUser" id="pass" placeholder="Password" value ="${passwordUser}" required=""/>
                            </div>
                            <div class="form-group">
                                <label for="re_password"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_password" id="re_pass" placeholder="Repeat password" required=""/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                                <font color="red">${not empty requestScope.MESSAGE ? requestScope.MESSAGE : ""}</font>
                            <div class="form-group form-button ">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Sign up"/>
                            </div>                            
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="/DuniExchange/resource/img/signup-image.jpg" alt="sing up image"></figure>
                        <a href="displayLoginServlet" class="signup-image-link">I already have Account</a>
                    </div>
                </div>
            </div>
        </section>
    </div>


    <!-- JS -->
    <!--<script src="/DuniExchange/vendor/jquery/jquery.min.js"></script>-->
    <!--<script src="/DuniExchange/js/main.js"></script>-->
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>