<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<!DOCTYPE html>
<html>
<head>
			
    <title>Event Payment List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet"> 
    <link href="assets/css/style.css" rel="stylesheet">
    
</head>
    <nav class="navbar navbar-inverse">
        <%@include file="Nav.jsp" %>
    </nav>
    <div class="top"></div>
    <section>
        <div class="container">
            <div class="Contents">
                <h2>Payment List</h2>
                <div class="container" style="width: 90%;">
                
                 <form action="" style= "width: 45%">
                <div class="col-md-3 col-lg-3" style= "width: 75%; float: inherit;;">
                    <input type="search" class="form-control"  id="ssearch" name= "ssearch"  placeholder="Search by Contact number.."  >
                   
                </div>
                </form>
                  
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Number</th>                                                
                            <th scope="col">Contact Number</th>
                            <th scope="col">Total Payment</th>
                            <th scope="col">Advance Payment</th>     
                            <th scope="col">Balance Payment</th>
                            <th scope="col">Advance Pay Date</th>  
                            <th scope="col">Payment Status</th>  
                            <th scope="col">Action</th>    
                                                               
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        
                    Connection con,con1= null;
                    Statement stmt,stmt1 = null;
                    ResultSet rs,rs1 = null;

                    con = DBConnect.getConnection();
                    con1 = DBConnect.getConnection();

                    stmt=con.createStatement();

                    stmt1=con1.createStatement();

                    String search =request.getParameter("ssearch");
                    String sql,sql1=null;

                    if(search != null){
                        sql ="SELECT * FROM hotelmanage.eventpayment order by PaymentID  DESC";
                        sql1 = "SELECT  c.contactNumber FROM (hotelmanage.customer c  INNER JOIN hotelmanage.event e ON e.CustomerID = c.CustomerID)   INNER JOIN hotelmanage.eventpayment pe ON pe.eventID = e.EventID  WHERE c.contactNumber like '%"+search+"%' ";
                        		
                        		                                             
                    }else{
                        sql ="SELECT * FROM hotelmanage.eventpayment order by PaymentID  DESC";
                        sql1 = "SELECT  c.contactNumber FROM (hotelmanage.customer c  INNER JOIN hotelmanage.event e ON e.CustomerID = c.CustomerID)   INNER JOIN hotelmanage.eventpayment pe ON pe.eventID = e.EventID";
                    }

                    rs = stmt.executeQuery(sql);
                    rs1 = stmt1.executeQuery(sql1);

                    while(rs.next() && rs1.next()){

                    %> 
                            
                    <tr>
                        <th scope="row"><%=rs.getString("PaymentID") %></th>    
                        <td><%=rs1.getString("ContactNumber") %></td>                                       
                        <td><%=rs.getString("TotalPayment") %></td>
                        <td><%=rs.getString("AdvancePayment") %></td>
                        <td><%=rs.getString("BalancePayment") %></td>
                        <td><%=rs.getString("AdvancePayDay") %></td>
                        <td><%=rs.getString("Status") %></td>
                        <td>
                            <input type="hidden" name="eventID" value='<%=rs.getString("eventID") %>'>
                            <a href='UpdateEventPayment.jsp?id=<%=rs.getString("eventID") %>' class="btn btn-warning">Update</a>
                          
                        </td>
                    </tr>
                        <% } %>
                        
                         
                    </tbody>
                </table> 
            </div>
        </div>
    </section>
</body>
</html>