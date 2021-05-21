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
 * Servlet implementation class UpdateInventoryServlet
 */
@WebServlet("/UpdateInventoryServlet")
public class UpdateInventoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInventoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		String SupplierName = request.getParameter("SupplierName");
		String Item_Name = request.getParameter("Item_Name");
		String  Quantity = request.getParameter("Quantity");	
		String Type = request.getParameter("Type");
		
		
		boolean isTrue = false;
		
		Inventory inventory = new InventoryDBUtil();
		
		isTrue = inventory.updateInventoryItem(Item_Name, Quantity, Type,SupplierName,id);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("ListInventory.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("");
			dis.forward(request, response);
			
		}
	}
}


