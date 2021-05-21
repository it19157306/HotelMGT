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
<!DOCTYPE html>
<html>
<head>
    <title>Add Meal Menu</title>
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
                <h2>Add  Meal Menu</h2>
               
                  <form method="POST" action ="addmealitemtoDB">   
                  <div style= "float: right;">
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"> Add Meal Type with Price</button>      </div><br>             
                    <div class="form-group">
                    <label for="exampleInputEmail1">Select Type</label>
                     
                      <select class="form-control custom-select" name="MealID" required="required">
                        <%  
                        try{
                            Statement stmt = null;
                            Connection con = null;
                            ResultSet rs = null;

                            con = DBConnect.getConnection();
                            stmt = con.createStatement();
                        
                            //Getting details from the Meal Lsit table
                            String sql ="Select * from hotelmanage.mealmenu";

                            rs = stmt.executeQuery(sql);
                            while(rs.next()){
                        %>        
                        <option value="<%=rs.getString("MealID")%>"><%=rs.getString("MealType")%></option>
                        <%
                          } }finally{}
                        %>
                         </select>
                    </div>     
                    <div class="form-group">
                      <label for="exampleInputEmail1">Select Category</label>
                        <select class="form-control custom-select" name="ItemCategory" required="required">
                          <option selected="selected">Select Category</option>
                          <option value ="Condiments">Condiments</option>
                          <option value ="Deserts">Deserts</option>
                          <option value ="Rice">Rice and Noodles</option>
                          <option value ="Salads">Salads</option>
                          <option value ="Meat">Meat and Fish Dishes</option> 
                       </select>
                    </div>

                    <div class="form-group">
                      <label for="exampleInputEmail1">Meal Name</label>
                      <input type="text" class="form-control" placeholder="Meal Name" id="MealName" name="MealName" required="required">
                    </div>
                    <button type="submit" class="btn btn-primary">Add Meal Menu</button>
                </form>
            </div>
        </div>
    </section>
    <div class="modal fade" id="exampleModalCenter"  tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Add New List</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form action="addMealType" method="POST">
            <div class="modal-body">
                <table class="table table-borderless">
                     <tr>
                        <td>Meal Menu name</td>
                        <td><input type="text" class="form-control"  name="mealname" placeholder="Meal menu name "></td>
                    </tr>
                    <tr>
                        <td>Menu Price</td>
                        <td><input type="text"  class="form-control"  name="Price" placeholder="Price"></td>
                    </tr>
                    <tr>
                        <td>Condiments (Limit)</td>
                        <td><input type="number"  class="form-control"  name="Condiments" placeholder="Condiments" min="1" max="5"></td>
                    </tr>
                    <tr>
                        <td>Desert (Limit)</td>
                        <td><input type="number"  class="form-control"  name="Desert" placeholder="Desert" min="1" max="5"></td>
                    </tr>
                    <tr>
                        <td>Meat And Fish Dishes (Limit)</td>
                        <td><input type="number"  class="form-control"  name="Meat" placeholder="Meat And Fish Dishes" min="1" max="5"></td>
                    </tr>
                    <tr>
                        <td>Rice And Noodles (Limit)</td>
                        <td><input type="number"  class="form-control"  name="Rice" placeholder="Rice And Noodles" min="1" max="5"></td>
                    </tr>
                    <tr>
                        <td>Salads (Limit)</td>
                        <td><input type="number"  class="form-control"  name="Salads" placeholder="Salads" min="1" max="5"></td>
                    </tr>
                </table>   
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <input type="submit" class="btn btn-primary" value="Add Details">
            </div>
        </form>
     </div>
     </div>
     </div>
     
      <%                    	
				           }
				             else
				               {  
				                response.sendRedirect("Login.jsp");
				            	
				         }
				            
				   %> 
</body>
</html>