<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<!DOCTYPE html>
<html>
<head>

				<%
            	 if(session.getAttribute("user") == "Owner" || session.getAttribute("user") == "Manager" || session.getAttribute("user") == "Receptionist")
				            { 
      	 
				%>
    <title>Event List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet"> 
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-inverse">
        <%@include file="Nav.jsp" %>
    </nav>
    <div class="top"></div>
    <section>
        <div class="container">
            <div class="Contents">
                <h2>Event List</h2>
                
                <form action="" style= "width: 45%">
                <div class="col-md-3 col-lg-3" style= "width: 75%; float: inherit;;">
                    <input type="search" class="form-control"  id="ssearch" name= "ssearch"  placeholder="Search by hall number or Event Type .."  >
                   
                </div>
                </form>
               <br>
                
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Number</th>  
                            <th scope="col">Crowd</th>                                                                          
                            <th scope="col">Hall Number</th>   
                             <th scope="col">Event Type</th>   
                             <th scope="col">Date</th>  
                              <th scope="col">Meal Type</th> 
                               <th scope="col">Show Meal</th>   
                             <th scope="col">Add Meal</th>
                              <th scope="col">Add Payment</th>   
                             <th scope="col">Action</th>                                                  
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    try{ 
                        Connection con = null;
                        Statement stmt = null;
                        ResultSet rs,rs1 = null;

                        con = DBConnect.getConnection();
                        stmt=con.createStatement();

                        String search =request.getParameter("ssearch");
                        String sql;
                            
                        if(search != null){
                            sql ="SELECT * FROM hotelmanage.event where HallNumber like '%"+search+"%' or EventType like '%"+search+"%' ";
                        }else{
                            sql ="SELECT * FROM hotelmanage.event order by EventID DESC";
                        }
                        rs = stmt.executeQuery(sql);
                        while(rs.next()){
                        %> 
                        <tr>
                            <th scope="row"><%=rs.getString("EventID") %></th>                                                  
                            <td><%=rs.getString("NoOfGuest") %></td>
                            <td><%=rs.getString("HallNumber") %></td>
                            <td><%=rs.getString("EventType") %></td>
                            <td><%=rs.getString("Date") %></td>
                            <td><%=rs.getString("MealType") %></td>
                            <td><a href='showMealMenu.jsp?eventID=<%=rs.getString("EventID") %>' class="btn btn-success">Show Meal</a></td>
                            <td><a href='CustomerAddmenu.jsp?eventId=<%=rs.getString("EventID")%>&mealType=<%=rs.getString("MealType")%>'  class="btn btn-success">Add Meal</a></td>
                            <td><a href='AddEventPayement.jsp?eventId=<%=rs.getString("EventID")%>&mealType=<%=rs.getString("MealType")%>'  class="btn btn-success">Add Payment</a></td>
                            <td>
                                <a href='UpdateEvent.jsp?id=<%=rs.getString("EventID") %>' class="btn btn-info">Edit</a>
                               
                            </td>
                        </tr>
                            <% 
                                }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                }
                            %>    
                             <%                    	
				           }
				             else
				               {  
				                response.sendRedirect("Login.jsp");
				            	
				         }
				            
				   %> 
                    </tbody>
                </table> 
            </div>
        </div>
    </section>
</body>
</html>