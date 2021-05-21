package com.FixedMeal;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Employee.EmployeeDBUtil;
import com.interfaces.Employee;
import com.interfaces.MealItems;

/**
 * Servlet implementation class UpdateMealItemsinDB
 */
@WebServlet("/UpdateMealItemsinDB")
public class UpdateMealItemsinDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMealItemsinDB() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String MealId = request.getParameter("MealId");
		String mealname = request.getParameter("mealname");
		String Price = request.getParameter("Price");
		String condimealname = request.getParameter("condimealname");
		String dertmealname = request.getParameter("dertmealname");
		String mfmealname = request.getParameter("mfmealname");
		String rnmealname = request.getParameter("rnmealname");
		String smealname = request.getParameter("smealname");
		
		
		boolean isTrue = false;;
		
		MealItems mealItems = new MealDBUtil();
		
				isTrue = mealItems.Updatemeal(MealId, mealname,Price,condimealname,dertmealname,mfmealname,rnmealname,smealname);				
			
	
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("ListMealMenu.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis1 = request.getRequestDispatcher("");
			dis1.forward(request, response);
			
					}
				}
			
	

}
