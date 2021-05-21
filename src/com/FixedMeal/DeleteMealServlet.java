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
 * Servlet implementation class DeleteMealServlet
 */
@WebServlet("/DeleteMealServlet")
public class DeleteMealServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMealServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String MealId = request.getParameter("MealId");
	
		
		boolean isTrue = false;;
		
		MealItems mealItems = new MealDBUtil();
		
				isTrue = mealItems.DeleteMeal(MealId);				
			
	
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("ListMealMenu.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis1 = request.getRequestDispatcher("");
			dis1.forward(request, response);
			
					}
				}
			
	

}
