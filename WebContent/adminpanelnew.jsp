<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet"> 
    <link href="assets/css/style.css" rel="stylesheet">
    
   
</head>
<body>
				<%
				    if(session.getAttribute("user") == "Owner")
				            { 
      	 
				%>
    <nav class="navbar navbar-inverse">
        <%@include file="Nav.jsp" %>
    </nav>
    <div class="top"></div>
    <section>
        <div class="container">
            <div class="Contents">
                <h2>Welcome to Richwin Hotel</h2>
                
            </div>
        </div>
        
        
        <div class="container">
        
            <div class="row box-home">
            
                <a href="">
                    <div class="col-md-3 col-lg-3 box-item">
                        <div class="box-item-icon">
                            <img src="assets/image/emp.jpg">
                        </div>
                        <div class="box-item-topic">
                           Working Employees
                        </div>
                        
  					<%
                    
                    //making the database connection
                    
                    Statement stmt = null;
                    Connection con = null;
                    ResultSet rs = null;

                    con = DBConnect.getConnection();
                    
                  //Getting values from the employee form
                  

                    stmt = con.createStatement();
                    //Getting details from the employee table
                    String sql ="Select Count(EmployeeID) from hotelmanage.employee";
                            
                        rs = stmt.executeQuery(sql);
                          
                            	rs.next();
                                int count = rs.getInt(1);
                              
                            
                    %>
                    	<div style="font-size: 35px"> <%=count %></div>
                    </div>
                </a>
                
                
                <a href="">
                    <div class="col-md-3 col-lg-3 box-item">
                        <div class="box-item-icon">
                            <img src="assets/image/money.jpg">
                        </div>
                        <div class="box-item-topic">
                           Pending  Payments
                        </div>
                        	<%
                    
                    //making the database connection
                    
                    Statement stmt1 = null;
                    Connection con1 = null;
                    ResultSet rs1 = null;

                    con1 = DBConnect.getConnection();
                    
                  //Getting values from the employee form
                  

                    stmt1 = con1.createStatement();
                    //Getting details from the employee table
                    String sql1 ="Select Count(salaryID) from hotelmanage.salary where Paid_Status = 'paid'";
                            
                        rs1 = stmt1.executeQuery(sql1);
                          
                            	rs1.next();
                                int count1 = rs1.getInt(1);
                              
                            
                    %>
                     <div style="font-size: 35px"><%=count1 %></div>
                    
                    </div>
                </a>
                
                
                
                
                <a href="">
                    <div class="col-md-3 col-lg-3 box-item">
                        <div class="box-item-icon">
                            <img src="assets/image/pending.png">
                        </div>
                        <div class="box-item-topic">
                            Total Expenses
                        </div>
                        <%
                    
                    //making the database connection
                    
                    Statement stmt2= null;
                        Statement stmt7 = null;
                    Connection con2 = null;
                    ResultSet rs2 = null;
                    ResultSet rs7,rs8 = null;

                    con2 = DBConnect.getConnection();
                    
                  //Getting values from the employee form
                  

                    stmt2 = con2.createStatement();
                    //Getting details from the employee table
                    
                    String sql2 ="Select SUM(Amount) from hotelmanage.expenses ";
                    
                  
                    
                    
               
                 	rs2 = stmt2.executeQuery(sql2);
                   rs2.next();
                  int count2 = rs2.getInt(1);
                   	
                    
                            
                    %><div style="font-size: 35px"><%=count2 %></div>
                    </div>
                </a>
                
               
                
            </div>
               <hr style="height:2px;border-width:0;color:gray;background-color:gray">
            <div>
            Upcoming events
            </div>
            <hr style="height:2px;border-width:0;color:gray;background-color:gray">
            
             <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Number</th>                                                
                            <th scope="col">Crowd</th>
                            <th scope="col">Hall Number</th>   
                             <th scope="col">Event Type</th>   
                            <th scope="col">Date</th>  
                             <th scope="col">Action</th>                                                  
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    try{ 
                        Connection con4 = null;
                        Statement stmt4 = null;
                        ResultSet rs4 = null;

                        con4 = DBConnect.getConnection();
                        stmt4=con4.createStatement();

                        String search =request.getParameter("ssearch");
                        
                        String sql4 ="SELECT * FROM hotelmanage.event order by EventID DESC limit 5";
                         
                        rs4 = stmt4.executeQuery(sql4);
                        while(rs4.next()){
                        	
                        	
                        %> 
                        <tr>
                            <th scope="row"><%=rs4.getString("EventID") %></th>                                                  
                            <td><%=rs4.getString("NoOfGuest") %></td>
                            <td><%=rs4.getString("HallNumber") %></td>
                            <td><%=rs4.getString("EventType") %></td>
                            <td><%=rs4.getString("Date") %></td>                         
                            <td>
                                <a href='UpdateEvent.jsp?id=<%=rs4.getString("EventID") %>' class="btn btn-info">Edit</a>
                               
                            </td>
                        </tr>
                            <% 
                                }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                }
                            %>    
                    </tbody>
                </table> 
            
              <hr style="height:2px;border-width:0;color:gray;background-color:gray">
              
              
              
              
               
               <br><br>
               
               
               <div >
               
               
               
               <div style="width: 45%; float: left;margin-right:5px;">
               
               
               <hr style="height:2px;border-width:0;color:gray;background-color:gray; ">
            <div>
           Paid Employee Payments
            </div>
            <hr style="height:2px;border-width:0;color:gray;background-color:gray">
            
             <table class="table" >
                    <thead>
                        <tr>
                            <th scope="col">Number</th>                                                
                            <th scope="col">Employee Name</th>
                            <th scope="col">Date</th>                                            
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    try{ 
                        Connection con5 = null;
                        Statement stmt5 = null;
                        ResultSet rs5 = null;

                        con5 = DBConnect.getConnection();
                        stmt5=con5.createStatement();

                       
                        String  sql5 ="SELECT s.salaryID, e.Name , s.Date FROM hotelmanage.salary s INNER JOIN hotelmanage.employee e ON e.EmployeeID = s.employeeID order by salaryID DESC limit 5";
                            
                        rs5 = stmt5.executeQuery(sql5);
                        while(rs5.next()){
                        %> 
                        <tr>
                            <th scope="row"><%=rs5.getString("salaryID") %></th>                                                  
                            <td><%=rs5.getString("Name") %></td>
                            <td><%=rs5.getString("Date") %></td>
                            
                        </tr>
                            <% 
                                }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                }
                            %>    
                    </tbody>
                </table> 
            
              <hr style="height:2px;border-width:0;color:gray;background-color:gray">
              
              </div>
               
               
               
               
               
                   <div style="width: 50%; float: right;">
               
               
               <hr style="height:2px;border-width:0;color:gray;background-color:gray; ">
            <div>
          	Pending Event Payments
            </div>
            <hr style="height:2px;border-width:0;color:gray;background-color:gray">
            
             <table class="table" >
                    <thead>
                        <tr>
                            <th scope="col">Number</th>                                                
                            <th scope="col">Customer Name</th> 
                            <th scope="col">Balance</th> 
                                                              
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    try{ 
                        Connection con5 = null;
                        Statement stmt5 = null;
                        ResultSet rs5 = null;

                        con5 = DBConnect.getConnection();
                        stmt5=con5.createStatement();

                       
                        String  sql5 ="SELECT ep.PaymentID ,c.FirstName ,ep.BalancePayment FROM ((hotelmanage.eventpayment ep INNER JOIN hotelmanage.event e ON ep.eventID = e.EventID)INNER JOIN hotelmanage.customer c ON c.CustomerID = e.CustomerID) LIMIT 5";
                        		
                        			
                        rs5 = stmt5.executeQuery(sql5);
                        while(rs5.next()){
                        %> 
                        <tr>
                            <th scope="row"><%=rs5.getString("PaymentID") %></th>                                                  
                            <td><%=rs5.getString("FirstName") %></td>   
                            <td><%=rs5.getString("BalancePayment") %></td>
                            
                            
                        </tr>
                            <% 
                                }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                }
                            %>    
                    </tbody>
                </table> 
            
              <hr style="height:2px;border-width:0;color:gray;background-color:gray">
              
              </div>
              
               </div>
               
               
              
        </div>
    </section>
    
   				 <%                    	
				           }
				             else
				               {  
				                response.sendRedirect("Login.jsp");
				            	
				         }
				            
				   %>
</body>

       
</html>