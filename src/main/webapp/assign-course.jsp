<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="admin.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Assign Course</title>
    <link rel="stylesheet" type="text/css" href="styleregister.css"> <!-- Include your CSS here -->
</head>
<body>

<div class="content">
    <div class="form-container">
        <h2>
            <img src="images/registericon.png" alt="Assign Course Icon" style="width: 30px">
            Assign Course to Faculty
        </h2>

        <form action="${pageContext.request.contextPath}/assigncourse" method="post">
            <table>
                <tr>
                    <td><label for="fname">Select Faculty:</label></td>
                    <td>
                        <select name="fname" id="fname" required>
                            <option value="">---Select---</option>
                            <c:forEach var="faculty" items="${facultyList}">
                                <option value="${faculty.fname}">${faculty.fname}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><label for="ctitle">Select Course:</label></td>
                    <td>
                        <select name="ctitle" id="ctitle" required>
                            <option value="">---Select---</option>
                            <c:forEach var="course" items="${courseList}">
                                <option value="${course.ctitle}">${course.ctitle} (${course.ccode})</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                
                <tr>
                <td><label for="ctype">Select Course Type</label></td>
                <td>
                    <select id="ctype" name="ctype" required>
                        <option value="">---Select---</option>
                        <option value="LECTURE">Lecture</option>
                        <option value="TUTORIAL">Tutorial</option>
                        <option value="PRACTICAL">Practical</option>
                        <option value="SKILL">Skill</option>
                    </select>
                </td>
            </tr>


                <tr>
                    <td><label for="section">Section:</label></td>
                    <td><input type="text" name="section" id="section" required></td>
                </tr>
                
                 <tr>
                    <td><label for="roomno">Room no:</label></td>
                    <td><input type="text" name="roomno" id="roomno" required></td>
                </tr>

                <tr>
                    <td colspan="2" class="button-container">
                        <button type="submit">Assign</button>
                    </td>
                </tr>
            </table>
        </form>
         <p style="color: red;">${message}</p> 
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 ERP System. All rights reserved.</p>
</footer>

</body>
</html>
