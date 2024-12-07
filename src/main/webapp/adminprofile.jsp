<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin.jsp" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s;
        }
        .container:hover {
            transform: scale(1.02);
        }
        h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.1em;
            margin: 10px 0;
        }
        .welcome-message {
            font-size: 1.5em;
            font-weight: bold;
            margin: 20px 0;
            color: #4A90E2;
        }
        footer {
            margin-top: 240px;
            font-size: 0.9em;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome</h1>
        <p class="welcome-message">Hello, <%= admin.getUsername() %>!</p>
        <p>We are glad to have you here. Please explore the features available to you.</p>
        <p>Don't hesitate to contact support if you need any assistance!</p>
    </div>
    <footer>
        <p>&copy; 2024 Your Company Name. All rights reserved.</p>
    </footer>
</body>
</html>
