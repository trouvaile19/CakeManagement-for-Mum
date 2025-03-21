<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cake Shop Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #fff5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            background-image: linear-gradient(to bottom right, #fff5f5, #ffeef1);
        }
        
        .login-container {
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(255, 182, 193, 0.2);
            padding: 35px;
            width: 100%;
            max-width: 420px;
            border: 1px solid rgba(255, 182, 193, 0.3);
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .login-header h1 {
            color: #e68a9f;
            font-size: 28px;
            margin-bottom: 10px;
            font-weight: 600;
        }
        
        .login-header p {
            color: #b18597;
            font-size: 15px;
        }
        
        .login-form .form-group {
            margin-bottom: 22px;
        }
        
        .login-form label {
            display: block;
            margin-bottom: 8px;
            color: #b18597;
            font-weight: 500;
            font-size: 15px;
        }
        
        .login-form input[type="text"],
        .login-form input[type="password"] {
            width: 100%;
            padding: 14px 18px;
            border: 1px solid #ffd6de;
            border-radius: 12px;
            font-size: 15px;
            transition: all 0.3s;
            background-color: #fffbfc;
        }
        
        .login-form input[type="text"]:focus,
        .login-form input[type="password"]:focus {
            border-color: #e68a9f;
            outline: none;
            box-shadow: 0 0 0 3px rgba(230, 138, 159, 0.1);
        }
        
        .button-group {
            display: flex;
            gap: 12px;
            margin-top: 15px;
        }
        
        .login-form input[type="submit"] {
            background-color: #e68a9f;
            color: white;
            border: none;
            border-radius: 12px;
            padding: 14px 20px;
            font-size: 16px;
            cursor: pointer;
            flex: 1;
            transition: all 0.3s;
            font-weight: 500;
        }
        
        .login-form input[type="submit"]:hover {
            background-color: #d97a8f;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(230, 138, 159, 0.2);
        }
        
        .login-form input[type="reset"] {
            background-color: #fff5f7;
            color: #b18597;
            border: 1px solid #ffd6de;
            border-radius: 12px;
            padding: 14px 20px;
            font-size: 16px;
            cursor: pointer;
            flex: 1;
            transition: all 0.3s;
            font-weight: 500;
        }
        
        .login-form input[type="reset"]:hover {
            background-color: #ffeef1;
            transform: translateY(-2px);
        }
        
        .links {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
            font-size: 14px;
        }
        
        .links a {
            color: #e68a9f;
            text-decoration: none;
            transition: all 0.3s;
            position: relative;
            padding: 2px 0;
        }
        
        .links a:hover {
            color: #d97a8f;
        }
        
        .links a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 1px;
            bottom: 0;
            left: 0;
            background-color: #e68a9f;
            transition: width 0.3s;
        }
        
        .links a:hover::after {
            width: 100%;
        }
        
        .error-message {
            color: #e74c3c;
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }
        
        /* Cake icon decoration */
        .login-header::before {
            content: "🧁";
            font-size: 32px;
            display: block;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1>Sweet Welcome</h1>
            <p>Please login to your cake shop account</p>
        </div>
        
        <form class="login-form" action="MainController" method="POST">
            <div class="form-group">
                <label for="userID">User ID</label>
                <input type="text" id="userID" name="userID" placeholder="Enter your user ID" />
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" />
            </div>
            
            <div class="button-group">
                <input type="submit" name="action" value="Login" />
                <input type="reset" value="Reset" />
            </div>
        </form>
        
        <div class="links">
            <a href="createUser.jsp">Sign Up</a>
            <a href="shopping.jsp">Browse Cakes</a>
        </div>
        
        <!-- Replaced Java scriptlet with JSTL -->
        <c:set var="message" value="${requestScope.ERROR}" />
        <div class="error-message">
            <c:out value="${message}" default="" />
        </div>
    </div>
</body>
</html>