<%@ include file="admin.jsp" %>
<body>
    <div class="content">
        <h2 align="center">
            View Timetable
            <link rel="stylesheet" type="text/css" href="styletable.css">
        </h2>

        <table class="timetable">
            <thead>
                <tr>
                    <th>Day/Hour</th>
                    <c:forEach var="hour" begin="1" end="16">
                        <th>Hour ${hour}</th>
                    </c:forEach>
                </tr>
            </thead>
            <tbody>
               
                <c:forEach var="day" items="Monday,Tuesday, Wednesday, Thursday, Friday, Saturday">
                    <tr>
                        <!-- Display the day name -->
                        <td>${day}</td>

                        <!-- Iterate over the hours for each day -->
                        <c:forEach var="hour" begin="1" end="16">
	                                    <td>${timetable[day][hour] != null ? timetable[day][hour] : '--	'}</td>
	                                </c:forEach>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 ERP System. All rights reserved.</p>
    </footer>
</body>
