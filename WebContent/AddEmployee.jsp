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
    <title>Add Employee</title>
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
                <h2>Add New Employee</h2>
                <form action="AddEmployee" method="post">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Employee Name</label>
                        <input type="text" class="form-control" placeholder="EmployeeName"  required = "required" name= "EmployeeName">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Address</label>
                        <input type="text" class="form-control" placeholder="Address" name="Address"  required = "required">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Contact Number</label>
                        <input type="text" class="form-control" placeholder="Contact Number" name="ContactNumber"  required = "required">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">NIC</label>
                        <input type="text" class="form-control" placeholder="NIC/Passport" name="NIC"  required = "required">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Basic Salary</label>
                        <input type="text" class="form-control" placeholder="Basic Salary" name="BasicSalary"  required = "required">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Gender</label>
                        <select class="form-control custom-select" name="Gender">
                            <option id="Male">Male</option>
                            <option id="Female">Female</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Designation</label>
                        <select class="form-control custom-select" name="Designation">
                            <option id="Owner">Owner</option>
                            <option id="Manager">Manager</option>
                            <option id="Employee">Employee</option>
                            <option id="Employee">Receptionist</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Username</label>
                        <input type="text" class="form-control" placeholder="Username" name="Username">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input type="password" class="form-control" placeholder="Password" name="Password" id="Password">
                        <input type="checkbox" onclick="myFunction()">Show Passowrd
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Confirm Password</label>
                        <input type="password" class="form-control" placeholder="Confirm Password">
                    </div>
                    <button type="submit" class="btn btn-primary">Add New User</button>
                 </form>
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


 <script type="text/javascript">
        function myFunction() {
            var x = document.getElementById("Password");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
        
        function passwordCheck(){
            var pass = document.getElementById("Password").value;
            var confPass = document.getElementById("confirmPassword").value;
            if(pass != confPass){
                alert("Password Confirmation Failed! Enter Confirm Password Again!");
            }
            else{
                document.getElementById("signup-form").submit();            
            }
        }
        </script>
</html>