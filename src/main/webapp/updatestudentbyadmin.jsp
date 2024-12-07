<%@ include file="admin.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<body>
<div class="content">
   <div class="form-container">
   <h2>
     <img src="images/registericon.png" alt="Admin Profile Picture" style="width: 30px"> 
     Update Student Details
     <link rel="stylesheet" type="text/css" href="styleregister.css">
   </h2>
    <form action="updateStudent" method="post">
        <table>
            <tr>
                <td><label for="sid">Student ID</label></td>
                <td><input type="text" id="sid" name="sid" value="${student.sid}" readonly/></td>
            </tr>
            <tr>
                <td><label for="sname">Enter Name</label></td>
                <td><input type="text" id="sname" name="sname" value="${student.sname}" required/></td>
            </tr>
            <tr>
                <td><label for="sfathername">Father's Name</label></td>
                <td><input type="text" id="sfathername" name="sfathername" value="${student.sfathername}" required/></td>
            </tr>
            <tr>
                <td><label for="smothername">Mother's Name</label></td>
                <td><input type="text" id="smothername" name="smothername" value="${student.smothername}" required/></td>
            </tr>
            <tr>
                <td><label for="sgender">Select Gender</label></td>
                <td>
                    <select id="sgender" name="sgender" required>
                        <option value="">---Select---</option>
                        <option value="MALE" ${student.sgender == 'MALE' ? 'selected' : ''}>MALE</option>
                        <option value="FEMALE" ${student.sgender == 'FEMALE' ? 'selected' : ''}>FEMALE</option>
                        <option value="OTHERS" ${student.sgender == 'OTHERS' ? 'selected' : ''}>OTHERS</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="sdateofbirth">Enter Date of Birth</label></td>
                <td><input type="date" id="sdateofbirth" name="sdateofbirth" value="${student.sdateofbirth}" required/></td>
            </tr>
            <tr>
                <td><label for="sdepartment">Select Department</label></td>
                <td>
                    <select id="sdepartment" name="sdepartment" required>
                        <option value="">---Select---</option>
                        <option value="CSE_H" ${student.sdepartment == 'CSE_H' ? 'selected' : ''}>CSE_H</option>
                        <option value="ECE" ${student.sdepartment == 'ECE' ? 'selected' : ''}>ECE</option>
                        <option value="EEE" ${student.sdepartment == 'EEE' ? 'selected' : ''}>EEE</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="semail">Enter Email ID</label></td>
                <td><input type="email" id="semail" name="semail" value="${student.semail}" readonly/></td>
            </tr>
            <tr>
                <td><label for="spassword">Enter Password</label></td>
                <td><input type="password" id="spassword" name="spassword" value="${student.spassword}" required/></td>
            </tr>
            <tr>
                <td><label for="slocation">Enter Location</label></td>
                <td><input type="text" id="slocation" name="slocation" value="${student.slocation}" required/></td>
            </tr>
            <tr>
                <td><label for="scontact">Enter Contact</label></td>
                <td><input type="number" id="scontact" name="scontact" value="${student.scontact}" required/></td>
            </tr>
            <tr>
                <td><label for="sreligion">Enter Religion</label></td>
                <td><input type="text" id="sreligion" name="sreligion" value="${student.sreligion}" required/></td>
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
