<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Supplier</title>
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
                <h2>Add New Supplier</h2>
                <form method="post" action="AddSupplier">           
                    <div class="form-group">
                        <label for="exampleInputEmail1">Supplier Name</label>
                        <input type="text" class="form-control" placeholder="Supplier Name" name="SupplierName"  required = "required">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Supplier Address</label>
                        <input type="text" class="form-control" placeholder="Supplier Address" name= "Address" required="required">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Contact Number</label>
                        <input type="text" class="form-control" placeholder="Contact Number" name= "ContactNumber"  required = "required">
                    </div>
                    
                    <div class="form-group">
                        <label for="exampleInputPassword1">Category</label>
                        <select class="form-control custom-select" name="category">
                        <%
                            
                        try{
                            Statement stmt = null;
                            Connection con = null;
                            ResultSet rs = null;

                            con = DBConnect.getConnection();
                            stmt = con.createStatement();
                        
                            //Getting details from the Meal Lsit table
                            String sql ="Select Name from hotelmanage.sup_category";
    
                            rs = stmt.executeQuery(sql);
                            while(rs.next()){
                        %>        
                        <option><%=rs.getString("Name")%></option>    
                        <%

                        } }finally{}  
                             %>                                             
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Add New Supplier</button>
                    <button type="submit" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter1">Add New Category</button>
                </form>
            </div>
        </div>
    </section>
            <div class="modal fade" id="exampleModalCenter1"  tabindex="-1" role="window" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="border-style: solid black;">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Add New Supplier Category</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                   
                    <form action="AddSupCategory" method="POST">
                    
                        <div class="modal-body">
                            <table class="table table-borderless">
                                 <tr>
                                    <td>Category Name</td> 
                                    <td><input type="text" class="form-control"  name="CategoryName" placeholder="Category Name"></td>
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