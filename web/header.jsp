<%-- 
    Document   : header
    Created on : Oct 21, 2023, 9:53:40 AM
    Author     : anhdu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="home">Car booking</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Home</a></li>
                <c:if test="${sessionScope.user.role eq 0}">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="AdminUser">User</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="AdminCar">Car</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="AdminContract">Contract</a></li>
                </c:if>
            </ul>
            <div class="d-flex">

                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <a class="btn btn-outline-dark" href="booked">
                            <i class="bi-clock me-1"></i>
                            Booked list
                        </a>

                        <a class="btn btn-outline-dark ms-3" href="profile">
                            <i class="bi-person me-1"></i>
                            Profile
                        </a>
                        
                        <a class="btn btn-outline-dark ms-3" href="log">
                            <i class="bi-box-arrow-right me-1"></i>
                            Log out
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-outline-dark ms-3" href="login.jsp">
                            <i class="bi-person me-1"></i>
                            Login
                        </a>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>
</nav>

<!-- Header-->
<header class="bg-dark py-5" style="background-image: url('https://images.unsplash.com/photo-1520105072000-f44fc083e508?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YnVzfGVufDB8fDB8fHww');">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Car booking</h1>
            <p class="lead fw-normal text-white-50 mb-0">Car booking</p>
        </div>
    </div>
</header>
