<%-- 
    Document   : order-confirm
    Created on : Mar 23, 2016, 9:20:37 PM
    Author     : gabriellawang
--%>

<%@page import="Model.Order"%>
<%@page import="Model.Package" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Your Order</title>
    </head>
    <body>
        <h1>Check your order below:</h1>
        <%
            ArrayList<Order> oList = (ArrayList<Order>) session.getAttribute("order-list");
            if (oList == null) {
                out.println("You haven't add any order into your cart!<br>");
            } else {
                //to be continued...
                //list all the orders and show the total price
                for (Order o : oList) {
                    String vendor = o.getVendorName();
                    double total = 0.0;
        %>
        <h2><%=vendor%></h2>
        <a href="">Check Out</a>
        <%
            ArrayList<Package> pList = o.getItems();
            for (Package p : pList) {
                String pName = p.getName();
                double price = p.getPrice();
                int qty = p.getQty();
                double unitTotal = price * qty;
                total += unitTotal;//need to standardize the decimal format
        %>
        <ul>
            <li>
                <b><%=pName%></b>
                <ul>
                    <li>Price: S$<%=price%></li>
                    <li>Quantity: <%=qty%></li>
                </ul>
            </li>
        </ul>
        <%
                    }
            %>
            <b>Total: S$</b><%=total%><br>
        <%
                }
            }
        %>     
    </body>
</html>
