package com.Expenses;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interfaces.Expenses;

/**
 * Servlet implementation class UpdateExpensesServlet
 */
@WebServlet("/UpdateExpensesServlet")
public class UpdateExpensesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateExpensesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ExpensesID = request.getParameter("ExpensesID");
		String Reason = request.getParameter("Reason");
		String Amount = request.getParameter("Amount");
		String AddedDate = request.getParameter("AddedDate");
		
		
		
		boolean isTrue = false;
		
		Expenses expenses = new ExpensesDBUtil();
		
		isTrue = expenses.UpdateExpenses(AddedDate ,Amount, Reason,ExpensesID);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("ListExpenses.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("");
			dis.forward(request, response);
			
		}
	}
}


