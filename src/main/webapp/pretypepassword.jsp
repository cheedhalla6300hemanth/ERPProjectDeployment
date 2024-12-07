<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    form {
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 400px;
        text-align: center;
    }

    form label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #333;
    }

    form input[type="email"],
    form input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
    }

    form button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    form button:hover {
        background-color: #0056b3;
    }

    p {
        font-size: 14px;
        margin-top: 10px;
    }

    p[style="color: red;"] {
        color: red;
    }

    p[style="color: green;"] {
        color: green;
    }
</style>
<head>
    <title>Reset Password</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/presetpassword" method="post">
        <label>Email:</label>
        <input type="email" name="email" required /><br>

        <label>New Password:</label>
        <input type="password" name="password" required /><br>

        <label>Confirm Password:</label>
        <input type="password" name="confirmPassword" required /><br>

        <button type="submit">Reset Password</button>
    </form>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>
    <c:if test="${not empty message}">
        <p style="color: green;">${message}</p>
    </c:if>
</body>
</html>
