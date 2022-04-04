<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- including the package we created in src/main/java -->
<%@ page import="java.util.*,com.luv2code.jsp.tagdemo.Student" %>

<%
	// just create some sample data ... normally provided by MVC
	List<Student> data = new ArrayList<>();

	data.add(new Student("John", "Doe", false));
	data.add(new Student("Maxwell", "Johnson", false));
	data.add(new Student("Mary", "Public", true));

	//need to set this value as attrbute on the page content to use in the JSTL tag
	pageContext.setAttribute("myStudents", data);
%>

<html>

<body>
	<table border="1">
	<!--tr:  set up table row -->
	<tr>
		<!--th:  set up table header -->
		<th>First Name</th>
		<th>Last Name</th>
		<th>Gold Customer</th>
	</tr>
	
	<c:forEach var="tempStudent" items="${myStudents}">
		<!-- with JSP expression language, it will call the appropriate getter methods for the specified attribute -->
		<tr>
			<!--td:  set up table data -->
			<td>${tempStudent.firstName}</td>
			<td>${tempStudent.lastName}</td>
			<td>${tempStudent.goldCustomer}</td> 
		</tr>
		
	</c:forEach>

	</table>

</body>

</html>












