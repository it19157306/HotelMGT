<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
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
                <h2>Expenses List</h2>
                
                 
                <form action="" style= "width: 45%">
                <div class="col-md-3 col-lg-3" style= "width: 75%; float: inherit;;">
                    <input type="search" class="form-control"  id="ssearch" name= "ssearch"  placeholder="Search by Amount"  >
                   
                </div>
                </form>
                
                <div class="container" style="width: 90%;">
                    <a class="btn btn-primary" href="AddCustomer.jsp">Add New</a>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Number</th>                                                
                            <th scope="col">AddedDate</th>
                            <th scope="col">Updated Date</th>
                            <th scope="col">Reason</th>     
                            <th scope="col">Amount</th>   
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
                            
                            sql ="SELECT * FROM hotelmanage.expenses where Amount like '%"+search+"%' ";
                        }else{
                            
                            sql ="SELECT * FROM hotelmanage.expenses order by ExpensesID DESC";
                        }
                        rs = stmt.executeQuery(sql);
                        while(rs.next()){
                        %> 
                         <tr>
                            <th scope="row"><%=rs.getString("ExpensesID") %></th>                                                  
                            <td><%=rs.getString("AddedDate") %></td>
                            <td><%=rs.getString("UpdatedDate") %></td>
                            <td><%=rs.getString("Reason") %></td>
                            <td><%=rs.getString("Amount") %></td>
                            <td>
                                <a href='UpdateExpenses.jsp?id=<%=rs.getString("ExpensesID") %>' class="btn btn-warning">Edit</a>
                               
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