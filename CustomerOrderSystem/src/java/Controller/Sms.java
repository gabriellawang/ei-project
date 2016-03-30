/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Customer;
import java.net.*;
import java.io.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ace830
 */
@WebServlet(name = "Sms", urlPatterns = {"/Sms"})
public class Sms extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String status = request.getParameter("st");
            String tx = request.getParameter("tx");
            SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");//dd/MM/yyyy
            Date current = new Date();
            String time= sdfDate.format(current);
            HttpSession session = request.getSession();
            Customer c = (Customer) session.getAttribute("customer");
            String phone = c.getPhone();

            if (status.equals("Completed")) {
                String sMsg = "Confirmed payment. Your order ID is " + tx + ". Your order is on the way.";
                String sURL = "http://gateway.onewaysms.sg:10002/api.aspx?apiusername=API335XIDMM6E&apipassword=API335XIDMM6E335XI&mobileno=" + phone + "&senderid=GrabFruit&languagetype=1&message=" + URLEncoder.encode(sMsg);
                String result = "";
                HttpURLConnection conn = null;
                try {
                    URL url = new URL(sURL);
                    conn = (HttpURLConnection) url.openConnection();
                    conn.setDoOutput(false);
                    conn.setRequestMethod("GET");
                    conn.connect();
                    int iResponseCode = conn.getResponseCode();
                    if (iResponseCode == 200) {
                        BufferedReader oIn = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                        String sInputLine = "";
                        String sResult = "";
                        while ((sInputLine = oIn.readLine()) != null) {
                            sResult = sResult + sInputLine;
                        }
                        if (Long.parseLong(sResult) > 0) {
                            response.sendRedirect("order-display.jsp?status=OK&orderid=" + tx + "&timestamp=" + time);
                        } else {
                            //response.sendRedirect("order-display.jsp?status=FAIL");
                            response.sendRedirect("order-display.jsp?status=OK&orderid=" + tx + "&timestamp=" + time);
                        }
                    } else {
                        //response.sendRedirect("order-display.jsp?status=FAIL");
                        response.sendRedirect("order-display.jsp?status=OK&orderid=" + tx + "&timestamp=" + time);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (conn != null) {
                        conn.disconnect();
                    }
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
