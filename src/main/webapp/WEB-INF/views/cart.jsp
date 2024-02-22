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
                                    <span class="quantityItems">${cart.size()}</span>
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
                        <div class="card-body p-0">
                            <div class="row g-0">
                                <div class="col-lg-8">
                                    <div class="p-5">
                                        <div class="d-flex justify-content-between align-items-center mb-5">
                                            <h1 class="fw-bold mb-0 text-black">Man Store Cart</h1>
                                            <h6 class="mb-0 text-muted "> <span class="quantityItems">${listCart.size()}</span> items</h6>
                                        </div>
                                        <c:forEach var="item" items="${listCart}">
                                            <div class="row mb-4 d-flex justify-content-between align-items-center represent" >

                                                <div class="col-md-2 col-lg-2 col-xl-2" class = "img" >
                                                    <img
                                                            src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img5.webp"
                                                            class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                </div>
                                                <div class="col-md-3 col-lg-3 col-xl-3 product"
                                                     data-product-id = '${item.getProductId()}'
                                                     data-color-id = '${item.getColorId()}'
                                                     data-size-id = '${item.getSizeId()}'>
                                                    <h6 class="text-black mb-0" >${item.getProduct()}</h6>
                                                    <h6 class="text-muted" >${item.getColor()}, ${item.getSize()}</h6>
                                                </div>
                                                <div class="col-md-3 col-lg-3 col-xl-2 d-flex quantity" >
                                                    <input class="form-control form-control-sm inputQuantity"  min="1" name="quantityCart" value="${item.getQuantity()}" type="number"
                                                            style="width: 100px" />
                                                </div>
                                                <div  data-price = '${item.getPrice()}' data-quantity = '${item.getQuantity()}' class="col-md-3 col-lg-2 col-xl-2 offset-lg-1 price"  >$ ${item.getPrice() * item.getQuantity()}</div>
                                                <div class="col-md-1 col-lg-1 col-xl-1 text-end delete" >
                                                    <button class="text-muted " style="border: none;background: none"><i class="fas fa-times"></i></button>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-lg-4 bg-grey">
                                    <div class="p-5" id = "summary">
                                        <form th:action="@{/cart}" method="post">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                            <hr class="my-4">
                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase ">Items <span class="quantityItems">${listCart.size()}</span></h5>
                                                <h5 class = 'totalPrice'>$ 0.00</h5>
                                            </div>
                                            <h5 class="text-uppercase mb-3">Shipping</h5>
                                            <div class="mb-4 pb-2">
                                                <select class="select">
                                                    <option value="1">Standard-Delivery - $5.00</option>
                                                    <option value="2">Two</option>
                                                    <option value="3">Three</option>
                                                    <option value="4">Four</option>
                                                </select>
                                            </div>
                                            <h5 class="text-uppercase mb-3">Name of Consignee</h5>
                                            <input type="text" id="nameOfConsignee" class="form-control form-control-lg" name = "nameOfConsignee" required/>
                                            <label class="form-label" for="nameOfConsignee">Enter your name</label>
                                            <h5 class="text-uppercase mb-3">Your Phone Number</h5>
                                            <input type="text" id="phoneNumber" class="form-control form-control-lg" name="phoneNumber" required/>
                                            <label class="form-label" for="phoneNumber">Enter your phone</label>
                                            <h5 class="text-uppercase mb-3">Your Address</h5>
                                            <input type="text" id="address" class="form-control form-control-lg" name = "address" required/>
                                            <label class="form-label" for="address">Enter your address</label>
                                            <h5 class="text-uppercase mb-3">Note</h5>
                                            <input type="text" id="note" class="form-control form-control-lg" name = "note" value=""/>
                                            <label class="form-label" for="address">Enter your require</label>
                                            <hr class="my-4">
                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase">Total price</h5>
                                                <h5 class="totalPrice">$ 0.00</h5>
                                            </div>
                                            <button id="payment" type="submit" class="btn btn-dark btn-block btn-lg"
                                                    data-mdb-ripple-color="dark">Payment</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>
<!-- Section-->
<h3 style="padding-left: 150px"> Recommended Products</h3>
<section class="py-5">

    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="product" items="${listProduct}" >
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
                success : function (value){
                    parent.remove();
                    tinhTien();
                    $(".quantityItems").html(value);
                }
            });
        });
        // $('#payment').click(function (){);
        //     var nameOfConsignee = $('#nameOfConsignee').val();
        //     var phoneNumber = $('#phoneNumber').val();
        //     var address = $('#address').val();
        //     var note = $('#note').val();
        //     alert(nameOfConsignee);
        //     $.ajax({
        //         url : "/api/savebill",
        //         type : "post",
        //         data : {
        //             nameOfConsignee : nameOfConsignee,
        //             phoneNumber : phoneNumber,
        //             address : address,
        //             note : note
        //         },
        //         success : function (value){
        //             alert(value);
        //             if(value == "true"){
        //                 linkCurrent = window.location.href;
        //                 linkReplace = linkCurrent.replace("/cart","/home");
        //                 alert("success");
        //                 window.location = linkReplace;
        //             }
        //         }
        //     })
        // })
    });
</script>
</body>
</html>
