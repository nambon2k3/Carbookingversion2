<%-- 
    Document   : AdminUser
    Created on : Oct 21, 2023, 9:52:12 AM
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

        <!-- Datatables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    </head>

    <body>

        <jsp:include page="/header.jsp" />

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">

                <div class="row mb-5">
                    <div class="col-10">
                    </div>
                    <div class="col-2">
                        <a class="btn btn-primary" href="./AdminBus?action=add">Add Bus</a>
                    </div>
                </div>

                <table id="datatable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Seats</th>
                            <th>Departure Time</th>
                            <th>Source</th>
                            <th>Destination</th> 
                            <th>Arrival Time</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${busList}" var="bus">
                            <tr>
                                <td>${bus.id}</td>
                                <td>${bus.seats}</td>
                                <td>${bus.departureTime}</td>
                                <td>${bus.source}</td>
                                <td>${bus.destination}</td>
                                <td>${bus.arrivalTime}</td>
                                <th><a href="./AdminBus?action=update&id=${bus.id}">Edit</a></th>
                                <th><a href="./AdminBus?action=delete&id=${bus.id}">Delete</a></th>
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

</html>
