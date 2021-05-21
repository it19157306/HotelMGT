 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    <title>Customer List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet"> 
    <link href="assets/css/style.css" rel="stylesheet">
    
</head>
<body>

				<%
            	 if(session.getAttribute("user") == "Owner" || session.getAttribute("user") == "Manager" || session.getAttribute("user") == "Receptionist")
				            { 
      	 
				%>
    <nav class="navbar navbar-inverse">
        <%@include file="Nav.jsp" %>
    </nav>
    <div class="top"></div>
    <section>
        <div class="container">
            <div class="Contents">
                <h2>Customers List</h2>
                
                <form action="" style= "width: 45%">
                <div class="col-md-3 col-lg-3" style= "width: 75%; float: inherit;;">
                    <input type="search" class="form-control"  id="cussearch" name= "cussearch"  placeholder="Search by Contact number or NIC.."  >
                   
                </div>
                </form>
                
                <div class="container" style="width: 90%;">
                    <a class="btn btn-primary" href="AddCustomer.jsp">Add New</a>
                </div>
                <table class="table" >
                    <thead>
                        <tr>
                            <th scope="col">Number</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">NIC</th>  
                            <th scope="col">Email</th>  
                            <th scope="col">Contact Number</th>   
                            <th scope="col">Add Event</th>   
                            <th scope="col">Action</th>                                               
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
                        
                        String search =request.getParameter("cussearch");
                        String sql;
                           
                        if(search != null){
                            sql = "SELECT * FROM hotelmanage.customer WHERE contactNumber like '%"+search+"%' or NIC like '%"+search+"%'  ";
                        }else{
                            sql ="SELECT * FROM hotelmanage.customer";
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
                        <td><%=rs.getString("ContactNumber") %></td>
                        
                        <td><a href='AddEvent.jsp?id=<%=rs.getString("CustomerID") %>' class="btn btn-warning">Add Event</a></td>

                        <td>
                            <input type="hidden" name= "CustomrID" value = '<%=rs.getString("CustomerID") %>'>
                            <a href='UpdateCustomerFromReception.jsp?id=<%=rs.getString("CustomerID") %>' class="btn btn-warning">Edit</a>
                            
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