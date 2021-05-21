package com.Event;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interfaces.Event;

/**
 * Servlet implementation class UpdateEventtServlet
 */
@WebServlet("/UpdateEventtServlet")
public class UpdateEventtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEventtServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		boolean isTrue = false;
		
		String date = request.getParameter("Date");
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date udob = null;
		
		 try {
			 
			 udob = sdf.parse(date);
				
				long ms =udob.getTime();
				
				java.sql.Date sqdob = new java.sql.Date(ms);

		String EventType = request.getParameter("EventType");
		String EventName = request.getParameter("EventName");
		String GuestCount = request.getParameter("GuestCount");
		String HallNumber = request.getParameter("HallNumber");
		String HallCost = request.getParameter("HallCost");
		String EventID = request.getParameter("EventID");
		String MealType = request.getParameter("MealType");
		
		
		
		Event event = new EventDBUtil();
		
		isTrue = event.updateEvent(EventType,EventName,GuestCount,HallNumber,HallCost,sqdob,EventID,MealType);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("ListEvents.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
			
		}
		
		 }catch (Exception e) {
				// TODO: handle exception
			}
	}
}


