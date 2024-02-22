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
<!-- Page Content-->
<section class="py-5">
    <section class="h-100 h-custom" style="background-color: #d2c9ff;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12">
                    <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                        <div class="card-body p-0" style="margin-left: 50px ; margin-top: 50px">
                            <div class="d-flex justify-content-between align-items-center mb-5">
                                <h2 class="fw-bold mb-0 text-black">Man Store Payment</h2>
                            </div>
                        </div>
                        <div class="card-body p-0" style="border-radius: 15px; margin: 50px">
                            <div class="jumbotron text-center">
                                <h3 class="display-4">Congratulations On Your Successful Order</h3>
                                <h5>Packages will be shipped before ${date} </h5>
                                <h5>Name: ${name}</h5>
                                <h5>Address: ${address}</h5>
                                <h5>Phone: ${phone}</h5>
                                <c:if test="${total > 0}">
                                    <h5>ToTal:  <span>${total}</span>.00$</h5>
                                </c:if>
                                <c:if test="${total == 0}">
                                    <h5>Total: 0.00$</h5>
                                </c:if>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>
<!-- Footer-->
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function(){

        tinhTien();

        function tinhTien(){
            var totalPrice = 0;
            $(".price").each(function (){
                var price = $(this).text();
                var arr = price.split(" ");
                totalPrice = totalPrice + parseInt(arr[1]) ;
                $(".totalPrice").html('$ ' + totalPrice);
            })
        };


        $('.quantity').change(function (){
            var parent = $(this).closest('.represent');
            var quantitynew = parent.find(".inputQuantity").val();
            var price = parent.find('.price').attr('data-price');
            var productId = parent.find('.product').attr('data-product-id');
            var colorId = parent.find('.product').attr('data-color-id');
            var sizeId = parent.find('.product').attr('data-size-id');
            var totalPrice1 = parseInt(quantitynew)  * parseInt(price);
            parent.find('.price').html('$ ' + totalPrice1 );
            $.ajax({
                url : "/api/addtocart",
                type : "get",
                data : {
                    productId : productId,
                    sizeId : sizeId,
                    colorId : colorId,
                    quantity : quantitynew
                },
                success : function (value){
                    tinhTien();
                }
            });

        });
        $('.delete').click(function (){
            var parent = $(this).closest('.represent');
            var productId = parent.find('.product').attr('data-product-id');
            var colorId = parent.find('.product').attr('data-color-id');
            var sizeId = parent.find('.product').attr('data-size-id');
            $.ajax({
                url : "/api/deletecart",
                type : "get",
                data : {
                    productId : productId,
                    sizeId : sizeId,
                    colorId : colorId,
                },
                success : function (){
                    parent.remove();
                    tinhTien();
                }
            });
        });
    });
</script>
</body>
</html>
