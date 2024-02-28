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
    </head>

    <body>

        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark d-flex justify-content-between">
            <a class="navbar-brand" href="home">Car Booking</a>
            <c:if test="${sessionScope.User eq null}">
                <a class="navbar-brand" href="login.jsp">Login</a>
            </c:if>
            <c:if test="${sessionScope.User ne null}">
                <a class="navbar-brand" href="listbooked">History booked</a>
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
            <h2>Create Contract</h2>
            <!-- Car Listings (Sample) -->
            <div class="row">

                <section class="py-5">
                    <div class="container mt-4">
                        <form action="home">
                            <div class="row mb-4">

                                <div class="col-md-3">
                                    <label for="capacityFilter">Capacity</label>
                                    <input type="number" class="form-control" id="capacityFilter" placeholder="Min Capacity" name="capacityMin" value="${capacityMin}">
                                </div>
                                <div class="col-md-3">
                                    <label for="capacityFilter">Check-in Date</label>
                                    <input  type="date" class="form-control" id="checkInDate" name="checkInDate" value="${checkInDate}" onchange="updateCheckOutDateMin()" required>
                                </div>
                                <div class="col-md-3">
                                    <label for="capacityFilter">Check-out Date</label>
                                    <input type="date" class="form-control" id="checkOutDate" name="checkOutDate" value="${checkOutDate}" required>
                                </div>
                                <div class="col-md-3 d-flex justify-content-center">
                                    <div>
                                        <label class="d-block">&nbsp;</label>
                                        <button type="submit" class="btn btn-primary btn-block ">Apply Filters</button>
                                    </div>
                                    <div>
                                        <label class="d-block">&nbsp;</label>
                                        <button type="reset" class="btn btn-primary btn-block ml-3" onclick="window.location.href = './home';">Reset Filters</button>
                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="container px-4 px-lg-5 mt-5 text-center">
                        <form action="booking">
                            <input type="hidden" class="form-control" id="checkInDateFilter" name="checkInDate" value="${checkInDate}" required>
                            <input type="hidden" class="form-control" id="checkOutDateFilter" name="checkOutDate" value="${checkOutDate}" required>
                            <table id="datatable">
                                <thead>
                                    <tr>
                                        <th>Car Type</th>
                                        <th>Capacity</th>
                                        <th>Rental Price Per Day</th>
                                        <th>Book Now</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listCar}" var="c">
                                        <tr>
                                            <td>${c.carType}</td>
                                            <td>${c.capacity}</td>
                                            <td>${c.rentalPricePerDay}</td>
                                            <td>
                                                <input type="checkbox" name="cid" value="${c.carID}">
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <input type="submit" class="btn btn-primary" name="name" value="Submit booked">
                        </form>



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

        
        <script>
            function updateCheckOutDateMin() {
            // Get the selected checkInDate value
            var checkInDate = document.getElementById('checkInDate').value;

            // Set the minimum checkOutDate value to checkInDate
            var checkOutDate = document.getElementById('checkOutDate');
                checkOutDate.min = checkInDate;
                if(checkOutDate.value < checkInDate) {
                    checkOutDate.value = checkInDate;
                }
        }
        </script>
        <!-- Footer -->
        <footer class="bg-dark text-white text-center py-3">
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
