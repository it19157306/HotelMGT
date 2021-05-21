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
    <title>Update Event Payment</title>
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
                <h2>Update Event Payment</h2>
                
                 <%
                    
                        Statement stmt = null;
                        Connection con = null;
                        ResultSet rs = null;
                        
                        con = DBConnect.getConnection();
                        stmt=con.createStatement();
                        
                        String id = request.getParameter("id");
                                     
                        //Getting details from the employee table
                        String sql = "SELECT * FROM hotelmanage.eventpayment  WHERE  eventID = '"+id+"' "; 
                        
                        rs = stmt.executeQuery(sql);
                        while(rs.next()){

                     %>
                <form method="post" action="UpdateEventPayment" >
                                        
                    
                    <input type="hidden" class="form-control" id="EventID" name="EventID" value='<%=rs.getString("eventID")%>' >  
                  
                     <div class="form-group">
                        <label for="exampleInputPassword1">Total Cost</label>
                         <input type="number" class="form-control" id="totalcost" name="totalcost"  value='<%=rs.getString("TotalPayment")%>' disabled="disabled">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Advance payment</label>
                        <input type="number" class="form-control"  id ="adavancepay" placeholder="adavancepay" name= "adavancepay" value='<%=rs.getString("AdvancePayment")%>' disabled="disabled">
                    </div>
                    <div class="form-group">
                        
                        <label for="exampleInputPassword1">Balance payment</label>
                         <input type="number" class="form-control"  id ="balance"  value='<%=rs.getString("BalancePayment")%>'  name= "balance" disabled="disabled">                                              
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Payment Status</label>
                            <select name = "status" class="form-control">
                                <option><%=rs.getString("Status")%></option>           
                                <option>Payment Completed</option>                                                      
                            </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>
                 
                  
                </form>
                  <%
                    }
                    %>
        </div>
        </div>
    </section>
</body>
</html>