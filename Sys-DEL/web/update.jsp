<%-- 
    Document   : update
    Created on : Mar 26, 2016, 11:02:58 PM
    Author     : gabriellawang
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Order"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String dID = (String) session.getAttribute("id");
    ArrayList<Order> unstarted = (ArrayList<Order>) session.getAttribute("unstarted");
    ArrayList<Order> started = (ArrayList<Order>) session.getAttribute("started");
    ArrayList<Order> finished = (ArrayList<Order>) session.getAttribute("finished");


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update order status</title>
    </head>
    <body>
        <b>Current Delivery Courier: </b> <%=dID%><br>

            <table border="1">
                <tr><th>Order ID</th><th>Status</th><th>Update</th></tr>
                        <%
                            for (Order o : unstarted) {
                                String orderID = o.getOrderID();
                                String status = o.getStatus();
                                out.println("<tr><td>" + orderID + "</td><td>" + status + "</td><td>");
                                %>     
                <form action="update">
                    <input type="hidden" name="id" value="<%=orderID%>" />
                    <input type="hidden" name="status" value="<%=status%>" />
                    <input type="submit" value="Start"/>
                </form>
                        <%
                                out.println("</td></tr>");
                            }

                            for (Order o : started) {
                                String orderID = o.getOrderID();
                                String status = o.getStatus();
                                out.println("<tr><td>" + orderID + "</td><td>" + status + "</td><td>");
                                %>     
                <form action="update">
                    <input type="hidden" name="id" value="<%=orderID%>" />
                    <input type="hidden" name="status" value="<%=status%>" />
                    <input type="submit" value="Finish"/>
                </form>
                        <%
                                out.println("</td></tr>");
                            }

                            for (Order o : finished) {
                                String orderID = o.getOrderID();
                                String status = o.getStatus();
                                out.println("<tr><td>" + orderID + "</td><td>" + status + "</td><td></td></tr>");
                            }
                        %>
            </table>

    </body>
</html>
