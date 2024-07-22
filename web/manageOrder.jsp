

<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Colo Shop</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Colo Shop Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    </head>

    <body>

        <div class="super_container">
            <!--header-->
            <%@include file="./Head/headerAdmin.jsp" %>
            <div style="height: 100px"></div>
            <div class="new_arrivals">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="product-grid" >
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Order ID</th>
                                            <th scope="col">Username</th>
                                            <th scope="col">Location Order</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Comment</th>
                                            <th scope="col">View</th>
                                            <th scope="col">Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listO}" var="o">
                                            <tr>
                                                <th scope="row">${o.orderDeitalID}</th>
                                                <th scope="row">${o.nameUser}</th>
                                                <th scope="row">${o.locationOrder}</th>
                                                <th scope="row">${o.total}$</th>
                                                <th scope="row">
                                                    <c:if test="${o.status == -1}">

                                                        <form action="manageOrder?action=changeSatus" method="post">
                                                            <input type="hidden" name="orderDetailID" value="${o.orderDeitalID}">
                                                            <button type="submit" name="status" value="1">Accept</button>
                                                            <button type="submit" name="status" value="0">Cancel</button>
                                                            
                                                        </form>


                                                    </c:if>

                                                    <c:if test="${o.status == 1}">
                                                        Accept
                                                    </c:if>

                                                    <c:if test="${o.status == 0}">
                                                        Cancel
                                                    </c:if>

                                                </th>

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Best Sellers -->

            <div class="product_sorting_container product_sorting_container_bottom clearfix"
                 style="margin-left: 70%">
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

            <!--footer-->




        </div>

        <script>

            const url = new URL(window.location.href);

            const deleteAc = document.getElementById("delete");
            deleteAc.addEventListener("click", (e) => {
                e.preventDefault();

                const conf = confirm("Are you sure to delete this products");

                if (conf) {
                    deleteAc.submit();
                }
            });

            function pagging(i) {
                if (url.searchParams.get("index")) {
                    url.searchParams.delete("index");
                    url.searchParams.set("index", i);
                } else {
                    url.searchParams.set("index", i);
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
        <script src="js/custom.js"></script>
    </body>

</html>



