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
 * Servlet implementation class AddMealItemServlet
 */
@WebServlet("/AddMealItemServlet")
public class AddMealItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMealItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		boolean isTrue = false;
		
		boolean condiments_1= false, condiments_2= false, condiments_3= false, condiments_4= false, condiments_5 = false;
		boolean desert_1 = false, desert_2= false, desert_3= false, desert_4 = false, desert_5 = false;
		boolean meatD_1= false, meatD_2= false, meatD_3= false, meatD_4= false, meatD_5 = false;
		boolean salads_1= false, salads_2= false, salads_3= false, salads_4= false, salads_5 = false;
		boolean RiceN_1= false, RiceN_2= false, RiceN_3= false, RiceN_4= false, RiceN_5 = false;
		
		
		
		
		String FIxedMID = request.getParameter("FIxedMID");
		MealItems mealItems = new MealDBUtil();
		
		if(request.getParameter("condiments_1") != null) {
			String MealName = request.getParameter("condiments_1");
			condiments_1 = mealItems.addcondiments(MealName,FIxedMID);		
		}
		if(request.getParameter("condiments_2") != null) {
			String MealName = request.getParameter("condiments_2");
			condiments_2 = mealItems.addcondiments(MealName,FIxedMID);		
		}
		if(request.getParameter("condiments_3") != null) {
			String MealName = request.getParameter("condiments_3");
			condiments_3 = mealItems.addcondiments(MealName,FIxedMID);		
		}
		if(request.getParameter("condiments_4") != null) {
			String MealName = request.getParameter("condiments_4");
			condiments_4 = mealItems.addcondiments(MealName,FIxedMID);		
		}
		if(request.getParameter("condiments_5") != null) {
			String MealName = request.getParameter("condiments_5");
			condiments_5 = mealItems.addcondiments(MealName,FIxedMID);		
		}
		
		
		if(request.getParameter("desert_1") != null) {
			String MealName = request.getParameter("desert_1");
			desert_1 = mealItems.addDeserts(MealName,FIxedMID);		
		}
		if(request.getParameter("desert_2") != null) {
			String MealName = request.getParameter("desert_2");
			desert_2 = mealItems.addDeserts(MealName,FIxedMID);		
		}
		if(request.getParameter("desert_3") != null) {
			String MealName = request.getParameter("desert_3");
			desert_3 = mealItems.addDeserts(MealName,FIxedMID);		
		}
		if(request.getParameter("desert_4") != null) {
			String MealName = request.getParameter("desert_4");
			desert_4 = mealItems.addDeserts(MealName,FIxedMID);		
		}
		if(request.getParameter("desert_5") != null) {
			String MealName = request.getParameter("desert_5");
			desert_5 = mealItems.addDeserts(MealName,FIxedMID);		
		}
		
		
		
		if(request.getParameter("meatD_1") != null) {
			String MealName = request.getParameter("meatD_1");
			meatD_1 = mealItems.addmeatandfish(MealName,FIxedMID);		
		}
		if(request.getParameter("meatD_2") != null) {
			String MealName = request.getParameter("meatD_2");
			meatD_2 = mealItems.addmeatandfish(MealName,FIxedMID);		
		}
		if(request.getParameter("meatD_3") != null) {
			String MealName = request.getParameter("meatD_3");
			meatD_3 = mealItems.addmeatandfish(MealName,FIxedMID);		
		}
		if(request.getParameter("meatD_4") != null) {
			String MealName = request.getParameter("meatD_4");
			meatD_4 = mealItems.addmeatandfish(MealName,FIxedMID);		
		}
		if(request.getParameter("meatD_5") != null) {
			String MealName = request.getParameter("meatD_5");
			meatD_5 = mealItems.addmeatandfish(MealName,FIxedMID);		
		}
		
		
		if(request.getParameter("salads_1") != null) {
            String MealName = request.getParameter("salads_1");
            salads_1 = mealItems.addsalads(MealName,FIxedMID);      
        }
        if(request.getParameter("salads_2") != null) {
            String MealName = request.getParameter("salads_2");
            salads_2 = mealItems.addsalads(MealName,FIxedMID);      
        }
        if(request.getParameter("salads_3") != null) {
            String MealName = request.getParameter("salads_3");
            salads_3 = mealItems.addsalads(MealName,FIxedMID);      
        }
        if(request.getParameter("salads_4") != null) {
            String MealName = request.getParameter("salads_4");
            salads_4 = mealItems.addsalads(MealName,FIxedMID);      
        }
        if(request.getParameter("salads_5") != null) {
            String MealName = request.getParameter("salads_5");
            salads_5 = mealItems.addsalads(MealName,FIxedMID);      
        }
        
        if(request.getParameter("riceN_1") != null) {
            String MealName = request.getParameter("riceN_1");
            RiceN_1 = mealItems.addRiceandNoodles(MealName,FIxedMID);      
        }
        if(request.getParameter("riceN_2") != null) {
            String MealName = request.getParameter("riceN_2");
            RiceN_2 = mealItems.addRiceandNoodles(MealName,FIxedMID);      
        }
        if(request.getParameter("riceN_3") != null) {
            String MealName = request.getParameter("riceN_3");
            RiceN_3 = mealItems.addRiceandNoodles(MealName,FIxedMID);      
        }
        if(request.getParameter("riceN_4") != null) {
            String MealName = request.getParameter("riceN_4");
            RiceN_4 = mealItems.addRiceandNoodles(MealName,FIxedMID);      
        }
        if(request.getParameter("riceN_5") != null) {
            String MealName = request.getParameter("riceN_5");
            RiceN_5 = mealItems.addRiceandNoodles(MealName,FIxedMID);      
        }

		
		if(desert_1 == true || desert_2 == true || desert_3 == true || desert_4 == true || desert_5 == true || condiments_1 == true || condiments_2 == true || condiments_3 == true || condiments_4 == true || condiments_5 == true || RiceN_1 == true || RiceN_2 == true || RiceN_3 == true || RiceN_4 == true || RiceN_5 == true || salads_1 == true || salads_2 == true || salads_3 == true || salads_4 == true || salads_5 == true) {
			RequestDispatcher dis = request.getRequestDispatcher("ListEvents.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis1 = request.getRequestDispatcher("");
			dis1.forward(request, response);
		}
		
		
		
	}

}
