package com.Customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interfaces.Customer;



/**
 * Servlet implementation class AddCustomerFromReceptionServlet
 */
@WebServlet("/AddCustomerFromReceptionServlet")
public class AddCustomerFromReceptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustomerFromReceptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String Address = request.getParameter("Address");
		String contactnumber = request.getParameter("contactnumber");
		String NIC = request.getParameter("NIC");
		String Country = request.getParameter("Country");
		String Email = request.getParameter("email");
		String Gender = request.getParameter("Gender");
		
		
		
		boolean isTrue = false;
		
		Customer customer = new CustomerDBUtil();
		
				isTrue = customer.addCustomer(firstname,lastname,Address,NIC,Country,Gender,Email,contactnumber);			
			
	
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("ListCustomer.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis1 = request.getRequestDispatcher("");
			dis1.forward(request, response);
			
					}
				}
	}


