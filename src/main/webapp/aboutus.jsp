<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>

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
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            overflow: hidden; /* Prevent scrollbars from appearing */
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

        /* Card Styles */
        .card-container {
            margin-top: 80px; /* space for the navbar */
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .main-card, .child-card {
            position: relative;
            width: 275px;
            height: 275px;
            perspective: 1000px; /* Add perspective for 3D effect */
            margin-bottom: 30px;
            cursor: pointer;
            opacity: 0; /* Initially hidden for animation */
            animation: fadeIn 0.6s forwards; /* Fade in effect */
        }

        .card-inner {
            position: relative;
            width: 100%;
            height: 100%;
            transition: transform 0.6s;
            transform-style: preserve-3d;
        }

        .main-card:hover .card-inner, .child-card:hover .card-inner {
            transform: rotateY(180deg); /* Rotates the inner container on hover */
        }

        .card-content, .card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden; /* Hide the opposite side */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
            color: white;
            text-align: center;
            border-radius: 15px;
        }

        .main-card .card-content {
            background-image: url('images/surya.jpg'); /* Main card image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            border-radius: 15px;
        }

        .card-back {
            background-color: rgba(255, 255, 255, 0.9);
            color: black;
            transform: rotateY(180deg); /* Position the back side initially */
            border-radius: 15px;
        }

        .child-card .card-content {
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            border-radius: 15px;
        }

        /* Button Styles */
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
            margin-top: 20px;
            position: absolute;
            bottom: 20px;
        }

        .btn-custom:hover {
            background-color: #ffca28;
            transform: scale(1.05);
        }

        /* Child Cards Container */
        .child-cards-container {
            display: none; /* Initially hidden */
            gap: 15px;
            transition: opacity 0.6s ease; /* Fade effect for child cards */
        }

        .child-cards-container.show {
            display: flex; /* Show when button clicked */
            opacity: 1; /* Fade in when shown */
        }

        /* Media Queries */
        @media (max-width: 768px) {
            .main-card, .child-card {
                width: 250px;
                height: 350px;
            }
        }

        .animated-title {
            color: blue; /* Text color */
            animation: fadeIn 2s ease-in-out; /* Animation effect */
        }

        /* Keyframes for the fadeIn effect */
        @keyframes fadeIn {
            0% {
                opacity: 0; /* Start invisible */
                transform: translateY(-20px); /* Start slightly above */
            }
            100% {
                opacity: 1; /* Fully visible */
                transform: translateY(0); /* Move to original position */
            }
        }

        /* Keyframes for child card fade-in effect */
        @keyframes fadeInChild {
            from {
                opacity: 0; /* Start invisible */
                transform: translateY(20px); /* Start slightly below */
            }
            to {
                opacity: 1; /* Fully visible */
                transform: translateY(0); /* Move to original position */
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
<br><br>
    <!-- Card Container -->
    <div class="card-container">
        <!-- Main Card -->
        <div class="main-card">
            <div class="card-inner">
                <div class="card-content">
                <br><br><br>  <br><br><br>  <br><br><br>  
               <h3 class="animated-title">Team Mentor</h3>




                </div>
                <div class="card-back">
                    <h2>Surya Kiran</h2>
                    <p>The hero Of Us</p>
                    <button class="btn-custom" onclick="showTeam()">View Team</button>
                </div>
            </div>
        </div>

        <!-- Child Cards Container -->
        <div class="child-cards-container" id="childCards">
            <div class="child-card">
                <div class="card-inner">
                    <div class="card-content" style="background-image: url('images/hem.jpg');">
                    <br><br><br><br><br><br><br><br><br><br><br><br>
                        <h3>Cheedhalla Hemanth</h3>
                        
                    </div>
                    <div class="card-back">
                        <h3>Cheedhalla Hemanth</h3>
                        <p>Expert in database management.Admin and Parent Role in the project.</p>
                    </div>
                </div>
            </div>
            <div class="child-card">
                <div class="card-inner">
                    <div class="card-content" style="background-image: url('images/rohini.jpg');">
                     <br><br><br><br><br><br><br><br><br><br><br><br>
                        <h3>Talari Rohini</h3>
                       
                    </div>
                    <div class="card-back">
                        <h3>Talari Rohini</h3>
                        <p>Skilled in creating responsive designs.</p>
                    </div>
                </div>
            </div>
            <div class="child-card">
                <div class="card-inner">
                    <div class="card-content" style="background-image: url('images/vinod.jpg');">
                      <br><br><br><br><br><br><br><br><br><br><br><br>
                        <h3>Maram Vinod Kumar</h3>
                       
                    </div>
                    <div class="card-back">
                        <h3>Maram Vinod Kumar</h3>
                        <p>Experienced in coordinating projects.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function showTeam() {
            const childCards = document.getElementById('childCards');
            childCards.classList.toggle('show');
        }
    </script>
</body>
</html>
