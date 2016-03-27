<%-- 
    Document   : order-choose
    Created on : Mar 26, 2016, 2:27:24 PM
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
        <title>Choose an order to pay</title>
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
                HashMap<String, ArrayList<Order>> hmap = new HashMap<String, ArrayList<Order>>();
                for (Order o : oList) {
                    String vendor = o.getVendorName();
                    if (hmap.get(vendor) != null) {
                        hmap.get(vendor).add(o);
                    } else {
                        ArrayList<Order> temp = new ArrayList();
                        temp.add(o);
                        hmap.put(vendor, temp);
                    }
                }
                session.setAttribute("order-map", hmap);
                Set set = hmap.entrySet();
                Iterator iterator = set.iterator();
                while (iterator.hasNext()) {
                    double total = 0.0;
                    Map.Entry mentry = (Map.Entry) iterator.next();
                    String vendor = (String) mentry.getKey();
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

            }
        %>
        <form action="order-confirm.jsp">
            <input type="hidden" name="vendor-name" value="<%=vendor%>"/>
            <input type="hidden" name="total-amount" value="<%=total%>"/>
            Delivery Address: <input type="text" name="address" />
            <input type="submit" value="Choose"/>
        </form>

        <%

                }
            }
        %>         

    </body>
</html>
