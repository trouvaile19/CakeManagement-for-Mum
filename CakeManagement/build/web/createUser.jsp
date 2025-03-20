<%-- 
    Document   : createUser
    Created on : Mar 1, 2025, 4:45:15 PM
    Author     : hoadoan
--%>

<%@page import="model.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>create Page</title>
    </head>
    <body>
        <%
            UserError user = (UserError) request.getAttribute("USER_ERROR");
            if(user == null) user = new UserError();
            
        %>
         
       
        <form action="MainController" method="POST">
            User ID: <input type="text" name="userID" required="" minlength="2" maxlength="8"/>
            <%= user.getRoleIDDError() %>
            </br>Full Name: <input type="text" name="fullName" required="" minlength="5" maxlength="20"/>
            </br>Phone: <input type="text" name="phone" required="" minlength="10" maxlength="13"/>
            </br>Role ID: <input type="text" name="roleID"  value="US" readonly=""/>
            </br>Password: <input type="password" name="password" required=""/>
            </br>Confirm: <input type="password" name="confirm" required=""/>
            <%= user.getConfirm() %>
            </br><input type="submit" name="action" value="Create"/> 
            <%= user.getError()%>
            <input type="reset" value="Reset"/>
        </form>
        <%
            String message= (String)request.getAttribute("ERROR");
            if(message== null) message="";
        %>
        <%= message %>
    </body>
</html>
