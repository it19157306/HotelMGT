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
    <title>Expenses List</title>
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
                <h2>Supplier  Report</h2>
                <div class="container" style="width: 90%;">
                
                
                </div>
                <br>
                <table class="table" >
                    <thead>
                        <tr>
                             <th scope="col">Number</th>  
                             <th scope="col">Name</th>                                              
                            <th scope="col">Contact Number</th>
                            <th scope="col">Address</th>
                            <th scope="col">Category</th>     
                           
                                                                                       
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
                       
                        String sql;
                           
                        sql ="SELECT * FROM hotelmanage.supplier ORDER BY Category";
                        		
                        		
                       
                        rs = stmt.executeQuery(sql);
                        
                        while(rs.next()){
                        
                            %> 
                            <tr>
                            
                            <th scope="row"><%=rs.getString("SupplerID") %></th>                                                  
                            <td><%=rs.getString("Name") %></td>
                            <td><%=rs.getString("ContactNumber") %></td>
                            <td><%=rs.getString("Address") %></td>
                            <td><%=rs.getString("Category") %></td>
                            
                            
                        
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