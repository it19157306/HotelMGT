package com.UtilityBills;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddnewBilltype
 */
@WebServlet("/AddnewBilltype")
public class AddnewBilltype extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddnewBilltype() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String Name = request.getParameter("billtype");
		
		boolean isTrue = false;
		      
		UtilityDBUtil utilitybill  = new UtilityDBUtil();
		
				isTrue = utilitybill.addutilitybilltype(Name);			
			
	
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("AddUtilityBill.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("");
			dis.forward(request, response);
			
			}
		}
		
	}


