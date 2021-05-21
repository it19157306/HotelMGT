package com.FixedMeal;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Inventory.InventoryDBUtil;
import com.interfaces.Inventory;
import com.interfaces.MealItems;

/**
 * Servlet implementation class AddMealTypeServlet
 */
@WebServlet("/AddMealTypeServlet")
public class AddMealTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMealTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mealname = request.getParameter("mealname");
		String Price = request.getParameter("Price");
		String Condiments = request.getParameter("Condiments");
		String Desert = request.getParameter("Desert");
		String Meat = request.getParameter("Meat");
		String Rice = request.getParameter("Rice");
		String Salads = request.getParameter("Salads");

		boolean isTrue = false;
		
		MealItems mealItems = new MealDBUtil();
		
		isTrue = mealItems.addMealType(mealname, Price, Condiments, Desert, Meat, Rice, Salads);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("AddMealMenu.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("");
			dis.forward(request, response);
			
		}
		
	}

}
