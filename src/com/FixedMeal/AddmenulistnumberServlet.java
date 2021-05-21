package com.FixedMeal;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interfaces.MealItems;

/**
 * Servlet implementation class AddmenulistnumberServlet
 */
@WebServlet("/AddmenulistnumberServlet")
public class AddmenulistnumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddmenulistnumberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			boolean isTrue = false;
		
		int Price = Integer.parseInt(request.getParameter("Price"));
		String mealnamenum = request.getParameter("mealnamenum");
		
		
		MealItems mealItems = new MealDBUtil();
		
		isTrue = mealItems.addmenulistnumber(mealnamenum,Price);		
		
		if(isTrue == true) {
	
			RequestDispatcher dis = request.getRequestDispatcher("AddMealMenu.jsp");
			dis.forward(request, response);
			
			}else {
				RequestDispatcher dis1 = request.getRequestDispatcher("success.jsp");
				dis1.forward(request, response);
	
					}
		}

}
