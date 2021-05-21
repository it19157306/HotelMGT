package com.Event;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interfaces.Event;

/**
 * Servlet implementation class AddEventServlet
 */
@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEventServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
		String date = request.getParameter("Date");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date udob = null;
		
		 try {
			 
			udob = sdf.parse(date);		
			
			long ms =udob.getTime();		
			
			java.sql.Date sqdob = new java.sql.Date(ms);
		
		
		String CustomerID = request.getParameter("CustomerID");	
		String EventType = request.getParameter("EventType");
		String EventName = request.getParameter("EventName");
		String GuestCount = request.getParameter("GuestCount");
		String HallNumber = request.getParameter("HallNumber");
		String HallCost = request.getParameter("HallCost");
		String Mealtype = request.getParameter("Mealtype");
		
		boolean isTrue = false;
		
		Event event = new EventDBUtil();
		
		isTrue = event.addevent(EventType,EventName,GuestCount,HallNumber,HallCost ,sqdob,CustomerID ,Mealtype);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("ListEvents.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("ListEvents.jsp");
			dis.forward(request, response);
			
		}
		 }catch (Exception e) {
				// TODO: handle exception
			}
		
		
	}

}
