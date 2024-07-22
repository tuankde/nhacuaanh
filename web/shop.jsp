<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Colo Shop Categories</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Colo Shop Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="styles/categories_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/categories_responsive.css">
    </head>

    <body>

        <div class="super_container">

            <!--header-->
            <%@include file="./Head/header.jsp" %>

            <div class="container product_section_container">
                <div class="row">
                    <div class="col product_section clearfix">

                        <!-- Breadcrumbs -->

                        <div class="breadcrumbs d-flex flex-row align-items-center">
                            <ul>
                                <li><a href="homePage">Home</a></li>
                                <li class="active"><a href="shop"><i class="fa fa-angle-right" aria-hidden="true"></i>Shop</a></li>
                            </ul>
                        </div>

                        <!-- Sidebar -->

                        <div class="sidebar">
                            <div class="sidebar_section">
                                <div class="sidebar_title">
                                    <h5>Product Category</h5>
                                </div>
                                <ul class="sidebar_categories">
                                    <c:forEach items="${listCa}" var="o">
                                        <li><a style="cursor: pointer" href="shop?cate=${o.categoryID}">${o.categoryName}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>

                            <!-- Price Range Filtering -->
                            <div class="sidebar_section">
                                <div class="sidebar_title">
                                    <h5>Search</h5>
                                </div>
                                <form class="d-flex" role="search" action="shop" method="get">
                                    <input
                                        class="form-control me-2"
                                        type="search" placeholder="Search" 
                                        aria-label="Search"
                                        name="search">
                                    <div></div>
                                    <button class="btn btn-outline-success" type="submit">Search</button>
                                </form>
                            </div>



                        </div>

                        <!-- Main Content -->

                        <div class="main_content">

                            <!-- Products -->

                            <div class="products_iso">
                                <div class="row">
                                    <div class="col">

                                        <!-- Product Sorting -->


                                        <!-- Product Grid -->

                                        <div class="product-grid">

                                            <c:forEach items="${listPro}" var="pro">

                                                <!-- Product 1 -->

                                                <div class="product-item men">
                                                    <div class="product discount product_filter">
                                                        <div class="product_image">
                                                            <a href="detailProduct?id=${pro.productID}"><img src="${pro.img}" alt=""></a>

                                                        </div>
                                                        
                                                        <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-$20</span></div>
                                                        <div class="product_info">
                                                            <h6 class="product_name"><a href="detailProduct?id=${pro.productID}">${pro.productName}</a></h6>
                                                            <div class="product_price">$${pro.price}</div>
                                                        </div>
                                                    </div>
                                                    <div class="red_button add_to_cart_button"><a href="detailProduct?id=${pro.productID}">Detail product</a></div>
                                                </div>
                                            </c:forEach>   
                                        </div>

                                        <!-- Product Sorting -->

                                        <div class="product_sorting_container product_sorting_container_bottom clearfix">
                                            <div class="pages d-flex flex-row align-items-center">
                                                <nav aria-label="Page navigation example">
                                                    <ul class="pagination">

                                                        <c:forEach begin="1" end="${maxPage}" var="i">
                                                            <li class="page-item ${indexPage == i ? 'active' : ''}">
                                                                <a style="cursor: pointer" class="page-link" onclick="pagging('${i}')">${i}</a>
                                                            </li>
                                                        </c:forEach>


                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--footer-->
            <%@include file="./Head/Footer.jsp" %>
        </div>

        <script>
            const url = new URL(window.location.href);

            function pagging(i) {
                if (url.searchParams.get("index")) {
                    url.searchParams.delete("index");
                    url.searchParams.set("index", i);
                } else {
                    url.searchParams.set("index", i);
                }

                window.location.href = url.href;
            }

            function cate(i) {
                if (url.searchParams.get("cate")) {
                    url.searchParams.delete("cate");
                    url.searchParams.set("cate", i);
                } else {
                    url.searchParams.set("cate", i);
                }

                window.location.href = url.href;
            }
        </script>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
        <script src="js/categories_custom.js"></script>
    </body>

</html>



