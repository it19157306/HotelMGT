package com.Customer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.DBConnection.DBConnect;
import com.interfaces.Customer;

public class CustomerDBUtil implements Customer {

	private static Connection con = null;
	private static Statement stmt,stmt1 = null;
	private static ResultSet rs = null;
	private static ResultSet rs1 = null;
	
	@Override
	public boolean addCustomer(String firstname, String lastname, String address, String nIC,
			String country, String gender, String email ,String contactnumber) {
			
		
		boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
          
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "insert into hotelmanage.customer values (0,'"+firstname+"','"+lastname+"','"+gender+"','"+nIC+"','"+country+"','"+address+"','"+email+"', '"+contactnumber+"')";
    	    
    	   
    		int rs = stmt.executeUpdate(sql);
    	
    		
    		if(rs > 0 ) {
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
	public boolean UpdateCustomer(String firstname, String lastname, String address, String contactnumber, String nIC,
			String country,  String email, String gender ,String id) {
			boolean isSuccess = false;
		
			try {
			
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "update hotelmanage.customer set FirstName ='"+firstname+"', Lastname = '"+lastname+"' , Gender = '"+gender+"', Country='"+country+"',  Address = '"+address+"' ,Email='"+email+"' ,contactNumber ='"+contactnumber+"' "
    	    		+ "where NIC = '"+nIC+"'";
    	    
    	   
    	    
    		int rs = stmt.executeUpdate(sql);
    		
    		
    		if(rs > 0 ) {
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
	
	
    public boolean deleteCustomer(String id) {
	 	
	 	
	 	boolean isSuccess = false;
	 	
	     	try {
	     		
	     		con = DBConnect.getConnection();
	     		stmt = con.createStatement();
	     		stmt1 = con.createStatement();
	     		
	     		//deleting the announcement details from the database relevant to the employee
	     		
	     		String sql = "delete from  hotelmanage.customer where CustomerID='"+id+"' ";
	     	
	     		
	     		
	     		int rs = stmt.executeUpdate(sql);
	     		
	     		
	     		if(rs > 0 ) {
	     			
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

