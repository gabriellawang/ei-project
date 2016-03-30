<%-- 
    Document   : order-detail
    Created on : Mar 23, 2016, 8:29:19 PM
    Author     : gabriellawang
--%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String name = request.getParameter("name");
    String description = request.getParameter("desc");
    String price = request.getParameter("price");
    String vendor = request.getParameter("vendor");
    String fullName = request.getParameter("fullname");
%>
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
            <div class="gallery">
                <div class="gallery-top">
                    <h1><%=name%></h1>
                    <p>Want to try the freshness? Add it to cart! </p>
                </div>
                <div class="gallery-bottom">
                    <div class="col-md-3 bottom-gallery" style='margin-left: 3cm'>
                        <a href="images/<%=name%>.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
                            <img class="img-responsive" src="images/<%=name%>.jpg" />
                            <div class="b-wrapper">
                                <h3 class="b-animate b-from-left    b-delay03 ">
                                    <span>Fruit</span>	
                                </h3>
                            </div>
                        </a>
                    </div>
                    <style>
                        div.order-input {
                            margin: 0;
                            position: absolute;
                            top: 57%;
                            left: 65%;
                            margin-right: -50%;
                            transform: translate(-50%, -50%) 
                        }
                    </style>
                    <div class="order-input">
                        <div class="panel panel-success" >

                            <div class="panel-heading">
                                <h3 class="panel-title"><b>Product Detail</b></h3>
                            </div>
                            <div class="panel-body">
                                <b>Description: </b><%=description%><br><br>
                                <b>Price: </b>S$ <%=price%><br><br>
                                <b>Vendor: </b><%=fullName%><br><br>
                                <form action="add-order">
                                    <input type="hidden" name="name" value='<%=name%>'/>
                                    <input type="hidden" name="pri" value='<%=price%>'/>
                                    <input type='hidden' name='vendor' value='<%=vendor%>'/>
                                    Choose the quantity: <input type='number' name='quantity'/><br>
                                    <input type='submit' value='Add to Cart' class="btn btn-lg btn-default"/>
                                </form>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
            <script src="js/jquery.chocolat.js"></script>
            <link rel="stylesheet" href="css/chocolat.css" type="text/css" media="screen" charset="utf-8">
            <!--light-box-files -->
            <script type="text/javascript" charset="utf-8">
                        $(function () {
                            $('.bottom-gallery a').Chocolat();
                        });
            </script>

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
