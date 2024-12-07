<%@ include file="admin.jsp" %> <!-- Including the main navbar and sidebar -->
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Parents</title> 
    <link rel="stylesheet" type="text/css" href="styletable.css">
    <style>
     #myInput {
        width: 90%;
        padding:5px 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-left: 60px;
        
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
    td = tr[i].getElementsByTagName("td")[4];
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
        <h3 style="text-align: center;"><u>View All Parents</u></h3>
        
        <table id="myTable">
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter Parent Name">
            <tr>
                <th>ID</th>
                <th>IMAGE</th>
                <th>Student Email</th>
                <th>Student Contact</th>
                <th>Parent Username</th>
                <th>Parent Password</th>
                <th>Parent Gender</th>
                <th>Date of Birth</th>
                <th>Relation</th>
                <th>Address</th>
                <th>Parent Contact</th>
            </tr>
            <c:forEach items="${parentlist}" var="parent">
                <tr>
                    <td><c:out value="${parent.pid}"/></td>
                    <td><img src='displayparentimage?pid=${parent.pid}' width="20%" height="20%"></td>
                    <td><c:out value="${parent.semail}"/></td>
                    <td><c:out value="${parent.scontact}"/></td>
                    <td><c:out value="${parent.pusername}"/></td>
                    <td><c:out value="${parent.ppassword}"/></td>
                    <td><c:out value="${parent.pgender}"/></td>
                    <td><c:out value="${parent.pdateofbirth}"/></td>
                    <td><c:out value="${parent.prelation}"/></td>
                    <td><c:out value="${parent.paddress}"/></td>
                    <td><c:out value="${parent.pcontact}"/></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
