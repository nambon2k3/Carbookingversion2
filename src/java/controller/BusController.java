package controller;

import dao.BusDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Bus;

@WebServlet(name = "BusController", urlPatterns = {"/BusController", "/AdminBus"})
public class BusController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            // Default action if 'action' parameter is not provided
            action = "list";
        }

        switch (action) {
            case "list":
                listBuses(request, response);
                break;
            case "add":
                showAddBusForm(request, response);
                break;
            case "detail":
                showBusDetail(request, response);
                break;
            case "update":
                showUpdateBusForm(request, response);
                break;
            case "delete":
                deleteBus(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        switch (action) {
            case "add":
                addBus(request, response);
                break;
            case "update":
                updateBus(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    // List buses (Empty method, provide the actual code here)
    private void listBuses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setAttribute("busList", new BusDAO().getAllBuses());
        
        request.getRequestDispatcher("/admin/AdminBus.jsp").forward(request, response);
        
    }
    
    // List buses (Empty method, provide the actual code here)
    private void listHomeBuses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setAttribute("busList", new BusDAO().getAllBuses());
        
        request.getRequestDispatcher("template.jsp").forward(request, response);
        
    }

    // Show add bus form (Empty method, provide the actual code here)
    private void showAddBusForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("action", "add");
        
        request.getRequestDispatcher("/admin/AddEditBus.jsp").forward(request, response);
    }

    // Show bus detail (Empty method, provide the actual code here)
    private void showBusDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement your code to show bus detail here
    }

    // Show update bus form (Empty method, provide the actual code here)
    private void showUpdateBusForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        request.setAttribute("bus", new BusDAO().getBusById(id));
        request.setAttribute("action", "update");
        
        request.getRequestDispatcher("/admin/AddEditBus.jsp").forward(request, response);
    }

    // Add a bus (Empty method, provide the actual code here)
    private void addBus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int seats = Integer.parseInt(request.getParameter("seats"));
        String departureTime = request.getParameter("departureTime");
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String arrivalTime = request.getParameter("arrivalTime");

        // Create a Bus object and set its properties
        Bus bus = new Bus();
        bus.setSeats(seats);
        bus.setDepartureTime(departureTime);
        bus.setSource(source);
        bus.setDestination(destination);
        bus.setArrivalTime(arrivalTime);
        
        new BusDAO().createBus(bus);
        
        response.sendRedirect("AdminBus");
    }

    // Update a bus (Empty method, provide the actual code here)
    private void updateBus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        int seats = Integer.parseInt(request.getParameter("seats"));
        String departureTime = request.getParameter("departureTime");
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String arrivalTime = request.getParameter("arrivalTime");

        // Create a Bus object and set its properties
        Bus bus = new Bus();
        bus.setId(id);
        bus.setSeats(seats);
        bus.setDepartureTime(departureTime);
        bus.setSource(source);
        bus.setDestination(destination);
        bus.setArrivalTime(arrivalTime);
        
        new BusDAO().updateBus(bus);
        
        response.sendRedirect("AdminBus");
    }

    // Delete a bus (Empty method, provide the actual code here)
    private void deleteBus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        new BusDAO().deleteBus(id);
        
        response.sendRedirect("AdminBus");
        
    }
}

