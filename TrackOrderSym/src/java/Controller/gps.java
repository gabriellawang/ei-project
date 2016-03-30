/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Coordinate;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ace830
 */
@WebServlet(name = "gps", urlPatterns = {"/gps"})
public class gps extends HttpServlet {

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
            ArrayList<Coordinate> cList = new ArrayList<Coordinate>();
            cList.add(new Coordinate(1.3688610, 103.8481050));
            cList.add(new Coordinate(1.3690542, 103.8496303));
            cList.add(new Coordinate(1.3607740, 103.8525300));
            cList.add(new Coordinate(1.3109685, 103.8447904));
            cList.add(new Coordinate(1.3556511, 103.8567565));
            cList.add(new Coordinate(1.3140277, 103.8454995));
            cList.add(new Coordinate(1.3109685, 103.8447904));
            cList.add(new Coordinate(1.3050089, 103.8509053));
            cList.add(new Coordinate(1.3034145, 103.8540131));
            cList.add(new Coordinate(1.3036374, 103.8529091));
            cList.add(new Coordinate(1.3018574, 103.8514160));

            String c = request.getParameter("Count");

            if (c != null) {
                int count = Integer.parseInt(c);
                out.println(cList.get(count).getX() + ";" + cList.get(count).getY());
                if (count < 10) {
                    count++;
                    response.setHeader("Refresh", "10, URL=http://localhost:8084/GpsSimulate/gps?Count=" + count + "&&x=" + cList.get(count).getX() + "&&y=" + cList.get(count).getY());
                }
            } else {
                out.println(cList.get(0).getX() + ";" + cList.get(0).getY());
                response.setHeader("Refresh", "10, URL=http://localhost:8084/GpsSimulate/gps?Count=" + 1 + "&&x=" + cList.get(1).getX() + "&&y=" + cList.get(1).getY());
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
