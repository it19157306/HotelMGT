<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Expenses</title>
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
                <h2>Add Expenses</h2>
                <form method="post" action="AddExpense" name = "myform">
            <div class="form-group">
                <label for="exampleInputPassword1">Date</label>
                 <input type="date" class="form-control" id="Date1" name="Date1" required="required" style="padding-top:0;">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Amount</label>
                <input type="number" class="form-control" placeholder="Amount" name= "Amount" required="required" onkeypress="validate()"  onkeyup="validate()">
            </div>
            <div class="form-group">
                
                <label for="exampleInputPassword1">Reason</label>
                <textarea class="form-control" id="Reason" name="Reason" required="required"></textarea>
            </div>

            <button type="submit" class="btn btn-primary">Add Expenses</button>
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

<script>  
  function validate(){  
  var num=document.myform.Amount.value;  
  if (isNaN(num)){  
    alert("Enter only numeric values"); 
    return false;  
  }else{
    return true;  
  }  
  }  
</script>  
</html>