<%-- 
    Document   : contract
    Created on : Feb 26, 2024, 3:53:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Car Booking Website</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/stylesBootstrap.css" rel="stylesheet" />
        <!-- Datatables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <body>

        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark d-flex justify-content-between">
            <a class="navbar-brand" href="home">Car Booking</a>
            <c:if test="${sessionScope.User eq null}">
                <a class="navbar-brand" href="login.jsp">Login</a>
            </c:if>
            <c:if test="${sessionScope.User ne null}">
                <a class="navbar-brand" href="#">History booked</a>
                <a class="navbar-brand" href="log">LogOut</a>
            </c:if>
        </nav>

        <!-- Banner -->
        <div class="jumbotron jumbotron-fluid text-center">
            <div class="container">
                <h1 class="display-4">Book Your Dream Car</h1>
                <p class="lead">Explore a wide range of cars and book your perfect ride today.</p>
            </div>
        </div>

        <!-- Car Listings with Filters -->
        <div class="container mt-4">
            <h2>Your Contract Detail</h2>
            <!-- Car Listings (Sample) -->
            <div class="row">

                <section class="py-5">
                    <div class="container px-4 px-lg-5 mt-5 text-center">
                        <input type="hidden" class="form-control" id="checkInDateFilter" name="checkInDate" value="${checkInDate}" required>
                        <input type="hidden" class="form-control" id="checkOutDateFilter" name="checkOutDate" value="${checkOutDate}" required>
                        <table id="datatable">
                                <thead>
                                    <tr>
                                        <th>Car Type</th>
                                        <th>Capacity</th>
                                        <th>Rental Price Per Day</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${list}" var="c">
                                        <tr>
                                            <td>${c.carType}</td>
                                            <td>${c.capacity}</td>
                                            <td>${c.rentalPricePerDay}</td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>



                    </div>

                </section>

            </div>
        </div>

        <script>
            let inputCheckIn = document.getElementById('checkInDateFilter');
            let inputcheckOut = document.getElementById('checkOutDateFilter');
            let inputCapacityFilter = document.getElementById('capacityFilter');

            const today = new Date();
            const year = today.getFullYear();
            let month = today.getMonth() + 1;
            let day = today.getDate();

            // Add leading zero for single-digit months and days
            month = month < 10 ? '0' + month : month;
            day = day < 10 ? '0' + day : day;
            let date = year + '-' + month + '-' + day;

            inputCheckIn.value = date;
            inputcheckOut.value = date;
        </script>

        <!-- Footer -->
        <footer class="bg-dark text-white text-center py-3" style="bottom: 0">
            <p>&copy; 2024 Car Booking. All rights reserved.</p>
        </footer>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- Datatables JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#datatable').DataTable();
            });
        </script>

    </body>

</html>
