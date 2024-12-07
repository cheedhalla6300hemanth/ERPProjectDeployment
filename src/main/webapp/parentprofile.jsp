<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="parent.jsp" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Parent Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            background: #fafafa;
            transition: box-shadow 0.3s;
        }
        .card:hover {
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
            color: #4CAF50;
        }
        b {
            color: #555;
        }
        footer {
            text-align: center;
            padding: 10px 0;
            background-color: rgba(0, 0, 50, 0.8);
            color: white;
            border-radius: 0 0 8px 8px;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Parent Profile</h1>
        <div class="card">
            <b>Parent ID:</b> <%= parent.getPid() %><br><br>
            <b>Profile Image:</b><br>
            <img src="displayparentimage?pid=<%=parent.getPid() %>" alt="Student Image" style="width: 150px; height: 150px; border-radius: 50%; margin-top: 10px;"><br><br>
            
            <b>Username:</b> <%= parent.getPusername() %><br><br>
            <b>Gender:</b> <%= parent.getPgender() %><br><br>
            <b>Date of Birth:</b> <%= parent.getPdateofbirth() %><br><br>
            <b>Relation to Student:</b> <%= parent.getPrelation() %><br><br>
            <b>Address:</b> <%= parent.getPaddress() %><br><br>
            <b>Contact:</b> <%= parent.getPcontact() %><br><br>
            <b>Student Email:</b> <%= parent.getSemail() %><br><br>
            <b>Student Contact:</b> <%= parent.getScontact() %><br><br>
        </div>
    </div>
    <footer>
        &copy; 2024 KL University. All Rights Reserved.
    </footer>
</body>
</html>
