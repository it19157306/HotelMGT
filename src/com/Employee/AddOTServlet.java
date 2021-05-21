package com.Employee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interfaces.Employee;

/**
 * Servlet implementation class AddOTServlet
 */
@WebServlet("/AddOTServlet")
public class AddOTServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOTServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String EmployeeName = request.getParameter("currentsal");
		String Address = request.getParameter("Address");
		String ContactNumber = request.getParameter("ContactNumber");
		String NIC = request.getParameter("NIC");
		String Gender = request.getParameter("Gender");
		String Designation = request.getParameter("Designation");
		String Username = request.getParameter("Username");
		String Password = request.getParameter("Password");
		String BasicSalary = request.getParameter("BasicSalary");
		
		boolean isTrue = false;;
		
		Employee Employeeinterface = new EmployeeDBUtil();
		
				isTrue = Employeeinterface.addEmployee(EmployeeName, Address,ContactNumber,NIC,Gender,Designation,Username,Password,BasicSalary);				
			
	
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("AddEmployee.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis1 = request.getRequestDispatcher("AddEmployee.jsp");
			dis1.forward(request, response);
			
					}
				}
	}


