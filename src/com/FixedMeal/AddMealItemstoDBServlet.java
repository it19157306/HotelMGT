package com.FixedMeal;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interfaces.MealItems;

import com.DBConnection.*;

/**
 * Servlet implementation class AddMealItemstoDBServlet
 */
@WebServlet("/AddMealItemstoDBServlet")
public class AddMealItemstoDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMealItemstoDBServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		boolean isTrue = false;
		

		
		MealItems mealItems = new MealDBUtil();
		
		String ItemCat = request.getParameter("ItemCategory");
		String MealID = request.getParameter("MealID");
		String MealName = request.getParameter("MealName");
		
		//Condiments check
		if( ItemCat.equals("Condiments")) {
			isTrue = mealItems.addNewcondiments(MealName,MealID);
			
			if(isTrue == true) {
				RequestDispatcher dis = request.getRequestDispatcher("AddMealMenu.jsp");
				dis.forward(request, response);
			}else {
				RequestDispatcher dis1 = request.getRequestDispatcher("test.jps");
				dis1.forward(request, response);
			}		
		}else if ( ItemCat.equals("Deserts")) { //Deserts check
			
			isTrue = mealItems.addNewDeserts(MealName,MealID);
			
			if(isTrue == true) {
				RequestDispatcher dis = request.getRequestDispatcher("AddMealMenu.jsp");
				dis.forward(request, response);
			}else {
				RequestDispatcher dis1 = request.getRequestDispatcher("test.jps");
				dis1.forward(request, response);
			}		
		}else if ( ItemCat.equals("Rice")) { //Rice check
			isTrue = mealItems.addNewRice(MealName,MealID);
			
			if(isTrue == true) {
				RequestDispatcher dis = request.getRequestDispatcher("AddMealMenu.jsp");
				dis.forward(request, response);
			}else {
				RequestDispatcher dis1 = request.getRequestDispatcher("test.jps");
				dis1.forward(request, response);
			}	
		}else if ( ItemCat.equals("Salads")) { //Salads check
			isTrue = mealItems.addNewSalads(MealName,MealID);
			
			if(isTrue == true) {
				RequestDispatcher dis = request.getRequestDispatcher("AddMealMenu.jsp");
				dis.forward(request, response);
			}else {
				RequestDispatcher dis1 = request.getRequestDispatcher("test.jps");
				dis1.forward(request, response);
			}	
		}else if ( ItemCat.equals("Meat")) { //Meat check
			isTrue = mealItems.addNewMeat(MealName,MealID);
			
			if(isTrue == true) {
				RequestDispatcher dis = request.getRequestDispatcher("AddMealMenu.jsp");
				dis.forward(request, response);
			}else {
				RequestDispatcher dis1 = request.getRequestDispatcher("test.jps");
				dis1.forward(request, response);
			}	
		}else {
			
		}
		
		
		}
	}
		
		
		
		
		
	
		
		
			



