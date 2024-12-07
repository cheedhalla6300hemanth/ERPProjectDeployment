<%@ include file="admin.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%> <!-- Including the main navbar and sidebar -->
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Faculties</title>
<link rel="stylesheet" type="text/css" href="styletable.css">
<style>
    #myInput {
        width: 118.5%;
        padding:5px 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-left: 5px;
        
        box-sizing: border-box;
    }

</style>
      <script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
</style>
</head>
<body>

    <div class="table-container">
        <h3 style="text-align: center;"><u>View All Faculties</u></h3>
        <table id="myTable">
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter Faculty Name">
            <tr>
                <th>ID</th>
                <th>IMAGE</th>
                <th>NAME</th>
                <th>FATHERNAME</th>
                <th>MOTHERNAME</th>
                <th>GENDER</th>
                <th>DATE OF BIRTH</th>
                <th>DEPARTMENT</th>
                <th>SALARY</th>
                <th>EMAIL</th>
                <th>LOCATION</th>
                <th>CONTACT</th>
                <th>MARITAL STATUS</th>
                <th>RESUME</th>
                <th>LINKEDIN URL</th>
                <th>RELIGION</th>
                <th>STATUS</th>
               
            </tr>
            <c:forEach items="${facultylist}" var="faculty">
                <tr>
                    <td><c:out value="${faculty.fid}"/></td>
                    <td><img src='displayfacultyimage?fid=${faculty.fid}' width="20%" height="20%"></td>
                    
                    <td><c:out value="${faculty.fname}"/></td>
                    <td><c:out value="${faculty.ffathername}"/></td>
                    <td><c:out value="${faculty.fmothername}"/></td>
                    <td><c:out value="${faculty.fgender}"/></td>
                    <td><c:out value="${faculty.fdateofbirth}"/></td>
                    <td><c:out value="${faculty.fdepartment}"/></td>
                    <td><c:out value="${faculty.fsalary}"/></td>
                    <td><c:out value="${faculty.femail}"/></td>
                    <td><c:out value="${faculty.flocation}"/></td>
                    <td><c:out value="${faculty.fcontact}"/></td>
                    <td><c:out value="${faculty.fmaritalstatus}"/></td>
                    <td><a href="displayfacultyresume?fid=${faculty.fid}" target="_new">View</a></td>
                    <td> <a href='<c:url value='${faculty.furl}'></c:url>' target="_new">ClickHere</a></td>
                    <td><c:out value="${faculty.freligion}"/></td>
                    <td><c:out value="${faculty.fstatus}"/></td>
               
            </c:forEach>
        </table>
    </div>
</body>
</html>