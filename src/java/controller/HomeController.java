/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CarDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Car;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CarDAO carDAO = new CarDAO();

        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        String capacityMin = request.getParameter("capacityMin");

        String condition = " SELECT C.*\n"
                + "FROM Cars C Where 1 = 1";

        if (capacityMin != null && !capacityMin.isEmpty()) {
            condition += " and C.Capacity >= " + capacityMin;
        }

        if (checkInDate != null && !checkInDate.isEmpty()) {
            condition += " and NOT EXISTS (\n"
                    + "    SELECT 1\n"
                    + "    FROM ContractDetails CD\n"
                    + "    JOIN Contracts CT ON CD.ContractID = CT.ContractID\n"
                    + "    WHERE CD.CarID = C.CarID\n"
                    + "      AND (\n"
                    + "        ('" + checkInDate + "' < CT.EndDateTime AND '" + checkOutDate + "' > CT.StartDateTime)\n"
                    + "      )\n"
                    + "  )";
        } else {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            checkInDate = checkOutDate = format.format(date);
            condition += " and NOT EXISTS (\n"
                    + "    SELECT 1\n"
                    + "    FROM ContractDetails CD\n"
                    + "    JOIN Contracts CT ON CD.ContractID = CT.ContractID\n"
                    + "    WHERE CD.CarID = C.CarID\n"
                    + "      AND (\n"
                    + "        ('" + format.format(date) + "' < CT.EndDateTime AND '" + format.format(date) + "' > CT.StartDateTime)\n"
                    + "      )\n"
                    + "  )";
        }
        List<Car> listCar = carDAO.getCarPerPage(condition);
        request.setAttribute("listCar", listCar);
        request.setAttribute("capacityMin", capacityMin);
        request.setAttribute("checkInDate", checkInDate);
        request.setAttribute("checkOutDate", checkOutDate);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
