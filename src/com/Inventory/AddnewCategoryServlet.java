package com.Inventory;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interfaces.Inventory;

/**
 * Servlet implementation class AddnewCategoryServlet
 */
@WebServlet("/AddnewCategoryServlet")
public class AddnewCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddnewCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String Inventoryname = request.getParameter("Inventoryname");
		
		
		boolean isTrue = false;
		
		Inventory inventory = new InventoryDBUtil();
		
		isTrue = inventory.InventCategory(Inventoryname);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("AddInventory.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("");
			dis.forward(request, response);
			
		}
	}
}


