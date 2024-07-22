
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign up</title>


        <!-- Main css -->
        <link rel="stylesheet" href="./css/style.css">
    </head>
    <body>

        <div class="main">

            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign up</h2>

                            <c:if test="${errDuplicateEmail != null}">
                                <h3 style="color: red">${errDuplicateEmail}</h3>
                            </c:if>

                            <c:if test="${errDuplicateUser != null}">
                                <h3 style="color: red">${errDuplicateUser}</h3>
                            </c:if>

                            <c:if test="${errNewPass != null}">
                                <h3 style="color: red">${errNewPass}</h3>
                            </c:if>    

                            <form action="signup" method="POST" class="register-form" id="register-form">
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="userName" id="name" placeholder="User Account"/>
                                </div>

                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="pass" id="pass" placeholder="Password"/>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                                </div>

                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-assignment-account"></i></label>
                                    <input type="text" name="name" id="name" placeholder="Full Name"/>
                                </div>

                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-phone"></i></label>
                                    <input type="text" name="phone" id="name" placeholder="Phone"/>
                                </div>

                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Your Email"/>
                                </div>

                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-home"></i></label>
                                    <input type="text" name="location" id="name" placeholder="Location"/>
                                </div>

                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="https://edeninterior.vn/wp-content/uploads/2022/04/thiet-ke-va-thi-cong-shop-jm-tttm-royal-city.jpg" alt="sing up image"></figure>
                            <a href="login" class="signup-image-link">I am already member</a>
                        </div>
                    </div>
                </div>
            </section>



        </div>

        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
