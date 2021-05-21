package com.Event;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Customer.CustomerDBUtil;

/**
 * Servlet implementation class DeleteEventServlet
 */
@WebServlet("/DeleteEventServlet")
public class DeleteEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEventServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 boolean isTrue = false;
		 //setting the id to a variable recieved from list form
		 String id = request.getParameter("id");
		 
		
		try {
			//creating a object from announcementDB class
			 EventDBUtil eventDBUtil = new EventDBUtil();
			 //sending the set id to the delete event method in eventDBUtil
			isTrue =  eventDBUtil.deleteEvent(id);
			
			if(isTrue == true) {
				//redirecting to the list event form
				response.sendRedirect("ListEvents.jsp");
			}else {
				
				//redirecting to the list event form
				response.sendRedirect("");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		
		
	}

}
