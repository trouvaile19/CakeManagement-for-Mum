<%-- 
    Document   : user
    Created on : Feb 15, 2025, 4:51:48 PM
    Author     : hoadoan
--%>

<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser != null) {
        %>
            User ID: <%= loginUser.getUserID() %>
            </br>Full Name: <%= loginUser.getFullName()%>
            </br>Phone: <%= loginUser.getPhone()%>
            </br>Role ID: <%= loginUser.getRoleID()%>
            </br><a href="MainController?action=Shopping">Shopping now</a>
            </br><a href="MainController?action=Logout">Logout</a>
        <%
            }
        %>
    </body>
</html>
