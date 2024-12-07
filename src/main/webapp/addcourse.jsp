<%@ include file="admin.jsp" %>

<body>

<div class="content">

   <div class="form-container">

   <h2>
     <img src="images/registericon.png" alt="Course Registration Icon" style="width: 30px"> 
   Course Registration
   <link rel="stylesheet" type="text/css" href="styleregister.css"></h2>

    <form action="insertcourse" method="post" enctype="multipart/form-data" onsubmit="validateForm(event)">

        <table>

            <tr>
                <td><label for="ccode">Enter Course Code</label></td>
                <td><input type="text" id="ccode" name="ccode" required/></td>
            </tr>

            <tr>
                <td><label for="ctitle">Enter Course Title</label></td>
                <td><input type="text" id="ctitle" name="ctitle" required/></td>
            </tr>

            <tr>
                <td><label for="cbranch">Select Course Branch</label></td>
                <td>
                    <select id="cbranch" name="cbranch" required>
                        <option value="">---Select---</option>
                        <option value="CSE">CSE</option>
                        <option value="ECE">ECE</option>
                        <option value="EEE">EEE</option>
                        <option value="MECH">MECH</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td><label for="cprogram">Select Course Program</label></td>
                <td>
                    <select id="cprogram" name="cprogram" required>
                        <option value="">---Select---</option>
                        <option value="BTECH">BTECH</option>
                        <option value="MTECH">MTECH</option>
                        <option value="MBA">MBA</option>
                        <option value="BBA">BBA</option>
                        <option value="LLB">LLB</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td><label for="cacademicyear">Select Academic Year</label></td>
                <td>
                    <select id="cacademicyear" name="cacademicyear" required>
                        <option value="">---Select---</option>
                        <option value="2022-23">2022-23</option>
                        <option value="2023-24">2023-24</option>
                        <option value="2024-25">2024-25</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td><label for="csemester">Select Course Semester</label></td>
                <td>
                    <select id="csemester" name="csemester" required>
                        <option value="">---Select---</option>
                        <option value="ODD">ODD</option>
                        <option value="EVEN">EVEN</option>
                        <option value="SUMMER TERM">SUMMER TERM</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td><label for="cyear">Enter Course Year</label></td>
                <td><input type="number" id="cyear" name="cyear" required/></td>
            </tr>

            <tr>
                <td><label for="ccredits">Enter Course Credits</label></td>
                <td><input type="number" id="ccredits" name="ccredits" required/></td>
            </tr>
             <tr>
                <td><label for="chandout">Choose Handout</label></td>
                <td><input type="file" id="chandout" name="chandout" required/></td>
            </tr>
            <tr>
                <td><label for="ccoordinator">Enter Course Coordinator Name</label></td>
                <td><input type="text" id="ccoordinator" name="ccoordinator" required/></td>
            </tr>
            <tr>
    <td><label for="section">Enter Section no</label></td>
    <td>
        <input type="text" id="section" name="section" required />
        <span id="sectionError" style="color: red; font-size: small;"></span>
    </td>
</tr>
<script>
    document.getElementById("section").addEventListener("input", function () {
        const sectionInput = this.value;
        const errorSpan = document.getElementById("sectionError");
        const sectionPattern = /^S-\d{1,2}$/; 

        if (!sectionPattern.test(sectionInput) || sectionInput.length >= 5) {
            errorSpan.textContent = "Section must start with 'S-' and contain up to 2 digits only.";
        } else {
            errorSpan.textContent = "";
        }
    });
    
   
</script>

            
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="Add"/>
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

</body>
