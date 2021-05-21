package com.Customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interfaces.Customer;

/**
 * Servlet implementation class UpdateCustomerFromTheReceptionServlet
 */
@WebServlet("/UpdateCustomerFromTheReceptionServlet")
public class UpdateCustomerFromTheReceptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomerFromTheReceptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String Address = request.getParameter("Address");
		String contactnumber = request.getParameter("ContactNumber");
		String NIC = request.getParameter("NIC");
		String Country = request.getParameter("Country");
		String Email = request.getParameter("Email");
		String Gender = request.getParameter("Gender");
		
		
		boolean isTrue = false;;
		
		Customer customer = new CustomerDBUtil();
		
				isTrue = customer.UpdateCustomer(firstname,lastname,Address,contactnumber,NIC,Country,Email,Gender,id);			
			
	
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("ListCustomer.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis1 = request.getRequestDispatcher("");
			dis1.forward(request, response);
			
					}
			}
	}


