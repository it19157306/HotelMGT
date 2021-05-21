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
    <title>Add Event</title>
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
            	 if(session.getAttribute("user") == "Owner" || session.getAttribute("user") == "Manager" || session.getAttribute("user") == "Receptionist")
            		 
				            { 
      	 
				%>
            
                <%
                if(request.getParameter("id")==null)
                {
                %>
                <div class="alert alert-warning fade in warning-title">
				  <strong>Warning!</strong> First, Select Customer. <a href="ListCustomer.jsp" class="btn btn-warning">Customer List</a>
				</div>
                    
                <%
                }else{
                %>

                <h2>Add Event</h2>
                <%                     
                 Statement stmt = null;
                 Connection con = null;
                 ResultSet rs = null;
                %>
                <form method="post" action="AddEvents" name="myform">
                    <%
                    con = DBConnect.getConnection();
                    stmt = con.createStatement();
                    String id = request.getParameter("id");
                    %>
                <input type="hidden" value="<%= request.getParameter("id") %>" name="CustomerID">
                <div class="form-group">
                    <label for="exampleInputPassword1">Event Type</label><br>
                    <select class="form-control custom-select" id="EventType" name="EventType">
                        <option id="Wedding">Wedding</option>
                        <option id="Party">Party</option>
                        <option id="Conference">Conference</option>
                        <option id="Conference">Other</option>
                    </select>
                </div>
                      
                <div class="form-group">
                    <label for="exampleInputEmail1">Date</label>
                    <input type="date" class="form-control" placeholder="Date" required="required" name="Date" style="padding-top:0;">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">No Of Guests</label>
                    <input type="text" class="form-control" placeholder="GuestCount" required="required" name="GuestCount" onkeypress= "validate()" onkeyup="validate()" >
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Hall</label>
                    <select class="form-control custom-select" name="HallNumber">
                        <option id="hall1">Hall 01</option>
                        <option id="hall2">Hall 02</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Hall Cost</label>
                    <input type="number" class="form-control" placeholder="Hall Cost" required="required" name ="HallCost">
                </div>
                     
                <div class="form-group">
                    <label for="exampleInputPassword1">Meal menu type</label>
                    <select class="form-control custom-select" name="Mealtype">  
                        <%
                        Statement stmt1 = null;
                        Connection con1 = null;
                        ResultSet rs1 = null;

                        con1 = DBConnect.getConnection();
                        stmt1 = con.createStatement();

                        //Getting details from the Suplier table
                        String sql ="select MealType from hotelmanage.mealmenu";

                        rs1 = stmt.executeQuery(sql);
                        while(rs1.next()){
                        %>
                        <option ><%=rs1.getString("MealType")%></option>
                        <% } %>
                    </select>
                    </div>
                    <button type="submit" id="event" class="btn btn-primary"  >Add New Event</button>
                 </form>
                 <%}
                		}
				             else
				               {  
				                response.sendRedirect("Login.jsp");
				            	
				         } %>
            </div>
        </div>
    </section>
    
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