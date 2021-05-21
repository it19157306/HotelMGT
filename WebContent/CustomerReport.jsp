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
    <title>Customer List</title>
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
                <h2>Customer Report</h2>
                <div class="container" style="width: 90%;">
                
                    <form action="" method="POST">
                    
                    
                        <div class="col-md-6 col-lg-6">
                            <div class="form-group">
                            <select name ="Gender">
                            	<option>Male</option>
                            	<option>Female</option>
                            </select>
                               
                            </div>
                        </div>
                       
                        <div class="row" style="text-align: center;">
                            <button type="submit" class="btn btn-primary">Genarate</button>
                        </div>
                        
                    </form>
                    
                    
                    
                   
                </div>
                <br>
                <table class="table" >
                    <thead>
                        <tr>
                            <th scope="col">Number</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">NIC</th>  
                            <th scope="col">Email</th>                             
                             <th scope="col">Address</th>    
                            
                                                                                       
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
                       
                        String Gender = request.getParameter("Gender");
                        
                        String sql;
                        
                        if(Gender != null){
                           
                        sql ="SELECT * FROM hotelmanage.customer WHERE Gender = '"+Gender+"' ";
                        
                        }else{
                        	
                        	 sql ="SELECT * FROM hotelmanage.customer ";
                        	
                        }	
                        		
                       
                        rs = stmt.executeQuery(sql);
                        
                        while(rs.next()){
                        
                            %> 
                            <tr>
                            
                         <td id= "CustomerID" ><%=rs.getString("CustomerID") %></td>
                        <td><%=rs.getString("FirstName") %></td>
                        <td><%=rs.getString("LastName") %></td>
                        <td><%=rs.getString("NIC") %></td>
                        <td><%=rs.getString("Email") %></td>                     
                      <td><%=rs.getString("Address") %></td>
                            
                            
                        
                        </tr>
                            <% 
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