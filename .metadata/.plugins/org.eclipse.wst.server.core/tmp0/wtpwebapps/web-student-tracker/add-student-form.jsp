<!DOCTYPE html>

<html>
<head>
	<title>Add Student</title>
	<!-- including css for nicer outlook -->
	<link type="text/css" rel ="stylesheet" href="css/style.css">
	<link type="text/css" rel ="stylesheet" href="css/add-student-style.css">
	<!-- including javascript script that checks for empty fields to prompt user when user attempts to add empty field -->
	<script type="text/javascript" src="js/student-validation.js"></script>
</head>

<body>

<div id="wrapper">
	<div id="header">
		<h2>University</h2>
	</div>
</div>

<div id="container">
	<h3>Add Student</h3>
	<form action="StudentControllerServlet" method="POST" name="studentForm" onSubmit="return validateForm()">
		<!-- the hidden form field to be passed to the servlet so the servelt knkows this is an add action -->
		<input type = "hidden" name="command" value="ADD">
		<table>
			<tbody>
				<tr>
					<td><label>First Name:</label></td>
					<td><input type="text" name="firstName"/></td>
				</tr>
				<tr>
					<td><label>Last Name:</label></td>
					<td><input type="text" name="lastName"/></td>
				</tr>
				<tr>
					<td><label>Email:</label></td>
					<td><input type="text" name="email"/></td>
				</tr>
				
				<tr>
					<td><label></label></td>
					<td><input type="submit" value="save" class="save"/></td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<div style="clear:both;"></div>
	<p>
		<a href="StudentControllerServlet">Back to List</a>
	</p>

</div>

</body>
</html>