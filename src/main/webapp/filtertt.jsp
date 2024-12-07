<%@ include file="admin.jsp" %>

<body>
<div class="content">
    <div class="form-container">
        <h2 align="center">Filter Timetable <link rel="stylesheet" type="text/css" href="styleregister.css"></h2>
        <form action="filtertimetable" method="get">
            <table align="center">
                <tr>
                    <td><label for="ttacademicyear">Academic Year:</label></td>
                    <td>
                        <select id="ttacademicyear" name="ttacademicyear" required>
                            <option value="">---Select---</option>
                            <option value="2022-2023">2022-2023</option>
                            <option value="2023-2024">2023-2024</option>
                            <option value="2024-2025">2024-2025</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="ttyear">Year:</label></td>
                    <td>
                        <select id="ttyear" name="ttyear" required>
                            <option value="">---Select---</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="ttsemester">Semester:</label></td>
                    <td>
                        <select id="ttsemester" name="ttsemester" required>
                            <option value="">---Select---</option>
                            <option value="ODD">ODD</option>
                            <option value="EVEN">EVEN</option>
                            <option value="SUMMER TERM">SUMMER TERM</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="ttcbranch">Branch:</label></td>
                    <td>
                        <select id="ttcbranch" name="ttcbranch" required>
                            <option value="">---Select---</option>
                            <option value="CSE">CSE</option>
                            <option value="ECE">ECE</option>
                            <option value="EEE">EEE</option>
                            <option value="MECH">MECH</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Filter Timetable">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
