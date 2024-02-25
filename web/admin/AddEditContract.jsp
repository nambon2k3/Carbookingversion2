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


                <h1>Ticket Management</h1>

                <div class="row">

                    <div class="col-md-6">

                        <form action="AdminTicket" method="post">
                            <input type="hidden" name="id" value="${ticket.id}">
                            <input type="hidden" name="action" value="update">
                            
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" class="form-control" name="username" value="${ticket.username}" required>
                            </div>

                            <div class="form-group">
                                <label>Bus</label>
                                <select class="form-control" name="busId" value="${ticket.busId}">
                                    <c:forEach items="${busList}" var="bus">
                                        <option value="${bus.id}" <c:if test="${bus.id eq ticket.busId}">selected</c:if>>${bus.source} - ${bus.destination}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Seat Number</label>  
                                <input type="text" class="form-control" name="seatNumber" value="${ticket.seatNumber}" required>
                            </div>
                            
                            <div class="form-group">
                                <label>Booked date</label>  
                                <input type="date" class="form-control" name="bookedDate" value="${ticket.bookedDate}" required>
                            </div>
                            
                            <div class="form-group">
                                <label class="alert">${msg}</label>  
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>

                    </div>

                </div>


            </div>
        </section>

    </body>

</html>
