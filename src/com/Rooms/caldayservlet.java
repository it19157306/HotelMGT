package com.Rooms;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class caldayservlet
 */
@WebServlet("/caldayservlet")
public class caldayservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public caldayservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
		 String dateBeforeString = request.getParameter("startdate");
		 String dateAfterString = request.getParameter("enddate");
		 
		request.setAttribute(name, o);

		 try {
		       java.util.Date dateBefore =  myFormat.parse(dateBeforeString);
		       java.util.Date dateAfter =  myFormat.parse(dateAfterString);
		       long difference = dateAfter.getTime() - dateBefore.getTime();
		       float daysBetween = (difference / (1000*60*60*24));
	               /* You can also convert the milliseconds to days using this method
	                * float daysBetween = 
	                *         TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)
	                */
		       System.out.println("Number of Days between dates: "+daysBetween);
		       
		       request.setAttribute("value", daysBetween);
		       
		       RequestDispatcher dis = request.getRequestDispatcher("BookRoom.jsp?id=");
			   dis.forward(request, response);
		 } catch (Exception e) {
		       e.printStackTrace();
		 }
	   }
	}

