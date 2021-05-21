package com.UtilityBills;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateUtilityBillServlets
 */
@WebServlet("/UpdateUtilityBillServlets")
public class UpdateUtilityBillServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUtilityBillServlets() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category = request.getParameter("category");
		String id = request.getParameter("BillID");
		String amount = request.getParameter("amount");
		
		
		boolean isTrue = false;;
		
		UtilityDBUtil utilitybill  = new UtilityDBUtil();
		
				isTrue = utilitybill.Updateutilitybill(category,amount,id);			
			
	
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("ListUtilityBill.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("");
			dis.forward(request, response);
			
					}
				}
	}


