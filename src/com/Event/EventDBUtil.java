package com.Event;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import com.DBConnection.DBConnect;
import com.interfaces.Employee;
import com.interfaces.Event;


public class EventDBUtil implements Event {

		private static Connection con = null;
		private static Statement stmt,stmt1,stmt2,stmt3,stmt4,stmt5,stmt6,stmt7 = null;
		private static ResultSet rs = null;



	public  boolean addevent(String eventType, String eventName, String guestCount,
			String hallNumber, String hallCost ,Date sqdob , String customerID,String mealtype)
     {
    	
    	boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "insert into hotelmanage.event values (0 ,'"+hallCost+"' ,'"+guestCount+"','"+hallNumber+"','"+eventType+"','"+sqdob+"','"+customerID+"' ,'"+mealtype+"')";
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
	
	
	public  boolean updateEvent(String eventType, String eventName , String guestCount,
			String hallNumber, String hallCost , Date sqdob, String customerID,String mealtype)
     {
    	
    	boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "update hotelmanage.event set Hallcost = '"+hallCost+"' , NoOfGuest ='"+guestCount+"' , HallNumber = '"+hallNumber+"',EventType = '"+eventType+"' ,Date = '"+sqdob+"' ,MealType ='"+mealtype+"'"
    	    		+ "where EventID = '"+customerID+"' ";
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
	public boolean addeventpayment(String totalcost, String adavancepay, String balance, String eventID,String status) {
		// TODO Auto-generated method stub
		boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "insert into hotelmanage.eventpayment (TotalPayment ,AdvancePayment ,BalancePayment,eventID,Status)values ('"+totalcost+"' ,'"+adavancepay+"','"+balance+"','"+eventID+"','"+status+"')";
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
	public boolean updateEventPaymnet(String eventID, String status) {
		// TODO Auto-generated method stub
boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "update hotelmanage.eventpayment set Status = '"+status+"' " + "where EventID = '"+eventID+"' ";
    	    		
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

public boolean deleteEvent(String id) {
	 	
	 	
	 	boolean isSuccess = false;
	 	
	     	try {
	     		
	     		con = DBConnect.getConnection();
	     		
	     		stmt = con.createStatement();
	     		stmt1 = con.createStatement();
	     		stmt2 = con.createStatement();
	     		stmt3= con.createStatement();
	     		stmt4 = con.createStatement();
	     		stmt5 = con.createStatement();
	     		stmt6 = con.createStatement();
	     		
	     		
	     		//deleting the announcement details from the database relevant to the employee
	     		String sql = "delete from  hotelmanage.event where EventID='"+id+"' ";
	     		String sql2 = "delete from  hotelmanage.eventpayment where eventID='"+id+"' ";
	     		String sql3 = "delete from  hotelmanage.select_condiments where MealID='"+id+"' ";
	     		String sql4 = "delete from  hotelmanage.select_desert where FIxedMID='"+id+"' ";
	     		String sql5 = "delete from  hotelmanage.select_meat_and_dishes where FIxedMID='"+id+"' ";
	     		String sql6 = "delete from  hotelmanage.select_rice_and_noodles where FIxedMID='"+id+"' ";
	     		String sql7 = "delete from  hotelmanage.select_salad where FIxedMID='"+id+"' ";
	     			
	     		int rs6 = stmt6.executeUpdate(sql7);	
	     		int rs5 = stmt5.executeUpdate(sql6);
	     		int rs4 = stmt4.executeUpdate(sql5);
	     		int rs3 = stmt3.executeUpdate(sql4);		
	     		int rs2 = stmt2.executeUpdate(sql3);
	     		int rs1 = stmt1.executeUpdate(sql2);
	     		int rs = stmt.executeUpdate(sql);
	     		
	     		
	     		if(rs6 > 0 && rs5>0 && rs4>0 && rs3>0 && rs2>0 && rs1>0 &&rs>0) {
	     			
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
