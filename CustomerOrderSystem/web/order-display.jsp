<%-- 
    Document   : order-display
    Created on : Mar 25, 2016, 1:26:06 PM
    Author     : gabriellawang
--%>

<%@page import="Utility.EMSMessageSender"%>
<%@page import="Model.Customer"%>
<%@page import="Model.Package" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Order"%>
<script>
    function popup1() {
        confirm("Oops! Your order was not successfully. Please check you account balance. You will be redirected to Order page.");
    }
    function popup2() {
        confirm("You have successfully ordered the fruit! ");
    }
</script>
<%
    String status = request.getParameter("status");
    if (status.equals("FAIL")) {
        //order fails
        %>
        <script>
            popup1();
        </script>
        <%
        response.sendRedirect("order.jsp");
    } else {
        //order successed
        String orderId = request.getParameter("orderid");
        String vendor = (String) session.getAttribute("vendor-name");
        double total = (Double) session.getAttribute("total");
        String timestamp = request.getParameter("timestamp");
        ArrayList<Order> oList = (ArrayList<Order>) session.getAttribute("order-list");
        Customer customer = (Customer) session.getAttribute("customer");
        int postcode = (Integer) session.getAttribute("postalCode");
        String address = (String) session.getAttribute("address");
        
        String pkgxml = "";
        for(int i = 0; i < oList.size(); i++){
            Order o = oList.get(i);
            String n = o.getVendorName();
            if(n.equals(vendor)){
                ArrayList<Package> pkgs = o.getItems();
                for(Package p : pkgs){
                    String pn = p.getName();
                    String ds = p.getDescription();
                    double pr = p.getPrice();
                    int q = p.getQty();
                    pkgxml += "<package><name>" + pn + "</name><description>" + ds + "</description><price>" + pr + "</price><qty>" + q + "</qty></package>";
                }
                oList.remove(o);
                i--;
            }
        }
        session.setAttribute("order-list", oList);
        
        String xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?>" + 
                "<order><orderid>" + orderId + "</orderid><totalPrice>" + total + "</totalPrice><timestamp>" + timestamp + "</timestamp><username>" + customer.getUsername() +
                "</username><email>" + customer.getEmail() + "</email><phone>" + customer.getPhone() + "</phone><address>" + address + "</address>" + 
                "<postcode>" + postcode + "</postcode><storeName>" + vendor + "</storeName>" + pkgxml + "</order>";
        EMSMessageSender msgSender = new EMSMessageSender("q.deliveryinfo");
        msgSender.sendMessage(xml, false);
        %>
        <script>
            popup2();
        </script>
        <%
        response.sendRedirect("order.jsp");
    }
%>