<%-- 
    Document   : order
    Created on : Mar 13, 2016, 5:20:27 PM
    Author     : gabriellawang
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Vendor"%>
<%@page import="Model.Package"%>
<%@page import="Model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grab Fruit! - Order Page</title>
    </head>
    <body>
        <h1>Grab Your Fruit Now!</h1>
        <a href="order-confirm.jsp">Confirm My Order and Pay</a><br>
        <script>
            function popup() {
                confirm("You order has been added successfully!");
            }
        </script>
        
        <%
            Customer c = (Customer) session.getAttribute("customer");
            String cName = c.getName();
            ArrayList<Vendor> vList = (ArrayList<Vendor>) session.getAttribute("vendorList");
            //session.removeAttribute("vendorList");
            String region = (String) session.getAttribute("region");
            boolean added = false;
            if(session.getAttribute("added") != null){
                added = (Boolean) session.getAttribute("added");
            }
            if(added){
                %>
                <script>popup();</script>
        <%
                added = false;
                session.setAttribute("added", false);
            }
        %>
        <b>Welcome, <%=cName%>! You are currently at <%=region%>. <br> 
            Here are the vendors nearby.<br>
            Start your order now.<br></b>
        <form action="send-order">

            <%
                if (vList != null && !vList.isEmpty()) {
                    //out.println(vList.size());
                    for (int i = 0; i < vList.size(); i++) {
                        String vName = vList.get(i).getName();
                        ArrayList<Package> pList = vList.get(i).getPkgList();
            %>
            Vendor: <%=vName%><br>
            <table border="1">
                <tr>
                    <th>Package Name</th><th>Description</th><th>Price</th>
                </tr>
                <%
                    for (int k = 0; k < pList.size(); k++) {
                        Package p = pList.get(k);
                        String pName = p.getName();
                        String des = p.getDescription();
                        double pri = p.getPrice();
                %>
                <tr>
                    <td><a href="order-detail.jsp?name=<%=pName%>&desc=<%=des%>&price=<%=pri%>&vendor=<%=vName%>"><%=pName%></a></td><td><%=des%></td><td>S$ <%=pri%></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
        <%
                }
            }
        %>

    </body>
</html>
