package com.Expenses;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interfaces.Expenses;

/**
 * Servlet implementation class Addexpenseservlet
 */
@WebServlet("/Addexpenseservlet")
public class Addexpenseservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addexpenseservlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,IllegalArgumentException {
	
		
		String date = request.getParameter("Date1");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date udob = null;
		
		try {
			
			udob = sdf.parse(date);
			
			long ms =udob.getTime();
			
			java.sql.Date sqdob = new java.sql.Date(ms);
			
		
		String Reason = request.getParameter("Reason");
		String Amount = request.getParameter("Amount");
		
		
		
		boolean isTrue = false;
		        
		Expenses expenses = new ExpensesDBUtil();
		
		isTrue = expenses.addExpenses(sqdob ,Amount, Reason);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("ListExpenses.jsp");
			dis.forward(request, response);
			
			
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("");
			dis.forward(request, response);
			
		}
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}


