
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
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
<main>
    <!-- Page Content-->
    <br>
    <br>
    <br>
    <br>
    <div class="container px-7 px-lg-7">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Login</h2>
                    <p>Please fill out this to login</p>
<%--                    <form th:action="@{/login}" method="post">--%>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" name="email" id="email" placeholder="Your Email"
                                   class="form-control form-control-lg">
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control form-control-lg" placeholder="Password" name="password"
                                   id="password">
                        </div>

<%--                        <div th:if="${param.error}" class="alert alert-error text-danger">--%>
<%--                            Invalid username or password.--%>
<%--                        </div>--%>

                            <button id = "btnLogin" class="btn btn-primary btn-block">Login</button>
                        <br>
                        <span>Don't have an account <a class="linkControl" href="./register.html"
                                                       th:href="@{/register}">Register here</a></span>
                        <br>
                        <a href="/forgotpassword" th:href="@{/forgotpassword}">Forgot password ?</a>

<%--                    </form>--%>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>

            </div>
        </div>
    </div>
</main>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="containeruser_role px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
<script type = "text/javascript"
        src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">
</script>
<script src="<c:url value="/resources/home/js/myScripts.js"></c:url>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" >
    $(document).ready(function (){
        $("#btnLogin").click(function (){
           var ten = $("#email").val();
           var mk = $("#password").val();
           $.ajax({
               url : "/api/check",
               type : "get",
               data : {
                   email : ten,
                   password : mk
               },
               success : function (value){

                   if (value == "true"){
                       linkCurrent = window.location.href;
                       linkReplace = linkCurrent.replace("/login","/home");
                       alert("success");
                       window.location = linkReplace;
                   }else{
                       alert("failed");
                       $("#ketqua").append("failed")
                   }
               }
           })
        });
    })
</script>
</body>
</html>
