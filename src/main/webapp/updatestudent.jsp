<%@ include file="student.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
</head>
<body>
   

    <h4 align="center" style="color:red">
        <c:out value="${message}"></c:out>
    </h4>

    <div class="content">
    <div class="form-container">
    <h2><img src="images/registericon.png" alt="Admin Profile Picture" style="width: 30px"> 
   Student Update<link rel="stylesheet" type="text/css" href="styleregister.css"></h2>
        <form method="post" action="updatestudentprofile">
            <table>
            
                <tr>
                    <td><label for="sid">Student ID</label></td>
                    <td><input type="number" id="sid" name="sid" readonly value="<%= student.getSid() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="sname">Enter Name</label></td>
                    <td><input type="text" id="sname" name="sname" value="<%= student.getSname() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="sfathername">Father's Name</label></td>
                    <td><input type="text" id="sfathername" name="sfathername" value="<%= student.getSfathername() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="smothername">Mother's Name</label></td>
                    <td><input type="text" id="smothername" name="smothername" value="<%= student.getSmothername() %>" required/></td>
                </tr>
                <tr>
                    <td><label>Select Gender</label></td>
                    <td>
                        <select id="sgender" name="sgender" required>
                            <option value="">---Select---</option>
                            <option value="MALE" <%= student.getSgender().equals("MALE") ? "selected" : "" %>>MALE</option>
                            <option value="FEMALE" <%= student.getSgender().equals("FEMALE") ? "selected" : "" %>>FEMALE</option>
                            <option value="OTHERS" <%= student.getSgender().equals("OTHERS") ? "selected" : "" %>>OTHERS</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="sdateofbirth">Enter Date of Birth</label></td>
                    <td><input type="date" id="sdateofbirth" name="sdateofbirth" value="<%= student.getSdateofbirth() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="sdepartment">Select Department</label></td>
                    <td>
                        <select id="sdepartment" name="sdepartment" required>
                            <option value="">---Select---</option>
                            <option value="CSE_H" <%= student.getSdepartment().equals("CSE_H") ? "selected" : "" %>>CSE_H</option>
                            <option value="ECE" <%= student.getSdepartment().equals("ECE") ? "selected" : "" %>>ECE</option>
                            <option value="EEE" <%= student.getSdepartment().equals("EEE") ? "selected" : "" %>>EEE</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="semail">Enter Email ID</label></td>
                    <td><input type="email" id="semail" name="semail" readonly value="<%= student.getSemail() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="spassword">Enter Password</label></td>
                    <td><input type="password" id="spassword" name="spassword" value="<%= student.getSpassword() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="slocation">Enter Location</label></td>
                    <td><input type="text" id="slocation" name="slocation" value="<%= student.getSlocation() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="scontact">Enter Contact</label></td>
                    <td><input type="number" id="scontact" name="scontact" value="<%= student.getScontact() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="sreligion">Enter Religion</label></td>
                    <td><input type="text" id="sreligion" name="sreligion" value="<%= student.getSreligion() %>" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Update"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div></div>
</body>
</html>
