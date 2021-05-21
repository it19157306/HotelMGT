<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="java.text.ParseException" %>
 <%@page import="java.text.SimpleDateFormat" %>
 <%@page import=" java.sql.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript">

function calday(){
<%

			SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dateBeforeString = request.getParameter("startdate");
			String dateAfterString = request.getParameter("enddate");
			
			try {
				 java.util.Date dateBefore = myFormat.parse(dateBeforeString);
				 java.util.Date dateAfter = myFormat.parse(dateAfterString);
			
				 long difference = dateAfter.getTime() - dateBefore.getTime();
			     float daysBetween = (difference / (1000*60*60*24));
			          /* You can also convert the milliseconds to days using this method
			           * float daysBetween = 
			           *         TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)
			           */
			      System.out.println("Number of Days between dates: "+daysBetween);
			          
			      request.setAttribute("dates", daysBetween);
			     
			} catch (Exception e) {
			      e.printStackTrace();
			}
			
			%>
			}

</script>

								 <form method="post" action="#"  >
 
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Reserve Date</label>
                                                <input type="date" class="form-control" placeholder="start" name="startdate" id ="startdate" required="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">end date</label>
                                                <input type="date" class="form-control" placeholder="Country" name="enddate" id = "enddate" required="required" >
                                            </div>   
                                                                       
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Payment Type</label>
                                                <select class="form-control custom-select" name="Paytype" >
                                                    <option value="Male">Instant</option>
                                                    <option value="Female">On leave</option>
                                                </select>
                                            </div>
                                          <br>
                                          <div class="form-group">
                                                <label for="exampleInputPassword1">dates</label>
                                                <input type="text" class="form-control" name="dates" id = "dates" value=<%=request.getAttribute("dates") %> >
                                            </div>   
                                            
                                            <button type="submit" class="btn btn-primary"   onclick="calday();"> Proceed</button>                                           
                                        </form>



</body>
</html>