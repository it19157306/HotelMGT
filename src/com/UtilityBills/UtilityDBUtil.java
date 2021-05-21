package com.UtilityBills;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import com.interfaces.*;
import com.DBConnection.DBConnect;

public class UtilityDBUtil implements UtilityBills  {
	

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public boolean addutilitybill(String category, String amount, Date udob) {
			
		
		boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "insert into hotelmanage.utilitybills (Amount , AddedDate,BillType)values ('"+amount+"','"+udob+"','"+category+"')";
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
	
	
public boolean addutilitybilltype(String name) {
			
		
		boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "insert into hotelmanage.utilitybill_category values  (0 , '"+name+"')";
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



	public boolean Updateutilitybill( String category , String amount, String ID ) {
			
		boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    		
    	    String sql = "update  hotelmanage.utilitybills set Amount ='"+amount+"' , BillType = '"+category+"'  WHERE BillID = '"+ID+"'";
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


public boolean deleteutilitybill(String id) {
	 	
	 	
	 	boolean isSuccess = false;
	 	
	     	try {
	     		
	     		con = DBConnect.getConnection();
	     		stmt = con.createStatement();
	     		
	     		
	     		//deleting the announcement details from the database relevant to the employee
	     		
	     		String sql = "delete from  hotelmanage.utilitybills where BillID='"+id+"' ";
	     	
	     		
	     		int rs = stmt.executeUpdate(sql);
	     		
	     		if( rs>0) {	     		
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
