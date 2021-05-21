
<div class="container-fluid">


    		<!--<div class="navbar-header">
      			<a class="navbar-brand" href="#"><img src="assets/image/logo-gold-hotel.png"></a>
    		</div>
    		-->
    		<ul class="nav navbar-nav">
				<li>
					<a href="#">
						<i class="fa fa-home nav-icon"></i>
						<a href="Home.jsp"><span>HOME</span></a>
					</a>
				</li>
				
					 <%
            
				            if(session.getAttribute("user") == "Receptionist" )
				            { 
      	 
				     %>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-users nav-icon"></i>
						<span>Customer</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="AddCustomer.jsp"><i class="fa fa-user-plus"></i> Add New Customer</a></li>
						<li><a href="ListCustomer.jsp"><i class="fa fa-list-alt"></i> Customer List</a></li>
					</ul>
				</li>
				
					<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-users nav-icon"></i>
						<span>Event</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="ListEvents.jsp"><i class="fa fa-glass-cheers"></i> Event List</a></li>
						<li><a href="ListEventPayment.jsp"><i class="fa fa-list-alt"></i> Event Payment List</a></li>
					</ul>
				</li>
				
				
				
				<%
				}else if (session.getAttribute("user") == "Manager" || session.getAttribute("user") == "Owner"){%>
				
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-users nav-icon"></i>
						<span>Customer</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="AddCustomer.jsp"><i class="fa fa-user-plus"></i> Add New Customer</a></li>
						<li><a href="ListCustomer.jsp"><i class="fa fa-list-alt"></i> Customer List</a></li>
					</ul>
				</li>
				
					
				
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-users nav-icon"></i>
						<span>Employee</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" id= "employee">
						<li><a href="AddEmployee.jsp"><i class="fa fa-user-plus"></i> Add New Employee</a></li>
						<li><a href="ListEmployee.jsp"><i class="fa fa-list-alt"></i> Employee List</a></li>
						<li><a href="AddOTEmployee.jsp"><i class="fa fa-list-alt"></i> Add OT</a></li>
						<li><a href="AddEmployeeSalary.jsp"><i class="fa fa-list-alt"></i> Employee Salary</a></li>
						<li><a href="EmployeeSalaryList.jsp"><i class="fa fa-list-alt"></i> Employee Salary List</a></li>
					</ul>
				</li>
				
				
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-users nav-icon"></i>
						<span>Event</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="ListEvents.jsp"><i class="fa fa-list-alt"></i> Event List</a></li>
						<li><a href="ListEventPayment.jsp"><i class="fa fa-list-alt"></i> Event Payment List</a></li>
					</ul>
				</li>
				
				
				
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-users nav-icon"></i>
						<span>Expenses</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="AddExpenses.jsp"><i class="fa fa-user-plus"></i> Add Expenses</a></li>
						<li><a href="ListExpenses.jsp"><i class="fa fa-list-alt"></i> Expenses List</a></li>
						<li><a href="AddUtilityBill.jsp"><i class="fa fa-list-alt"></i> Add Utility Bills</a></li>
						<li><a href="ListUtilityBill.jsp"><i class="fa fa-list-alt"></i> List Utility Bills</a></li>
					</ul>
				</li>
				
				
				
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-users nav-icon"></i>
						<span>Inventory</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="AddInventory.jsp"><i class="fa fa-user-plus"></i> Add Inventory</a></li>
						<li><a href="ListInventory.jsp"><i class="fa fa-list-alt"></i> Inventory List</a></li>
					</ul>
				</li>
				
				
				
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-users nav-icon"></i>
						<span>Meal Menu</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="AddMealMenu.jsp"><i class="fa fa-user-plus"></i> Add New Meal Menu</a></li>
						<li><a href="ListMealMenu.jsp"><i class="fa fa-list-alt"></i>  Meal Menu List</a></li>						
					</ul>
				</li>
				
				
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-users nav-icon"></i>
						<span>Supplier</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="AddSupplier.jsp"><i class="fa fa-user-plus"></i> Add  Supplier</a></li>
						<li><a href="ListSuppliers.jsp"><i class="fa fa-list-alt"></i> Supplier List</a></li>
					</ul>
				</li>
				
    		<%
				}if(session.getAttribute("user") == "Owner"){
				
			%>
    		<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-users nav-icon"></i>
						<span>Reports</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="CustomerReport.jsp"><i class="fa fa-user-plus"></i> Customer Report</a></li>
						<li><a href="Employeereport.jsp"><i class="fa fa-list-alt"></i> Employee Report</a></li>
						<li><a href="InventoryReport.jsp"><i class="fa fa-list-alt"></i> Inventory Report</a></li>
						<li><a href="SupplierReport.jsp"><i class="fa fa-list-alt"></i> Supplier Report</a></li>
						<li><a href="ExpensesReport.jsp"><i class="fa fa-list-alt"></i> Expenses Report</a></li>
						<li><a href="UtilityBillReport.jsp"><i class="fa fa-list-alt"></i> UtilityBill Report</a></li>
						<li><a href="EventReport.jsp"><i class="fa fa-list-alt"></i> Event Report</a></li>
					</ul>
				</li>

    		</ul>
    		 
    		 <%}else{ }%>
    		<ul class="nav navbar-nav navbar-right">
			    <li>
			    <% 
    		 
    				if(session.getAttribute("user") != null){
    			%>
    			
			    	<a href="Logout">
			    		<i class="glyphicon glyphicon-log-in nav-icon"></i>
			    	<span>LogOut</span>
			    	</a>
			    	<%}else { %>
			    	
			    	
			    	<a href="Login.jsp">
			    		<i class="glyphicon glyphicon-log-in nav-icon"></i>
			    	<span>LogIn</span>
			    	</a>
			    	<%} %>
			    </li>
		    </ul>
		    
  		</div>
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		