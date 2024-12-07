<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deleting</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        .container {
            text-align: center;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            color: #e74c3c;
            font-size: 24px;
        }
        
        p {
            font-size: 18px;
            color: #333;
            margin-bottom: 20px;
        }
        
        a {
            background-color: #e74c3c;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 18px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        
        a:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Are you sure you want to delete this student?</h1>
        <p>This action cannot be undone.</p>
        <!-- Confirm deletion link -->
        <a href='<c:url value="deletes?id=${student.sid}"></c:url>'>Confirm</a>
    </div>
</body>
</html>
