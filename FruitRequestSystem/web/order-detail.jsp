<%-- 
    Document   : order-detail
    Created on : Mar 23, 2016, 8:29:19 PM
    Author     : gabriellawang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String name = request.getParameter("name");
    String description = request.getParameter("desc");
    String price = request.getParameter("price");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=name%></title>
    </head>
    <body>
        <b>Description: </b><%=description%><br>
        <b>Price: </b>S$ <%=price%><br>
        <form action="add-order">
            <input type="hidden" name="name" value='<%=name%>'/>
            <input type="hidden" name="pri" value='<%=price%>'/>
            Choose the quantity: <input type='number' name='quantity'/><br>
            <input type='submit' value='Add to Cart'/>
        </form>
    </body>
</html>
