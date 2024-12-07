<%@page import="com.klef.jfsd.erp.model.Parent"%>
<%@page import="com.klef.jfsd.erp.model.Student"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Parent parent= (Parent)session.getAttribute("p");
Student student= (Student)session.getAttribute("s");
if(parent==null && student==null)
{
	response.sendRedirect("parentsessionexpiry.jsp");
	return;
}
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parent Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('picerp.png');
            background-size: cover;
            background-position: center;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh; 
            display: flex;
            flex-direction: column;
        }

        /* Navbar Styles */
        .navbar-custom {
            background-color: rgba(0, 0, 50, 0.8);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            padding: 10px 20px;
        }

        .navbar-custom .navbar-brand {
            color: #f8f9fa;
            font-weight: bold;
            font-size: 1.5rem;
        }

        .navbar-custom .nav-link {
            color: #ffffff;
            font-size: 1.1rem;
        }

        /* Parent Info and Logout */
        .parent-info {
            display: flex;
            align-items: center;
            margin-left: auto;
        }

        .parent-info img {
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }

        .parent-info span {
            color: #ffffff;
            font-size: 1.2rem;
            margin-right: 20px;
        }

        .logout-link {
            color: #ffffff;
            font-size: 1rem;
            margin-left: 10px;
            text-decoration: none;
            background-color: transparent;
            padding: 8px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        .logout-link:hover {
            background-color: #dc3545;
            color: #fff;
        }

        .logout-link:active {
            background-color: #ff0000;
        }

        /* Side Navbar Styles */
        .sidebar {
            position: fixed;
            top: 60px;
            left: 0;
            width: 225px;
            height: calc(100vh - 60px);
            background-color: rgba(0, 0, 50, 0.9);
            padding-top: 20px;
            overflow-y: auto; 
        }

        .sidebar .nav-link {
            color: #ffffff;
            padding: 10px 20px;
            display: block;
            transition: background 0.3s, color 0.3s;
            font-size: 1.1rem;
        }

        .sidebar .nav-link:hover {
            background-color: #ffca28;
            color: #000;
            border-radius: 20px;
        }

        /* Content Styles */
        .content {
            margin-left: 270px; 
            padding: 100px 40px 40px; 
            flex-grow: 1; 
        }

        /* Button Styles */
        .btn-custom {
            background-color: #ffc107;
            border: none;
            color: black;
            padding: 10px 20px;
            border-radius: 20px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-custom:hover {
            background-color: #ffca2c;
            transform: scale(1.05);
        }

        /* Footer Styles */
        footer {
            text-align: center;
            padding: 10px;
            background-color: rgba(0, 0, 50, 0.8);
            color: white;
            width: 100%;
        }

        /* Animations for Links */
        .nav-link {
            opacity: 0;
            animation: slideIn 0.5s forwards;
        }

        .nav-link:nth-child(1) { animation-delay: 0.1s; }
        .nav-link:nth-child(2) { animation-delay: 0.2s; }
        .nav-link:nth-child(3) { animation-delay: 0.3s; }
        .nav-link:nth-child(4) { animation-delay: 0.4s; }

        @keyframes slideIn {
            from { transform: translateX(-100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        /* Dropdown Menu Styles */
        .dropdown-menu {
            display: none; 
            background-color: rgba(0, 0, 50, 0.9);
            border: none;
            padding-left: 0;
            border-radius: 5px; 
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3); 
        }

        /* Dropdown Item Styles */
        .dropdown-menu .dropdown-item {
            color: #ffffff;
            padding: 10px 35px;
            transition: background 0.3s, color 0.3s, transform 0.2s; 
        }

        .dropdown-menu .dropdown-item:hover {
            background-color: #ffca28;
            color: #000;
            transform: scale(1.05); 
        }

        /* Show dropdown items */
        .dropdown-menu.show {
            display: block; 
        }

        /* Dropdown Toggle */
        .nav-link {
            cursor: pointer; 
            position: relative; 
            padding: 10px 20px; 
            transition: color 0.3s, background 0.3s; 
        }

        .nav-link:hover {
            color: #ffca28; 
            background-color: rgba(255, 255, 255, 0.1); 
            border-radius: 5px; 
        }

        /* Animation for dropdown */
        .dropdown-menu {
            opacity: 0;
            max-height: 0;
            transition: max-height 0.3s ease, opacity 0.3s ease;
        }

        .dropdown-menu.show {
            opacity: 1;
            max-height: 200px; 
        }

        /* Arrow caret for dropdown */
        .caret {
            margin-left: 5px; 
            transition: transform 0.3s; 
        }

        /* Rotate caret when dropdown is open */
        .dropdown-menu.show + .nav-link .caret {
            transform: rotate(180deg); 
        }
        
        
        
         .navbar-center {
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        text-align: center;
          top: 50%; /* Align vertically in the navbar */
    transform: translate(-50%, -50%); /* Horizontal and vertical centering */
    transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
        
    }

   .navbar-text {
    font-size: 1.5rem; /* Decrease font size */
    font-weight: bold;
    background: linear-gradient(90deg, violet,lightgreen,pink,yellow,orange,skyblue); /* Gradient text effect */
    -webkit-background-clip: text; 
    -webkit-text-fill-color: transparent; /* Make text gradient */
    color: #007bff; /* Fallback color */
    text-shadow: 2px 2px 5px rgba(0, 123, 255, 0.5); /* Subtle shadow for depth */
    animation: fadeIn 2s ease-in-out; /* Smooth fade-in effect on page load */
    letter-spacing: 1px;
    cursor: pointer;
    text-align: center;
    transition: transform 0.3s ease, text-shadow 0.3s ease, color 0.3s ease;
}

.navbar-text:hover {
    transform: scale(1.1); /* Slight zoom on hover */
    text-shadow: 4px 4px 10px rgba(0, 123, 255, 0.7); /* Increase shadow for glow effect */
    color: #00c6ff; /* Change color on hover */
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <a class="navbar-brand" href="index.jsp">ERP System</a>
         <div class="navbar-center">
        <span class="navbar-text">Parent-Portal</span>
    </div>
        <div class="parent-info">
            <img src="displayparentimage?pid=<%=parent.getPid() %>" alt="Student Image" >
           <span><%=parent.getPusername() %></span>
            <a href="logoutp" class="logout-link">Logout</a>
        </div>
    </nav>

    <!-- Side Navbar -->
    <div class="sidebar">
        <ul class="navbar-nav">
            <li><a class="nav-link" href="#">Dashboard</a></li>
            <li><a class="nav-link" href="mychildprofile">My Child's Profile</a></li>
            <li><a class="nav-link" href="parentprofile">My Profile</a></li>
            <li><a class="nav-link" href="updateparent">Edit Profile</a></li>
            <li><a class="nav-link" href="#">Attendance</a></li>
            <li><a class="nav-link" href="pforgetpassword">Reset Password</a></li>
        </ul>
    </div>

   


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
