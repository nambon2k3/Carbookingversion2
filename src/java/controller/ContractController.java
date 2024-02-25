package controller;

import dao.CarDAO;
import dao.ContractDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.Contract;

/**
 *
 * @author anhdu
 */
@WebServlet(name = "ContractController", urlPatterns = {"/ContractController", "/AdminContract"})
public class ContractController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            // Default action if 'action' parameter is not provided
            action = "list";
        }

        switch (action) {
            case "list":
                listContracts(request, response);
                break;
            case "add":
                showAddContractForm(request, response);
                break;
            case "detail":
                showContractDetail(request, response);
                break;
            case "update":
                showUpdateContractForm(request, response);
                break;
            case "delete":
                deleteContract(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addContract(request, response);
                break;
            case "update":
                updateContract(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    // List contracts (Empty method, provide the actual code here)
    private void listContracts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("contractList", new ContractDAO().getAllContracts());

        request.getRequestDispatcher("/admin/AdminContract.jsp").forward(request, response);

    }

    // Show add contract form (Empty method, provide the actual code here)
    private void showAddContractForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement your code to display the add contract form here
    }

    // Show contract detail (Empty method, provide the actual code here)
    private void showContractDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement your code to show contract detail here
    }

    // Show update contract form (Empty method, provide the actual code here)
    private void showUpdateContractForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Contract contract = new ContractDAO().getContractByID(id);

        if (request.getParameter("error") != null) {
            request.setAttribute("msg", "Update failed!");
        }
        request.setAttribute("carList", new CarDAO().getAllCars());
        request.setAttribute("contract", contract);
        request.getRequestDispatcher("/admin/AddEditContract.jsp").forward(request, response);
    }

    // Add a contract (Empty method, provide the actual code here)
    private void addContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement your code to add a contract here
    }

    // Update a contract (Empty method, provide the actual code here)
    private void updateContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        int carId = Integer.parseInt(request.getParameter("carId"));
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

        // Create a Contract object and set its properties
        Contract contract = new Contract();

        if (new ContractDAO().updateContract(contract)) {
            response.sendRedirect("AdminContract");
        } else {
            response.sendRedirect("AdminContract?action=update&id=" + id + "&error");
        }
    }

    // Delete a contract (Empty method, provide the actual code here)
    private void deleteContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        new ContractDAO().deleteContract(id);

        response.sendRedirect("AdminContract");
    }
}
