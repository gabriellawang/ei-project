<%-- 
    Document   : order-confirm
    Created on : Mar 23, 2016, 9:20:37 PM
    Author     : gabriellawang
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
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
            String vendor = request.getParameter("vendor-name");
            String address = request.getParameter("address");
            double total = Double.parseDouble(request.getParameter("total-amount"));
            HashMap<String, ArrayList<Order>> hmap = (HashMap<String, ArrayList<Order>>) session.getAttribute("order-map");
        %>
        <h2><%=vendor%></h2>
        <%
            ArrayList<Order> orders = hmap.get(vendor);
            for (Order o : orders) {
                ArrayList<Package> pList = o.getItems();
                for (Package p : pList) {
                    String pName = p.getName();
                    double price = p.getPrice();
                    int qty = p.getQty();
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

            }
            session.setAttribute("address", address);
            session.setAttribute("vendor-name", vendor);
            session.setAttribute("total", total);
        %>

        <form action="${initParam['posturl']}" method="post">
            <input type="hidden" name="upload" value="1" />
            <input type ="hidden" name="return" value="${initParam['returnurl']}" />
            <input type ="hidden" name="business" value="${initParam['business']}" />
            <input type ="hidden" name="cmd" value="_cart" />

            Vendor Name: <input type="text" name="item_name_1" value="<%=vendor%>" />
            <br>
            Total Amount: <input type="text" name="amount_1" value="<%=total%>" />
            <br>
            <input type="text" hidden name="quantity_1" value="1" />
            <button type="submit" style="border: 0; background: transparent">
                <img src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif" alt="submit" />
            </button>

        </form>        
    </body>
</html>
