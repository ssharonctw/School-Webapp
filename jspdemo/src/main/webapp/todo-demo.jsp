<%@ page import="java.util.*" %> <!-- import the package to use List & ArrayList -->

<html>

<body>

<!-- Step 1: Create HTML form -->
<form action="todo-demo.jsp"> <!-- submit the data right back to its self -->
	Add new item: <input type="text" name="theItem" />
	
	<input type="submit" value="Submit" />
</form>

<br>
Item entered <%=request.getParameter("theItem") %>


<!-- Step 2: Add new item to "To Do" list -->
<%
	// get the TO DO items from the session, and store to the arraylist
	List<String> items = (List<String>) session.getAttribute("myToDoList"); //getAttribute will return java.lang.object, so we need to downcast to List<String>

	// if the TO DO items doesn't exist, then create a new one
	if (items == null) {
		items = new ArrayList<String>();
		session.setAttribute("myToDoList", items); //session.setAttribute(String "name", Object value);
	}
	
	// see if there is form data to add
	String theItem = request.getParameter("theItem");
	if (theItem != null && (!theItem.trim().equals("")) && !items.contains(theItem.trim())) { //check for both null and empty string and duplicates
		items.add(theItem);
	}
%>

<!-- Step 3: Display all "To Do" item from session -->
<hr>
<b>To List Items:</b> <br/>

<ol>
<%
	for (String temp : items) {
		out.println("<li>" + temp + "</li>");  //out.println prints the content back to the page
	}
%>
</ol>

</body>

</html>








