<%@ page language="java" contentType="text/html; charset = UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Man Store Admin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href='<c:url value = "/resources/admin/css/styles.css"></c:url> ' rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="font-size: 15px">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="index.html">Man Store</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group">
            <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
        </div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#!">Settings</a></li>
                <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="#!">Logout</a></li>
            </ul>
        </li>
    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Core</div>
                    <a class="nav-link" href="/admin">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Dashboard
                    </a>
                    <div class="sb-sidenav-menu-heading">Management</div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        Products
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="/admin/addproduct">Add Product</a>
                            <a class="nav-link" href="/admin/updateproduct">Update Product</a>
                        </nav>
                    </div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                        <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                        User
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                Authentication
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="login.html">Login</a>
                                    <a class="nav-link" href="register.html">Register</a>
                                    <a class="nav-link" href="password.html">Forgot Password</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                Error
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="401.html">401 Page</a>
                                    <a class="nav-link" href="404.html">404 Page</a>
                                    <a class="nav-link" href="500.html">500 Page</a>
                                </nav>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">Logged in as:</div>
                Admin
            </div>
        </nav>
    </div>
    <div id="layoutSidenav_content" >
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Man Store Admin</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Man Store</li>
                </ol>
                <form th:action="@{/admin/updateproduct}" th:object="${productForm}" method="post" enctype="multipart/form-data">
                    <div style="width: 80%; margin-left: 10%"  >
                        <button type="submit" class="btn btn-success" id="btn-add" style="float: right;  margin-right: 10%;font-size: 20px;width: auto; padding: 0 10px">Add</button>
                        <h2 style="font-weight: bolder;font-size: 25px">Add Product</h2>
                        <div class="form-group">
                            <label for="name">Name Product:</label><br>
                            <input name="name" type="text" class="form-control" id="name" placeholder="Name Product...."><br>
                        </div>

                        <div class="form-group">
                            <label for="category">Categoty:</label>
                            <select name="category" class="form-control" id="category">
                                <c:forEach var="item" items="${category}">
                                    <option value="${item.getId()}">${item.getName()}</option>
                                </c:forEach>
                            </select><br>
                        </div>

                        <div class="form-group">
                            <label for="quantity">Quantity:</label><br>
                            <input name="quantity" type="text" class="form-control" id="quantity" placeholder="Quantity...."><br>
                        </div>

                        <div class="form-group">
                            <label for="price">Price:</label><br>
                            <input name="price" type="text" class="form-control" id="price" placeholder="Price...."><br>
                        </div>

                        <div class="form-group">
                            <label for="image">Image:</label><br>
                            <input name="file" type="file" class="form-control" id="image" placeholder="Image...." enctype="multipart/form-data" ><br>
                        </div>

                        <div class="form-group">
                            <label for="description">Description:</label><br>
                            <textarea name="description" class="form-control" rows="5" id="description" placeholder="Description...."></textarea><br>
                        </div>

                        <div class="form-group">
                            <label for="size">Size:</label><br>
                            <div id="size" >
                                <c:forEach var="item" items="${size}">
                                    <label class="checkbox-inline"><input name="size" type="checkbox" value="${item.getId()}">${item.getName().toUpperCase()}</label>
                                </c:forEach>
                            </div><br>
                        </div>

                        <div class="form-group">
                            <label for="color">Color:</label><br>
                            <div id="color" >
                                <c:forEach var="item" items="${color}">
                                    <label class="checkbox"><input name="color" type="checkbox" value="${item.getId()}" style="font-weight: normal">${item.getName()}</label>
                                </c:forEach>
                            </div><br>
                        </div>

                    </div>
                </form>
            </div>
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2023</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<c:url value="/resources/admin/js/datatables-simple-demo.js"></c:url>"</script>
<%--    <script src="<c:url value="/resources/admin/assets/demo/chart-bar-demo.js"></c:url>"></script>--%>
<script src="<c:url value="/resources/admin/js/scripts.js"></c:url>"></script>
<%--    <script src="<c:url value="/resources/admin/assets/demo/chart-area-demo.js"></c:url>"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        var files = [];
        $('#image').change(function (event){
            files = event.target.files;
            forms = new FormData();
            forms.append("file",files[0]);
            $.ajax({
                url : "/api/uploadfile",
                type : "POST",
                data : forms,
                contentType: false,
                processData: false,
                enctype: "multipart/form-data",
                success : function (value){

                }
            })
        })

    });

</script>

</body>
</html>
