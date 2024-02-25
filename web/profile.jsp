<%-- 
    Document   : profile
    Created on : Oct 22, 2023, 10:46:29 PM
    Author     : anhdu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Car booking</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/stylesBootstrap.css" rel="stylesheet" />
    </head>

    <body>
        <jsp:include page="/header.jsp" />

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">

                <h1>User Profile Update</h1>

                <form action="profile" method="post">

                    <input type="hidden" name="username" value="${user.username}">

                    <!-- Full Name -->
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullName}">
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${user.email}">
                    </div>

                    <!-- Date of Birth -->
                    <div class="form-group">
                        <label for="dob">Date of Birth</label>
                        <input type="date" class="form-control" id="dob" name="dob" value="${user.dob}">
                    </div>

                    <!-- Gender -->
                    <div class="form-group">
                        <label>Gender</label>
                        <label for="gender">Gender</label>
                        <select class="form-control" id="gender" name="gender">
                            <option value="0" <c:if test="${user.gender eq 0}">selected</c:if>>Male</option>
                            <option value="1" <c:if test="${user.gender eq 1}">selected</c:if>>Female</option>
                        </select>
                    </div>

                    <div style="display: flex; width: 100%">
                        <div style="width: 50%;">

                        </div>
                        <div style="width: 50%;">

                        </div>
                    </div>

                    <br>

                    <button type="submit" class="btn btn-primary">Update Profile</button>
                    
                    <br><br>

                    <a href="ChangePass" class="btn btn-secondary">Change password</a>
                </form>

            </div>
        </section>

    </body>

</html>
