<%@ include file="admin.jsp" %> <!-- Including the main navbar and sidebar -->
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Faculty Course</title>
    <link rel="stylesheet" type="text/css" href="styletable.css"> <!-- Reference to external CSS -->
</head>
<body>
    <div class="table-container">
        <h3 style="text-align: center;"><u>Delete Faculty Course Assignment</u></h3>
        <table>
            <thead>
                <tr>
                    <th>Faculty Name</th>
                    <th>Department</th>
                    <th>Course Title</th>
                    <th>Course Code</th>
                    <th>Credits</th>
                    <th>Type</th>
                    <th>Section</th>
                    <th>Academic Year</th>
                    <th>Room Number</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="facultyCourse" items="${facultyCourseList}">
                    <tr>
                        <td><c:out value="${facultyCourse.faculty.fname}" /></td>
                        <td><c:out value="${facultyCourse.faculty.fdepartment}" /></td>
                        <td><c:out value="${facultyCourse.course.ctitle}" /></td>
                        <td><c:out value="${facultyCourse.course.ccode}" /></td>
                        <td><c:out value="${facultyCourse.course.ccredits}" /></td>
                        <td><c:out value="${facultyCourse.ctype}" /></td>
                        <td><c:out value="${facultyCourse.section}" /></td>
                        <td><c:out value="${facultyCourse.course.cacademicyear}" /></td>
                        <td><c:out value="${facultyCourse.roomno}" /></td>
                        <td>
                            <a href="deleteasso?mid=${facultyCourse.mappingid}" 
                               onclick="return confirm('Are you sure you want to delete this?');">
                                Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
