<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>SELECT MEAL TYPE</title>
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
                <h2>Add New Supplier</h2>
                <form action="addMealType" method="POST">
                    <select id="inputState" class="form-control custom-select" name="MealType" required>
                        <option value="0" selected>Choose...</option> 
                        <% try{
                                    Statement stmt2 = null;
                                    Connection con2 = null;
                                    ResultSet rs2 = null;
                        
                                    con2 = DBConnect.getConnection();
                                    stmt2 = con2.createStatement();
                                
                            //Getting details from the Meal Lsit table
                            String sql2 ="Select * from hotelmanage.mealmenu";
                        
                            rs2 = stmt2.executeQuery(sql2);
                            while(rs2.next()){
                        %>
                         <option value="<%=rs2.getString("MealType")%>" ><%=rs2.getString("MealType")%></option>
                        <%
                                } }finally{}
                        %>
                    </select>
                    <input type="hidden" value="<%= request.getParameter("id") %>" name="eventId">
                    <button type="submit" class="btn btn-primary">Add Meal Type</button>
                </form>
            </div>
        </div>
    </section>
</body>
</html>