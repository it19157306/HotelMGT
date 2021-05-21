     package com.Login;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.Login.*;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Get User id and Password from the Form
		String id = request.getParameter("username");
		String password = request.getParameter("password");
		
		//Create the Session
		HttpSession session = request.getSession();
						
		//Create an Object LoginDBUtil Class
		LoginDBUtil loginCheck = new LoginDBUtil();
			
		boolean isTrue;
		
	
		//Check the Email and Password
		if(loginCheck.checkReceptionist(id, password))
		{			
			
							
			//Assign Values to the session
			session.setAttribute("user", "Receptionist");
			session.setAttribute("id", id);
			
			//Login Success Message
			System.out.println("Login Success");
			
			//Redirect to the Customer Profile Page
			response.sendRedirect("Home.jsp");
							
		}

		else if(loginCheck.checkManager(id, password))
		{
			
			
			session.setAttribute("user", "Manager");
			session.setAttribute("id", id);
			
			//Redirect to the admin Profile Page
			response.sendRedirect("Home.jsp");
			
			//Login Success Message
			System.out.println("Admin Login Success");
			
			
		}else if(loginCheck.checkOwner(id, password))
			
		{
			
			
			 session.setAttribute("user", "Owner");
			 session.setAttribute("id", id);
			 
			//Redirect to the admin Profile Page
			response.sendRedirect("adminpanelnew.jsp");
			//Login Success Message
			System.out.println("Admin Login Success");
		   
			
		}else if(loginCheck.checkCustomer(id, password))
			
		{
			//Login Success Message
			System.out.println("Admin Login Success");
			
			//Redirect to the admin Profile Page
			response.sendRedirect("Home.jsp");
			
			session.setAttribute("user", "customer");
			session.setAttribute("id", id);
			
		}
						
		else {
			//Login Failed Message
			System.out.println("Login Failed");
			
			//Redirect to the Customer Profile Page
			response.sendRedirect("Login.jsp");
		}
	}
	
}


