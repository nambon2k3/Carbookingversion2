
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
                <h2 style="margin-bottom: 50px">Available Bus</h2>
                <table id="datatable">

                    <thead>
                        <tr>
                            <th>Bus ID</th>
                            <th>Seats Left</th>
                            <th>Departure Time</th>
                            <th>Source</th>
                            <th>Destination</th> 
                            <th>Arrival Time</th>
                            <th>Book Tickets</th>
                            <th>Number Tickets</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${busList}" var="bus">
                            <c:if test="${bus.seats ne 0}">
                                <tr>
                                    <td>${bus.getId()}</td>
                                    <td>${bus.seats}</td>
                                    <td>${bus.departureTime}</td>
                                    <td>${bus.source}</td>
                                    <td>${bus.destination}</td>
                                    <td>${bus.arrivalTime}</td>
                                    <th>
                                        <a href="#" onclick="book(${bus.getId()})">Book Now</a>
                                    </th>
                                    <th>
                                        <input id="number-${bus.getId()}" type="number" name="numberTicket" value="1">
                                    </th>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
                
                <script>
                    
                    function book(id) {
                        let numberSeat = document.getElementById('number-' + id).value;
                        window.location.href = './bookdetail?id=' + id + '&numberTicket=' + numberSeat;
                    }
                    
                </script>

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