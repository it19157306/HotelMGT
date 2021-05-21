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
 * Servlet implementation class AddEventPaymentServlet
 */
@WebServlet("/AddEventPaymentServlet")
public class AddEventPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEventPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String totalcost = request.getParameter("totalcost");	
		String adavancepay = request.getParameter("adavancepay");
		String balance = request.getParameter("balance");
		String EventID = request.getParameter("EventID");
		String status = request.getParameter("status");
		
		
		boolean isTrue = false;
		
		Event event = new EventDBUtil();
		
		isTrue = event.addeventpayment(totalcost,adavancepay,balance,EventID,status);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("ListEventPayment.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher(".jsp");
			dis.forward(request, response);
			
		}
		
		
		
	}
		
	
}
