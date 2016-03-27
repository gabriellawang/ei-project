<%-- 
    Document   : order
    Created on : Mar 13, 2016, 5:20:27 PM
    Author     : gabriellawang
--%>
<%@include file="protect.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Vendor"%>
<%@page import="Model.Package"%>
<%@page import="Model.Customer"%>
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
            <!-- welcome-->
            <div class="content">
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
                    if (session.getAttribute("added") != null) {
                        added = (Boolean) session.getAttribute("added");
                    }
                    if (added) {
                %>
                <script>popup();</script>
                <%
                        added = false;
                        session.setAttribute("added", false);
                    }
                %>
                <div class="welcome">
                    <h1>Welcome, <%=cName%></h1>
                    <p><a href="order-choose.jsp">Confirm My Order and Pay</a></p>
                    <p>You are currently at <b><%=region%></b>. Here are the vendors nearby. Grab Fruit now! </p>
                </div>

                <form action="send-order">

                    <%
                        if (vList != null && !vList.isEmpty()) {
                            //out.println(vList.size());
                            for (int i = 0; i < vList.size(); i++) {
                                String vName = vList.get(i).getName();
                                String fullName = vList.get(i).getFullName();
                                ArrayList<Package> pList = vList.get(i).getPkgList();
                    %>
                    <div class="grid_3 grid_4">
                        <div class="page-header">
                            <h2 id="h2-bootstrap-heading"><%=i + 1%>. <%=fullName%></h2>
                        </div>
                        <style>
                            table {
                                border-collapse: collapse;
                                width: 100%;
                            }

                            th, td {
                                text-align: left;
                                padding: 8px;
                            }

                            tr:nth-child(even){background-color: #f2f2f2}

                            th {
                                background-color: #37b48e;
                                color: white;
                            }
                        </style>
                        <table>
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
                                <td><a href="order-detail.jsp?name=<%=pName%>&desc=<%=des%>&price=<%=pri%>&vendor=<%=vName%>&fullname=<%=fullName%>"><%=pName%></a></td><td><%=des%></td><td>S$ <%=pri%></td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                    </div>
                </form>
                <%
                        }
                    }
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
