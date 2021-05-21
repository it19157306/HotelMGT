<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
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
    <nav class="navbar navbar-inverse">
        <%@include file="Nav.jsp" %>
    </nav>
    <div class="top"></div>
    <section>
        <div class="container">
            <div class="Contents">
                <%
                if(request.getParameter("eventId")==null)
                {
                %>
                <div class="alert alert-warning fade in warning-title">
                  <strong>Warning!</strong> First, Select Event. <a href="ListEvents.jsp" class="btn btn-warning">Event List</a>
                </div>
                    
                <%
                }else{
                %>
                <h2>Add Meal Menu</h2>
                <form action="addMealMenu2" method="POST" style="min-height: 1200px;">
                <input type="hidden" name="FIxedMID" value="<%= request.getParameter("eventId") %>">

                <%
                if(request.getParameter("mealType")!=null)
                {
                    Statement stmt2 = null;
                    Connection con2 = null;
                    ResultSet rs2 = null;

                    
                    
                    
                    con2 = DBConnect.getConnection();
                    stmt2 = con2.createStatement();
                	
                    String mealType = request.getParameter("mealType");
                    
                    int condimentsLimit, desertsLimit, meat_and_dishessLimit, rice_and_noodlesLimit, saladLimit;
                    //Getting details from the Meal Lsit table
                    String sql2 ="Select * from hotelmanage.mealmenu WHERE MealID = '"+mealType+"' ";

                    rs2 = stmt2.executeQuery(sql2);
                    while(rs2.next()){
                        condimentsLimit = Integer.parseInt(rs2.getString("condimentsLimit"));
                        desertsLimit = Integer.parseInt(rs2.getString("desertsLimit"));
                        meat_and_dishessLimit = Integer.parseInt(rs2.getString("meat_and_dishessLimit"));
                        rice_and_noodlesLimit = Integer.parseInt(rs2.getString("rice_and_noodlesLimit"));
                    	saladLimit = Integer.parseInt(rs2.getString("saladLimit"));
                    	
                    
                %>
                    
                    <h3>Condiments</h3>
                    <div class="row">
                    	<% for(int i = 1; i <= condimentsLimit; i++) { %>
                            <div class="form-group col-md-6">
                                <label for="inputState">Item 0<%=i %></label>
                                <select required="required" id="inputState" class="form-control custom-select" name="condiments_<%=i %>">
                                    <option value="">Choose...</option>
                                    <% try{
                                        Statement stmt = null;
                                        Connection con = null;
                                        ResultSet rs = null;

                                        con = DBConnect.getConnection();
                                        stmt = con.createStatement();
                                    
                                        //Getting details from the Meal Lsit table
                                        String sql ="Select * from hotelmanage.mealcondiments WHERE MealID = '"+mealType+"'";

                                        rs = stmt.executeQuery(sql);
                                        while(rs.next()){
                                    %>        
                                     <option  ><%=rs.getString("CondimentsName")%></option>
                                    <%
                                        } }finally{}
                                    %>
                                </select>
                            </div>
                        <%  } %>
                        </div>

                        <hr>


                        <h3 class="card-title">Desert</h3>
                        <div class="row" style="text-align: left;">
                            <% for(int i = 1; i <= desertsLimit; i++) { %>
                            <div class="form-group col-md-6">
                                <label for="inputState">Item 0<%=i %></label>
                                <select required="required" id="inputState" class="form-control custom-select" name="desert_<%=i %>">
                                    <option value="">Choose...</option>
                                    <% try{
                                        Statement stmt = null;
                                        Connection con = null;
                                        ResultSet rs = null;

                                        con = DBConnect.getConnection();
                                        stmt = con.createStatement();
                                    
                                        //Getting details from the Meal Lsit table
                                        String sql ="Select * from hotelmanage.mealdesert WHERE MealID = '"+mealType+"'";

                                        rs = stmt.executeQuery(sql);
                                        while(rs.next()){
                                    %>        
                                     <option value="<%=rs.getString("desertName")%>" ><%=rs.getString("desertName")%></option>
                                    <%
                                        } }finally{}
                                    %>
                                </select>
                            </div>
                            <%  } %>
                        </div>

                        <hr>


                        <h3 class="card-title">Meat And Fish Dishes</h3>
                            <div class="row" style="text-align: left;">
                                <% for(int i = 1; i <= meat_and_dishessLimit; i++) { %>
                                <div class="form-group col-md-6">
                                    <label for="inputState">Item 0<%=i %></label>
                                    <select required="required" id="inputState" class="form-control custom-select" name="meatD_<%=i %>">
                                        <option value="">Choose...</option>
                                        <% try{
                                            Statement stmt = null;
                                            Connection con = null;
                                            ResultSet rs = null;

                                            con = DBConnect.getConnection();
                                            stmt = con.createStatement();
                                        
                                            //Getting details from the Meal Lsit table
                                            String sql ="Select * from hotelmanage.meal_meat_and_dishes WHERE MealID = '"+mealType+"'";

                                            rs = stmt.executeQuery(sql);
                                            while(rs.next()){
                                        %>        
                                         <option value="<%=rs.getString("MeatAndDishName")%>" ><%=rs.getString("MeatAndDishName")%></option>
                                        <%
                                            } }finally{}
                                        %>
                                    </select>
                                </div>
                                <%  } %>
                        </div>

                        <hr>


                        <h3 class="card-title">Rice And Noodles</h3>
                            <div class="row" style="text-align: left;">
                                <% for(int i = 1; i <= rice_and_noodlesLimit; i++) { %>
                                <div class="form-group col-md-6">
                                    <label for="inputState">Item 0<%=i %></label>
                                    <select required="required" id="inputState" class="form-control custom-select" name="riceN_<%=i %>">
                                        <option value="">Choose...</option>
                                        <% try{
                                            Statement stmt = null;
                                            Connection con = null;
                                            ResultSet rs = null;

                                            con = DBConnect.getConnection();
                                            stmt = con.createStatement();
                                        
                                            //Getting details from the Meal Lsit table
                                            String sql ="Select * from hotelmanage.meal_rice_and_noodles WHERE MealID = '"+mealType+"'";

                                            rs = stmt.executeQuery(sql);
                                            while(rs.next()){
                                        %>        
                                         <option value="<%=rs.getString("RiceAndNoodleName")%>" ><%=rs.getString("RiceAndNoodleName")%></option>
                                        <%
                                            } }finally{}
                                        %>
                                    </select>
                                </div>
                                <%  } %>
                        </div>

                        <hr>


                        <h3 class="card-title">Salads</h3>
                            <div class="row" style="text-align: left;">
                                <% for(int i = 1; i <= saladLimit; i++) { %>
                                <div class="form-group col-md-6">
                                    <label for="inputState">Item 0<%=i %></label>
                                    <select required="required" id="inputState" class="form-control custom-select" name="salads_<%=i %>">
                                        <option value="">Choose...</option>
                                        <% try{
                                            Statement stmt = null;
                                            Connection con = null;
                                            ResultSet rs = null;

                                            con = DBConnect.getConnection();
                                            stmt = con.createStatement();
                                        
                                            //Getting details from the Meal Lsit table
                                            String sql ="Select * from hotelmanage.mealsalads WHERE MealID = '"+mealType+"'";

                                            rs = stmt.executeQuery(sql);
                                            while(rs.next()){
                                        %>        
                                         <option value="<%=rs.getString("saladName")%>" ><%=rs.getString("saladName")%></option>
                                        <%
                                            } }finally{}
                                        %>
                                    </select>
                                </div>
                                <%  } %>
                        </div>
                        
                         <%  }
                    	}%>
                        
                        
                    
                    <button type="submit" class="btn btn-primary">Add Meal</button>
                </form>
            </div>
        </div>
        <%
                                    }
                                %>
</body>
</html>