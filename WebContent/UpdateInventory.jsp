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
    <title>Update Inventory</title>
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
                <h2>Update Inventory</h2>
                
                	 <%
            
				            if(session.getAttribute("user") == "Owner" || session.getAttribute("user") == "Manager")
				            { 
      	 
				     %>
				         
                 <%
                    
                        Statement stmt = null;
                        Connection con = null;
                        ResultSet rs,rs1,rs2 = null;
                        
                        con = DBConnect.getConnection();
                        stmt = con.createStatement();
                                     
                        //Getting values from the employee form
                        String id = request.getParameter("id");
                                
                        //Getting details from the employee table
                        String sql ="Select * from hotelmanage.inventory where InventoryID = '"+id+"'";
                                
                            rs = stmt.executeQuery(sql);
                                while(rs.next()){
                        %>
               
                <form method="post" action="UpdateInventory">
                
              
                
                    <div class="form-group">
                        <label for="exampleInputEmail1">Supplier Name</label>
                       
                          <input type="hidden" class="form-control" name ="id"  value ='<%=rs.getString("InventoryID") %>'>
                        <select class="form-control custom-select" name="SupplierName">
                        
                             <option ><%=rs.getString("SupplierName")%></option>
                              <%

                            
                            con = DBConnect.getConnection();
                            stmt = con.createStatement();
                        
                        
                            //Getting details from the Suplier table
                            String sql1 ="select Name from hotelmanage.supplier ";

                            rs1 = stmt.executeQuery(sql1);
                            while(rs1.next()){
                            
                        %>
                            <option ><%=rs1.getString("Name")%></option>
                        <%
                        } 
                        %>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="exampleInputEmail1">Inventory Name</label>
                        <input type="text" class="form-control" placeholder="InventoryName" name="Item_Name" value ='<%=rs.getString("Item_Name") %>'>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Quantity</label>
                        <input type="text" class="form-control" placeholder="Quantity" name="Quantity" value ='<%=rs.getString("Quantity") %>'>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Date</label>
                        <input type="date"  class="form-control" placeholder="Date" name="Date" value ='<%=rs.getString("Date") %>' readonly="readonly" style="padding-top: 0;">
                    </div>
                    
                    <div class="form-group">
                        <label for="exampleInputPassword1">Type</label>
                        <select class="form-control custom-select" name="Type">
                            
                             <option ><%=rs.getString("Type")%></option>
                              <%
                             con = DBConnect.getConnection();
                                stmt = con.createStatement();
                            
                            //Getting details from the Suplier table
                            String sql2 ="select Name from hotelmanage.sup_category";

                            rs2 = stmt.executeQuery(sql2);
                            while(rs2.next()){
                              %>
                            <option><%=rs2.getString("Name") %></option>
                            <%} %>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Update Inventory</button>
                 
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteInventory">Delete</button>
                </form>
        </div>
        </div>
    </section>
    <div class="modal fade" id="deleteInventory"  tabindex="-1" role="window" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="border-style: solid black;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Are You Sure?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
               
                <form action="Deleteitem" method="POST">
                
                <input type="hidden" class="form-control"  name="id" value="<%=rs.getString("InventoryID") %>" readonly="readonly">
                    <div class="modal-body">
                        <table class="table table-borderless">
                             <tr>
                                <td>Inventory Name</td> 
                                <td><input type="text" class="form-control"  name="InventoryName" value="<%=rs.getString("Item_Name") %>" readonly="readonly"></td>
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
				           }
				             else
				               {  
				                response.sendRedirect("Login.jsp");
				            	
				         }
				            
				   %>
</body>
</html>