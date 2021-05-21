<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Supplier List</title>
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
                <h2>Supplier List</h2>
                
                 <form action="#" style= "width: 45%">
                <div class="col-md-3 col-lg-3" style= "width: 75%; float: inherit;;">
                    <input type="search" class="form-control"  id="supsearch" name= "supsearch"  placeholder="Search by Name or Contact Number"  >
                   
                </div>
                </form>
                
                <div class="container" style="width: 90%;">
                    <a class="btn btn-primary" href="AddSupplier.jsp">Add New</a>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Number</th>
                            <th scope="col">Contact Number</th>
                            <th scope="col">Name</th>                                                  
                            <th scope="col">Category</th> 
                            <th scope="col">Add Items</th>     
                            <th scope="col">Action</th>                                               
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    try{ 
                        Connection con = null;
                        Statement stmt = null;
                        ResultSet rs = null;
                       
                        //String id = request.getParameter("emp_id");
                        con = DBConnect.getConnection();
                        stmt=con.createStatement();
                        
                        String search =request.getParameter("supsearch");
                        String sql;
                                
                        if(search != null){
                            sql ="SELECT * FROM hotelmanage.supplier where Name like '%"+search+"%' or ContactNumber like '%"+search+"%' ";
                        }else{  
                            sql ="SELECT * FROM hotelmanage.supplier ";
                        }   
                        
                        rs = stmt.executeQuery(sql);
                        
                        while(rs.next()){
                    %> 
                         <tr>
                            <th scope="row"><%=rs.getString("SupplerID") %></th>
                       
                            <td><%=rs.getString("ContactNumber") %></td>
                            <td><%=rs.getString("Name") %></td>
                            <td><%=rs.getString("Category") %></td>
                            <td><a href='AddInventory.jsp?id=<%=rs.getString("SupplerID") %>' class="btn btn-warning">Add</a></td>
                            <td>
                                <a href='Updatesup.jsp?id=<%=rs.getString("SupplerID") %>' class="btn btn-warning">Edit</a>
                                
                            </td>
                        </tr>
                            <% 
                                }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                }
                            %>    
                            
                              <%                    	
				           }
				             else
				               {  
				                response.sendRedirect("Login.jsp");
				            	
				         }
				            
				   %>  
                    </tbody>
                </table> 
            </div>
        </div>
    </section>
</body>
</html>