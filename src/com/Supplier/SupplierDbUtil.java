package com.Supplier;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.DBConnection.DBConnect;
import com.interfaces.supplier;

public class SupplierDbUtil implements supplier {
	

	private static Connection con = null;
	private static Statement stmt,stmt1 = null;
	private static ResultSet rs,rs1 = null;
	
	boolean isSuccess = false;
	
    public  boolean insertsupplier(String SupplierName, String address, String contactNumber, String category)
     {
    	
    	boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "insert into hotelmanage.supplier values (0,'"+contactNumber+"','"+address+"','"+SupplierName+"','"+category+"')";
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
    
    
    public  boolean insertsuppliercategory( String category)
    {
   	
   	boolean isSuccess = false;
   	
   	try {
   		//testing databse connecion
   		con = DBConnect.getConnection();
   		stmt = con.createStatement();
   		//Sql querry in inserting the recieved details to the database
   	    String sql = "insert into hotelmanage.sup_category values (0,'"+category+"')";
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
    
    public boolean updatesupplier(String supplierName, String address, String contactNumber, String category ,String id) {
    			
    	boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "update hotelmanage.supplier set ContactNumber='"+contactNumber+"' ,Address='"+address+"',Name='"+supplierName+"',Category='"+category+"'"
    	    		        					+"where SupplerID='"+id+"' ";
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
    
 public  boolean DeleteSupplier(String id) {
    	
    	boolean isSuccess = false;
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		stmt1 = con.createStatement();
    		//Sql querry in deleting the recieved details in the database
    		
    		String sql1 = "delete from hotelmanage.inventory where SupID='"+id+"'";
    		
    		String sql = "delete from hotelmanage.supplier where SupplerID='"+id+"' ";
    		
    		int rs1 = stmt1.executeUpdate(sql1);
    		int rs = stmt.executeUpdate(sql);
    		
    		if( rs1 > 0 && rs > 0) {
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
