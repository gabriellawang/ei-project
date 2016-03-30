/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Customer;
import Model.Vendor;
import Utility.CustomerDAO;
import Utility.EMSMessageSender;
import Utility.VendorDAO;
import Utility.XMLParser;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
        PrintWriter out = response.getWriter();
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String code = request.getParameter("postal code");
            int postalCode = 0;
            HttpSession session = request.getSession();

            Customer customer = CustomerDAO.retrieveCustomer(username);
            if (customer == null) {
                //validate the login information: when username is incorrect
                request.setAttribute("errMsg", "Invalid username/password!");
                RequestDispatcher view = request.getRequestDispatcher("login.jsp");
                view.forward(request, response);
            } else if(code.isEmpty()){
                request.setAttribute("errMsg", "Empty Postal Code!");
                RequestDispatcher view = request.getRequestDispatcher("login.jsp");
                view.forward(request, response);
            } else {
                if (customer.getPassword().equals(password)) {
                    //when customer login successfully, get the region name according to the postal code(we assume postal code is always valid)
                    postalCode = Integer.parseInt(code);
                    String xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?><search_creteria>" + "<customer_id>" + username + "</customer_id><postal_code>" + postalCode + "</postal_code></search_creteria>";
                    EMSMessageSender msgSender = new EMSMessageSender("q.requestregion");
                    String jmsOutput = msgSender.sendMessage(xml, true);
                    XMLParser xp = new XMLParser(jmsOutput);
                    Object[] result = xp.getParsingResult();
                    String region = (String) result[0];
                    ArrayList<Vendor> vList = (ArrayList<Vendor>) result[1];
                    for(int i = 0; i < vList.size(); i++){
                        String name = vList.get(i).getName();
                        vList.get(i).setFullName(VendorDAO.retrieveFullName(name));
                    }
                    session.setAttribute("customer", customer);
                    session.setAttribute("postalCode", postalCode);
                    session.setAttribute("vendorList", vList);
                    session.setAttribute("region", region);
                    response.sendRedirect("order.jsp");
                } else {
                    // when password is incorrect
                    request.setAttribute("errMsg", "Invalid username/password!");
                    RequestDispatcher view = request.getRequestDispatcher("login.jsp");
                    view.forward(request, response);
                }
            }
        } finally {
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
