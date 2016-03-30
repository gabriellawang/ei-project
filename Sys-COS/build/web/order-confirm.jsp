<%-- 
    Document   : order-confirm
    Created on : Mar 23, 2016, 9:20:37 PM
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
            <%
                String vendor = request.getParameter("vendor-name");
                String address = request.getParameter("address");
                double total = Double.parseDouble(request.getParameter("total-amount"));
                HashMap<String, ArrayList<Order>> hmap = (HashMap<String, ArrayList<Order>>) session.getAttribute("order-map");
            %>           

            <div class='content'>
                <div class="page-header">
                    <h3>Check your order</h3>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Order Information</h3>
                            </div>
                            <style>
                                div.panel-body{
                                    margin-left: 0.5cm;
                                }
                            </style>
                            <div class="panel-body">
                                <b>Vendor ID: <%=vendor%></b>
                                <%
                                    ArrayList<Order> orders = hmap.get(vendor);
                                    for (Order o : orders) {
                                        ArrayList<Package> pList = o.getItems();
                                        for (Package p : pList) {
                                            String pName = p.getName();
                                            double price = p.getPrice();
                                            int qty = p.getQty();
                                %>

                                <div style='margin-left: 0.5cm'>
                                        <b><%=pName%></b>
                                        
                                        <p>Price: S$<%=price%></p>
                                        <p>Quantity: <%=qty%></p>
                                        
                                        
                                </div>
                                        <%
                                        }
                                    }%>
                                <div>
                                    <form action="${initParam['posturl']}" method="post">
                                        <input type="hidden" name="upload" value="1" />
                                        <input type ="hidden" name="return" value="${initParam['returnurl']}" />
                                        <input type ="hidden" name="business" value="${initParam['business']}" />
                                        <input type ="hidden" name="cmd" value="_cart" />
                                        <hr>
                                        <table width="400">
                                            <tr>
                                                <td>Vendor Name:</td>
                                                <td><input type="text" name="item_name_1" value="<%=vendor%>" readonly/></td>
                                            </tr>
                                            <tr>
                                                <td>Total Amount:</td>
                                                <td><input type="text" name="amount_1" value="<%=total%>" readonly/></td>
                                            </tr>
                                        </table>
                                            <br>
                                        <input type="text" hidden name="quantity_1" value="1" />
                                        <button type="submit" style="border: 0; background: transparent">
                                            <img src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif" alt="submit" />
                                        </button>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <%
                        
                    
                    session.setAttribute("address", address);
                    session.setAttribute("vendor-name", vendor);
                    session.setAttribute("total", total);
                %>
            </div>

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
