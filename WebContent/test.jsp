<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>




             <div class="form-group">
               <input type="number" class="form-control" id="totalcost" name="totalcost">
          </div>
         <div class="form-group">
             <input type="number" class="form-control"  id ="adavancepay"  name= "adavancepay" required="required" onchange="balance()">
        </div>
         
     
         
            <div class="form-group">
                <input  id="balance" name="balance"   >
          
        </div>
        <div class="form-group">
           <input type="Button"  class="btn btn-primary" onclick="balance()" value="cal">

</div>




</body>

<script type="text/javascript">

function balance(){
	  
    var totalcost = (document.getElementById('totalcost').value);
   	 var adavancepay = (document.getElementById('adavancepay').value);     
   	 
   	   var total1 = Number(totalcost) -  Number(adavancepay);      
		  // var bal = document.getElementById('balance');
		 document.getElementById('balance').value= total1;
		
 	//	bal.value = total1.value;
 		// bal.style.display = 'block';
    
  
      
  }
     

</script> 
</html>