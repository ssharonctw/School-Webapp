function validateForm() {
	
	// error fields to store fields that are empty
	var theErrorFields = [];
	
	// student form
	var studentForm = document.forms["studentForm"];
	
	// check first name
	var firstName = studentForm["firstName"].value.trim();;
	if (firstName == "") {
		theErrorFields.push("First name");
	}
 
	// check last name
	var lastName = studentForm["lastName"].value.trim();;
	if (lastName == "") {
		theErrorFields.push("Last name");
	}
	
	// check email
	var email = studentForm["email"].value.trim();;
	if (email == "") {
		theErrorFields.push("Email");
	}
	
	//if error fields is not empty, means there's more than one field that are empty, hence alert users with error msg
	if (theErrorFields.length > 0) {
		alert("Form validation failed. Please add data for following fields: " + theErrorFields);
		return false;
	}
}