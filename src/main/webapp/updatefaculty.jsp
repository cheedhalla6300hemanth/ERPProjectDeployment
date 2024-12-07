<%@ include file="faculty.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Faculty</title>
    <link rel="stylesheet" type="text/css" href="styleregister.css">
</head>
<body>

    <h4 align="center" style="color:red">
        <c:out value="${message}"></c:out>
    </h4>

    <div class="content">
        <div class="form-container">
            <h2>
                <img src="images/registericon.png" alt="Faculty Profile Picture" style="width: 30px"> 
                Faculty Update
            </h2>
            <form method="post" action="updatefacultyprofile">
                <table>
                    <tr>
                        <td><label for="fid">Faculty ID</label></td>
                        <td><input type="number" id="fid" name="fid" readonly value="<%= faculty.getFid() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fname">Enter Name</label></td>
                        <td><input type="text" id="fname" name="fname" value="<%= faculty.getFname() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="ffathername">Father's Name</label></td>
                        <td><input type="text" id="ffathername" name="ffathername" value="<%= faculty.getFfathername() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fmothername">Mother's Name</label></td>
                        <td><input type="text" id="fmothername" name="fmothername" value="<%= faculty.getFmothername() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label>Select Gender</label></td>
                        <td>
                            <select id="fgender" name="fgender" required>
                                <option value="">---Select---</option>
                                <option value="MALE" <%= faculty.getFgender().equals("MALE") ? "selected" : "" %>>MALE</option>
                                <option value="FEMALE" <%= faculty.getFgender().equals("FEMALE") ? "selected" : "" %>>FEMALE</option>
                                <option value="OTHERS" <%= faculty.getFgender().equals("OTHERS") ? "selected" : "" %>>OTHERS</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="fdateofbirth">Enter Date of Birth</label></td>
                        <td><input type="date" id="fdateofbirth" name="fdateofbirth" value="<%= faculty.getFdateofbirth() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fdepartment">Select Department</label></td>
                        <td>
                            <select id="fdepartment" name="fdepartment" required>
                                <option value="">---Select---</option>
                                <option value="CSE_H" <%= faculty.getFdepartment().equals("CSE_H") ? "selected" : "" %>>CSE_H</option>
                                <option value="ECE" <%= faculty.getFdepartment().equals("ECE") ? "selected" : "" %>>ECE</option>
                                <option value="EEE" <%= faculty.getFdepartment().equals("EEE") ? "selected" : "" %>>EEE</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="fsalary">Enter Salary</label></td>
                        <td><input type="number" id="fsalary" name="fsalary" value="<%= faculty.getFsalary() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="femail">Enter Email ID</label></td>
                        <td><input type="email" id="femail" name="femail" readonly value="<%= faculty.getFemail() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fpassword">Enter Password</label></td>
                        <td><input type="password" id="fpassword" name="fpassword" value="<%= faculty.getFpassword() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="flocation">Enter Location</label></td>
                        <td><input type="text" id="flocation" name="flocation" value="<%= faculty.getFlocation() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fcontact">Enter Contact</label></td>
                        <td><input type="number" id="fcontact" name="fcontact" value="<%= faculty.getFcontact() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fmaritalstatus">Marital Status</label></td>
                        <td>
                            <select id="fmaritalstatus" name="fmaritalstatus" required>
                                <option value="">---Select---</option>
                                <option value="Single" <%= faculty.getFmaritalstatus().equals("Single") ? "selected" : "" %>>Single</option>
                                <option value="Married" <%= faculty.getFmaritalstatus().equals("Married") ? "selected" : "" %>>Married</option>
                                <option value="Divorced" <%= faculty.getFmaritalstatus().equals("Divorced") ? "selected" : "" %>>Divorced</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="freligion">Enter Religion</label></td>
                        <td><input type="text" id="freligion" name="freligion" value="<%= faculty.getFreligion() %>" required/></td>
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
</body>
</html>
