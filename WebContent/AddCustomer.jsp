<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
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
                <h2>Add New Customer</h2>
                <form method="post" action="AddcustomerfromReception" >
                    <div class="form-group">
                        <label for="exampleInputEmail1">Customer First Name</label>
                        <input type="text" class="form-control" placeholder="First Name" name="firstname" required="required">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Customer Last Name</label>
                        <input type="text" class="form-control" placeholder="Last Name" name="lastname" required="required">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Address</label>
                        <input type="text" class="form-control" placeholder="Address" name= "Address" required="required">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Contact Number</label>
                        <input type="number" class="form-control" placeholder="contactnumber" name="contactnumber" required="required">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">NIC</label>
                        <input type="text" class="form-control" placeholder="NIC/Passport" name="NIC" required="required">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Country</label>
                        <input type="text" class="form-control" placeholder="Country" name="Country" required="required">
                    </div>   
                    
                    <div class="form-group">
                        <label for="exampleInputPassword1">Email</label>
                        <input type="text" class="form-control" placeholder="Email" name="email" >
                    </div>                                           
                    <div class="form-group">
                        <label for="exampleInputPassword1">Gender</label>
                        <select class="form-control custom-select" name="Gender" required="required">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                  <br>
                  
                  
                    <button type="submit" class="btn btn-primary">Proceed</button>
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
    </script>
</html>