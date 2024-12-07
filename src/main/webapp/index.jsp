<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ERP System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('images/picerp.png');
            background-size: cover;
            background-position: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            color: white;
           /*  animation: fadeInBackground 1.5s ease-in-out; */
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
            transition: background-color 0.4s ease;
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
            position: relative;
        }

        .navbar-custom .nav-link:hover {
            color: #ffca28;
        }

        .navbar-custom .dropdown-menu {
            background-color: rgba(0, 0, 50, 0.9);
            border: none;
            transform: translateY(-10px);
            opacity: 0;
            visibility: hidden;
            transition: transform 0.1s ease, opacity 0.1s ease;
        }

        .navbar-custom .dropdown:hover .dropdown-menu {
            transform: translateY(0);
            opacity: 1;
            visibility: visible;
        }

        .navbar-custom .dropdown-item {
            color: #ffffff;
        }

        .navbar-custom .dropdown-item:hover {
            background-color: #ffca28;
            color: #000;
        }
                /* Footer Styles */
        footer {
            text-align: center;
            padding: 20px;
            background-color: rgba(0, 0, 50, 0.8);
            color: white;
            height:0;
            width: 100%;
        }
        

        /* Container and Button Styles */
        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: white;
            text-align: center;
        }

        .btn-custom {
            background-color: #ffc107;
            border: none;
            color: black;
            padding: 10px 20px;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #ffca2c;
            transform: scale(1.05);
        }

        .btn-custom:active {
            background-color: #e0a800;
            transform: scale(0.98);
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

    <!-- Main Content -->
    <div class="container text-center">
        <div class="text-black">
            <h1>Welcome to the ERP System</h1>
            <p>Manage everything with ease!</p>
        </div>
    </div>
    <!-- Footer -->
    <footer>
        <p>&copy; 2024 ERP System. All rights reserved.</p>
    </footer>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
