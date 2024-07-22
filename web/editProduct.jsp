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
            <%@include file="./Head/headerAdmin.jsp" %>

            <div class="container product_section_container">
                <div class="row">
                    <div class="col product_section clearfix">

                        <!-- Breadcrumbs -->

                        <div class="breadcrumbs d-flex flex-row align-items-center">
                            <ul>
                                <li><a href="homePage">Admin</a></li>
                                <li class="active"><a href="index.html"><i class="fa fa-angle-right" aria-hidden="true"></i>Edit</a></li>
                            </ul>
                        </div>

                        <!-- Main Content -->

                        <div class="main_content">

                            <!-- Products -->

                            <div class="products_iso">
                                <div class="row">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h1 class="mb-4">Edit Product</h1>
                                            <form action="editProduct" method="POST">
                                                <input type="text" name="id" value="${product.productID}" style="display: none">
                                                <div class="form-group">
                                                    <label for="title">Name</label>
                                                    <input type="text" class="form-control" id="title" name="name" value="${product.productName}" required>
                                                </div>

                                                <div class="form-group">
                                                    <label for="desc">Description</label>
                                                    <textarea class="form-control" id="desc" name="des" rows="5">
                                                        ${product.description}
                                                    </textarea>
                                                </div>

                                                <div class="form-group">
                                                    <label for="price">Price</label>
                                                    <input type="text" class="form-control" id="price" name="price" value="${product.price}" >
                                                </div>

                                                <div class="form-group">
                                                    <label for="stock">listCategory</label>
                                                    <select name="cate" id="lang-select">
                                                        <c:forEach items="${list}" var="cate">
                                                            <option value="${cate.categoryID}"
                                                                    <c:if test="${cate.categoryID == product.categoryID}">selected</c:if>
                                                                >${cate.categoryName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <label for="title">Link IMG</label>
                                                    <input type="text" class="form-control" name="img"
                                                           value="${product.img}" required>
                                                </div>

                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-primary">Edit</button>
                                                </div>
                                            </form>
                                            <!--END CREATE-->
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


