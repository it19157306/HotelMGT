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
    <title>Add OT</title>
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
				<%
				 if(request.getParameter("id")==null)
                {
                %>
                
                <div class="alert alert-warning fade in warning-title">
				  <strong>Warning!</strong> First, Select From Salary List. <a href="EmployeeSalaryList.jsp" class="btn btn-warning">Salary List</a>
				</div>
                    
                <%
                }else{
                %>
    <nav class="navbar navbar-inverse">
        <%@include file="Nav.jsp" %>
    </nav>
    <div class="top"></div>
    <section>
        <div class="container">
            <div class="Contents">
                <h2>Add OT</h2>
                
                <form method="post" action="AddOT">        
                           
                    <%
                     
                    String driverName = "com.mysql.jdbc.Driver";
                    String username = "root";
                    String pass = "";

                    String Url = "jdbc:mysql://localhost:3306/hotelmanage";

                    Statement stmt,stmt1 = null;
                    Connection con = null;
                    ResultSet rs,rs1 = null;

                    Class.forName(driverName).newInstance();

                    con = DriverManager.getConnection(Url, username, pass);

                    con = DBConnect.getConnection();
                    stmt = con.createStatement();
                    stmt1 = con.createStatement();

                    String id = request.getParameter("id");
                    
                    String sql ="select salaryID from hotelmanage.salary  WHERE salaryID  = '"+id+"'";
                    String sql1 ="select TotalSalary from hotelmanage.salary  WHERE salaryID  = '"+id+"'";

                    rs = stmt.executeQuery(sql);
                    rs1 = stmt1.executeQuery(sql1);
                        
                    while(rs.next() && rs1.next()) {
                
                    %>
                   
                     
                   
 
                    <div class="form-group">
                        <label for="exampleInputPassword1">Current Salary</label>
                        <input type="number" class="form-control" id= "currentsal" name= "currentsal"    value ='<%=rs1.getString("TotalSalary")%>' name ="HallCost"  disabled="disabled" >
                    </div>
                    <%} %>
                        
                    <div class="form-group">
                        <label for="exampleInputEmail1">Date</label>
                        <input type="date" class="form-control" id= "Date" name= "Date "placeholder="Date" required="required" name="Date" style="padding-top:0;">
                    </div>
                   
                    <div class="form-group">
                        <label for="exampleInputPassword1">OT Hours</label>
                        <input type="number" class="form-control" id= "hours" name= "hours" placeholder="OThours" required="required" name="GuestCount"  onclick="calculateTotal();"  onkeypress=" calculateTotal();" onkeyup=" calculateTotal();">
                    </div>
                    
                    <div class="form-group">
                        <label for="exampleInputPassword1">OT Rate</label>
                        <input type="number" class="form-control" id= "rate" name= "rate" placeholder="OT Rate" required="required" name ="HallCost" onclick="calculateTotal();" onkeypress=" calculateTotal();" onkeyup=" calculateTotal();">
                    </div>
                    
                    <div class="form-group">
                        <label for="exampleInputPassword1">Total OT payment</label>
                        <input type="number" class="form-control"  id= "otpayment" name= "otpayment"placeholder="Total OT Payment"  name ="HallCost" disabled="disabled">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Total Salary</label>
                        <input type="number" class="form-control" id= "totsalary" name= "totsalary"  placeholder="Total Salary"  name ="HallCost" disabled="disabled">
                    </div>
              
                    <button type="submit" id="event" class="btn btn-primary" >Add OT</button>
                </form>
        </div>
        </div>
    </section>
    
    
    			<%      }              	
				           }
				             else
				               {  
				                response.sendRedirect("Login.jsp");
				            	
				         }
				            
				            
				   %>
</body>

<script type="text/javascript">
        function display(){
            document.getElementById("element").style.display = "none";          
        }
        
        function calculateTotal() {
            var hours = document.getElementById('hours').value;
            var rate = document.getElementById('rate').value;
            var currentsalary = parseInt( document.getElementById('currentsal').value);
            var val2= hours * rate;
            var total = currentsalary + val2;
            var totalEl = document.getElementById('otpayment');
            var totalE2 = document.getElementById('totsalary');

            totalEl.value = val2;
            totalE2.value = total;              
                 
            totalEl.style.display = 'block';
            totalE2.style.display = 'block';
        }
    </script>
</html>