<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<!-- the item need to be the same attribute name set by servlet -->
	<c:forEach var="tempStudent" items="${student_list}"> 
	
		${tempStudent} <br/>
	
	</c:forEach>

</body>
</html>