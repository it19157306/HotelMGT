package com.Supplier;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interfaces.supplier;

/**
 * Servlet implementation class UpdateSup
 */
@WebServlet("/UpdateSup")
public class UpdateSup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSup() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id ");
		String SupplierName = request.getParameter("Name");
		String Address = request.getParameter("Address");
		String ContactNumber = request.getParameter("ContactNumber");
		String category = request.getParameter("Category");
		
		boolean isTrue = false;;
		
		supplier supplier =  new SupplierDbUtil();
		
		isTrue = supplier.updatesupplier(SupplierName, Address,ContactNumber,category ,id);				
			
	
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("ListSuppliers.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis1 = request.getRequestDispatcher("");
			dis1.forward(request, response);
			
		}
	
	}
	

}
