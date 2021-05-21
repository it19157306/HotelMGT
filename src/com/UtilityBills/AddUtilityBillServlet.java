package com.UtilityBills;

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

import com.Expenses.ExpensesDBUtil;
import com.interfaces.Expenses;


/**
 * Servlet implementation class AddUtilityBillServlet
 */
@WebServlet("/AddUtilityBillServlet")
public class AddUtilityBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUtilityBillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String date = request.getParameter("Date");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date udob = null;
		
		try {
			
			udob = sdf.parse(date);
			
			long ms =udob.getTime();
			
			java.sql.Date sqdob = new java.sql.Date(ms);
			
		
		String category = request.getParameter("category");
		String Amount = request.getParameter("amount");
		
		
		
		boolean isTrue = false;
		      
		UtilityDBUtil utilitybill  = new UtilityDBUtil();
		
				isTrue = utilitybill.addutilitybill(category,Amount,sqdob);			
			
	
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("ListUtilityBill.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("");
			dis.forward(request, response);
			
			}
		}catch(Exception e) {
			e.printStackTrace();
			}
		}
	}


