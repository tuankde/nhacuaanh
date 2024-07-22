

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <title>Shopping Cart</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    </head>
    <body>
        <section class="h-100 h-custom" style="background-color: #d2c9ff;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-8">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                                                <h6 id="totalItems" class="mb-0 text-muted">${sessionScope.cart.getSize()} items</h6>
                                            </div>
                                            <hr class="my-4">

                                            <c:if test="${sessionScope.cart == null || sessionScope.cart.getSize() == 0}">
                                                <h1>NO PRODUCTS IN CART</h1>
                                            </c:if>

                                            <c:if test="${sessionScope.cart != null}">
                                                <!-- Product Items -->
                                                <c:forEach items="${sessionScope.cart.getListItem()}" var="i">
                                                    <!-- Product Item 1 -->
                                                    <div class="row mb-4 d-flex justify-content-between align-items-center product-item">
                                                        <!-- Product Image -->
                                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                                            <img src="${i.product.img}"
                                                                 class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                        </div>
                                                        <!-- Product Details -->
                                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                                            <h6 class="text-muted">Product</h6>
                                                            <h6 class="text-black mb-0">${i.product.productName}</h6>
                                                        </div>
                                                        <!-- Quantity Input -->
                                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex align-items-center">
                                                            <c:if test="${i.quanity > 1}">
                                                                <button class="btn btn-link px-2">
                                                                    <a href="shoppingCartController?action=post&id=${i.product.productID}&function=decrease">
                                                                        <i class="fas fa-minus"></i>
                                                                    </a>
                                                                </button>
                                                            </c:if>
                                                            
                                                            <span class="quantityDisplay">${i.quanity}</span> <!-- Display the quantity -->
                                                            <c:if test="${i.quanity < 100}">
                                                                <button class="btn btn-link px-2">
                                                                    <a href="shoppingCartController?action=post&id=${i.product.productID}&function=increase">
                                                                        <i class="fas fa-plus"></i>
                                                                    </a>
                                                                </button>
                                                            </c:if>
                                                        </div>
                                                        <!-- Price -->
                                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                            <h6 class="totalPrice">${i.product.price}</h6>
                                                        </div>
                                                        <!-- Remove Button -->
                                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                            <a href="shoppingCartController?action=delete&id=${i.product.productID}" class="text-muted remove-btn"><i class="fas fa-times"></i></a>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:if>    

                                            <hr class="my-4">

                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="shop" class="text-body"><i
                                                            class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Summary Section -->
                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                            <hr class="my-4">

                                            <!-- Total Price -->
                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase">Total price</h5>
                                                <h5 id="finalTotal">$<fmt:formatNumber type = "number" 
                                                                  maxIntegerDigits = "5" value = "${sessionScope.cart.totalPrice()}" /></h5>
                                            </div>

                                            <c:if test="${sessionScope.acc != null}">
                                                <c:if test="${sessionScope.cart.getSize() != 0 && sessionScope.cart != null}">
                                                    <form class="border border-primary p-4" action="payWithAccountController" method="post">

                                                        <div class="mb-3">
                                                            <label for="address" class="form-label">Address</label>
                                                            <input type="text" class="form-control" name="address" id="address" placeholder="Enter your delivery address" required="">
                                                        </div>
                                                        <button type="submit" class="btn btn-dark btn-block btn-lg"
                                                                data-mdb-ripple-color="dark">Pay</button>
                                                    </form>
                                                </c:if>

                                                <c:if test="${sessionScope.cart == null || sessionScope.cart.getSize() == 0}">
                                                    <p style="font-weight: 600">Not product to PAY</p>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${sessionScope.acc == null}">
                                                <h3>You must be login to buy product</h3>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

       
    </body>

</html>
