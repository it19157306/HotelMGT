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
    <title>Room Payment</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet"> 
    <link href="assets/css/style.css" rel="stylesheet">
    <script type="text/javascript">
    function calculateTotal() {
         ar daycount = document.getElementById('daycount').value;
        var nights = document.getElementById('nights').value;
            var val2= daycount * nights;
            var totalEl = document.getElementById('totalPrice');
            totalEl.value = val2;
            totalEl.style.display = 'block';
    }
    </script>
</head>
<body>
    <nav class="navbar navbar-inverse">
        <%@include file="Nav.jsp" %>
    </nav>
    <div class="top"></div>
    <section>
        <div class="container">
            <div class="Contents">
                <h2>Room Payment</h2>
                <form method="post" action="" >
            <div class="form-group">
                <label for="exampleInputPassword1">Customer Name</label>
                 <input type="text" class="form-control"  name="Name" required="required" placeholder="Customer Name">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Room Type</label>
                <input type="text" class="form-control" placeholder="Room Type" name= "Amount" required="required">
            </div>
            <div class="form-group">
                
                <label for="exampleInputPassword1">Number Of days</label>
                <input type="text" class="form-control" placeholder="Number Of days" id="daycount" name="daycount" required="required" onkeyup="calculateTotal()" onkeypress="calculateTotal()">
            </div>
            
             <div class="form-group">
                
                <label for="exampleInputPassword1">Number of Rooms</label>
                <input type="text" class="form-control" id="numberrooms" name="numberrooms" required="required">
            </div>
            
             <div class="form-group">
                
                <label for="exampleInputPassword1">Kids</label>
                <input type="text" class="form-control" id="Reason" name="Reason" required="required">
            </div>
            
             <div class="form-group">
                
                <label for="exampleInputPassword1">Adults</label>
                <input type="text" class="form-control" id="Reason" name="Reason" required="required">
            </div>
            
             <div class="form-group">                                         
                <label for="exampleInputPassword1">Price Per Night</label>
                <input type="text" class="form-control" id="nights" name="nights" required="required" onkeyup="calculateTotal()" onkeypress="calculateTotal()">
            </div>
            
              <div class="form-group">                                         
                <label for="exampleInputPassword1">Discounts</label>
                <input type="text" class="form-control" id="Reason" name="Reason" required="required">
            </div>
            
              <div class="form-group">                                         
                <label for="exampleInputPassword1">Total Payment</label>
                <input type="text" class="form-control" id="totalPrice"  name="totalPrice" readonly="readonly" >
            </div>

            <button type="submit" class="btn btn-primary" >Add Payment</button>
        </form>
        </div>
        </div>
    </section>
</body>
</html>