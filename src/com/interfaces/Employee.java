package com.interfaces;

import java.sql.Date;

public interface Employee {
	
	public  boolean addEmployee(String employeeName, String address, String contactNumber, String nIC, String gender, String designation, String username, String password, String basicSalary);
    
	public boolean UpdateEmployee(String employeeName, String address, String contactNumber, String nIC, String gender, String designation, String username, String password, String basicSalary);

	public boolean addEmployeesalary(String basic, String totalsalary, String status, Date sqdob, String employeeID);

	public boolean UpdateEmployeesalary(String basic, String totalsalary, String status, Date sqdob, String employeeID);


	

	
	
}
