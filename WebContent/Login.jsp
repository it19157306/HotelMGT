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
    <title>Hotel Richwin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet"> 
    <link href="assets/css/style.css" rel="stylesheet">
    
   
</head>
<body>

<
    <nav class="navbar navbar-inverse">
        <%@include file="Nav.jsp" %>
    </nav>
    <div class="top"></div>
    <section>
    
    
        <div class="container">
        
            <div class="Contents">
            <div style="align-items: center; margin-left: 265px;">
    <img src="assets/image/logo-gold-hotel.png" alt="Girl in a jacket" >
    </div>
    <br>
                <h2>Login</h2>
                <form action="login" method = "post">
                    <div class="form-group">
                        <input type="text" class="form-control" id="username" name = "username" aria-describedby="emailHelp" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="password" name = "password" placeholder="Password">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block btn-submit">Sign In</button>
                    <div class="auth-options">
                        <div class="custom-control custom-checkbox form-group">
                            <input type="checkbox" class="custom-control-input" id="exampleCheck1">
                            <label class="custom-control-label" for="exampleCheck1">Remember me</label>
                        </div>
                        <a href="#" class="forgot-link">Forgot Password?</a>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>

</html>