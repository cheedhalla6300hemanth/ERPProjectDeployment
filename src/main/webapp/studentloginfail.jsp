<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Failed</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f8f9fa;
        }
        .message {
            text-align: center;
            font-size: 24px;
            color: red;
            margin-bottom: 20px;
        }
        .btn-back {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="message">
        Login Failed. Please try again.
    </div>
    
    <!-- Back button to redirect to adminlogin page -->
    <a href="userlogin" class="btn-back">Back to Login</a>

</body>
</html>
