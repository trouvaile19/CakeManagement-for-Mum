<%-- 
    Document   : payment.jsp
    Created on : 20-03-2025, 21:47:45
    Author     : ADMIN
--%>

<%@page import="shopping.Product"%>
<%@page import="shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
    </head>
    <body>
        <h1>Your Bill Here </h1>
        <% 
            double total = 0;            
            Cart cart = (Cart) session.getAttribute("CART");
            if(cart != null){
        %>        
        <table border="1">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>ProductID</th>
                    <th>Cake's Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
            <%  int count = 1;
                for (Product cake : cart.getCart().values()) {    
                    total += cake.getQuantity() * cake.getPrice();                
                                        
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
                <h1>Total: <%= String.format("%.2f", total)%>$</h1>
                <%session.setAttribute("TOTAL", total);%>            
                <form action="MainController">
                    <input type="submit" name="action" value="Pay"/>
                    <a href="user.jsp">Home</a>
                </form>
        <% 
            }
            String mess = (String) request.getAttribute("MESS");
            if(mess==null) mess = "";
        %>
        <%=mess%>
    </body>
</html>
