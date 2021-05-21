package com.Employee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Customer.CustomerDBUtil;

/**
 * Servlet implementation class DeleteEmployeeServlet
 */
@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 boolean isTrue = false;
		 //setting the id to a variable recieved from list form
		 String id = request.getParameter("id");
		 
		
		try {
			//creating a object from announcementDB class
			 EmployeeDBUtil employeeDBUtil = new EmployeeDBUtil();
			 //sending the set id to the delete anouncement method in announceDButil
			isTrue =  employeeDBUtil.deleteEmploye(id);
			
			if(isTrue == true) {
				//redirecting to the list announcement form
				response.sendRedirect("ListEmployee.jsp");
			}else {
				
				//redirecting to the list announcement form
				response.sendRedirect("");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
