package com.Inventory;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Event.EventDBUtil;
import com.interfaces.Inventory;;

/**
 * Servlet implementation class AddInventoryServlet
 */
@WebServlet("/AddInventoryServlet")
public class AddInventoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddInventoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		String date = request.getParameter("date");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date udob = null;
		
		try {
			
			udob = sdf.parse(date);
			
			long ms =udob.getTime();
			
			java.sql.Date sqdob = new java.sql.Date(ms);
		
		
		String SupplierName = request.getParameter("SupplierName");
		String Inventoryname = request.getParameter("InventoryName");
		String supid = request.getParameter("supplierid");
		int Quantity = Integer.parseInt(request.getParameter("Quantity"));
		
		String InventoryType = request.getParameter("inventoryType");
		
		
		boolean isTrue = false;
		
		Inventory inventory = new InventoryDBUtil();
		
		isTrue = inventory.addInventoryItem(Inventoryname, Quantity, sqdob, InventoryType,SupplierName,supid);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("ListInventory.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("");
			dis.forward(request, response);
			
		}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
