<%@ include file="admin.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Faculty</title>
    <link rel="stylesheet" type="text/css" href="styleregister.css">
</head>
<body>
    <div class="content">
        <div class="form-container">
            <h2>
                <img src="images/registericon.png" alt="Faculty Profile Picture" style="width: 30px"> 
                Faculty Update
            </h2>
            <form method="post" action="updateFaculty">
                <table>
                    <tr>
                        <td><label for="fid">Faculty ID</label></td>
                        <td><input type="number" id="fid" name="fid" readonly value="${faculty.fid}" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fname">Enter Name</label></td>
                        <td><input type="text" id="fname" name="fname" value="${faculty.fname}" required/></td>
                    </tr>
                    <tr>
                        <td><label for="ffathername">Father's Name</label></td>
                        <td><input type="text" id="ffathername" name="ffathername" value="${faculty.ffathername}" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fmothername">Mother's Name</label></td>
                        <td><input type="text" id="fmothername" name="fmothername" value="${faculty.fmothername}" required/></td>
                    </tr>
                    <tr>
                        <td><label>Select Gender</label></td>
                        <td>
                            <select id="fgender" name="fgender" required>
                                <option value="">---Select---</option>
                                <option value="MALE" ${faculty.fgender == 'MALE' ? 'selected' : ''}>MALE</option>
                                <option value="FEMALE" ${faculty.fgender == 'FEMALE' ? 'selected' : ''}>FEMALE</option>
                                <option value="OTHERS" ${faculty.fgender == 'OTHERS' ? 'selected' : ''}>OTHERS</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="fdateofbirth">Enter Date of Birth</label></td>
                        <td><input type="date" id="fdateofbirth" name="fdateofbirth" value="${faculty.fdateofbirth}" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fdepartment">Select Department</label></td>
                        <td>
                            <select id="fdepartment" name="fdepartment" required>
                                <option value="">---Select---</option>
                                <option value="CSE_H" ${faculty.fdepartment == 'CSE_H' ? 'selected' : ''}>CSE_H</option>
                                <option value="ECE" ${faculty.fdepartment == 'ECE' ? 'selected' : ''}>ECE</option>
                                <option value="EEE" ${faculty.fdepartment == 'EEE' ? 'selected' : ''}>EEE</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="fsalary">Enter Salary</label></td>
                        <td><input type="number" id="fsalary" name="fsalary" value="${faculty.fsalary}" required/></td>
                    </tr>
                    <tr>
                        <td><label for="femail">Enter Email ID</label></td>
                        <td><input type="email" id="femail" name="femail" readonly value="${faculty.femail}" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fpassword">Enter Password</label></td>
                        <td><input type="password" id="fpassword" name="fpassword" value="${faculty.fpassword}" required/></td>
                    </tr>
                    <tr>
                        <td><label for="flocation">Enter Location</label></td>
                        <td><input type="text" id="flocation" name="flocation" value="${faculty.flocation}" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fcontact">Enter Contact</label></td>
                        <td><input type="number" id="fcontact" name="fcontact" value="${faculty.fcontact}" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fmaritalstatus">Marital Status</label></td>
                        <td>
                            <select id="fmaritalstatus" name="fmaritalstatus" required>
                                <option value="">---Select---</option>
                                <option value="Single" ${faculty.fmaritalstatus == 'Single' ? 'selected' : ''}>Single</option>
                                <option value="Married" ${faculty.fmaritalstatus == 'Married' ? 'selected' : ''}>Married</option>
                                <option value="Divorced" ${faculty.fmaritalstatus == 'Divorced' ? 'selected' : ''}>Divorced</option>
                            </select>
                        </td>
                    </tr>
                     <tr>
                        <td><label for="furl">Enter Url</label></td>
                        <td><input type="text" id="furl" name="furl" value="${faculty.furl}" required/></td>
                    </tr>
                    <tr>
                        <td><label for="freligion">Enter Religion</label></td>
                        <td><input type="text" id="freligion" name="freligion" value="${faculty.freligion}" required/></td>
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
</html>
