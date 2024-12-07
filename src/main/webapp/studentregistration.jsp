<%@ include file="admin.jsp" %>
<head> <style>
        .strength {
            font-weight: bold;
        }
        .weak {
            color: red;
        }
        .medium {
            color: orange;
        }
        .strong {
            color: green;
        }
    </style></head>
<body>
<div class="content">
   <div class="form-container">
   <h2>
     <img src="images/registericon.png" alt="Admin Profile Picture" style="width: 30px"> 
   Student Registration<link rel="stylesheet" type="text/css" href="styleregister.css"></h2>
    <form action="insertstudent" method="post" enctype="multipart/form-data" onsubmit="validateForm(event)">
        <table>

            <tr>
                <td><label for="simage">Choose Image</label></td>
                <td><input type="file" id="simage" name="simage" required/></td>
            </tr>
            <tr>
                <td><label for="sname">Enter Student Name</label></td>
                <td><input type="text" id="sname" name="sname" required/></td>
            </tr>
            <tr>
                <td><label for="sfathername">Father's Name</label></td>
                <td><input type="text" id="sfathername" name="sfathername" required/></td>
            </tr>
            <tr>
                <td><label for="smothername">Mother's Name</label></td>
                <td><input type="text" id="smothername" name="smothername" required/></td>
            </tr>
            <tr>
           <tr>
                <td><label for="sgender">Select Gender</label></td>
                <td>
                    <select id="sgender" name="sgender" required>
                        <option value="">---Select---</option>
                        <option value="MALE">MALE</option>
                        <option value="FEMALE">FEMALE</option>
                        <option value="OTHERS">OTHERS</option>
                    </select>
                </td>
            </tr>
            <tr>
    <td><label for="sdateofbirth">Enter Date of Birth</label></td>
    <td>
        <input type="date" id="sdateofbirth" name="sdateofbirth" required
               onchange="validateDOB(this)"
               title="Age must be between 18 and 60 years."/>
    </td>
</tr>
                <td><label for="sdepartment">Select Department</label></td>
                <td>
                    <select id="sdepartment" name="sdepartment" required>
                        <option value="">---Select---</option>
                        <option value="CSE_H">CSE_H</option>
                        <option value="ECE">ECE</option>
                        <option value="EEE">EEE</option>
                    </select>
                </td>
            </tr>
            <tr>
             <tr>
                <td><label for="semail">Enter Email ID</label></td>
                <td>
                    <input type="email" id="semail" name="semail" required oninput="validateEmail()"/>
                    <span id="emailError" style="color: red;"></span>
                </td>
            </tr>
   
            <tr>
                <td><label for="spassword">Enter Password</label></td>
                <td>
                    <input type="password" id="spassword" name="spassword" required oninput="evaluatePasswordStrength()"/>
                    <span id="passwordStrength" class="strength"></span>
                </td>
            </tr>
            <tr>
                <td><label for="slocation">Enter Location</label></td>
                <td><input type="text" id="slocation" name="slocation" required/></td>
            </tr>
           <tr>
                <td><label for="scontact">Enter Contact</label></td>
                <td>
                    <input type="tel" id="scontact" name="scontact" required oninput="validateContact()"/>
                    <span id="contactError" style="color: red;"></span>
                </td>
            </tr>
            <tr>
                <td><label for="sreligion">Enter Religion</label></td>
                <td><input type="text" id="sreligion" name="sreligion" required/></td>
            </tr>
           
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="Register"/>
                    <input type="reset" value="Clear"/>
                </td>
            </tr>
        </table>
    </form>
</div>

</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 ERP System. All rights reserved.</p>
</footer>
<script>
    function validateDOB(input) {
        const dob = new Date(input.value);
        const today = new Date();
        const age = today.getFullYear() - dob.getFullYear();
        const m = today.getMonth() - dob.getMonth();
        if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) {
            age--;
        }
        if (age < 18 || age > 60) {
            alert("Age must be between 18 and 60 years.");
            input.value = ""; // Reset the input if the age is not valid
        }
    }
    function validateEmail() {
        const emailInput = document.getElementById('semail');
        const emailError = document.getElementById('emailError');
        const emailValue = emailInput.value;

        if (!emailValue.endsWith('@gmail.com')) {
            emailError.textContent = "Email must end with @gmail.com.";
            return false;
        } else {
            emailError.textContent = "";
            return true;
        }
    }

    function validateContact() {
        const contactInput = document.getElementById('scontact');
        const contactError = document.getElementById('contactError');
        const contactValue = contactInput.value;

        const contactPattern = /^[6-9][0-9]{9}$/;
        if (!contactPattern.test(contactValue)) {
            contactError.textContent = "Contact must be a 10-digit number starting with 6, 7, 8, or 9.";
            return false;
        } else {
            contactError.textContent = "";
            return true;
        }
    }

    function evaluatePasswordStrength() {
        const passwordInput = document.getElementById('spassword');
        const strengthIndicator = document.getElementById('passwordStrength');
        const passwordValue = passwordInput.value;

        // Criteria for password validation
        const hasUpperCase = /[A-Z]/.test(passwordValue);
        const hasLowerCase = /[a-z]/.test(passwordValue);
        const hasNumber = /[0-9]/.test(passwordValue);
        const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(passwordValue);

       
        strengthIndicator.textContent = "";

        if (passwordValue.length < 6) {
            strengthIndicator.textContent = "Weak: Password must be at least 6 characters.";
            strengthIndicator.className = "strength weak";
        } 
        else if (!hasUpperCase || !hasLowerCase || !hasNumber || !hasSpecialChar) {
            strengthIndicator.className = "strength medium";
            if (!hasUpperCase) {
                const upperCaseMessage = document.createElement('div');
                upperCaseMessage.textContent = "Password should include at least one uppercase letter.";
                strengthIndicator.appendChild(upperCaseMessage);
            }
            if (!hasLowerCase) {
                const lowerCaseMessage = document.createElement('div');
                lowerCaseMessage.textContent = "Password should include at least one lowercase letter.";
                strengthIndicator.appendChild(lowerCaseMessage);
            }
            if (!hasNumber) {
                const numberMessage = document.createElement('div');
                numberMessage.textContent = "Password should include at least one number.";
                strengthIndicator.appendChild(numberMessage);
            }
            if (!hasSpecialChar) {
                const specialCharMessage = document.createElement('div');
                specialCharMessage.textContent = "Password should include at least one special character.";
                strengthIndicator.appendChild(specialCharMessage);
            }
        } 
        // Strong password
        else {
            strengthIndicator.textContent = "Strong: Good password!";
            strengthIndicator.className = "strength strong";
        }
    }


    function validateForm(event) {
        if (!validateEmail() || !validateContact()) {
            event.preventDefault();
            alert("Please correct the errors before submitting the form.");
        }
    }
</script>
</body>
