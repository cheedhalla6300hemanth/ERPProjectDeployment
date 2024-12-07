<%@ include file="admin.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<body>
<div class="content">
   <div class="form-container">
   <h2>
     <img src="images/registericon.png" alt="Course Update Icon" style="width: 30px"> 
     Update Course Details
     <link rel="stylesheet" type="text/css" href="styleregister.css">
   </h2>
   
   <form action="updateCourse" method="post" enctype="multipart/form-data">
       <table>
           <tr>
               <td><label for="cid">Course ID</label></td>
               <td><input type="text" id="cid" name="cid" value="${course.cid}" readonly/></td>
           </tr>
           <tr>
               <td><label for="ccode">Course Code</label></td>
               <td><input type="text" id="ccode" name="ccode" value="${course.ccode}" required/></td>
           </tr>
           <tr>
               <td><label for="ctitle">Course Title</label></td>
               <td><input type="text" id="ctitle" name="ctitle" value="${course.ctitle}" required/></td>
           </tr>
           <tr>
               <td><label for="cbranch">Course Branch</label></td>
               <td>
                   <select id="cbranch" name="cbranch" required>
                       <option value="">---Select---</option>
                       <option value="CSE" ${course.cbranch == 'CSE' ? 'selected' : ''}>CSE</option>
                       <option value="ECE" ${course.cbranch == 'ECE' ? 'selected' : ''}>ECE</option>
                       <option value="EEE" ${course.cbranch == 'EEE' ? 'selected' : ''}>EEE</option>
                       <option value="MECH" ${course.cbranch == 'MECH' ? 'selected' : ''}>MECH</option>
                   </select>
               </td>
           </tr>
           <tr>
               <td><label for="cprogram">Course Program</label></td>
               <td>
                   <select id="cprogram" name="cprogram" required>
                       <option value="">---Select---</option>
                       <option value="BTECH" ${course.cprogram == 'BTECH' ? 'selected' : ''}>BTECH</option>
                       <option value="MTECH" ${course.cprogram == 'MTECH' ? 'selected' : ''}>MTECH</option>
                       <option value="MBA" ${course.cprogram == 'MBA' ? 'selected' : ''}>MBA</option>
                       <option value="BBA" ${course.cprogram == 'BBA' ? 'selected' : ''}>BBA</option>
                       <option value="LLB" ${course.cprogram == 'LLB' ? 'selected' : ''}>LLB</option>
                   </select>
               </td>
           </tr>
           <tr>
               <td><label for="cacademicyear">Academic Year</label></td>
               <td>
                   <select id="cacademicyear" name="cacademicyear" required>
                       <option value="">---Select---</option>
                       <option value="2022-23" ${course.cacademicyear == '2022-23' ? 'selected' : ''}>2022-23</option>
                       <option value="2023-24" ${course.cacademicyear == '2023-24' ? 'selected' : ''}>2023-24</option>
                       <option value="2024-25" ${course.cacademicyear == '2024-25' ? 'selected' : ''}>2024-25</option>
                   </select>
               </td>
           </tr>
           <tr>
               <td><label for="csemester">Course Semester</label></td>
               <td>
                   <select id="csemester" name="csemester" required>
                       <option value="">---Select---</option>
                       <option value="ODD" ${course.csemester == 'ODD' ? 'selected' : ''}>ODD</option>
                       <option value="EVEN" ${course.csemester == 'EVEN' ? 'selected' : ''}>EVEN</option>
                       <option value="SUMMER TERM" ${course.csemester == 'SUMMER TERM' ? 'selected' : ''}>SUMMER TERM</option>
                   </select>
               </td>
           </tr>
           <tr>
               <td><label for="cyear">Course Year</label></td>
               <td><input type="number" id="cyear" name="cyear" value="${course.cyear}" required/></td>
           </tr>
           <tr>
               <td><label for="ccredits">Course Credits</label></td>
               <td><input type="number" id="ccredits" name="ccredits" value="${course.ccredits}" required/></td>
           </tr>
           
           <tr>
               <td><label for="ccoordinator">Course Coordinator</label></td>
               <td><input type="text" id="ccoordinator" name="ccoordinator" value="${course.ccoordinator}" required/></td>
           </tr>
          
           <tr>
               <td colspan="2" class="button-container">
                   <input type="submit" value="Update"/>
                   <input type="reset" value="Clear"/>
               </td>
           </tr>
       </table>
   </form>
</div>
</div>

<footer>
    <p>&copy; 2024 ERP System. All rights reserved.</p>
</footer>
</body>
