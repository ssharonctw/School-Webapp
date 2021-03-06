<!--%@ page import="java.util.*, com.luv2code.web.jdbc.*" %-->
<!-- by using JSTL, we no longer need the above java library imports -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Student Tracker App</title>
	
	<!-- including css for nicer outlook -->
	<link type="text/css" rel ="stylesheet" href="css/style.css">
</head>

<%-- <% --%>
<!-- // 	get the students from the request object (sent by servlet) -->
<!-- // 	Replace the below with JSTL tags  -->
<!-- // 	List<Student> theStudents = (List<Student>) request.getAttribute("STUDENT_LIST"); -->
<%-- %> --%>

<body>

<div id="wrapper">
	<div id="header">
		<h2>University</h2>
	</div>
</div>

<div id = "container">
	<div id="content">
	
	<!-- put new button: Add Student -->
	<input type="button" value="Add student"
		onclick="window.location.href='add-student-form.jsp'"
		class="add-student-button"
	/>
	<div id="content" >
	<!-- add a form for search form to Search Student -->
	<form action="StudentControllerServlet" method="GET">
		<input type="hidden" name="command" value="SEARCH" />
		Search student: <input type="text" name="theSearchName"/>
		<input type="submit" value="Search" class="add-student-button"/>
		<a href="StudentControllerServlet">Reset</a>
	</form>
	</div>
	
		<table>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Actions</th>
			</tr>
			
			<c:forEach var="tempStudent" items="${STUDENT_LIST}">
				<!-- set up a link for each student to update -->
				<!-- JSTL tag creates a url for us -->
				<!-- below will generate the url of StudentControllerServlet?command=LOAD&studentId=5 -->
				<c:url var="loadLink" value="StudentControllerServlet">
					<c:param name="command" value="LOAD"/>
					<c:param name="studentId" value="${tempStudent.id}"/>
				</c:url>
				<!-- set up a link for each student to delete -->
				<c:url var="deleteLink" value="StudentControllerServlet">
					<c:param name="command" value="DELETE"/>
					<c:param name="studentId" value="${tempStudent.id}"/>
				</c:url>
				<tr> 
					<td>${tempStudent.firstName}</td> 
					<td>${tempStudent.lastName}</td> 
					<td>${tempStudent.email}</td>
					<td><a href="${loadLink}">Update</a> 
						|
					 	<a href="${deleteLink}"
					 	onclick="if(!(confirm('Are you sure you want to delete this student?'))) return false">Delete</a></td> 
 				</tr> 
			</c:forEach>
			<!-- using JSTL tag to replace the for loop below -->
<%-- 			<!--  <%for (Student tempStudent: theStudents){%> --%>
<!-- 				<tr> -->
<%-- 					<td><%= tempStudent.getFirstName() %></td> --%>
<%-- 					<td><%= tempStudent.getLastName() %></td> --%>
<%-- 					<td><%= tempStudent.getEmail() %></td> --%>
<!-- 				</tr> -->
<%-- 			<% } %> --%>
		</table>
	</div>
</div>

</body>

</html>