/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Customer;
import Model.CustomerDAO;
import Model.EMSMessageSender;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gabriellawang
 */
public class ValidateUser extends HttpServlet {

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
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            int postalCode = Integer.parseInt(request.getParameter("postal code"));
            HttpSession session = request.getSession();

            Customer customer = CustomerDAO.retrieveCustomer(username);
            if (customer == null) {
                request.setAttribute("errMsg", "Invalid username/password!");
                RequestDispatcher view = request.getRequestDispatcher("login.jsp");
                view.forward(request, response);
            } else {
                if (customer.getPassword().equals(password)) {
                    //session.setAttribute("customer", customer);
                    //session.setAttribute("postalCode", postalCode);
                    //response.sendRedirect("order.jsp");
                    String xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?><search_creteria>"+"<customer_id>"+username+"</customer_id><postal_code>"+postalCode+"</postal_code></search_creteria>";
                    EMSMessageSender msgSender = new EMSMessageSender("q.request.search");
                    String jmsOutput = msgSender.sendMessage(xml,true);
                } else {
                    request.setAttribute("errMsg", "Invalid username/password!");
                    RequestDispatcher view = request.getRequestDispatcher("login.jsp");
                    view.forward(request, response);
                }
            }
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
