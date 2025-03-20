<%-- 
    Document   : viewCart
    Created on : 07-03-2025, 16:52:44
    Author     : ADMIN
--%>

<%@page import="shopping.Product"%>
<%@page import="shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
    </head>
    <body>
        <h1>Your Cake's bill here</h1>
        <% 
            Cart cart = (Cart) session.getAttribute("CART");
            if(cart != null){
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Edit</th>
                    <th>Remove</th>

                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    double total = 0;
                    for(Product product : cart.getCart().values()){
                        total +=product.getQuantity() * product.getPrice();
                %>
            <form action ="MainController" method="POST"> 
                <tr>
                    <td><%= count++ %></td>
                    <td>
                        <input type="text" name="id" value="<%=product.getProductID()%>" readonly=""/>
                    </td>
                    <td><%= product.getName()%></td>
                    <td><%= product.getPrice()%></td>
                    <td>
                        <input type="number" name="quantity" value="<%= product.getQuantity()%>" required="" min="1"/>
                    </td>
                    <td><%= product.getQuantity() * product.getPrice()%>$</td>
                    <td>
                        <input type="submit" name="action" value="Edit"/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Remove"/>                        
                    </td>
                    <%  String exceedMess = (String) request.getAttribute("MESSAGE_".concat(product.getProductID())); 
                        if(exceedMess == null) exceedMess = "";
                    %>                
                    <td>
                    <%=exceedMess%>
                    </td>
                </tr> 
            </form>

                <%}  %>
            </tbody>
        </table>
            <h1>Total: <%= String.format("%.2f", total) %>$</h1>
        <%
            }else{
        %>
        <h1>Cart is empty</h1>
        <%
            }
        %>
        <a href="shopping.jsp">ADD MORE</a>
        <a href="MainController?action=Clearcart">Clear Cart</a>
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Checkout"/>
            <input type="" />
        </form>
        
        ${requestScope.MESSAGE}
    </body>
</html>
