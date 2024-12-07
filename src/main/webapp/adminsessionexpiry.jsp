<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Session Expired</title>
    <style>
        /* Global styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fa;
            text-align: center;
            padding: 60px;
            margin: 0;
            color: #333;
        }

        h1 {
            color: #e74c3c;
            font-size: 2em;
            margin-bottom: 15px;
            font-weight: bold;
            line-height: 1.3;
        }

        p {
            font-size: 1.05em;
            color: #666;
            margin-bottom: 25px;
        }

        a {
            color: #fff;
            background-color: #3498db;
            padding: 10px 22px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 1.1em;
            transition: background-color 0.3s ease, transform 0.2s ease;
            display: inline-block;
        }

        a:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }

        /* Container for centering content */
        .container {
            max-width: 550px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        /* Button styles */
        .btn {
            display: inline-block;
            background-color: #2ecc71;
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1.1em;
            margin-top: 20px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #27ae60;
            transform: translateY(-2px);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            h1 {
                font-size: 1.7em;
            }

            p {
                font-size: 1em;
            }

            .container {
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>OOPS... !! Session Expired Due to Time Out or Logout</h1>
        <p>Your session has expired. Please log in again to continue.</p>
        <a href="adminlogin" class="btn">Login Again</a>
    </div>
</body>
</html>
