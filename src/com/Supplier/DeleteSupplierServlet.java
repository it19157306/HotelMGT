package com.Supplier;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Expenses.ExpensesDBUtil;

/**
 * Servlet implementation class DeleteSupplierServlet
 */
@WebServlet("/DeleteSupplierServlet")
public class DeleteSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSupplierServlet() {
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
			 SupplierDbUtil supplierDbUtil = new SupplierDbUtil();
			 //sending the set id to the delete anouncement method in announceDButil
			isTrue =  supplierDbUtil.DeleteSupplier(id);
			
			if(isTrue == true) {
				//redirecting to the list announcement form
				
				RequestDispatcher dis = request.getRequestDispatcher("ListSuppliers.jsp");
				dis.forward(request, response);
			}else {
				
				//redirecting to the list announcement form
				RequestDispatcher dis = request.getRequestDispatcher("");
				dis.forward(request, response);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
