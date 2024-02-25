
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
    <!-- Datatables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
</head>

<body>
    <jsp:include page="/header.jsp" />

    <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 style="margin-bottom: 50px">Booked Bus</h2>
                <table id="datatable">
                    <thead>
                        <tr>
                            <th>Bus ID</th>
                            <th>Seats Number</th>
                            <th>Book Date</th>
                            <th>Departure Time</th>
                            <th>Source</th>
                            <th>Destination</th>
                            <th>Arrival Time</th>
                            <th>Number of seats</th>
                            <th>ACtion</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${listBooked}" var="booked">
                            <tr>
                                <td>${booked.getKey().busId}</td>
                                <td>${booked.getKey().seatNumber}</td>
                                <td>${booked.getKey().bookedDate}</td>
                                <td>${booked.getValue().departureTime}</td>
                                <td>${booked.getValue().source}</td>
                                <td>${booked.getValue().destination}</td>
                                <td>${booked.getValue().arrivalTime}</td>
                                <td>${booked.getKey().numberSeat}</td>
                                <th><a href="./cancel?id=${booked.getKey().id}">Cancel</a></th>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>


            </div>
        </section>

    </body>

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