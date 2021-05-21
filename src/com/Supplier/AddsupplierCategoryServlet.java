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
 * Servlet implementation class AddsupplierCategoryServlet
 */
@WebServlet("/AddsupplierCategoryServlet")
public class AddsupplierCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddsupplierCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String Category = request.getParameter("CategoryName");
		
		boolean isTrue = false;;
		
		supplier supplier = (com.interfaces.supplier) new SupplierDbUtil();
		
		isTrue = supplier.insertsuppliercategory(Category);				
			
	
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("AddSupplier.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis1 = request.getRequestDispatcher("");
			dis1.forward(request, response);
			
		}
		
	}

}
