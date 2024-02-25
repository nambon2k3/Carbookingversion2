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


    </head>

    <body>

        <jsp:include page="/header.jsp" />

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">


                <h1>Bus management</h1>

                <div class="row">

                    <div class="col-md-6">

                        <form action="AdminBus" method="post">

                            <input type="hidden" name="id" value="${bus.id}">
                            <input type="hidden" name="action" value="${action}">

                            <div class="mb-3">
                                <label for="seats" class="form-label">Number of Seats</label>
                                <input type="number" class="form-control" id="seats" name="seats" value="${bus.seats}" required>
                            </div>

                            <div class="mb-3">
                                <label for="departureTime" class="form-label">Departure Time</label>
                                <input type="time" class="form-control" id="departureTime" name="departureTime" value="${bus.departureTime}" required>
                            </div>

                            <div class="mb-3">
                                <label for="source" class="form-label">Source</label>
                                <input type="text" class="form-control" id="source" name="source" value="${bus.source}" required>
                            </div>

                            <div class="mb-3">
                                <label for="destination" class="form-label">Destination</label>
                                <input type="text" class="form-control" id="destination" name="destination" value="${bus.destination}" required>
                            </div>

                            <div class="mb-3">
                                <label for="arrivalTime" class="form-label">Arrival Time</label>
                                <input type="time" class="form-control" id="arrivalTime" name="arrivalTime" value="${bus.arrivalTime}" required>
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>

                        </form>

                    </div>

                </div>


            </div>
        </section>

    </body>

</html>
