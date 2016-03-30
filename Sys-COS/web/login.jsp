<%-- 
    Document   : login
    Created on : Mar 13, 2016, 5:16:59 PM
    Author     : gabriellawang
--%>
<%
    if(session.getAttribute("customer") != null){
        response.sendRedirect("order.jsp");
    }
%>
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
                        <a href="login.jsp">Login | Register</a>
                    </div>

                    <div class="clearfix"></div>
                </div>
                <div class="top-nav">
                    <span class="menu"><img src="images/menu.png" alt="">  </span>
                    <ul>
                        <li class="active"><a href="index.html" > Home </a></li>
                        <li><a href="order.jsp"> Order Online </a></li> 
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
                <div class="clearfix"> </div>
            </div>

            <div class="content">
                <style>
                    div.col-sm-4 {
                        margin: 0;
                        position: absolute;
                        top: 50%;
                        left: 50%;
                        margin-right: -50%;
                        transform: translate(-50%, -50%) 
                    }
                </style>
                <div class="col-sm-4" style="text-align: center;">

                    <div class="panel panel-success" align="center" style="text-align: center;">

                        <div class="panel-heading">
                            <h3 class="panel-title"><b>Login</b></h3>
                        </div>
                        <div class="panel-body">
                            <form action="validate-user" method="post" align="middle">
                                <style>
                                    table {
                                        border-collapse: collapse;
                                        width: 100%;
                                    }

                                    th, td {
                                        text-align: left;
                                        padding: 8px;
                                    }
                                </style>
                                <table width="400">
                                    <tr>
                                        <td><b>Username</b></td>
                                        <td>
                                            <input type="text" name="username" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Password</b></td>
                                        <td>
                                            <input type="password" name="password"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Postal Code</b></td>
                                        <td>
                                            <input type="text" name="postal code"/>
                                        </td>
                                    </tr>
                                </table>
                                <input type="submit" value="Login" class="btn btn-lg btn-default"/>
                            </form>
                        </div>
                    </div>
                    <%

                        String errorMsg = (String) request.getAttribute("errMsg");
                        if (errorMsg != null) {

                    %>            
                    <h4 class="grid2">
                        <span class="label label-warning"><%=errorMsg%></span>
                    </h4 class="grid1">
                    <%
                        }
                    %>  
                </div>
                <div class="clearfix"> </div>
            </div>


    </body>
</html>
