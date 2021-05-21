package com.Supplier;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Employee.EmployeeDBUtil;
import com.interfaces.Employee;
import com.interfaces.supplier;

/**
 * Servlet implementation class AddSupplierServlet
 */
@WebServlet("/AddSupplierServlet")
public class AddSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSupplierServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String SupplierName = request.getParameter("SupplierName");
		String Address = request.getParameter("Address");
		String ContactNumber = request.getParameter("ContactNumber");
		String category = request.getParameter("category");
		
		
		boolean isTrue = false;;
		
		supplier supplier = (com.interfaces.supplier) new SupplierDbUtil();
		
		isTrue = supplier.insertsupplier(SupplierName, Address,ContactNumber,category);				
			
	
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("ListSuppliers.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis1 = request.getRequestDispatcher("");
			dis1.forward(request, response);
			
		}
		
	}

}
