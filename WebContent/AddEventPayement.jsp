<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.DBConnection.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Event Payment</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet"> 
    <link href="assets/css/style.css" rel="stylesheet">
    
  
</head>
<body onload="totalcost(); calpayment();totalcost(hallcost,totalmenucost);">
 			<%
            	 if(session.getAttribute("user") == "Owner" || session.getAttribute("user") == "Manager" || session.getAttribute("user") == "Receptionist")
				            { 
      	 
				%>
    <nav class="navbar navbar-inverse">
        <%@include file="Nav.jsp" %>
    </nav>
    <div class="top"></div>
    <section>
        <div class="container">
            <div class="Contents">
                <h2>Add New Payment</h2>
                <form method="post" action="AddeventPayment">                     
          <%   
          Statement stmt,stmt1 = null;
          Connection con = null;
          ResultSet rs,rs1 = null;

          con = DBConnect.getConnection();                                
          stmt=con.createStatement();
          stmt1=con.createStatement();

          //Getting values from the employee form
          String id = request.getParameter("eventId");
          String type = request.getParameter("mealType");

          //Getting details from the employee table
          String sql = "SELECT * FROM hotelmanage.event  WHERE  EventID = '"+id+"' ";   
          String sql1 = "Select TotalPrice FROM hotelmanage.mealmenu WHERE MealType = '"+type+"' ";

          rs = stmt.executeQuery(sql);
          rs1 = stmt1.executeQuery(sql1);

          while(rs.next() &&rs1.next()){      
        	  
          %> 
                    
          <input type="hidden" class="form-control" id="EventID" name="EventID" value='<%=rs.getString("EventID")%>' >
          <div class="form-group">
              <label for="exampleInputPassword1">Cost of menu plan</label>
              <input type="number" class="form-control" id="costmenu" name="costmenu" value='<%=rs1.getString("TotalPrice")%>' disabled="disabled">
          </div>
          <div class="form-group">
              <label for="exampleInputPassword1">Guest Count</label>
              <input type="number" class="form-control" id="guestcount" name="guestcount" value='<%=rs.getString("NoOfGuest")%>'  disabled="disabled">
          </div>
           <div class="form-group">
              <label for="exampleInputPassword1">Total Cost for meal menu</label>
              <input type="number" class="form-control" id="totalmenucost" name="totalmenucost" disabled="disabled">
          </div>
          <div class="form-group">
              <label for="exampleInputPassword1">Hall Cost</label>
              <input type="number" class="form-control" id="hallcost" name="hallcost" value='<%=rs.getString("HallCost")%>' disabled="disabled">
          </div>
          <div class="form-group">
              <label for="exampleInputPassword1">Total Cost</label>
              <input type="number" class="form-control" id="totalcost" name="totalcost">
          </div>
          <div class="form-group">
             <label for="exampleInputText">Advance payment</label>
             <input type="number" class="form-control"  id ="adavancepay"  name= "adavancepay" required="required" onchange="bal()">
          </div>
          <div class="form-group">
             <label for="exampleInputPassword1">Payment Status</label>
                 <select name = "status">
                     <option>Full Payment</option>
                     <option>Partial Payment</option>
                 </select>
          </div>
          <div class="form-group">
             <label for="exampleInputText">Balance payment</label>
                <input  class="form-control" id="balance" name="balance" >
          </div>
          
          <button type="submit" class="btn btn-primary">Submit</button>
           <input type="Button" class="btn btn-primary" onclick="bal()" Value="calcaulate">
         
          <% } %>
          
       
        </form>
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


 <script  type="text/javascript">  
  
 function display(){
     document.getElementById("element").style.display = "none";          
 }
 
      function validate(){  
      var num=document.myform.Amount.value;  
        if (isNaN(num)){  
          alert("Enter only numeric values"); 
          return false;  
        }else{  
          return true;  
        }  
      }  
     
      function calpayment(){
    	  
        var mealplancost  = document.getElementById('costmenu').value;
       	 var guestcount  = document.getElementById('guestcount').value;            
       	   var toalmealcost = mealplancost * guestcount;
             var total = document.getElementById('totalmenucost');
                total.value = toalmealcost;
                total.style.display = 'block';
          
      }
   
      function totalcost(hallcost,totalmenucost){
        var totalmenucost  = Number(document.getElementById('totalmenucost').value);  
        var hallcost  = Number(document.getElementById('hallcost').value);
         var total1 = 0 ; 
          var total1 = Number(hallcost) +  Number(totalmenucost);
          
            var cost = document.getElementById('totalcost');
       
             cost.value = total1;
             cost.style.display = 'block';
          
      }
    
      function bal(){
    	  
    		
    	    var totalcost = (document.getElementById('totalcost').value);
    	   	 var adavancepay = (document.getElementById('adavancepay').value);     
    	   	 
    	   	   var total1 = Number(totalcost) -  Number(adavancepay);      
    			  
    			 document.getElementById('balance').value= total1;
    			    
    	  }
      
      function myFunction() {
    	  alert('hello');
    	}
</script> 
</html>