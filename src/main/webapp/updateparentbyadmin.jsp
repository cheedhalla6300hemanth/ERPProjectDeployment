<%@ include file="admin.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Parent</title>
    <link rel="stylesheet" type="text/css" href="styleregister.css">
</head>
<body>

    <h4 align="center" style="color:red">
        <c:out value="${message}"></c:out>
    </h4>

    <div class="content">
    <div class="form-container">
    <h2><img src="images/registericon.png" alt="Parent Profile Picture" style="width: 30px"> 
   Parent Update</h2>
        <form method="post" action="updateParent">
            <table>
                <tr>
                    <td><label for="pid">Parent ID</label></td>
                    <td><input type="number" id="pid" name="pid" readonly value="${parent.pid}" required/></td>
                </tr>
                <tr>
                    <td><label for="semail">Student Email</label></td>
                    <td><input type="email" id="semail" name="semail" readonly value="${parent.semail}"  required/></td>
                </tr>
                <tr>
                    <td><label for="scontact">Student Contact</label></td>
                    <td><input type="text" id="scontact" name="scontact" readonly value="${parent.scontact}"  required/></td>
                </tr>
                <tr>
                    <td><label for="pusername">Username</label></td>
                    <td><input type="text" id="pusername" name="pusername" value="${parent.pusername}"  required/></td>
                </tr>
                <tr>
                    <td><label for="ppassword">Password</label></td>
                    <td><input type="password" id="ppassword" name="ppassword" value="${parent.ppassword}"  required/></td>
                </tr>
                <tr>
                    <td><label>Select Gender</label></td>
                    <td>
                        <select id="pgender" name="pgender" required>
                            <option value="">---Select---</option>
                           <option value="MALE" ${parent.pgender == 'MALE' ? 'selected' : ''}>MALE</option>
                        <option value="FEMALE" ${parent.pgender == 'FEMALE' ? 'selected' : ''}>FEMALE</option>
                        <option value="OTHERS" ${parent.pgender == 'OTHERS' ? 'selected' : ''}>OTHERS</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="pdateofbirth">Date of Birth</label></td>
                    <td><input type="date" id="pdateofbirth" name="pdateofbirth" value="${parent.pdateofbirth}" required/></td>
                </tr>
                <tr>
                    <td><label for="prelation">Relation to Student</label></td>
                    <td><input type="text" id="prelation" name="prelation" value="${parent.prelation}"  required/></td>
                </tr>
                <tr>
                    <td><label for="paddress">Parent Address</label></td>
                    <td><input type="text" id="paddress" name="paddress" value="${parent.paddress}"  required/></td>
                </tr>
                 <tr>
                    <td><label for="pcontact"> Parent Contact</label></td>
                    <td><input type="text" id="pcontact" name="pcontact" value="${parent.pcontact}"  required/></td>
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
