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
        <%
            Customer c = (Customer) session.getAttribute("customer");
            String cName = c.getName();
            ArrayList<Vendor> vList = (ArrayList<Vendor>) session.getAttribute("vendorList");
        %>
        <b>Welcome, <%=cName%>! Start your order now.</b><br>

        <%
            if (vList != null && !vList.isEmpty()) {
                for (int i = 0; i < vList.size(); i++) {
                    String vName = vList.get(i).getName();
                    ArrayList<Package> pList = vList.get(i).getPkgList();
        %>
        Vendor: <%=vName%><br>
        <table>
            <tr>
                <th>Package Name</th><th>Description</th><th>Price</th>
            </tr>
            <%
            for(int k = 0; k < pList.size(); k++){
                Package p = pList.get(k);
                String pName = p.getName();
                String des = p.getDescription();
                double pri = p.getPrice();
                %>
                <tr>
                    <td><%=pName%></td><td><%=des%></td><td><%=pri%></td>
                </tr>
            <%
            }
            %>
        </table>
            <%
                    }
                }
            %>
        
    </body>
</html>
