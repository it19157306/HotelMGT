package com.Inventory;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;

import com.DBConnection.DBConnect;
import com.interfaces.Inventory;

public class InventoryDBUtil implements Inventory {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;



	public  boolean InventCategory(String Inventoryname)
	 {
		
		boolean isSuccess = false;
		
		try {
			//testing databse connecion 
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			//Sql querry in inserting the recieved details to the database
		    String sql = "insert into hotelmanage.sup_category values (0, '"+Inventoryname+"')";
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
	
public  boolean addInventoryItem(String Inventoryname, int Quantity , Date date, String InventoryType,String supplierName,String supID)
 {
	
	boolean isSuccess = false;
	
	try {
		//testing databse connecion 
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		//Sql querry in inserting the recieved details to the database
		
	    String sql = "insert into hotelmanage.inventory values (0,'"+Inventoryname+"','"+supplierName+"','"+Quantity+"','"+date+"','"+InventoryType+"' , '"+supID+"' )";
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
public boolean updateInventoryItem(String inventoryname, String quantity, String inventoryType ,String SupplierName,String id) {

	boolean isSuccess = false;
	
	try {
		//testing databse connecion
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		//Sql querry in inserting the recieved details to the database
	    String sql = "update hotelmanage.inventory set Item_Name='"+inventoryname+"',Quantity = '"+quantity+"',Type = '"+inventoryType+"' ,SupplierName = '"+SupplierName+"' "
		+ "where InventoryID = '"+id+"'";
	    		   				
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

public boolean deleteinventory(String id) {
 	
 	
 	boolean isSuccess = false;
 	
     	try {
     		
     		con = DBConnect.getConnection();
     		stmt = con.createStatement();
     	
     		//deleting the announcement details from the database relevant to the employee
     		
     		String sql = "delete from  hotelmanage.inventory where InventoryID='"+id+"' ";
     		
     	
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
