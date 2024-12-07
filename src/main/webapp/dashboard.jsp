<%@ include file="admin.jsp" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }
        .dashboard-container {
            text-align: center;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        h3 {
            margin-top: 20px;
            color: #555;
        }
        .counts-container {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }
        .count-box {
            text-align: center;
            padding: 10px;
            background-color: #f1f1f1;
            border-radius: 8px;
            width: 150px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .charts-container {
            display: flex;
            justify-content: space-around; /* Align pie charts side by side */
            margin-top: 30px;
        }
        canvas {
            width: 250px !important;  /* Decrease the size of the charts */
            height: 250px !important; /* Decrease the size of the charts */
            margin: 0 15px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
     

        <h3>Gender Counts</h3>
        
        <!-- Gender Counts Container -->
        <div class="counts-container">
            <!-- Student Gender Counts -->
            <div class="count-box">
                <h4>Student Gender</h4>
                <p>Male Students: <c:out value="${malecount}" /></p>
                <p>Female Students: <c:out value="${femalecount}" /></p>
            </div>

            <!-- Faculty Gender Counts -->
            <div class="count-box">
                <h4>Faculty Gender</h4>
                <p>Male Faculty: <c:out value="${fmalecount}" /></p>
                <p>Female Faculty: <c:out value="${ffemalecount}" /></p>
            </div>
        </div>

        <!-- Charts Container -->
        <div class="charts-container">
            <!-- Pie Chart for Student Gender Distribution -->
            <canvas id="genderChart"></canvas>

            <!-- Pie Chart for Faculty Gender Distribution -->
            <canvas id="facultyGenderChart"></canvas>
        </div>
    </div>

    <script>
        // Fetch counts for students using JSTL variables
        const maleStudentCount = Number("${malecount}");
        const femaleStudentCount = Number("${femalecount}");

        // Fetch counts for faculty using JSTL variables
        const maleFacultyCount = Number("${fmalecount}");
        const femaleFacultyCount = Number("${ffemalecount}");

        // Initialize Student Gender Pie Chart
        const studentCtx = document.getElementById('genderChart').getContext('2d');
        const genderChart = new Chart(studentCtx, {
            type: 'pie',
            data: {
                labels: ['Male Students', 'Female Students'],
                datasets: [{
                    label: 'Gender Distribution of Students',
                    data: [maleStudentCount, femaleStudentCount],
                    backgroundColor: ['#36A2EB', '#FF6384'], // Colors for the pie chart
                    hoverOffset: 4
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    }
                }
            }
        });

        // Initialize Faculty Gender Pie Chart
        const facultyCtx = document.getElementById('facultyGenderChart').getContext('2d');
        const facultyGenderChart = new Chart(facultyCtx, {
            type: 'pie',
            data: {
                labels: ['Male Faculty', 'Female Faculty'],
                datasets: [{
                    label: 'Gender Distribution of Faculty',
                    data: [maleFacultyCount, femaleFacultyCount],
                    backgroundColor: ['#FF9F40', '#FFCD56'], // Colors for the pie chart
                    hoverOffset: 4
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    }
                }
            }
        });
    </script>
</body>
</html>
