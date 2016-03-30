/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import utility.UpdateOrderStatus;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;
import utility.DeliveryDAO;

/**
 *
 * @author gabriellawang
 */
@WebServlet(name = "LoginProcess", urlPatterns = {"/login-process"})
public class LoginProcess extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String id = request.getParameter("id");
            String pwd = request.getParameter("password");
            session.setAttribute("userid", id);
            session.setAttribute("password", pwd);
            boolean valid = DeliveryDAO.validateUser(id, pwd);
            String err = "invalid ID or password!";
            if (!valid) {
                request.setAttribute("errMsg", err);
                RequestDispatcher view = request.getRequestDispatcher("home.jsp");
                view.forward(request, response);
            } else {
                ArrayList<Order> unstarted = UpdateOrderStatus.getUnstartedOrder(id);
                ArrayList<Order> started = UpdateOrderStatus.getStartedOrder(id);
                ArrayList<Order> finished = UpdateOrderStatus.getFinishedOrder(id);
                session.setAttribute("unstarted", unstarted);
                session.setAttribute("started", started);
                session.setAttribute("finished", finished);
                session.setAttribute("id", id);
                response.sendRedirect("update.jsp");
            }
            out.close();
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
        processRequest(request, response);
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
