<%@page import="com.klef.jfsd.erp.model.Faculty"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Faculty faculty = (Faculty)session.getAttribute("f");
if(faculty==null)
{
	response.sendRedirect("facultysessionexpiry.jsp");
	return;
}
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Dashboard</title>

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
            min-height: 100vh; /* Ensure body covers the full height */
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

        /* Admin Info and Logout */
       
        .faculty-info {
            display: flex;
            align-items: center;
            margin-left: auto;
        }

        .faculty-info img {
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }

        .faculty-info span {
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
            width: 215px;
            height: calc(100vh - 60px);
            background-color: rgba(0, 0, 50, 0.9);
            padding-top: 20px;
            overflow-y: auto; /* To allow scrolling if content exceeds viewport */
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
            margin-left: 270px; /* Account for the sidebar */
            padding: 0px 40px 40px; /* Account for navbar and spacing */
            flex-grow:1; /* Ensure content expands to fill available space */
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
            transform: scale(1.05);j
        }

       /* Footer Styles */
        footer {
            text-align: center;
            padding: 8px;
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
        .nav-link:nth-child(5) { animation-delay: 0.5s; }
        .nav-link:nth-child(6) { animation-delay: 0.6s; }
        .nav-link:nth-child(7) { animation-delay: 0.7s; }
        .nav-link:nth-child(8) { animation-delay: 0.8s; }
        .nav-link:nth-child(9) { animation-delay: 0.9s; }
        .nav-link:nth-child(10) { animation-delay: 1s; }

        @keyframes slideIn {
            from { transform: translateX(-100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
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
    overflow-y: auto; /* To allow scrolling if content exceeds viewport */
}

/* Dropdown Menu Styles */
.dropdown-menu {
    display: none; /* Hide dropdown by default */
    background-color: rgba(0, 0, 50, 0.9);
    border: none;
    padding-left: 0;
    border-radius: 5px; /* Rounded corners for dropdown */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3); /* Subtle shadow */
}

/* Dropdown Item Styles */
.dropdown-menu .dropdown-item {
    color: #ffffff;
    padding: 10px 35px;
    transition: background 0.3s, color 0.3s, transform 0.2s; /* Add transform transition */
}

.dropdown-menu .dropdown-item:hover {
    background-color: #ffca28;
    color: #000;
    transform: scale(1.05); /* Scale effect on hover */
}

/* Show dropdown items */
.dropdown-menu.show {
    display: block; /* Show dropdown when active */
}

/* Dropdown Toggle */
.nav-link {
    cursor: pointer; /* Indicate clickable items */
    position: relative; /* Position for hover effects */
    padding: 10px 20px; /* Add some padding for the toggle */
    transition: color 0.3s, background 0.3s; /* Smooth transition for color change */
}

.nav-link:hover {
    color: #ffca28; /* Change text color on hover */
    background-color: rgba(255, 255, 255, 0.1); /* Slight background change on hover */
    border-radius: 5px; /* Rounded corners on hover */
}

/* Animation for dropdown */
.dropdown-menu {
    opacity: 0;
    max-height: 0;
    transition: max-height 0.3s ease, opacity 0.3s ease;
}

.dropdown-menu.show {
    opacity: 1;
    max-height: 200px; /* Adjust based on content */
}

/* Arrow caret for dropdown */
.caret {
    margin-left: 5px; /* Spacing for the caret */
    transition: transform 0.3s; /* Transition for rotation */
}

/* Rotate caret when dropdown is open */
.dropdown-menu.show + .nav-link .caret {
    transform: rotate(180deg); /* Rotate caret on dropdown open */
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
        <span class="navbar-text">Faculty-Portal</span>
    </div>
        <div class="faculty-info">
          <img src="displayfacultyimage?fid=<%=faculty.getFid() %>" alt="Student Image" >
            <span><%=faculty.getFname()%></span>
            <a href="logoutf" class="logout-link">Logout</a>
        </div>
    </nav>
<br><br><br>
    <!-- Side Navbar -->
    <div class="sidebar">
        <ul class="navbar-nav">
            <li><a class="nav-link" href="#">Dashboard</a></li>
              <li><a class="nav-link" href="facultyhome">Home</a></li>
          <li><a class="nav-link" href="facultyprofile">Profile</a></li>
          <li><a class="nav-link" href="mycourses">My Courses</a></li>
           <li><a class="nav-link" href="updatefaculty">Update Profile</a></li>
              <li class="nav-item">
            <a class="nav-link" href="#" id="studentToggle">
                Student Information<span class="caret"></span>
            </a>
            <ul class="dropdown-menu" id="studentDropdown">
              
                <li><a class="dropdown-item" href="viewallstudentsbyf">View Students</a></li>
                <li><a class="dropdown-item" href="editstudents">Edit Students</a></li>
                 <li><a class="dropdown-item" href="deletestudentbyf">Delete Students</a></li>
                
            </ul>
        </li>
            <li><a class="nav-link" href="#">My Subjects</a></li>
            <li><a class="nav-link" href="#">Attendance</a></li>
            <li><a class="nav-link" href="#">Examinations</a></li>
            <li><a class="nav-link" href="#">Grades</a></li>
            <li><a class="nav-link" href="fforgetpassword">Reset Password</a></li>
        </ul>
    </div>
   

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<script>
    document.getElementById('studentToggle').addEventListener('click', function () {
        const dropdownMenu = document.getElementById('studentDropdown');
        dropdownMenu.classList.toggle('show');
    });

  
</script>
