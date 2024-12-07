<%@ include file="admin.jsp" %> <!-- Including the main navbar and sidebar -->
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Courses</title> 
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
</head>
<body>

    <div class="table-container">
        <h3 style="text-align: center;"><u>View All Courses</u></h3>
        <table id="myTable">
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter Course Name">
              <tr>
                <th>Course ID</th>
                <th>Course Code</th>
                <th>Course Title</th>
                <th>Course Program</th>
                <th>Academic Year</th>
                <th>Semester</th>
                <th>Course Year</th>
                <th>Credits</th>
                <th>Course Coordinator</th>
                <th>Branch</th>
                
                <th>Delete</th>
            </tr>
            <c:forEach items="${courselist}" var="course">
                <tr>
                   <td><c:out value="${course.cid}"/></td>
                    <td><c:out value="${course.ccode}"/></td>
                    <td><c:out value="${course.ctitle}"/></td>
                    <td><c:out value="${course.cprogram}"/></td>
                    <td><c:out value="${course.cacademicyear}"/></td>
                    <td><c:out value="${course.csemester}"/></td>
                    <td><c:out value="${course.cyear}"/></td>
                    <td><c:out value="${course.ccredits}"/></td>
                    <td><c:out value="${course.ccoordinator}"/></td>
                    <td><c:out value="${course.cbranch}"/></td>
                   
                   <td>
    <a href='<c:url value="deletec?id=${course.cid}"/>'onclick="return confirm('Are you sure you want to delete this course?');">
       Delete
    </a>
</td>

                </tr>
            </c:forEach>
        </table>
    </div>
</body>

</html>
