package com.luv2code.servletdemo.mvctwo;

import java.util.ArrayList;
import java.util.List;

//a helper class mimicking the model (database) of students
public class StudentDataUtil {

	//will return a list of student object when called by servlet
	public static List<Student> getStudents() {
		
		// create an empty list
		List<Student> students = new ArrayList<>();
		
		// add sample data
		students.add(new Student("Mary", "Public", "mary@luv2code.com"));
		students.add(new Student("John", "Doe", "john@luv2code.com"));
		students.add(new Student("Ajay", "Rao", "ajay@luv2code.com"));
		
		// return the list
		return students;
	}
}







