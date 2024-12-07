<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

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

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card-custom {
            width: 18rem;
            margin: 15px;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, box-shadow 0.3s;
            overflow: hidden;
            position: relative; /* For inner animation */
        }

        .card-custom img {
            width: 100px;
            height: 100px;
            margin-top: 20px;
            transition: transform 0.3s;
        }

        .card-custom:hover img {
            transform: scale(1.1); /* Image zoom effect */
        }

        .card-custom:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .card-custom .card-body {
            padding: 20px;
            transition: background-color 0.3s;
        }

        .card-custom:hover .card-body {
            background-color: rgba(255, 255, 255, 0.1); /* Light background on hover */
        }

        .card-custom .btn {
            background-color: #ffc107;
            color: black;
            font-weight: bold;
            border: none;
            border-radius: 25px;
            padding: 10px 20px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .card-custom .btn:hover {
            background-color: #ffca2c;
            transform: scale(1.05); /* Scale effect on hover */
        }

        .card-custom .btn:active {
            background-color: #e0a800;
            transform: scale(0.98);
        }
    </style>
</head>
<body>
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

    <!-- Login Cards -->
    <div class="login-container container">
        <div class="card card-custom">
            <img src="images/studenticon.png" alt="Student Icon">
            <div class="card-body">
                <h5 class="card-title">Student Login</h5>
                <a href="studentlogin" class="btn">Login</a>
            </div>
        </div>
        <div class="card card-custom">
            <img src="images/facultyicon.png" alt="Faculty Icon">
            <div class="card-body">
                <h5 class="card-title">Faculty Login</h5>
                <a href="facultylogin" class="btn">Login</a>
            </div>
        </div>
        <div class="card card-custom">
            <img src="images/parenticon.png" alt="Parent Icon">
            <div class="card-body">
                <h5 class="card-title">Parent Login</h5>
                <a href="parentlogin" class="btn">Login</a>
                <a href="parentregister" class="btn">Register</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
