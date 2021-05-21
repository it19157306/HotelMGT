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
    <title>Update Utility Bills</title>
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
                <h2>Update Utility Bills</h2>
                
                
                 <%
            
				            if(session.getAttribute("user") == "Owner" || session.getAttribute("user") == "Manager")
				            { 
      	 
				%>
                
             <%
                                            
                    Statement stmt,stmt1 = null;
                    Connection con,con1 = null;
                    ResultSet rs,rs1 = null;
                    
                     con = DBConnect.getConnection();                                               
                    stmt=con.createStatement();
                     
                    //Getting values from the employee form
                    String id = request.getParameter("id");
                    
                    //Getting details from the employee table
                    String sql ="Select * FROM hotelmanage.utilitybills where BillID = '"+id+"' ";
                    
                    rs = stmt.executeQuery(sql);
                    while(rs.next()){

                %>
                
                <form method="post" action="UpdateUtilityBill">
                
                
                
                    <input type="hidden" class="form-control" placeholder="Reason" name= "BillID" value = '<%=rs.getString("BillID") %>'>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Select Bill Type</label>
                        <select class="form-control custom-select" id="category" name="category">
                             <option><%=rs.getString("BillType") %></option>
                             
 								<%
	                            
                                con1 = DBConnect.getConnection();
                                stmt1 = con1.createStatement();
                            
                                //Getting details from the Suplier table
                                String sql1 ="select Name from hotelmanage.utilitybill_category";
        
                                rs1 = stmt1.executeQuery(sql1);
                                while(rs1.next()){
                            %>
                            <option ><%=rs1.getString("Name")%></option>
                             <%
                            } 
                            %> 
                        </select>
                      
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Added Date</label>
                        <input type="Date" class="form-control"  value = '<%=rs.getString("AddedDate") %>' disabled="disabled">
                    </div>                                       
                    <div class="form-group">
                        
                        <label for="exampleInputPassword1">Amount</label>
                        <input type="number" class="form-control" name= "amount"  id= "amount" value = '<%=rs.getString("Amount") %>' >
                    </div>

                    <button type="submit" class="btn btn-primary">Update Utility Bills</button>
                    
                   		 <%
            
				            if(session.getAttribute("user") == "Owner" )
				            { 
				          %>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteBills">Delete</button>
                    	<% 
			                    }else {
			                    } 
			                    
			                    %>	
							            	
							         
				              
                    
                </form>
                
                
                   
        </div>
        </div>
    </section>
    <div class="modal fade" id="deleteBills"  tabindex="-1" role="window" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="border-style: solid black;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Are You Sure?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
               
                <form action="DeleteBill" method="POST">
              			   <input type="hidden" class="form-control"  name= "id" value = '<%=rs.getString("BillID") %>'>
                    <div class="modal-body">
                        <table class="table table-borderless">
                             <tr>
                                <td>Bill Type</td> 
                                <td><input type="text" class="form-control"  name="InventoryName" value="<%=rs.getString("BillType") %>" readonly="readonly"></td>
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
                    
                    
                        <script>  
                    function validate(){  
                        
                    var num1 =  document.getElementById('Amount').value;
                    
                    
                    if (isNaN(num1)){  
                        
                        alert("Enter only numeric values"); 
                    
                      return false;  
                      
                    }else{  
                        
                      return true;  
                      
                      }  
                    }  
                    </script>  
                   
</body>
</html>