<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->

<header class="header trans_300">

    <!-- Top Navigation -->

    <div class="top_nav">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="top_nav_left">FREESHIP > $50</div>
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
                                        <li><a href="login"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>
                                        <li><a href="signup"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${acc != null}">
                                <li class="account">
                                    <a href="#">
                                        My Account
                                        <i class="fa fa-angle-down"></i>
                                    </a>
                                    <ul class="account_selection">
                                        <li><a href="profile"><i class="fa fa-user" aria-hidden="true"></i>Profile</a></li>
                                        <li><a href="myOrder"><i class="fa fa-cart-plus" aria-hidden="true"></i>My Order</a></li>
                                        <li><a href="logout"><i class="fa fa-sign-in" aria-hidden="true"></i>Logout</a></li>
                                    </ul>
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
                        <a href="homePage">TUAN KHIEU <span>shop</span></a>
                    </div>
                    <nav class="navbar">
                        <ul class="navbar_menu">
                            <li><a href="homePage">Home</a></li>
                            <li><a href="shop">Shop</a></li>
                            <li><a href="contact.jsp">Contact</a></li>
                        </ul>
                        <ul class="navbar_user">
                            <li class="checkout">
                                <a href="shoppingCartController?action=get">
                                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                    <span id="checkout_items" class="checkout_items">

                                        <c:if  test="${cart.getSize() == 0 || cart.getSize() == null}">
                                            0
                                        </c:if>
                                        <c:if  test="${cart.getSize() != 0}">
                                            ${cart.getSize()}
                                        </c:if>
                                    </span>
                                </a>
                            </li>
                        </ul>
                        <div class="hamburger_container">
                            <i class="fa fa-bars" aria-hidden="true"></i>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>

</header>