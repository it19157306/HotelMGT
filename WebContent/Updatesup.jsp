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
    <title>Update Supplier</title>
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
                <h2>Update Supplier</h2>
                
               
                <%
                    
                //making the database connection
              
                Statement stmt= null;
                Connection con = null;
                ResultSet rs= null;

                con = DBConnect.getConnection();
                stmt = con.createStatement();
                             
                //Getting values from the employee form
                String id = request.getParameter("id");
                        
                //Getting details from the employee table
                String sql ="select * from hotelmanage.supplier  where SupplerID =  '"+id+"'";
                        
                    rs = stmt.executeQuery(sql);
                        while(rs.next()){
                            
                            

                %>
                 <form action="updatesupplier" method="post" >
                                        
                                         <input type="hidden" class="form-control" name ="id" id="id"  value = '<%=rs.getString("SupplerID") %>'>
                                         
                                         
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Supplier Name</label>
                                                <input type="text" class="form-control"   name ="Name " value = '<%=rs.getString("Name") %>'>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Supplier Address</label>
                                                <input type="text" class="form-control"  name="Address" value = '<%=rs.getString("Address") %>'>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Contact Number</label>
                                                <input type="text" class="form-control"  name = "ContactNumber"  value = '<%=rs.getString("ContactNumber") %>'>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Category</label>
                                                <select class="form-control custom-select"  name ="Category">
                                                
                                                    <option selected="selected"><%=rs.getString("Category")%></option>
                                                   
                                                    <%
                                                    
                                                try{
                                                    

                                                    Statement stmt1= null;
                                                    Connection con1 = null;
                                                    ResultSet rs1= null;
                                                    
                                                    con1 = DBConnect.getConnection();
                                                    stmt1= con1.createStatement();
                                                
                                                    //Getting details from the Meal Lsit table
                                                    String sql1 ="Select Name from hotelmanage.sup_category";
                            
                                                    rs1 = stmt1.executeQuery(sql1);
                                                    while(rs1.next()){
                                                        
                                                    
                                                    
                            
                                                %>     
                                                    <option><%=rs1.getString("Name")%></option>
                                                    
                                                      <%
                                                
                                                    } }finally{}
                                                   
                                                     %>        
                                                </select>
                                            </div>

                                            <button type="submit" class="btn btn-primary">Update Supplier</button>
                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteSupplier">Delete</button>
                                        </form>
        </div>
        </div>
    </section>
    
    
    <div class="modal fade" id="deleteSupplier"  tabindex="-1" role="window" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="border-style: solid black;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Are You Sure?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
               
                <form action="deleteSupplier" method="POST">
                
                  <input type="hidden" class="form-control"   name ="id"  value ='<%=rs.getString("SupplerID") %>' >
                  
                    <div class="modal-body">
                        <table class="table table-borderless">
                             <tr>
                                <td>Supplier Name</td> 
                                <td><input type="text" class="form-control"  name="customerNAme" value="<%=rs.getString("Name") %>" readonly="readonly"></td>
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
              
             
</body>
</html>