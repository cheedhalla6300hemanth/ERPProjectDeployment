<%@ include file="faculty.jsp" %> <!-- Including the main navbar and sidebar -->
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Students</title> 
 <link rel="stylesheet" type="text/css" href="styletable.css">
</head>
<body>

    <div class="table-container">
        <h3 style="text-align: center;"><u>View All Students</u></h3>
        <table>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>FATHERNAME</th>
                <th>MOTHERNAME</th>
                <th>GENDER</th>
                <th>DATE OF BIRTH</th>
                <th>DEPARTMENT</th>
                <th>EMAIL</th>
                <th>LOCATION</th>
                <th>CONTACT</th>
                <th>RELIGION</th>
                <th>STATUS</th>
            </tr>
            <c:forEach items="${studentlist}" var="student">
                <tr>
                    <td><c:out value="${student.sid}"/></td>
                    <td><c:out value="${student.sname}"/></td>
                    <td><c:out value="${student.sfathername}"/></td>
                    <td><c:out value="${student.smothername}"/></td>
                    <td><c:out value="${student.sgender}"/></td>
                    <td><c:out value="${student.sdateofbirth}"/></td>
                    <td><c:out value="${student.sdepartment}"/></td>
                    <td><c:out value="${student.semail}"/></td>
                    <td><c:out value="${student.slocation}"/></td>
                    <td><c:out value="${student.scontact}"/></td>
                    <td><c:out value="${student.sreligion}"/></td>
                    <td><c:out value="${student.sstatus}"/></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <!-- Footer -->
    <footer>
        <p>&copy; 2024 ERP System. All rights reserved.</p>
    </footer>
</body>
</html>
