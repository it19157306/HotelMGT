package com.UtilityBills;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Expenses.ExpensesDBUtil;

/**
 * Servlet implementation class DeleteUtilityServlet
 */
@WebServlet("/DeleteUtilityServlet")
public class DeleteUtilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUtilityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 boolean isTrue = false;
		 //setting the id to a variable recieved from list form
		 String id = request.getParameter("id");
		 
		
		try {
			//creating a object from announcementDB class
			 UtilityDBUtil utilityDBUtil = new UtilityDBUtil();
			 //sending the set id to the delete anouncement method in announceDButil
			isTrue =  utilityDBUtil.deleteutilitybill(id);
			
			if(isTrue == true) {
				//redirecting to the list announcement form
				response.sendRedirect("ListUtilityBill.jsp");
			}else {
				
				//redirecting to the list announcement form
				response.sendRedirect("");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	
		
	}

}
