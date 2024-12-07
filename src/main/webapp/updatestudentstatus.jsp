<%@ include file="admin.jsp" %> <!-- Including the main navbar and sidebar -->
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Students</title> 
 <link rel="stylesheet" type="text/css" href="styletable.css">
 <style>
     #myInput {
        width: 92%;
        padding:5px 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-left: 50px;
        
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
    td = tr[i].getElementsByTagName("td")[1];
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
</head>
<body>

    <div class="table-container">
        <h3 style="text-align: center;"><u>View All Students</u></h3>
       <table id="myTable">
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter Student Name">
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
                <th>ACTION</th>
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
                    
                     <td>
       
      <a href='<c:url value="updatestatuss?sid=${student.sid}&sstatus=Accepted"></c:url>'>Accept</a>
      <a href='<c:url value="updatestatuss?sid=${student.sid}&sstatus=Rejected"></c:url>'>Reject</a>
  
           </td>
                    
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
