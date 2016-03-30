/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;
import utility.EMSMessageSender;
import utility.UpdateOrderStatus;

/**
 *
 * @author gabriellawang
 */
@WebServlet(name = "UpdateStatus", urlPatterns = {"/update"})
public class UpdateStatus extends HttpServlet {

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
            String orderID = (String) request.getParameter("id");
            String status = (String) request.getParameter("status");
            HttpSession session = request.getSession();

            if(status.equals("unstarted")){
                UpdateOrderStatus.UpdateStatus(orderID, "started");
                //send jms msg to inform "order started"
                EMSMessageSender msgSender = new EMSMessageSender("q.deliveryStatus");
                msgSender.sendMessage("start", false);
            }else{
                UpdateOrderStatus.UpdateStatus(orderID, "finished");
                //send jms msg to inform "order finished"
                EMSMessageSender msgSender = new EMSMessageSender("q.deliveryStatus");
                msgSender.sendMessage("end", false);
            }
            String id = (String) session.getAttribute("userid");
            String pwd = (String) session.getAttribute("password");
            response.sendRedirect("login-process?id=" + id + "&password=" + pwd);
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
