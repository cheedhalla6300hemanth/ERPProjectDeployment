<%@ include file="admin.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Faculty Courses</title>
    <link rel="stylesheet" type="text/css" href="styletable.css">
</head>
<body>
    <div class="table-container">
        <h3 style="text-align: center;"><u>Courses Allotted</u></h3>
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
                    <th>Course Coordinator</th>
                    <th>Academic Year</th>
                    <th>Room Number</th>
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
                        <td><c:out value="${facultyCourse.course.ccoordinator}" /></td>
                        <td><c:out value="${facultyCourse.course.cacademicyear}" /></td>
                        <td><c:out value="${facultyCourse.roomno}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
