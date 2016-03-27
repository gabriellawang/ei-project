<%-- 
    Document   : order-choose
    Created on : Mar 26, 2016, 2:27:24 PM
    Author     : gabriellawang
--%>
<%@include file="protect.jsp" %>
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
        <title>Grab Fruit | An online fruit store provides freshness to you daily life</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <!--theme-style-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Fruit Fresh Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </head>
    <body>
        <!--header-->
        <div class="container">
            <div class="header">

                <div class="header-top">
                    <div class="logo">
                        <a href="index.html"><img src="images/logo.png" alt="" /></a>
                    </div>
                    <div class="login" align="right">
                        <a href="logout.jsp">Logout</a>
                    </div>

                    <div class="clearfix"></div>
                </div>
                <div class="top-nav">
                    <span class="menu"><img src="images/menu.png" alt="">  </span>
                    <ul>
                        <li><a href="index.html" > Home </a></li>
                        <li class="active"><a href="order.jsp"> Order Online </a></li> 
                        <li><a href="about.html" > About Us</a></li>						
                        <li><a href="contact.html" >Contact Us</a></li>
                        <div class="clearfix"></div>
                    </ul>
                    <script>
                        $("span.menu").click(function () {
                            $(".top-nav ul").slideToggle(500, function () {
                            });
                        });
                    </script>
                </div>			
            </div>

            <div class="page-header">
                <h3>Choose one order </h3>
            </div>
            <%
                ArrayList<Order> oList = (ArrayList<Order>) session.getAttribute("order-list");
                if (oList == null || oList.isEmpty()) {
            %>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">Empty Cart!</h3>
                </div>
                <div class="panel-body">
                    You haven't add any fruit into you cart.
                </div>
            </div>
            <%
            } else {
                HashMap<String, ArrayList<Order>> hmap = new HashMap<String, ArrayList<Order>>();
            %>
            <style>
                div.row{
                    margin-left: 1cm;
                }
            </style>
            <div class="row">
                <div class="col-sm-4">
                    <%
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

                    <h3 id="h3-bootstrap-heading"><%=vendor%></h3>
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
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Order Detail</h3>
                        </div>
                        <style>
                            div.panel-body{
                                margin-left: 0.5cm;
                            }
                        </style>
                        <div class="panel-body">
                            <ul>
                                <li>
                                    <b><%=pName%></b>
                                    <ul>
                                        <li>Price: S$<%=price%></li>
                                        <li>Quantity: <%=qty%></li>
                                    </ul>
                                </li>
                            </ul>
                            <form action="order-confirm.jsp">
                                <input type="hidden" name="vendor-name" value="<%=vendor%>"/>
                                <input type="hidden" name="total-amount" value="<%=total%>"/>
                                Delivery Address: <input type="text" name="address" />
                                <input type="submit" value="Choose" class="btn btn-sm btn-info"/>
                            </form>
                        </div>
                    </div>
                    <%
                                }
                            }
                        }
                    %></div></div>
                    <%
                        }
                    %> 
            <!--footer-->
            <div class="footer">
                
                <div class="footer-top-top">
                    <div class="col-md-4 footer-top">
                        <ul class="social">
                            <li><a href="#"><i> </i></a></li>						
                            <li><a href="#"><i class="twitter"> </i></a></li>
                            <li><a href="#"><i class="google"> </i></a></li>
                        </ul>
                    </div>
                    <div class="col-md-4 footer-top">
                        <p>87 Prinsep Street, Singapore</p>
                        <p>+65 9485 3825</p>
                    </div>
                    <div class="col-md-4 footer-top">
                        <p class="footer-class"> © 2016 Grab Fruit All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <!--//footer-->
        </div>
    </body>
</html>
