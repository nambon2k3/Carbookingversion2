<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Car booking</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Datatables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    </head>

    <body>

        <jsp:include page="/header.jsp" />

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">

                <table id="datatable" class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Total cost</th>
                            <th>Start date</th>
                            <th>End date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${contractList}" var="contract">
                            <tr>
                                <td>${contract.contractID}</td>
                                <td>${contract.username}</td>
                                <td>${contract.totalCost}</td>
                                <td><fmt:formatDate value="${contract.startDateTime}" pattern="dd-MM-yyyy" /></td>
                                <td><fmt:formatDate value="${contract.endDateTime}" pattern="dd-MM-yyyy" /></td>
                                <td>${contract.status}</td>
                                <td>
                                    <!-- View Details Modal Trigger Button -->
                                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#carModal_${contract.contractID}">Details</button>

                                    <!-- Render accept button only if status is 'Pending' -->
                                    <c:if test="${contract.status eq 'Pending'}">
                                        <!-- Accept Modal Trigger Button -->
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#acceptModal_${contract.contractID}">Accept</button>
                                    </c:if>

                                    <!-- Render reject button only if status is 'Pending' -->
                                    <c:if test="${contract.status eq 'Pending'}">
                                        <!-- Reject Modal Trigger Button -->
                                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#rejectModal_${contract.contractID}">Reject</button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
        </section>

        <!-- Modals -->
        <c:forEach items="${contractList}" var="contract">
            <div class="modal fade" id="carModal_${contract.contractID}" tabindex="-1"
                 aria-labelledby="carModalLabel_${contract.contractID}" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="carModalLabel_${contract.contractID}">Cars for Contract
                                ${contract.contractID}</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Car Type</th>
                                        <th>Capacity</th>
                                        <th>Rental Price Per Day</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${contract.contractDetails}" var="contractDetail">
                                        <tr>
                                            <td>${contractDetail.car.carID}</td>
                                            <td>${contractDetail.car.carType}</td>
                                            <td>${contractDetail.car.capacity}</td>
                                            <td>${contractDetail.car.rentalPricePerDay}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- Accept Confirmation Modals -->
        <c:forEach items="${contractList}" var="contract">
            <div class="modal fade" id="acceptModal_${contract.contractID}" tabindex="-1"
                 aria-labelledby="acceptModalLabel_${contract.contractID}" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="acceptModalLabel_${contract.contractID}">Accept Contract
                                ${contract.contractID}?</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="AdminContract" method="post">
                                <input type="hidden" name="id" value="${contract.contractID}" />
                                <input type="hidden" name="action" value="update" />
                                <input type="hidden" name="status" value="Accepted" />
                                <p>Are you sure you want to accept this contract?</p>
                                <button type="submit" class="btn btn-success">Yes, Accept</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- Reject Confirmation Modals -->
        <c:forEach items="${contractList}" var="contract">
            <div class="modal fade" id="rejectModal_${contract.contractID}" tabindex="-1"
                 aria-labelledby="rejectModalLabel_${contract.contractID}" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="rejectModalLabel_${contract.contractID}">Reject Contract
                                ${contract.contractID}?</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="AdminContract" method="post">
                                <input type="hidden" name="id" value="${contract.contractID}" />
                                <input type="hidden" name="action" value="update" />
                                <input type="hidden" name="status" value="Rejected" />
                                <p>Are you sure you want to reject this contract?</p>
                                <button type="submit" class="btn btn-danger">Yes, Reject</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Datatables JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
        <!-- Datatables Bootstrap JS -->
        <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>
        <!-- Initialize Datatables -->
        <script>
            $(document).ready(function () {
                $('#datatable').DataTable();
            });
        </script>

    </body>

</html>
