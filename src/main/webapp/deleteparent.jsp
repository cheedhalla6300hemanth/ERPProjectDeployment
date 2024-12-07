<%@ include file="admin.jsp" %> <!-- Including the main navbar and sidebar -->
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Parents</title> 
    <link rel="stylesheet" type="text/css" href="styletable.css">
</head>
<body>

    <div class="table-container">
        <h3 style="text-align: center;"><u>View All Parents</u></h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Student Email</th>
                <th>Student Contact</th>
                <th>Parent Username</th>
                <th>Parent Password</th>
                <th>Parent Gender</th>
                <th>Date of Birth</th>
                <th>Relation</th>
                <th>Address</th>
                <th>Parent Contact</th>
                <th>Delete</th>
            </tr>
            <c:forEach items="${parentlist}" var="parent">
                <tr>
                    <td><c:out value="${parent.pid}"/></td>
                    <td><c:out value="${parent.semail}"/></td>
                    <td><c:out value="${parent.scontact}"/></td>
                    <td><c:out value="${parent.pusername}"/></td>
                    <td><c:out value="${parent.ppassword}"/></td>
                    <td><c:out value="${parent.pgender}"/></td>
                    <td><c:out value="${parent.pdateofbirth}"/></td>
                    <td><c:out value="${parent.prelation}"/></td>
                    <td><c:out value="${parent.paddress}"/></td>
                    <td><c:out value="${parent.pcontact}"/></td>
                     <td>
             <a href='<c:url value="deletep?id=${parent.pid}"></c:url>'>Delete</a>
           </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
