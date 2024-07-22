<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->

<header class="header trans_300">

    <!-- Top Navigation -->

    <div class="top_nav">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="top_nav_left">FREE SHIP > $50</div>
                </div>
                <div class="col-md-6 text-right">
                    <div class="top_nav_right">
                        <ul class="top_nav_menu">

                            <!-- Currency / Language / My Account -->

                            <c:if test="${acc == null}">
                                <li class="account">
                                    <a href="#">
                                        Login-Register
                                        <i class="fa fa-angle-down"></i>
                                    </a>
                                    <ul class="account_selection">
                                        <li><a href="login"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign in</a></li>
                                        <li><a href="signup"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${acc != null}">
                                <li class="account">
                                    <a href="logout">
                                        Logout
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Navigation -->

    <div class="main_nav_container">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-right">
                    <div class="logo_container">
                        <a href="manageProduct">TUAN KHIEU <span>ADMIN</span></a>

                    </div>
                    <nav class="navbar">
                        <ul class="navbar_menu">
                            <li><a href="manageProduct">Manage Product</a></li>
                            <li><a href="manageAccount">Manage Account</a></li>
                            <li><a href="manageOrder">Manage Order</a></li>
                        </ul>

                    </nav>
                </div>
            </div>
        </div>
    </div>

</header>


