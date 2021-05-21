package com.Expenses;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;

import com.DBConnection.DBConnect;
import com.interfaces.Expenses;

public class ExpensesDBUtil implements Expenses {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public boolean addExpenses(java.util.Date date, String amount, String reason) {
			
		
		boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "insert into  hotelmanage.expenses (ExpensesID , AddedDate, Reason , Amount) values (0,'"+date+"','"+reason+"','"+amount+"')";
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
	public boolean UpdateExpenses(String date, String amount, String reason,String ExpensesID) {

		boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "update hotelmanage.expenses set Reason = '"+reason+"' , Amount ='"+amount+"' "+" where  ExpensesID = '"+ExpensesID+"' ";
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

	
public boolean deleteExpenses(String id) {
	 	
	 	
	 	boolean isSuccess = false;
	 	
	     	try {
	     		
	     		con = DBConnect.getConnection();
	     		stmt = con.createStatement();
	     		
	     		
	     		//deleting the announcement details from the database relevant to the employee
	     		
	     		String sql = "delete from  hotelmanage.expenses where ExpensesID='"+id+"' ";
	     		
	     		int rs = stmt.executeUpdate(sql);
	     		
	     		if(rs>0) {	     		
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
