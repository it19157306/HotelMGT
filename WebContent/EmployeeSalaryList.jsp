<%@page import="java.awt.print.Printable"%>
<%@page import="java.sql.SQLException"%>
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
    <title>Employee Salary List</title>
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
                <h2>Employee Salary List</h2>
                <div class="container" style="width: 90%;">
                    <a class="btn btn-primary" href="AddCustomer.jsp">Add New</a>
                </div>
                <table class="table">
                     <thead>
                        <tr>
                            <th scope="col">Number</th>  
                            <th scope="col">Name</th>  
                            <th scope="col">Basic</th>        
                            <th scope="col">Date</th>                                                                                                         
                            <th scope="col">Total Salary</th>                        
                            <th scope="col">OT</th>                 
                            <th scope="col">Action</th>                                               
                        </tr>
                     </thead>
                     <tbody>
                    <%
                    try{ 
                        Connection con = null;
                        Statement stmt = null;
                     
                        ResultSet rs= null;
                      
                         
                        con = DBConnect.getConnection();
                        stmt=con.createStatement();
                         
                        String search =request.getParameter("cussearch");
                        String sql = null;;
                     
                     
                                 
                        if(search != null){
                            sql = "SELECT e.Name,s.salaryID, s.Basic ,s.Paid_Status, s.Date ,s.TotalSalary, s.employeeID from hotelmanage.employee e INNER JOIN hotelmanage.salary s ON e.employeeID = s.employeeID  WHERE e.Name like '%"+search+"%'";  
                        }else{
                            sql = "SELECT e.Name,s.salaryID, s.Basic ,s.Paid_Status, s.Date ,s.TotalSalary , s.employeeID from hotelmanage.employee e INNER JOIN hotelmanage.salary s ON e.employeeID = s.employeeID";                                   
                        }
   
                        rs = stmt.executeQuery(sql);

                        while(rs.next() ){
                        %> 
                             
                        <tr>
                            <td><%=rs.getString("salaryID") %></td>
                            <td><%=rs.getString("Name") %></td>
                            <td><%=rs.getString("Basic") %></td>
                            <td><%=rs.getString("Date") %></td>                                                                                                    
                            <td><%=rs.getString("TotalSalary") %></td>
                             
                          
                            <td><a href='AddOTEmployee.jsp?id=<%=rs.getString("salaryID") %>' class="btn btn-warning">Add OT</a></td>
                                                                                
                            <td>
                                <input type="hidden" id= "employeeID" name ="employeeID" value ='<%=rs.getString("employeeID") %>' >
                                <a href='AddOTEmployee.jsp?id=<%=rs.getString("salaryID") %>' class="btn btn-warning" onclick="sessions();">Edit</a>
                               
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
            </div>
        </div>
    </section>
</body>
</html>