<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Utility Bills</title>
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
                <h2>Add Utility Bills</h2>
                <form method="post" action="AddUtilityBill">                                                          
                    <div class="form-group">                                        
                        <label for="exampleInputPassword1">Select Bill Type</label>                                              
                         <select class="form-control custom-select" id="category" name="category">
                            <option selected="selected">Select Bill Type</option>
                              <%
	                              Statement stmt = null;
	                              Connection con = null;
	                              ResultSet rs = null;
	                              
                                con = DBConnect.getConnection();
                                stmt = con.createStatement();
                            
                                //Getting details from the Suplier table
                                String sql1 ="select Name from hotelmanage.utilitybill_category";
        
                                rs = stmt.executeQuery(sql1);
                                while(rs.next()){
                            %>
                            <option ><%=rs.getString("Name")%></option>
                            <%
                            } 
                            %> 
                           
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Date</label>
                        <input type="Date" class="form-control" placeholder="Date" id="Date" name= "Date" style="padding-top:0;">
                    </div>
                    <div class="form-group">                                               
                        <label for="exampleInputPassword1">Amount</label>
                        <input type="number" class="form-control" placeholder="Amount" id="amount" name = "amount">
                    </div>
                    <button type="submit" class="btn btn-primary">Add Utility Bills</button>
                      <button type="button"  data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary">Add New Bill Type</button>
                </form>
            </div>
        </div>
        
        
          <div class="modal fade" id="exampleModalCenter"  tabindex="-1" role="window" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="border-style: solid black;">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Add New Bill Type</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="row">
                                <div class="col-xl">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title"></h5>
                                            
                                            <form action="addnewbilltype" method="post">
                                            
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Bill Type</label>
                                                    <input type="text" class="form-control" placeholder="Enter New Bill Type "  required = "required" name= "billtype">
                                                </div>
                                                <button type="submit" class="btn btn-primary">Add New Bill Type</button>
                                            </form>
                                            <br>
                                            <br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            
    </section>
    
    			 <%                    	
				           }
				             else
				               {  
				                response.sendRedirect("Login.jsp");
				            	
				         }
				            
				   %>
</body>
</html>