<%-- 
    Document   : login
    Created on : Mar 13, 2016, 5:16:59 PM
    Author     : gabriellawang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Grab Fruit!</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Grab Fruit!</h1>
        <h2>Login</h2>
        <form action="validate-user" method="post">
            <table>
                <tr>
                    <td>
                        <input type="text" name="username" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="password" name="password"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="postal code"/>
                    </td>
                </tr>
            </table>
            <input type="submit" value="Login"/>
        </form>
        <%
                        
            String errorMsg = (String) request.getAttribute("errMsg");
            if(errorMsg != null){
                out.println(errorMsg);
            }
        %>
    </body>
</html>
