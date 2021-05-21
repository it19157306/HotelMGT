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
    <title>Utility Bill List</title>
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
                <h2>Utility Bill List</h2>
                
                <form action="" style= "width: 45%" >
                
                <div class="col-md-3 col-lg-3" style= "width: 75%; float: inherit;;">
                 <input type="search" class="form-control"  id="supsearch" name= "supsearch"  placeholder="Search by Bill type or Amount"  >
               
                </div>
                </form>
                
                
                
                <div class="container" style="width: 90%;">
                    <a class="btn btn-primary" href="AddUtilityBill.jsp">Add New</a>
                </div>
                <table class="table" id= "myTable">
                    <thead>
                        <tr>
                            <th scope="col">Number</th>                                                
                            <th scope="col">AddedDate</th>
                            <th scope="col">Updated Date</th>
                            <th scope="col">BillType</th>     
                            <th scope="col">Amount</th>     
                            <th scope="col">Action</th>                                                  
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    try{ 
                        Connection con1 = null;
                        Statement stmt1 = null;
                        ResultSet rs1 = null;
                       
                        con1 = DBConnect.getConnection();
                        stmt1=con1.createStatement();

                        String search =request.getParameter("supsearch");
                        String sql1;
 
                        if(search != null){
                            
                            sql1 ="SELECT * FROM hotelmanage.utilitybills Where   BillType like '%"+search+"%'  or Amount like '%"+search+"%' ";
                            
                        }else{
                        	
                        	sql1 ="SELECT * FROM hotelmanage.utilitybills order by   BillID  DESC";
                        }

                        rs1 = stmt1.executeQuery(sql1);
                        
                        while(rs1.next()){
                    %> 
                        <tr>
                            <th scope="row"><%=rs1.getString("BillID") %></th>                                                  
                            <td><%=rs1.getString("AddedDate") %></td>
                            <td><%=rs1.getString("UpdatedDate") %></td>
                            <td ><%=rs1.getString("BillType") %></td>
                            <td><%=rs1.getString("Amount") %></td>
                            <td>
                                <a href='UpdateUtilityBill.jsp?id=<%=rs1.getString("BillID") %>' class="btn btn-warning">Edit</a>
                                
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