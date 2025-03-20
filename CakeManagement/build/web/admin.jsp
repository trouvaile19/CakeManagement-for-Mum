<%-- 
    Document   : admin
    Created on : Feb 15, 2025, 4:51:53 PM
    Author     : hoadoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.UserDTO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Administrator Page</title>
</head>
<body>

    <c:choose>
        <c:when test="${empty sessionScope.LOGIN_USER or sessionScope.LOGIN_USER.roleID != 'AD'}">
            <c:redirect url="login.html"/>
        </c:when>
    </c:choose>

    <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
    
    <form action="MainController" method="POST">
        <input type="submit" name="action" value="Logout"/>
    </form>

    <!-- Form tìm kiếm -->
    <form action="MainController">
        Search: <input type="text" name="search" value="${param.search}" />
        <input type="submit" name="action" value="Search"/>
    </form>

    <c:if test="${not empty requestScope.LIST_USER}">
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Phone</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${requestScope.LIST_USER}" varStatus="counter">
                <form action="MainController" method="POST">
                    <tr>
                        <td>${counter.count}</td>
                        <td><input type="text" name="userID" value="${user.userID}" readonly="readonly"/></td>
                        <td><input type="text" name="fullName" value="${user.fullName}" required="required"/></td>
                        <td><input type="text" name="phone" value="${user.phone}" required="required"/></td>
                        <td><input type="text" name="roleID" value="${user.roleID}" required="required"/></td>
                        <td>${user.password}</td>

                        <!-- Update -->
                        <td>
                            <input type="submit" name="action" value="Update"/>
                            <input type="hidden" name="search" value="${param.search}"/>
                        </td>

                        <!-- Delete -->
                        <td>
                            <a href="MainController?action=Delete&userID=${user.userID}&search=${param.search}">Delete</a>
                        </td>
                    </tr>
                </form>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
        <c:set var="found" value="${FOUND}" />
        <c:if test="${empty found}">
            <c:set var="found" value="" />
        </c:if>

        <c:out value="${found}" />
  

    <c:if test="${not empty requestScope.ERROR}">
        <p>${requestScope.ERROR}</p>
    </c:if>

</body>
</html>
