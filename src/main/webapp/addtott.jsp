<%@ include file="admin.jsp" %>

<body>

<div class="content">

   <div class="form-container">

   <h2>
   <img src="images/registericon.png" alt="Course Registration Icon" style="width: 30px"> 
   Add TimeTable
   <link rel="stylesheet" type="text/css" href="styleregister.css"></h2>

    <form action="inserttimetable" method="post">

        <table>

            <tr>
                <td><label for="ttacademicyear">Select Academic Year</label></td>
                <td>
                    <select id="ttacademicyear" name="ttacademicyear" required>
                        <option value="">---Select---</option>
                        <option value="2022-2023">2022-2023</option>
                        <option value="2023-2024">2023-2024</option>
                        <option value="2024-2025">2024-2025</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td><label for="ttyear">Select Year</label></td>
                <td>
                    <select id="ttyear" name="ttyear" required>
                        <option value="">---Select---</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td><label for="ttsemester">Select Semester</label></td>
                <td>
                    <select id="ttsemester" name="ttsemester" required>
                        <option value="">---Select---</option>
                        <option value="ODD">ODD</option>
                        <option value="EVEN">EVEN</option>
                        <option value="SUMMER TERM">SUMMER TERM</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td><label for="ttcbranch">Select Course Branch</label></td>
                <td>
                    <select id="ttcbranch" name="ttcbranch" required>
                        <option value="">---Select---</option>
                        <option value="CSE">CSE</option>
                        <option value="ECE">ECE</option>
                        <option value="EEE">EEE</option>
                        <option value="MECH">MECH</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td><label for="ttccode">Enter Course Code</label></td>
               
                <td>
                        <select name="ttccode" id="ttccode" required>
                            <option value="Break">---Select---</option>
                            <c:forEach var="course" items="${courseList}">
                                <option value="${course.ccode}">${course.ccode}(${course.ctitle})</option>
                            </c:forEach>
                        </select>
                    </td>
            </tr>

                <tr>
                    <td><label for="ttctitle">Select Course:</label></td>
                    <td>
                        <select name="ttctitle" id="ttctitle" required>
                            <option value="Break">---Select---</option>
                            <c:forEach var="course" items="${courseList}">
                                <option value="${course.ctitle}">${course.ctitle} (${course.ccode})</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                  <tr>
                <td><label for="tttype">Select Course Type</label></td>
                <td>
                    <select id="tttype" name="tttype" required>
                        <option value="">---Select---</option>
                        <option value="LECTURE">Lecture</option>
                        <option value="TUTORIAL">Tutorial</option>
                        <option value="PRACTICAL">Practical</option>
                        <option value="SKILL">Skill</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td><label for="ttday">Select Day</label></td>
                <td>
                    <select id="ttday" name="ttday" required>
                        <option value="">---Select---</option>
                        <option value="Monday">Monday</option>
                        <option value="Tuesday">Tuesday</option>
                        <option value="Wednesday">Wednesday</option>
                        <option value="Thursday">Thursday</option>
                        <option value="Friday">Friday</option>
                        <option value="Saturday">Saturday</option>
                        <option value="Sunday">Sunday</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td><label for="tthour">Select Hour</label></td>
                <td>
                    <select id="tthour" name="tthour" required>
                        <option value="">---Select---</option>
                        <c:forEach var="i" begin="1" end="16">
                            <option value="${i}">${i}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="Add"/>
                    <input type="reset" value="Clear"/>
                </td>
            </tr>

        </table>
          <c:if test="${not empty message}">
    <p style="color: red;">${message}</p>
</c:if>
    </form>

</div>

</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 ERP System. All rights reserved.</p>
</footer>

</body>
