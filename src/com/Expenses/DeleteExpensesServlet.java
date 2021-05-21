package com.Expenses;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Event.EventDBUtil;

/**
 * Servlet implementation class DeleteExpensesServlet
 */
@WebServlet("/DeleteExpensesServlet")
public class DeleteExpensesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteExpensesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 boolean isTrue = false;
		 //setting the id to a variable recieved from list form
		 String id = request.getParameter("id");
		 
		
		try {
			//creating a object from announcementDB class
			 ExpensesDBUtil expensesDBUtil = new ExpensesDBUtil();
			 //sending the set id to the delete anouncement method in announceDButil
			isTrue =  expensesDBUtil.deleteExpenses(id);
			
			if(isTrue == true) {
				//redirecting to the list announcement form
				response.sendRedirect("ListExpenses.jsp");
			}else {
				
				//redirecting to the list announcement form
				response.sendRedirect("");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
