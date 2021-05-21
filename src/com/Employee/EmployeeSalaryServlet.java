package com.Employee;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interfaces.Employee;

/**
 * Servlet implementation class EmployeeSalaryServlet
 */
@WebServlet("/EmployeeSalaryServlet")
public class EmployeeSalaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeSalaryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String basic = request.getParameter("basic");
		String totalsalary = request.getParameter("totalsalary");
		String status = request.getParameter("status");	
		String date = request.getParameter("Date");
		String employeeID = request.getParameter("employeeID");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date udob = null;
		
		try {
			
			udob = sdf.parse(date);
			
			long ms =udob.getTime();
			
			java.sql.Date sqdob = new java.sql.Date(ms);
		
		
		boolean isTrue = false;;
		
		Employee Employeeinterface = new EmployeeDBUtil();
		
				isTrue = Employeeinterface.addEmployeesalary(basic, totalsalary,status,sqdob,employeeID);				
			
	
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("EmployeeSalaryList.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis1 = request.getRequestDispatcher("");
			dis1.forward(request, response);
			
					}
		}catch(Exception e) {
			e.printStackTrace();
		}
				}
	
		
	

}
