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
    <title>Update Customer</title>
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
                if(request.getParameter("id")==null)
                {
                %>
                <div class="alert alert-warning fade in warning-title">
                  <strong>Warning!</strong> First, Select Customer. <a href="ListCustomer.jsp" class="btn btn-warning">Customer List</a>
                </div>
                    
                <%
                }else{
                %>
                <h2>Update Customer</h2>
                <%
                                        
                String driverName = "com.mysql.jdbc.Driver";
                String username = "root";
                String pass = "";

                String Url = "jdbc:mysql://localhost:3306/hotelmanage";

                Statement stmt = null;
                Connection con = null;
                ResultSet rs = null;

                Class.forName(driverName).newInstance();

                con = DriverManager.getConnection(Url, username, pass);
                %>

                <form method="post" action="UpdateCustomerFromReception" >
                      <%
                    stmt = con.createStatement();
                    String id = request.getParameter("id");
                    
                    //Getting details from the employee table
                    String sql ="select * from hotelmanage.customer WHERE CustomerID = '"+id+"'";
                            
                    rs = stmt.executeQuery(sql);
                        while(rs.next()){
                
                    %>
                    
                    <input type="hidden" class="form-control" name="id" value ='<%=rs.getString("CustomerID") %>' >
                    <div class="form-group">
                        <label for="exampleInputPassword1">NIC</label>
                        <input type="text" class="form-control" placeholder="NIC/Passport" name="NIC" value ='<%=rs.getString("NIC") %>' >
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Customer First Name</label>
                        <input type="text" class="form-control" placeholder="First Name" name="firstname" value ='<%=rs.getString("FirstName") %>'>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Customer Last Name</label>
                        <input type="text" class="form-control" placeholder="Last Name" name="lastname" value ='<%=rs.getString("LastName") %>'>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Address</label>
                        <input type="text" class="form-control" placeholder="Address" name= "Address" value ='<%=rs.getString("Address") %>'>
                    </div>
                      <div class="form-group">
                        <label for="exampleInputPassword1">Contact Number</label>
                        <input type="text" class="form-control" placeholder="Address" name= "ContactNumber" value ='<%=rs.getString("ContactNumber") %>'>
                    </div>                                
                    
                    <div class="form-group">
                        <label for="exampleInputPassword1">Country</label>
                        <input type="text" class="form-control" placeholder="Country" name="Country" value ='<%=rs.getString("Country") %>'>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Email</label>
                        <input type="text" class="form-control" placeholder="Email" name="Email" value ='<%=rs.getString("Email") %>'>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Gender</label>                                          
                     <input type="text" class="form-control" placeholder="Gender" name="Gender" value ='<%=rs.getString("Gender") %>'>                                                  
                    </div>
                  
                    <button type="submit" class="btn btn-primary">Update</button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteCus">Delete</button>
                    
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
               
                <form action="DeleteCustomer" method="POST">
                  <input type="hidden" class="form-control" placeholder="EmployeeName" name = "id" value ='<%=rs.getString("CustomerID") %>'>
                    <div class="modal-body">
                        <table class="table table-borderless">
                             <tr>
                                <td>Customer Name</td> 
                                
                                <td>
                              
                                <input type="text" class="form-control"  name="customerNAme" value="<%=rs.getString("FirstName") %>" readonly="readonly"></td>
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
                }
                    %>
</body>
</html>