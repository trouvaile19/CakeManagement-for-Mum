<%-- 
    Document   : login
    Created on : Feb 15, 2025, 4:51:58 PM
    Author     : hoadoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="MainController" method="POST">
            User ID:<input type="text" name="userID" />
            </br>Password:<input type="password" name="password"/>
            </br><input type="submit" name="action" value="Login"/>
            <input type="reset"  value="Reset"/>
        </form>
    </body>
    <%
        String message = (String) request.getAttribute("MESSAGE");
        if (message == null) {
            message = "";
        }
    %>
    <%= message%>
</html>
