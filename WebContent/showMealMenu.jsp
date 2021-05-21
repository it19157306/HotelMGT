<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Meal Menu</title>
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
                <h2>Meal Menu</h2>
                
                <h3>Condiments</h3>
                <ul>               
                <%
                if(request.getParameter("eventID")!=null){
                	
                    int eventId = Integer.parseInt(request.getParameter("eventID"));
                    
                    Statement stmt2 = null;
                    Connection con2 = null;
                    ResultSet rs2 = null;

                    con2 = DBConnect.getConnection();
                    stmt2 = con2.createStatement();
                	
                    int condimentsLimit, desertsLimit, meat_and_dishessLimit, rice_and_noodlesLimit, saladLimit;
                    //Getting details from the Meal Lsit table
                    String sql2 ="Select * from hotelmanage.select_condiments WHERE MealID = '"+eventId+"'";

                    rs2 = stmt2.executeQuery(sql2);
                    while(rs2.next()){
                    %>
                    <li> <%=rs2.getString("CondimentName") %></li>
                    <%
                    }
                }
                %>
                </ul>
                
                <h3>Desert</h3>
                <ul>               
                <%
                if(request.getParameter("eventID")!=null){
                	int eventId = Integer.parseInt(request.getParameter("eventID"));
                	
	                Statement stmt2 = null;
	                Connection con2 = null;
	                ResultSet rs2 = null;
	
	                con2 = DBConnect.getConnection();
	                stmt2 = con2.createStatement();
	            	
	                
	                String sql2 ="Select * from hotelmanage.select_desert WHERE FIxedMID = '"+eventId+"'";
	
	                rs2 = stmt2.executeQuery(sql2);
	                while(rs2.next()){
	                %>
	                <li> <%=rs2.getString("Name") %></li>
	                <%
	                }
                }
                %>
                </ul>
                
                
                
                <h3>Meat And Fish Dishes</h3>
                <ul>               
                <%
                if(request.getParameter("eventID")!=null){
                	int eventId = Integer.parseInt(request.getParameter("eventID"));
                	
	                Statement stmt2 = null;
	                Connection con2 = null;
	                ResultSet rs2 = null;
	
	                con2 = DBConnect.getConnection();
	                stmt2 = con2.createStatement();
	            	
	                String sql2 ="Select * from hotelmanage.select_meat_and_dishes WHERE FIxedMID = '"+eventId+"'";
	
	                rs2 = stmt2.executeQuery(sql2);
	                while(rs2.next()){
	                %>
	                <li> <%=rs2.getString("Name") %></li>
	                <%
	                }
                }
                %>
                </ul>


                <h3>Rice And Noodles</h3>
                <ul>               
                <%
                if(request.getParameter("eventID")!=null){
                    int eventId = Integer.parseInt(request.getParameter("eventID"));
                    
                    Statement stmt2 = null;
                    Connection con2 = null;
                    ResultSet rs2 = null;
    
                    con2 = DBConnect.getConnection();
                    stmt2 = con2.createStatement();
                    
                    String sql2 ="Select * from hotelmanage.select_rice_and_noodles WHERE FIxedMID = '"+eventId+"'";
    
                    rs2 = stmt2.executeQuery(sql2);
                    while(rs2.next()){
                    %>
                    <li> <%=rs2.getString("Name") %></li>
                    <%
                    }
                }
                %>
                </ul>

                <h3>Salads</h3>
                <ul>               
                <%
                if(request.getParameter("eventID")!=null){
                    int eventId = Integer.parseInt(request.getParameter("eventID"));
                    
                    Statement stmt2 = null;
                    Connection con2 = null;
                    ResultSet rs2 = null;
    
                    con2 = DBConnect.getConnection();
                    stmt2 = con2.createStatement();
                    
                    String sql2 ="Select * from hotelmanage.select_salad WHERE FIxedMID = '"+eventId+"'";
    
                    rs2 = stmt2.executeQuery(sql2);
                    while(rs2.next()){
                    %>
                    <li> <%=rs2.getString("Name") %></li>
                    <%
                    }
                }
                %>
                </ul>

                <a href="ListEvents.jsp" class="btn btn-primary">Back to Event List</a>

            </div>
        </div>
    </section>
</body>
</html>