/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
            String id = request.getParameter("id");
            String pwd = request.getParameter("password");
            HttpSession session = request.getSession();

            String dbURL = "jdbc:mysql://localhost:3306/sys-del";
            String userName = "root";
            String password = "";
            java.sql.Connection dbConn = null;
            ResultSet rs = null;

            String sql1 = "SELECT * FROM info WHERE id like " + id;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                dbConn = DriverManager.getConnection(dbURL, userName, password);

                Statement statement = dbConn.createStatement();
                if (statement.execute(sql1)) {
                    rs = statement.getResultSet();
                }
                String dId = "";
                String ps = "";
                while (rs.next()) {
                    dId = rs.getString(1);
                    ps = rs.getString(2);

                }
                String err = "invalid ID or password!";
                if (dId.isEmpty() || ps.isEmpty()) {
                    //invalid
                    request.setAttribute("errMsg", err);
                    RequestDispatcher view = request.getRequestDispatcher("home.jsp");
                    view.forward(request, response);
                } else {
                    if (!id.equals(dId)) {
                        //invalid
                        request.setAttribute("errMsg", err);
                        RequestDispatcher view = request.getRequestDispatcher("home.jsp");
                        view.forward(request, response);
                    } else if (!pwd.equals(ps)) {
                        request.setAttribute("errMsg", err);
                        RequestDispatcher view = request.getRequestDispatcher("home.jsp");
                        view.forward(request, response);
                    } else {
                        session.setAttribute("id", dId);
                        response.sendRedirect("update");
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (dbConn != null) {
                        dbConn.close();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
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
