<html>

<head><title>Student Confirmation Title</title></head>

<body>

	The student is confirmed: ${param.firstName} ${param.lastName}

	<br/><br/>

	Favorite Programming Languages: <br/>
	
	<!-- display list of "favoriteLanguage" -->	
	<ul>
		<%
			String[] langs = request.getParameterValues("favoriteLanguageMultiple");
			if(langs !=null){//to avoid error if user doesn't select a value
				for (String tempLang : langs) {
						out.println("<li>" + tempLang + "</li>");
				}	
			}
		%>
	</ul>
</body>
</html>










