<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
 <%@page import="java.text.ParseException" %>
 <%@page import="java.text.SimpleDateFormat" %>
 <%@page import=" java.sql.Date" %>

<!DOCTYPE html>
<html>
<head>
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
                <h2>Event Report</h2>
                <div class="container" style="width: 90%;">
                
                    <form action="" method="POST">
                    
                    
                        <div class="col-md-6 col-lg-6">
                            <div class="form-group">
                                <input type="date" class="form-control" id="date1" name="date1" required="required" style="padding-top: 0;">
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <div class="form-group">
                                <input type="date" class="form-control"id="date2" name="date2" required="required" style="padding-top: 0;">
                            </div>
                        </div>
                        <div class="row" style="text-align: center;">
                            <button type="submit" class="btn btn-primary">Genarate</button>
                        </div>
                        
                    </form>
                    
                    
                    <%
                    
                    
                    String date1 = request.getParameter("date1");
                    String date2 = request.getParameter("date2");
            		
            		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            		
            		java.util.Date udob = null;
            		java.util.Date udob1 = null;
            		
            		try {
            			
            			udob = sdf.parse(date1);
            			udob1 = sdf.parse(date2);
            			
            			long ms =udob.getTime();
            			long ms1 =udob1.getTime();
            			
            			java.sql.Date sqdob = new java.sql.Date(ms);
            			java.sql.Date sqdob1 = new java.sql.Date(ms1);
            			
				
			%>
                    
                   
                </div>
                <br>
                <table class="table" >
                    <thead>
                        <tr>
                              <th scope="col">Number</th>                                                
                            <th scope="col">Crowd</th>
                            <th scope="col">Hall Number</th>   
                             <th scope="col">Event Type</th>  
                              <th scope="col">Cost</th>  
                            <th scope="col">Date</th>  
                                                                                       
                        </tr>
                    </thead>
                    <tbody>
                    
                     <%
                        try{ 
                       Connection con = null;
                       Statement stmt = null;
                       ResultSet rs = null;
                       
                        
                        con = DBConnect.getConnection();
                        stmt=con.createStatement();
                       
                        String sql;
                           
                        sql ="SELECT * FROM hotelmanage.event  WHERE Date > '"+sqdob+"' AND  Date <'"+sqdob1+"' ";
                        		
                        		
                       
                        rs = stmt.executeQuery(sql);
                        
                        while(rs.next()){
                        
                            %> 
                            <tr>
                            
                             <th scope="row"><%=rs.getString("EventID") %></th>                                                  
                            <td><%=rs.getString("NoOfGuest") %></td>
                            <td><%=rs.getString("HallNumber") %></td>
                            <td><%=rs.getString("EventType") %></td>
                             <td><%=rs.getString("HallCost") %></td>
                            <td><%=rs.getString("Date") %></td>
                            
                            
                        
                        </tr>
                            <% 
                                }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                }
			} catch (Exception e) {
			      e.printStackTrace();
			}
                            %>    
                            
                            
                    </tbody>
                </table> 
            </div>
        </div>
    </section>
</body>
</html>