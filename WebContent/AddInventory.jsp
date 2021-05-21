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
    <title>Add Inventory</title>
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
          
            
            if(session.getAttribute("user") == "Owner" || session.getAttribute("user") == "Manager")
            { 


                if(request.getParameter("id")==null)
                {
                %>
                <div class="alert alert-warning fade in warning-title">
				  <strong>Warning!</strong> First, Select the Add Button for the relavent supplier. <a href="ListSuppliers.jsp" class="btn btn-warning">Supplier List</a>
				</div>
                    
                <%
                }else{
                %>
                
                
                <h2>Add New Inventory</h2>      
                
                    <form action="AddInventory" method="POST"> 
                        
                        <div class="form-group">
                        <%
                        Statement stmt = null;
                        Connection con = null;
                        ResultSet rs = null;

                        con = DBConnect.getConnection();
                        stmt = con.createStatement();
                    
                        String id = request.getParameter("id");
                        
                        //Getting details from the Suplier table
                        String sql = "select * from hotelmanage.supplier where SupplerID = '"+id+"' ";

                        rs = stmt.executeQuery(sql);
                        while(rs.next()){
                        %>            
                            <label for="exampleInputEmail1">Supplier  Name</label>
                            <input type="text" class="form-control" value = '<%=rs.getString("Name")%>' name="SupplierName">
                              <input type="hidden" class="form-control" value = '<%=rs.getString("SupplerID")%>' name="supplierid">
                            
                        <%
                            } 
                        %>
                            
                        </div>
                           
                        <div class="form-group">
                            <label for="exampleInputEmail1">Item Name</label>
                            <input type="text" class="form-control" placeholder="Inventory Name" name="InventoryName">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputQuantity">Quantity</label>
                            <input type="text" class="form-control" placeholder="Quantity" name="Quantity">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputDate">Date</label>
                            <input type="date" class="form-control" placeholder="Date" name="date" style="padding-top:0;">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputType">Type</label>
                            <select class="form-control custom-select" name="inventoryType">
                            <%
                                con = DBConnect.getConnection();
                                stmt = con.createStatement();
                            
                                //Getting details from the Suplier table
                                String sql1 ="select Name from hotelmanage.sup_category";
        
                                rs = stmt.executeQuery(sql1);
                                while(rs.next()){
                            %>
                            <option ><%=rs.getString("Name")%></option>
                            <%} %>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Inventory</button>
                        <button type="button"  data-toggle="modal" data-target="#newInventryType" class="btn btn-primary">Add New Inventory Type</button>
                </form>
                
               
                
           </div>
        </div>
    </section>


    <div class="modal fade" id="newInventryType"  tabindex="-1" role="window" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="border-style: solid black;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLongTitle">Add New Supplier Category</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
               
                <form action="AddnewCateogory" method="POST">
                
                    <div class="modal-body">
                        <table class="table table-borderless">
                             <tr>
                                <td>Category Name</td> 
                                <td><input type="text" class="form-control" placeholder="Inventoryname"  required = "required" name= "Inventoryname"></td>
                            </tr>
                            
                        </table>   
                    </div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Add New Category</button>
                    </div>
                </form>
            </div>
        </div>
    </div>  
             <%}
                
                 }
				             else
				               {  
				                response.sendRedirect("Login.jsp");
				            	
				         }
				            %>                             
               
                
</body>
</html>