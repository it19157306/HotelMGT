<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


 										<form method="post" action="#"  >
 
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Arrival Date</label>
                                                <input type="date" class="form-control" placeholder="start" name="startdate" id ="startdate" required="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Departure date</label>
                                                <input type="date" class="form-control" placeholder="Country" name="enddate" id = "enddate" required="required" >
                                            </div>   
                                            
                                             <div class="form-group">
                                                <label for="exampleInputPassword1">Departure date</label>
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
                                            
                                            <button type="submit" class="btn btn-primary" > Proceed</button>                                           
                                        </form>


</body>
</html>