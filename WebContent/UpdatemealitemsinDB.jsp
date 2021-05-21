<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Meal</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet"> 
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>

				<%
				
            	 if(session.getAttribute("user") == "Owner" || session.getAttribute("user") == "Manager")
				            { 
      	 
				%>
    <nav class="navbar navbar-inverse">
        <%@include file="Nav.jsp" %>
    </nav>
    <div class="top"></div>
    <section>
        <div class="container">
            <div class="Contents">
                <h2>Update Meal</h2>
                
                 <form method="post" action="updatemealmenu">
                                        
                                         
                    <%
                        
                        Statement stmt = null;
                        Connection con = null;
                        ResultSet rs = null;
                        
                        //Getting values from the employee form
                        String MealId = request.getParameter("MealId");
                        
                         con = DBConnect.getConnection();                               
                        stmt=con.createStatement();
                         
                        
                        
                        //Getting details from the employee table
                        String sql = "select * from hotelmanage.mealmenu where MealId = '"+MealId+"' ";
                        
                        rs = stmt.executeQuery(sql);
                        while(rs.next()){

                   		%>
                   		
                   		<input type="hidden" class="form-control"  name="MealId" value= '<%= request.getParameter("MealId") %>'>
                    	
                    	<div class="form-group">
                            <label for="exampleInputEmail1">Meal Menu name</label>
                            <input type="text" class="form-control"  name="mealname" placeholder="Meal menu name " value="<%=rs.getString("MealType")%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Menu Price</label>
                            <input type="text" class="form-control"  name="Price" placeholder="Menu Price" value="<%=rs.getString("TotalPrice")%>" >
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleInputEmail1">Condiments (Limit)</label>
                            <input type="number" class="form-control"  name="condimealname" min="1" max="5" value="<%=rs.getString("condimentsLimit")%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">MDesert (Limit)</label>
                            <input type="number" class="form-control"  name="dertmealname" min="1" max="5" value="<%=rs.getString("desertsLimit")%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Meat And Fish Dishes (Limit)</label>
                            <input type="number" class="form-control"  name="mfmealname" min="1" max="5" value="<%=rs.getString("meat_and_dishessLimit")%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Rice And Noodles (Limit)</label>
                            <input type="number" class="form-control"  name="rnmealname" min="1" max="5" value="<%=rs.getString("rice_and_noodlesLimit")%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Salads (Limit)</label>
                            <input type="number" class="form-control"  name="smealname" min="1" max="5" value="<%=rs.getString("saladLimit")%>">
                        </div>
                        
                         
                    
                        <button type="submit" class="btn btn-primary">Update Meal</button>
                       
                          <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteEvent">Delete</button>
                       
                    </form >
                    
                   
                    
                    
                  
                    
        </div>
        </div>
    </section>
    
    <div class="modal fade" id="deleteEvent"  tabindex="-1" role="window" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="border-style: solid black;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Are You Sure?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
               
                <form action="deleteMeal" method="POST">
                <input type="hidden" class="form-control"  name="MealId" value= '<%= request.getParameter("MealId") %>'>
                    <div class="modal-body">
                        <table class="table table-borderless">
                             <tr>
                                <td>Menu Name</td> 
                                <td><input type="text" class="form-control"  name="customerNAme" value="<%=rs.getString("MealType") %>" readonly="readonly"></td>
                            </tr>
                            
                        </table>   
                    </div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
                    <input type="submit" class="btn btn-danger" value="Delete">
                    </div>
                </form>
             </div>
        </div>
    </div>
    <% 
       		 }
					%>
					
					 <%                    	
				           }
				             else
				               {  
				                response.sendRedirect("Login.jsp");
				            	
				         }
				            
				   %> 
</body>
</html>