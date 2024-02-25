package controller;

import dao.BusDAO;
import dao.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.Ticket;

/**
 *
 * @author anhdu
 */
@WebServlet(name = "TicketController", urlPatterns = {"/TicketController", "/AdminTicket"})
public class TicketController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            // Default action if 'action' parameter is not provided
            action = "list";
        }

        switch (action) {
            case "list":
                listTickets(request, response);
                break;
            case "add":
                showAddTicketForm(request, response);
                break;
            case "detail":
                showTicketDetail(request, response);
                break;
            case "update":
                showUpdateTicketForm(request, response);
                break;
            case "delete":
                deleteTicket(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addTicket(request, response);
                break;
            case "update":
                updateTicket(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    // List tickets (Empty method, provide the actual code here)
    private void listTickets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("ticketList", new TicketDAO().getAllTickets());

        request.getRequestDispatcher("/admin/AdminTicket.jsp").forward(request, response);

    }

    // Show add ticket form (Empty method, provide the actual code here)
    private void showAddTicketForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement your code to display the add ticket form here
    }

    // Show ticket detail (Empty method, provide the actual code here)
    private void showTicketDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement your code to show ticket detail here
    }

    // Show update ticket form (Empty method, provide the actual code here)
    private void showUpdateTicketForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Ticket ticket = new TicketDAO().getTicketById(id);

        if (request.getParameter("error") != null) {
            request.setAttribute("msg", "Update failed!");
        }
        request.setAttribute("busList", new BusDAO().getAllBuses());
        request.setAttribute("ticket", ticket);
        request.getRequestDispatcher("/admin/AddEditTicket.jsp").forward(request, response);
    }

    // Add a ticket (Empty method, provide the actual code here)
    private void addTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement your code to add a ticket here
    }

    // Update a ticket (Empty method, provide the actual code here)
    private void updateTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        int busId = Integer.parseInt(request.getParameter("busId"));
        int seatNumber = Integer.parseInt(request.getParameter("seatNumber"));
        String dateString = request.getParameter("bookedDate");
        Date bookedDate = null;

        if (dateString != null && !dateString.isEmpty()) {
            try {
                // Parse the string date into a java.sql.Date
                bookedDate = Date.valueOf(dateString);
            } catch (IllegalArgumentException e) {
                e.printStackTrace(); // Handle parsing error if necessary
            }
        }

        // Create a Ticket object and set its properties
        Ticket ticket = new Ticket();
        ticket.setId(id);
        ticket.setUsername(username);
        ticket.setBusId(busId);
        ticket.setSeatNumber(seatNumber);
        ticket.setBookedDate(bookedDate);

        if (new TicketDAO().updateTicket(ticket)) {
            response.sendRedirect("AdminTicket");
        } else {
            response.sendRedirect("AdminTicket?action=update&id=" + id + "&error");
        }
    }

    // Delete a ticket (Empty method, provide the actual code here)
    private void deleteTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        new TicketDAO().deleteTicket(id);

        response.sendRedirect("AdminTicket");
    }
}
