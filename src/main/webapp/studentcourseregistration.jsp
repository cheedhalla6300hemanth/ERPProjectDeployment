<%@ include file="student.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <h2 align="center">Course Registration</h2>
    
</head>
<body>
    <div class="content">
        <div class="split-screen">
            <div class="half">
                <h3>Timetable</h3>  
                <link rel="stylesheet" type="text/css" href="styletable.css">
                <table class="timetable">
                    <thead>
                        <tr>
                            <th>Day/Hour</th>
                            <c:forEach var="hour" begin="1" end="16">
                                <th>Hour ${hour}</th>
                            </c:forEach>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="day" items="Monday,Tuesday, Wednesday, Thursday, Friday, Saturday">
                            <tr>
                                <td>${day}</td>
                                <c:forEach var="hour" begin="1" end="16">
                                    <td>${timetable[day][hour] != null ? timetable[day][hour] : '-'}</td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="half">
    <h3>Course Registration</h3>  
    <link rel="stylesheet" type="text/css" href="styleregister.css">
    <form action="/courseviewregister/update" method="post">
        <c:forEach var="course" items="${courses}">
            <div>
                <h4>${course.ctitle} (${course.ccode})</h4>
                <input type="hidden" name="courseId" value="${course.cid}" />
                
                <div>
                    <label>LECTURE</label>
                    <select name="lectureSection">
                        <option value="">---Select---</option>
                        <c:forEach var="facultycourse" items="${facultycourseList}">
                            <c:if test="${facultycourse.course.cid == course.cid && facultycourse.ctype == 'LECTURE'}">
                                <option value="${facultycourse.section}">${facultycourse.section}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                
                <div>
                    <label>SKILL</label>
                    <select name="skillSection">
                        <option value="">---Select---</option>
                        <c:forEach var="facultycourse" items="${facultycourseList}">
                            <c:if test="${facultycourse.course.cid == course.cid && facultycourse.ctype == 'SKILL'}">
                                <option value="${facultycourse.section}">${facultycourse.section}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                
                <div>
                    <label>PRACTICAL</label>
                    <select name="practicalSection">
                        <option value="">---Select---</option>
                        <c:forEach var="facultycourse" items="${facultycourseList}">
                            <c:if test="${facultycourse.course.cid == course.cid && facultycourse.ctype == 'PRACTICAL'}">
                                <option value="${facultycourse.section}">${facultycourse.section}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                
                <div>
                    <label>TUTORIAL</label>
                    <select name="tutorialSection">
                        <option value="">---Select---</option>
                        <c:forEach var="facultycourse" items="${facultycourseList}">
                            <c:if test="${facultycourse.course.cid == course.cid && facultycourse.ctype == 'TUTORIAL'}">
                                <option value="${facultycourse.section}">${facultycourse.section}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                        </div>
                    </c:forEach>
                    <button type="submit">Register</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
