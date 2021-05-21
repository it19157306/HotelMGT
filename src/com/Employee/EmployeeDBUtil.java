package com.Employee;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;

import com.DBConnection.DBConnect;
import com.interfaces.Employee;

public class EmployeeDBUtil implements Employee {

	private static Connection con = null;
	private static Statement stmt,stmt1,stmt2 = null;
	private static ResultSet rs,rs2 = null;
	
	boolean isSuccess = false;
	
    public  boolean addEmployee(String employeeName, String address, String contactNumber, String nIC, String gender, String designation, String username, String password, String basicSalary)
     {
    	
    	boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "insert into hotelmanage.employee values (0,'"+employeeName+"','"+address+"','"+nIC+"','"+contactNumber+"','"+gender+"','"+designation+"','"+basicSalary+"','"+username+"','"+password+"')";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }

	@Override
	public boolean UpdateEmployee(String employeeName, String address, String contactNumber, String nIC, String gender,
			String designation, String username, String password, String basicSalary) {
		
		boolean isSuccess = false;
		
		try {
			
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "update hotelmanage.employee set Name ='"+employeeName+"', Address = '"+address+"' , contactNumber='"+contactNumber+"',  Gender = '"+gender+"' ,Designation='"+designation+"' , BasicSalary ='"+basicSalary+"' , Username = '"+username+"', Password = '"+password+"' "  
    	      	    		+ "where NIC = '"+nIC+"' ";
    	    
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    		}
		
		return isSuccess;
		}


	public boolean addEmployeesalary(String basic, String totalsalary, String status, Date sqdob, String employeeID) {
			
			boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "insert into hotelmanage.salary values (0,'"+basic+"','"+sqdob+"','"+totalsalary+"','"+status+"','"+employeeID+"')";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
	}

	@Override
	public boolean UpdateEmployeesalary(String basic, String totalsalary, String status, Date sqdob,
			String employeeID) {
		// TODO Auto-generated method stub
		return false;
	}

	

public boolean deleteEmploye(String id) {
 	
 	
 	boolean isSuccess = false;
 	
     	try {
     		
     		con = DBConnect.getConnection();
     		stmt = con.createStatement();
     		stmt1 = con.createStatement();
     		stmt2 = con.createStatement();
     		
     		//deleting the announcement details from the database relevant to the employee
     		
     		String sql = "delete from  hotelmanage.employee where EmployeeID='"+id+"' ";
     		
     		String sql1 = "delete from  hotelmanage.salary where employeeID='"+id+"'";
     		
     		String sql2 = "delete from  hotelmanage.salary_ot where EmployeeID='"+id+"'";
     		
     		
     		int rs2 = stmt2.executeUpdate(sql2);
     		
     		int rs1 = stmt1.executeUpdate(sql1);
     		
     		int rs = stmt.executeUpdate(sql);
     		
     		
     		if(rs2 > 0 && rs1 > 0 && rs>0) {
     			
     			isSuccess = true;
     		
     			}
     		else {
     			isSuccess = false;
     		}
     		
     		}
     	catch(Exception e) {
     		e.printStackTrace();
     	}
     	
     	return isSuccess;
     }


	
}







