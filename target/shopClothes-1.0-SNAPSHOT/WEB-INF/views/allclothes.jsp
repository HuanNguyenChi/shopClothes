<%@ page language="java" contentType="text/html; charset = UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no,maximum-scale=1.0, minimum-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>ManStore</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link href='<c:url value="/resources/home/css/myStyle.css"/> ' rel="stylesheet" >
</head>
<body>
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="/home">Man Store</a>
        <div class="collapse navbar-collapse flex-container" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item " >
                    <form class="d-flex" th:action="@{/search}" method="get">
                        <input class="form-control me-2" type="search" placeholder="Search" name="q" aria-label="Search">
                        <button class="btn btn-outline-light btn-sm" type="submit">Search</button>
                    </form>
                </li>
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/">Contact</a></li>
                <c:choose>
                    <c:when test="${firstChar != null}">
                        <li class="nav-item"><a class="nav-link" href="/login" >${firstChar}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a class="nav-link" href="/login" >Login</a></li>
                    </c:otherwise>
                </c:choose>
                <li class="nav-item"><a class="nav-link" href="/home">About</a></li>
                <li class="nav-item" >
                    <a href="/cart">
                        <button class="btn btn-outline-light " type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <div id = "quantityCart" class="badge bg-dark text-white ms-1 rounded-pill">
                                <c:if test="${cart == null }">
                                    <span>0</span>
                                </c:if>
                                <c:if test="${cart != null }">
                                    <span >${cart.size()}</span>
                                </c:if>
                            </div>
                        </button>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Man Store in Clothes</h1>
            <p class="lead fw-normal text-white-50 mb-0">Style is knowing who you are, what you want to say, and not giving a damn!</p>
        </div>
    </div>
</header>
<!-- Section-->
<!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="product" items="${listClothes}" >
                <div class="col mb-5">
                    <a href="/itemdetail/${product.getId()}">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${product.getName()}</h5>
                                    <!-- Product price-->
                                        ${product.getPrice()}$
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/itemdetail/${product.getId()}">View options</a></div>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<footer class="py-5 bg-dark">
    <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="<c:url value="/resources/home/js/myScripts.js"></c:url>"></script>

</body>
</html>
