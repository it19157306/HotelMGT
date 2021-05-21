package com.Customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class DeleteCustomerServlet
 */
@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 boolean isTrue = false;
		 //setting the id to a variable recieved from list form
		 String id = request.getParameter("id");
		 
		
		try {
			//creating a object from announcementDB class
			 CustomerDBUtil customerDBUtil = new CustomerDBUtil();
			 //sending the set id to the delete anouncement method in announceDButil
			isTrue =  customerDBUtil.deleteCustomer(id);
			
			if(isTrue == true) {
				//redirecting to the list announcement form
				response.sendRedirect("ListCustomer.jsp");
			}else {
				
				//redirecting to the list announcement form
				response.sendRedirect("");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			
			
	
	}
		
		
}


