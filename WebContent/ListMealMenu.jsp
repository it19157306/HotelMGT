<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Menu List</title>
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
                <h2>Menu List</h2>
                
                <div class="col-md-3 col-lg-3">
                    
                    
                </div>
                
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Number</th>                                                
                            <th scope="col">Meal Name</th>
                            <th scope="col">Price</th>   
                            <th scope="col">Condiments Limit</th>   
                             <th scope="col">Deserts Limit</th>   
                            <th scope="col">Meat And Dishess Limit</th>  
                             <th scope="col">Rice And Noodles Limit</th>
                             <th scope="col">saladLimit</th>
                             <th scope="col">Action</th>                                                  
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    try{ 
                        Connection con = null;
                        Statement stmt = null;
                        ResultSet rs,rs1 = null;

                        con = DBConnect.getConnection();
                        stmt=con.createStatement();

                        String search =request.getParameter("ssearch");
                        String sql;
                            
                        
                            sql ="SELECT * FROM hotelmanage.mealmenu order by MealID DESC";
                    
                        rs = stmt.executeQuery(sql);
                        while(rs.next()){
                        %> 
                        <tr>
                            <th scope="row"><%=rs.getString("MealID") %></th>                                                  
                            <td><%=rs.getString("MealType") %></td>
                            <td><%=rs.getString("TotalPrice") %></td>
                            <td><%=rs.getString("condimentsLimit") %></td>
                            <td><%=rs.getString("desertsLimit") %></td>
                            <td><%=rs.getString("meat_and_dishessLimit") %></td>
                            <td><%=rs.getString("rice_and_noodlesLimit") %></td>
                            <td><%=rs.getString("saladLimit") %></td>
                            <td>
                            	<a href='UpdatemealitemsinDB.jsp?MealId=<%=rs.getString("MealID") %>' class="btn btn-warning">Change</a>
                            </td>
                        </tr>
                            <% 
                                }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                }
                            %>    
                    </tbody>
                </table> 
            </div>
        </div>
    </section>
</body>
</html>