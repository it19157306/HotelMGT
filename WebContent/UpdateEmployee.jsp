<%@page import="java.awt.Button"%>
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
    <title>Update Employee</title>
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
            
        				<%
            
				            if(session.getAttribute("user") == "Manager" || session.getAttribute("user") == "Owner")
				            { 
				          %>
				            	  
            
            	<%
                if(request.getParameter("id")==null)
                {
                %>
                <div class="alert alert-warning fade in warning-title">
				  <strong>Warning!</strong> First, Select Employee. <a href="ListEmployee.jsp" class="btn btn-warning">Employee List</a>
				</div>
                    
                <%
                }else{
                %>
                <h2>Update Employee</h2>
                <%
                    
                    //making the database connection
                    
                    Statement stmt = null;
                    Connection con = null;
                    ResultSet rs = null;

                    con = DBConnect.getConnection();
                    
                  //Getting values from the employee form
                    String id = request.getParameter("id");

                    stmt = con.createStatement();
                    //Getting details from the employee table
                    String sql ="Select * from hotelmanage.employee where EmployeeID = '"+id+"'";
                            
                        rs = stmt.executeQuery(sql);
                            while(rs.next()){
                    %>
                    <form action="UpdateEmployee" method="post">
                    
                     <input type="hidden" class="form-control" placeholder="EmployeeName" name = "id" value ='<%=rs.getString("EmployeeID") %>'>
                    
                        <div class="form-group">
                            <label for="exampleInputEmail1">Employee Name</label>
                            <input type="text" class="form-control" placeholder="EmployeeName" name = "EmployeeName" value ='<%=rs.getString("Name") %>'>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Address</label>
                            <input type="text" class="form-control" placeholder="Address" name="Address" value ='<%=rs.getString("Address") %>'>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Contact Number</label>
                            <input type="text" class="form-control" placeholder="Contact Number" name="ContactNumber" value ='<%=rs.getString("contactNumber") %>'>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">NIC</label>
                            <input type="text" class="form-control" placeholder="NIC/Passport" name="NIC" value ='<%=rs.getString("NIC") %>'>
                        </div>
                         <div class="form-group">
                            <label for="exampleInputPassword1">Basic Salary</label>
                            <input type="text" class="form-control" placeholder="NIC/Passport" name="BasicSalary" value ='<%=rs.getString("BasicSalary") %>'>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Gender</label>
                            <input type="text" class="form-control" placeholder="NIC/Passport" name="Gender" value ='<%=rs.getString("Gender") %>' readonly="readonly">
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleInputPassword1">Designation</label>
                            <select class="form-control custom-select" name="Designation">
                                
                                <option id="Owner"><%=rs.getString("Designation") %></option>
                                <option id="Manager">Manager</option>
                                <option id="Employee">Employee</option>
                                  <option id="Employee">Receptionist</option>
                            </select>
                        </div>
                     
                  
                         <div class="form-group">
                            <label for="exampleInputPassword1">Username</label>
                            <input type="text" class="form-control" placeholder="Username" value ='<%=rs.getString("Username") %>' name="Username">
                        </div>
                         <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="text" class="form-control" placeholder="Password" value ='<%=rs.getString("Password") %>' name="Password">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Confirm Password</label>
                            <input type="text" class="form-control" placeholder="Confirm Password" value ='<%=rs.getString("Password") %>'>
                        </div>
                        

                        
                        <button type="submit" class="btn btn-primary">Update User</button>
                        
                        
				               
				            	 
				            	 <button type="button" class="btn btn-danger"   data-toggle="modal" data-target="#deleteCus">Delete</button>
				            	  
				       
                    </form>
                      
                 
        </div>
        </div>
    </section>
    
    
    <div class="modal fade" id="deleteCus"  tabindex="-1" role="window" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="border-style: solid black;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Are You Sure?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
               
                <form action="DeleteEmployee" method="POST">
                  <input type="hidden" class="form-control"  name = "id" value ='<%=rs.getString("EmployeeID") %>'>
                    <div class="modal-body">
                        <table class="table table-borderless">
                             <tr>
                                <td>Customer Name</td> 
                                
                                <td>
                              
                                <input type="text" class="form-control"  name="customerNAme" value="<%=rs.getString("Name") %>" readonly="readonly"></td>
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
                }
                    %>
                    <% 
                    }else {
                     response.sendRedirect("Login.jsp");
				            	
				           }
				               %>
                        
</body>




</html>