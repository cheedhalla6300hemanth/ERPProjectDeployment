	<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parent Registration</title>

    <!-- Custom Stylesheet -->
    <link rel="stylesheet" type="text/css" href="styleregister.css">
</head>
<body>
<div class="content">
    <div class="form-container">
        <h2>
            <img src="images/registericon.png" alt="Parent Profile Picture" style="width: 30px">
            Parent Registration
        </h2>
        <form action="checkstudentpresent" method="post" enctype="multipart/form-data">
            <table>
                 <tr>
                <td><label for="pimage">Choose Image</label></td>
                <td><input type="file" id="pimage" name="pimage" required/></td>
            </tr>
                <tr>
                    <td><label for="semail">Student Email</label></td>
                    <td><input type="email" id="semail" name="semail" maxlength="50" required/></td>
                </tr>
                <tr>
                    <td><label for="scontact">Student Contact</label></td>
                    <td><input type="tel" id="scontact" name="scontact" maxlength="20" required/></td>
                </tr>
                <tr>
                    <td><label for="pusername">Parent Username</label></td>
                    <td><input type="text" id="pusername" name="pusername" maxlength="50" required/></td>
                </tr>
                <tr>
                    <td><label for="ppassword">Parent Password</label></td>
                    <td><input type="password" id="ppassword" name="ppassword" maxlength="50" required/></td>
                </tr>
                <tr>
                    <td><label for="pgender">Parent Gender</label></td>
                    <td>
                        <select id="pgender" name="pgender" required>
                            <option value="">---Select---</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="pdateofbirth">Parent Date of Birth</label></td>
                    <td><input type="date" id="pdateofbirth" name="pdateofbirth" required/></td>
                </tr>
                <tr>
                    <td><label for="prelation">Parent Relation</label></td>
                    <td><input type="text" id="prelation" name="prelation" maxlength="50" required/></td>
                </tr>
                <tr>
                    <td><label for="paddress">Parent Address</label></td>
                    <td><input type="text" id="paddress" name="paddress" maxlength="50" required/></td>
                </tr>
                <tr>
                    <td><label for="pcontact">Parent Contact</label></td>
                    <td><input type="tel" id="pcontact" name="pcontact" maxlength="20" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Register"/>
                        <input type="reset" value="Clear"/>
                    </td>
                      
                </tr>
                   
            </table>
                <h5 align="center" style="color:red"><c:out value="${message}"></c:out></h5>
        </form>
    </div>
</div>


</body>
</html>
