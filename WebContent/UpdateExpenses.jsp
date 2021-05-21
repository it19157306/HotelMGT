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
    <title>Update Expenses</title>
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
                <h2>Update Expenses</h2>
                
                
                		 <%
            
				            if(session.getAttribute("user") == "Manager" || session.getAttribute("user") == "Owner")
				            { 
				          %>
				          
                
                    <%
                                            
                        Statement stmt = null;
                        Connection con = null;
                        ResultSet rs = null;
                         con = DBConnect.getConnection();                               
                        stmt=con.createStatement();
                         
                        //Getting values from the employee form
                        String id = request.getParameter("id");
                        
                        //Getting details from the employee table
                        String sql ="select * from hotelmanage.expenses where ExpensesID = '"+id+"'";
                        
                        rs = stmt.executeQuery(sql);
                        while(rs.next()){

                    %>
                    
                    <form method="post" action="UpdateExpenses">
                    
                     <input type="hidden" class="form-control" id="ExpensesID" name="ExpensesID"  value = '<%=rs.getString("ExpensesID") %>' style="padding-top: 0;" >
                        <div class="form-group">
                            <label for="exampleInputPassword1">Added Date</label>
                             <input type="Date" class="form-control" placeholder="Date" id="Date" name="Date" readonly="readonly" value = '<%=rs.getString("AddedDate") %>' style="padding-top: 0;">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Amount</label>
                            <input type="number" class="form-control" placeholder="Amount" id= "Amount" name = "Amount" required="required" value = '<%=rs.getString("Amount") %>'>
                        </div>
                        <div class="form-group">
                            
                            <label for="exampleInputPassword1">Reason</label>
                            <textarea class="form-control" id="Reason" name="Reason" required="required"><%=rs.getString("Reason") %></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Update Expenses</button>
                         <%
            
				            if(session.getAttribute("user") == "Owner" )
				            { 
				          %>
                       
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteCus">Delete</button>
                        
                         	<% 
			                    }else {
			                   
							            	
							           }
				               %>	
			            
				         
                    </form>
        </div>
        </div>
    </section>
    
    
    <div class="modal fade" id="deleteCus"  tabindex="-1" role="window" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="border-style: solid black;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Are You Sure?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
               
                <form action="deleteExpense" method="POST">
                  <input type="hidden" class="form-control"  name = "id" value ='<%=rs.getString("ExpensesID") %>'>
                    <div class="modal-body">
                        <table class="table table-borderless">
                             <tr>
                                <td>Expenses ID</td> 
                                
                                <td>
                              
                                <input type="text" class="form-control"   value="<%=rs.getString("ExpensesID") %>" readonly="readonly"></td>
                            </tr>
                            
                        </table>   
                    </div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
                    <input type="submit" class="btn btn-danger" value="Delete">
                    </div>
                </form>
             </div>
        </div>
    </div>
    
    		<% 
          	   }
            %>
            
                   	<% 
                    }else {
                     response.sendRedirect("Login.jsp");
				            	
				           }
				               %>	
				         
</body>
 
</html>