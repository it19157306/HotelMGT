<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee Salary</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet"> 
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
 			 <%
                if(request.getParameter("id")==null)
                {
                %>
                <div class="alert alert-warning fade in warning-title">
				  <strong>Warning!</strong> First, Select Relevant Salary button from salary List. <a href="EmployeeSalaryList.jsp" class="btn btn-warning">Salary List</a>
				</div>
                    
                <%
                }else{
                %>
                
    <nav class="navbar navbar-inverse">
        <%@include file="Nav.jsp" %>
    </nav>
    <div class="top"></div>
    <section>
        <div class="container">
            <div class="Contents">
                <h2>Add New Salary</h2>
                <form method="post" action="AddSalary">       
                           
                    <%
                    Statement stmt = null;
                    Connection con = null;
                    ResultSet rs = null;
                    
                    
                    
                    con = DBConnect.getConnection();                                
                    stmt=con.createStatement();
                     
                    //Getting values from the employee form
                    String id = request.getParameter("id");
                    
                    //Getting details from the employee table
                    String sql = "SELECT * FROM hotelmanage.employee  WHERE  EmployeeID = '"+id+"' ";   
                    
                    rs = stmt.executeQuery(sql);
                    while(rs.next()){                           
                    %> 
                    
                    <div class="form-group">
                        
                        <input type="hidden"  value='<%=rs.getString("EmployeeID") %>' name="employeeID">
                    </div>
                    
                    <div class="form-group">
                        <label for="exampleInputEmail1">Date</label>
                        <input type="date" class="form-control" placeholder="Date" required="required" name="Date" style="paddint-top:0;">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Basic</label>
                        <input type="number" class="form-control"  value='<%=rs.getString("BasicSalary") %>' required="required" name="basic">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Total Salary</label>
                        <input type="number" class="form-control" placeholder="Hall Cost" required="required" name ="totalsalary">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Salary Payment Status</label>
                        <select class="form-control custom-select" name="status">
                            <option >Handover</option>
                            <option >Pending to handover</option>
                        </select>
                    </div>
                    <button type="submit"  class="btn btn-primary" >Add Salary</button> 
                </form>
            </div>
        </div>
    </section>
    
   				 <%
   				 
   				 }
                    }
   				 
   				 %>
</body>
</html>