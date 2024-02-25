package controller;

import dao.CarDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Car;

@WebServlet(name = "CarController", urlPatterns = {"/CarController", "/AdminCar"})
public class CarController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            // Default action if 'action' parameter is not provided
            action = "list";
        }

        switch (action) {
            case "list":
                listCars(request, response);
                break;
            case "add":
                showAddCarForm(request, response);
                break;
            case "detail":
                showCarDetail(request, response);
                break;
            case "update":
                showUpdateCarForm(request, response);
                break;
            case "delete":
                deleteCar(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        switch (action) {
            case "add":
                addCar(request, response);
                break;
            case "update":
                updateCar(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    // List cares (Empty method, provide the actual code here)
    private void listCars(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setAttribute("carList", new CarDAO().getAllCars());
        
        request.getRequestDispatcher("/admin/AdminCar.jsp").forward(request, response);
        
    }

    // Show add car form (Empty method, provide the actual code here)
    private void showAddCarForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("action", "add");
        
        request.getRequestDispatcher("/admin/AddEditCar.jsp").forward(request, response);
    }

    // Show car detail (Empty method, provide the actual code here)
    private void showCarDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement your code to show car detail here
    }

    // Show update car form (Empty method, provide the actual code here)
    private void showUpdateCarForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("car", new CarDAO().getCarByID(id));
        request.setAttribute("action", "update");
        
        request.getRequestDispatcher("/admin/AddEditCar.jsp").forward(request, response);
    }

    // Add a car (Empty method, provide the actual code here)
    private void addCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String carType = request.getParameter("carType");
        double rentalPricePerDay = Double.parseDouble(request.getParameter("rentalPricePerDay"));

        // Create a Car object and set its properties
        Car car = new Car();
        car.setCapacity(capacity);
        car.setCarType(carType);
        car.setRentalPricePerDay(rentalPricePerDay);
        
        new CarDAO().createCar(car);
        
        response.sendRedirect("AdminCar?success");
    }

    // Update a car (Empty method, provide the actual code here)
    private void updateCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String carType = request.getParameter("carType");
        double rentalPricePerDay = Double.parseDouble(request.getParameter("rentalPricePerDay"));

        // Create a Car object and set its properties
        Car car = new Car();
        car.setCapacity(capacity);
        car.setCarType(carType);
        car.setRentalPricePerDay(rentalPricePerDay);
        car.setCarID(id);
        
        new CarDAO().editCar(car);
        
        response.sendRedirect("AdminCar?success");
    }

    // Delete a car (Empty method, provide the actual code here)
    private void deleteCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        new CarDAO().deleteCar(id);
        
        response.sendRedirect("AdminCar?success");
        
    }
}

