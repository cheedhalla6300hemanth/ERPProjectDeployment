<%@ include file="admin.jsp" %> <!-- Including the main navbar and sidebar -->
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
       Faculty Registration
      
       <link rel="stylesheet" type="text/css" href="styleregister.css" onsubmit="validateForm(event)"></h2>
        
       <form action="insertfaculty" method="post" enctype="multipart/form-data"> <!-- Changed action to insertfaculty -->
           <table>
             <tr>
                <td><label for="fimage">Choose Image</label></td>
                <td><input type="file" id="fimage" name="fimage" required/></td>
            </tr>       
               <tr>
                   <td><label for="fname">Enter Faculty Name</label></td>
                   <td><input type="text" id="fname" name="fname" required/></td>
               </tr>
               <tr>
                   <td><label for="ffathername">Father's Name</label></td>
                   <td><input type="text" id="ffathername" name="ffathername" required/></td>
               </tr>
               <tr>
                   <td><label for="fmothername">Mother's Name</label></td>
                   <td><input type="text" id="fmothername" name="fmothername" required/></td>
               </tr>
              <tr>
                <td><label for="fgender">Select Gender</label></td>
                <td>
                    <select id="fgender" name="fgender" required>
                        <option value="">---Select---</option>
                        <option value="MALE">MALE</option>
                        <option value="FEMALE">FEMALE</option>
                        <option value="OTHERS">OTHERS</option>
                    </select>
                </td>
            </tr>
               <tr>
                   <td><label for="fdateofbirth">Enter Date of Birth</label></td>
                   <td><input type="date" id="fdateofbirth" name="fdateofbirth" required    onchange="validateDOB(this)"
               title="Age must be between 18 and 60 years."/></td>
               </tr>
               <tr>
                   <td><label for="fdepartment">Select Department</label></td>
                   <td>
                       <select id="fdepartment" name="fdepartment" required>
                           <option value="">---Select---</option>
                           <option value="CSE_H">CSE_H</option>
                           <option value="ECE">ECE</option>
                           <option value="EEE">EEE</option>
                       </select>
                   </td>
               </tr>
               <tr>
                   <td><label for="fsalary">Enter Salary</label></td>
                   <td><input  type="number" id="fsalary" name="fsalary" step="0.01" required/></td>
               </tr>
               <tr>
                   <td><label for="femail">Enter Email ID</label></td>
                   <td><input type="email" id="femail" name="femail" required oninput="validateEmail()"/>
                   <span id="emailError" style="color: red;"></span>
                   </td>
               </tr>
               <tr>
                   <td><label for="fpassword">Enter Password</label></td>
                   <td><input type="password" id="fpassword" name="fpassword" required oninput="evaluatePasswordStrength()"/>
                    <span id="passwordStrength" class="strength"></span></td>
               </tr>
               <tr>
                   <td><label for="flocation">Enter Location</label></td>
                   <td><input type="text" id="flocation" name="flocation" required/></td>
               </tr>
                
               <tr>
                   <td><label for="fcontact">Enter Contact</label></td>
                   <td><input type="number" id="fcontact" name="fcontact" required oninput="validateContact()"/>
                    <span id="contactError" style="color: red;"></span>
                    </td>
               </tr>
               <tr>
                   <td><label for="fmaritalstatus">Marital Status</label></td>
                   <td>
                       <select id="fmaritalstatus" name="fmaritalstatus" required>
                           <option value="">---Select---</option>
                           <option value="Single">Single</option>
                           <option value="Married">Married</option>
                           <option value="Divorced">Divorced</option>
                       </select>
                   </td>
               </tr>
                <tr>
                <td><label for="fresume">Upload Resume</label></td>
                <td><input type="file" id="fresume" name="fresume" required/></td>
            </tr> 
            
            <tr>
                   <td><label for="furl">Give Linkedin URL</label></td>
                   <td><input type="text" id="furl" name="furl" required/></td>
               </tr>
               <tr>
                   <td><label for="freligion">Enter Religion</label></td>
                   <td><input type="text" id="freligion" name="freligion" required/></td>
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
        const emailInput = document.getElementById('femail');
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
        const contactInput = document.getElementById('fcontact');
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
        const passwordInput = document.getElementById('fpassword');
        const strengthIndicator = document.getElementById('passwordStrength');
        const passwordValue = passwordInput.value;

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
