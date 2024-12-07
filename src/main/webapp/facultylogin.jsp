<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS for Animations and Styles -->
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('picerp.png');
            background-size: cover;
            background-position: center;
            height: 100vh;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            animation: fadeInBackground 1.5s ease-in-out;
        }

        @keyframes fadeInBackground {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Navbar Styles */
        .navbar-custom {
            background-color: rgba(0, 0, 50, 0.8);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .navbar-custom .navbar-brand {
            color: #f8f9fa;
            font-weight: bold;
            font-size: 1.5rem;
        }

        .navbar-custom .nav-link {
            color: #ffffff;
            margin-right: 20px;
            font-size: 1.1rem;
        }

        .navbar-custom .nav-link:hover {
            color: #ffca28;
        }

        .navbar-custom .dropdown-menu {
            background-color: rgba(0, 0, 0, 0.8);
            border: none;
        }

        .navbar-custom .dropdown-item {
            color: #ffffff;
        }

        .navbar-custom .dropdown-item:hover {
            background-color: #ffca28;
            color: #000;
        }

        /* Login Form Styles */
        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
            transform: translateY(-50px);
            opacity: 0;
            animation: slideInForm 1s ease forwards;
        }

        @keyframes slideInForm {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .form-container h1 {
            font-size: 2.2rem;
            margin-bottom: 30px;
            color: #333;
            opacity: 0;
            animation: fadeInText 1.2s ease forwards;
        }

        @keyframes fadeInText {
            to {
                opacity: 1;
            }
        }

        .form-container .form-label {
            font-size: 1rem;
            font-weight: 500;
            color: #333;
        }

        .form-container .form-control {
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 30px;
            padding: 10px 20px;
            font-size: 1rem;
            transition: border 0.3s ease, box-shadow 0.3s ease;
            opacity: 0;
            animation: fadeInInput 1.5s ease forwards;
        }

        @keyframes fadeInInput {
            to {
                opacity: 1;
            }
        }

        .form-container .form-control:focus {
            border-color: #ffca28;
            box-shadow: 0 0 10px rgba(255, 202, 40, 0.5);
        }

        .form-container .btn-custom {
            background-color: #ffca28;
            border: none;
            color: #333;
            padding: 10px 20px;
            font-size: 1.1rem;
            font-weight: bold;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            margin-top: 20px;
            animation: fadeInButton 1.8s ease forwards;
        }

        @keyframes fadeInButton {
            to {
                opacity: 1;
            }
        }

        .form-container .btn-custom:hover {
            background-color: #f0b322;
            transform: scale(1.05);
        }

        .form-container .links {
            margin-top: 20px;
            font-size: 0.9rem;
        }

        .form-container .links a {
            color: #ffca28;
            text-decoration: none;
        }

        .form-container .links a:hover {
            text-decoration: underline;
        }

        /* Media Queries for Mobile */
        @media (max-width: 768px) {
            .form-container {
                width: 90%;
                padding: 30px;
            }

            .navbar-custom .nav-link {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="index">ERP System</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="aboutus">About Us</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Login
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="adminlogin">Admin Login</a></li>
                            <li><a class="dropdown-item" href="userlogin">User Login</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Admin Login Form -->
    <div class="form-container">
        <h1>Faculty Login</h1>
        <form method="post" action="checkfacultylogin" >
            <div class="mb-3">
                
                <input type="text" class="form-control" id="femail" name="femail" placeholder="Enter username or email" required>
            </div>
            <div class="mb-3">
              
                <input type="password" class="form-control" id="fpassword" name="fpassword" placeholder="Enter password" required>
            </div>
            <button type="submit" class="btn btn-custom">Login</button>
        </form>
        <div class="links">
          <a href="fforgetpassword">Forgot Password?</a>
              <h5 align="center" style="color:red"><c:out value="${message}"></c:out></h5>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
