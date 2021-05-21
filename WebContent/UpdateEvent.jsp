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
    <title>Update Event</title>
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
                <h2>Update Event</h2>
                 <form method="post" action="UpdateEvent">
                                        
                                         
                    <%
                        
                        Statement stmt = null;
                        Connection con = null;
                        ResultSet rs = null;
                        
                        //Getting values from the employee form
                        String id = request.getParameter("id");
                        
                         con = DBConnect.getConnection();                               
                        stmt=con.createStatement();
                         
                        
                        
                        //Getting details from the employee table
                        String sql = "select * from hotelmanage.event where EventID = '"+id+"' ";
                        
                        rs = stmt.executeQuery(sql);
                        while(rs.next()){

                    %>
                    
                        <div class="form-group">
                            <label for="exampleInputPassword1">Event Type</label>
                            
                            <select class="form-control custom-select" name="EventType">
                          
                                <option ><%=rs.getString("EventType") %></option>
                                <option>Party</option>
                                 <option>Wedding</option>
                                <option>Conference</option>
                                <option>Conference</option>
                            </select>
                         </div>
                         
                         <input type="hidden" class="form-control"  name="EventID" value= '<%=rs.getString("EventID") %>'>
                         
                        <div class="form-group">
                            <label for="exampleInputEmail1">Date</label>
                            <input type="date" class="form-control" placeholder="Event Name" name="Date" value= '<%=rs.getString("Date") %>' style="padding-top: 0;">
                        </div>
                        
                       
                        <div class="form-group">
                            <label for="exampleInputPassword1">Number Of Guests</label>
                            <input type="number" class="form-control" placeholder="Password" name="GuestCount" value = '<%=rs.getString("NoOfGuest") %>'>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Hall</label>
                            <select class="form-control custom-select" name="HallNumber">
                            
                             <option id="hall1" ><%=rs.getString("HallNumber") %></option>
                                <option id="hall2">Hall 01</option>
                                 <option id="hall2">Hall 02</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Hall Cost</label>
                            <input type="number" class="form-control" placeholder="Hall Cost" name ="HallCost" value = '<%=rs.getString("HallCost") %>'>
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleInputPassword1">Meal Type</label>
                            <select required="required" id="inputState" class="form-control custom-select" name="MealType">
		                          <option value="">Choose...</option>
		                          <% try{
		                          	 Statement stmt2 = null;
		                               Connection con2 = null;
		                               ResultSet rs2 = null;
		
		                               con2 = DBConnect.getConnection();
		                               stmt2 = con2.createStatement();
		
		                               //Getting details from the Suplier table
		                               String sql2 ="select * from hotelmanage.mealmenu";
		
		                               rs2 = stmt2.executeQuery(sql2);
		                               while(rs2.next()){
		                          %>       
		                           <option value="<%=rs2.getString("MealID")%>" ><%=rs2.getString("MealType")%></option>
		                          <%
		                              } }finally{}
		                          %>
		                      </select>
                        </div>
                        
                        
                    
                        <button type="submit" class="btn btn-primary">Update Event</button>
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteEvent">Delete</button>
                    </form>
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
               
                <form action="DeleteEvent" method="POST">
                 <input type="hidden" class="form-control"  name="id" value= '<%=rs.getString("EventID") %>'>
                    <div class="modal-body">
                        <table class="table table-borderless">
                             <tr>
                                <td>Event Date</td> 
                                <td><input type="text" class="form-control"  name="customerNAme" value="<%=rs.getString("Date") %>" readonly="readonly"></td>
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
</body>
</html>