package com.luv2code.web.jdbc;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentDbUtil studentDbUtil; //setting up reference to a studentDbUtil
	
	//Java EE Resource injection so tomcat server will automatically inject the 
	//connection pool object and assign it here to this variable data source
	@Resource(name = "jdbc/web_student_tracker") 
	private DataSource dataSource;
	
	//init method will be called by Java EE server / Tomcat when the servlet is first loaded
	//so this is where to put custom initialization work
	@Override
	public void init() throws ServletException {

		super.init();
		//create out student dbutil....and pass in the conn pool/ datasource
		try {
			studentDbUtil = new StudentDbUtil(dataSource);
		}catch(Exception exc){
			throw new ServletException(exc);
		}
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	//get the data, set the attribute, use request dispatcher and send to JSP
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//list the students ... in MVC fashion
		try {
			//read the "command"
			String theCommand=request.getParameter("command");
			//route to the appropriate method
			if(theCommand==null) {
				theCommand="LIST";
			}
			
			switch(theCommand) {
			
			case "LIST":
				//list the students ... in MVC fashion
				listStudents(request, response);
				break;

//moved ADD case to doPost to avoid duplication add when submit				
//			case "ADD":
//				addStudent(request,response);
//				break;
				
			case "LOAD":
				loadStudent(request, response);
				break;
				
			case "UPDATE":
				updateStudent(request, response);
				break;
				
			case "DELETE":
				deleteStudent(request, response);
				break;
			
			case "SEARCH":
				searchStudent(request, response);
				break;	
			
			default:
				//if there's bad command we don't recognize, in default return list the students ... in MVC fashion
				listStudents(request, response);			
			}
			
		} catch (Exception exc) {
			throw new ServletException(exc);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//read the "command"
			String theCommand=request.getParameter("command");
			//route to the appropriate method
			if(theCommand==null) {
				theCommand="LIST";
			}
			
			switch(theCommand) {
			
			case "ADD":
				addStudent(request,response);
				break;

			default:
				//if there's bad command we don't recognize, in default return list the students ... in MVC fashion
				listStudents(request, response);			
			}
			
		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	private void searchStudent(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//read search name from form data
		String theSearchName = request.getParameter("theSearchName");
		
		//search students matching theSearchName from db util
		List<Student> students = studentDbUtil.searchStudent(theSearchName);
		
		//add students matching theSearchName to the request
		request.setAttribute("STUDENT_LIST", students);
		
		//send to JSP page(view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
		dispatcher.forward(request, response);
		
	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response)throws Exception {
		//read student id info from form data (passed by delete button link after user confirms)
		String theStudentId = request.getParameter("studentId");
		
		//delete student from database
		studentDbUtil.deleteStudent(theStudentId);
		
		//send user back to "list students" page
		listStudents(request, response);
	}


	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//read student info from form data (passed by update page submit button link)
		int id = Integer.parseInt(request.getParameter("studentId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		
		//create a new student object
		Student theStudent = new Student(id, firstName, lastName, email);
		
		//perform update on database
		studentDbUtil.updateStudent(theStudent);
		
		//send them back to the "list student" page
		listStudents(request,response);
	}


	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//read student id from form data (passed by update button link)
		String theStudentId = request.getParameter("studentId");
		//get student from database (db util)
		Student theStudent = studentDbUtil.getStudents(theStudentId);
		//place student in the request attribute
		request.setAttribute("THE_STUDENT", theStudent);
		//send to jsp page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/update-student-form.jsp");
		dispatcher.forward(request, response);
		
	}


	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// add students 
		// read student info from the form data
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
				
		//create a new student object
		Student theStudent = new Student(firstName, lastName, email);
		
		//add the student to the database
		studentDbUtil.addStudent(theStudent);
		
		//send back to main page (the student list)
		//original: (may have duplicated submit if refresh the page)
		//	listStudents(request, response);
		//SEND AS REDIRECT to avoid multiple-browser reload issue
		response.sendRedirect(request.getContextPath()+"/StudentControllerServlet?command=LIST");
		
	}


	private void listStudents(HttpServletRequest request, HttpServletResponse response)throws Exception {
		//get students from db util
		
		List<Student> students = studentDbUtil.getStudents();
		
		
		//add students to the request
		request.setAttribute("STUDENT_LIST", students);
		
		//send to JSP page(view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
		dispatcher.forward(request, response);
	}

}
