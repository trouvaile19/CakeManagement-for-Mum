<%-- 
    Document   : Shopping
    Created on : 07-03-2025, 16:06:52
    Author     : ADMIN
--%>

<%@page import="model.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="shopping.Product"%>
<%@page import="shopping.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cake Shopping</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String user="";
            if(loginUser != null){
              user = loginUser.getFullName();
            };
        %>
        <h1>Welcone <%=user%> to my Bakery Family!!!!</h1>
        <form action="MainController" method="POST">
            Select your baby:
            <select name="product">
                <option value="P001-Chocolate Cake-16.52">Chocolate Cake - 16.52$</option>
                <option value="P002-Strawberry Cake-15.22">Strawberry Cake - 15.22$</option>
                <option value="P003-Cheese Cake-17.83">Cheese Cake - 17.83$</option>
                <option value="P004-Tiramisu-18.70">Tiramisu - 18.70$</option>
                <option value="P005-Red Velvet Cake-17.39">Red Velvet Cake - 17.39$</option>
                <option value="P006-Matcha Green Tea Cake-16.96">Matcha Green Tea Cake - 16.96$</option>
                <option value="P007-Carrot Cake-16.09">Carrot Cake - 16.09$</option>
                <option value="P008-Lemon Drizzle Cake-15.65">Lemon Drizzle Cake - 15.65$</option>
                <option value="P009-Black Forest Cake-18.26">Black Forest Cake - 18.26$</option>
                <option value="P010-Mango Mousse Cake-17.61">Mango Mousse Cake - 17.61$</option>
            </select>
            <input type="number" name="quantity" value="1" min="1" step="1">
 
            <input type="submit" name="action" value="Add"></br>
            <input type="submit" name="action" value="View">            
        </form>
        <% 
            String message = (String) request.getAttribute("MESSAGE");
            if(message == null) message ="";
        %>
        <%= message %>
        <%
            List<Product> listCake = (List<Product>)  session.getAttribute("LIST_PRODUCT");
            if(listCake != null && listCake.size() > 0){
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>CakeID</th>
                    <th>Cake's Name</th>
                    <th>Price</th>
                    <th>quantity</th>
                </tr>
            </thead>
            <tbody>
                <%                         
                    int count = 1;
                    for (Product cake : listCake) {
                %>
                <tr>
                    <td><%=count++%></td>
                    <td><%=cake.getProductID()%></td>
                    <td><%=cake.getName()%></td>
                    <td><%=cake.getPrice()%></td>
                    <td><%=cake.getQuantity()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    <%}%>
    <%
        String mess = (String) request.getAttribute("MESS");
        if(mess == null) mess = "";
    %>
    <%=mess%>
    </body>
</html>
