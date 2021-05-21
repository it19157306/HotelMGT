package com.FixedMeal;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.DBConnection.DBConnect;
import com.interfaces.MealItems;

public class MealDBUtil implements MealItems {
	

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	boolean isSuccess = false;
	
	public boolean addmenulistnumber(String name , double price) {
		
		
    	boolean isSuccess = false;
    	
    	try {
    		 
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
	}
	
	
	
	
    public  boolean addcondiments(String MealName ,String mealMenulistnumber)
     {
    	
    	boolean isSuccess = false;
    	
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		
    		//Sql querry in inserting the recieved details to the database
    		
    	    String sql = "insert into hotelmanage.select_condiments values (0,'"+MealName+"' ,'"+mealMenulistnumber+"')";
    	    
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
    
    public  boolean addNewcondiments(String MealName ,String MealID)
    {
   	
   	boolean isSuccess = false;
   	
   	try {
   		//testing databse connecion
   		con = DBConnect.getConnection();
   		stmt = con.createStatement();
   		
   		//Sql querry in inserting the recieved details to the database
   		
   	    String sql = "insert into hotelmanage.mealcondiments values (0,'"+MealName+"' ,'"+MealID+"')";
   	    
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

    
    public  boolean addNewDeserts(String MealName ,String MealID){
	   	boolean isSuccess = false;
	   	
	   	try {
	   		//testing databse connecion
	   		con = DBConnect.getConnection();
	   		stmt = con.createStatement();
	   		
	   	    String sql = "insert into hotelmanage.mealdesert values (0,'"+MealName+"' ,'"+MealID+"')";
	   	    
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
    
    
   
    public  boolean addNewRice(String MealName ,String MealID){
	   	boolean isSuccess = false;
	   	
	   	try {
	   		//testing databse connecion
	   		con = DBConnect.getConnection();
	   		stmt = con.createStatement();
	   		
	   	    String sql = "insert into hotelmanage.meal_rice_and_noodles values (0,'"+MealName+"' ,'"+MealID+"')";
	   	    
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
    
    
    public  boolean addNewSalads(String MealName ,String MealID){
	   	boolean isSuccess = false;
	   	
	   	try {
	   		//testing databse connecion
	   		con = DBConnect.getConnection();
	   		stmt = con.createStatement();
	   		
	   	    String sql = "insert into hotelmanage.mealsalads values (0,'"+MealName+"' ,'"+MealID+"')";
	   	    
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
    
    public  boolean addNewMeat(String MealName ,String MealID){
	   	boolean isSuccess = false;
	   	
	   	try {
	   		//testing databse connecion
	   		con = DBConnect.getConnection();
	   		stmt = con.createStatement();
	   		
	   	    String sql = "insert into hotelmanage.meal_meat_and_dishes values (0,'"+MealName+"' ,'"+MealID+"')";
	   	    
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

    
    public  boolean addNewVegetable(String MealName ,String MealID){
	   	boolean isSuccess = false;
	   	
	   	try {
	   		//testing databse connecion
	   		con = DBConnect.getConnection();
	   		stmt = con.createStatement();
	   		
	   	    String sql = "insert into hotelmanage.meal_meat_and_dishes values (0,'"+MealName+"' ,'"+MealID+"')";
	   	    
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
    
    
    public  boolean addDeserts(String MealName,String mealMenulistnumber)
    {
   	
   	boolean isSuccess = false;
   	
   	try {
   		//testing databse connecion
   		con = DBConnect.getConnection();
   		stmt = con.createStatement();
   		
   		//Sql querry in inserting the recieved details to the database
   	    String sql = "insert into hotelmanage.select_desert values (0,'"+MealName+"', '"+mealMenulistnumber+"')";
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
    
    public boolean addRiceandNoodles(String MealName ,String mealMenulistnumber) {
    	
    	boolean isSuccess = false;
       	
       	try {
       		//testing databse connecion
       		con = DBConnect.getConnection();
       		stmt = con.createStatement();
       		
       		//Sql querry in inserting the recieved details to the database
       	    String sql = "insert into hotelmanage.select_rice_and_noodles values (0,'"+MealName+"', '"+mealMenulistnumber+"')";
       	    
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
	public boolean addsalads(String name, String mealMenulistnumber) {
		boolean isSuccess = false;
       	
	       	try {
	       		//testing databse connecion
	       		con = DBConnect.getConnection();
	       		stmt = con.createStatement();
	       		
	       		//Sql querry in inserting the recieved details to the database
	       	    String sql = "insert into hotelmanage.select_salad values (0,'"+name+"', '"+mealMenulistnumber+"')";
	       	    
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
	public boolean addmeatandfish(String name, String mealMenulistnumber) {
		boolean isSuccess = false;
       	
	       	try {
	       		//testing databse connecion
	       		con = DBConnect.getConnection();
	       		stmt = con.createStatement();
	       		
	       		//Sql querry in inserting the recieved details to the database
	       	    String sql = "insert into hotelmanage.select_meat_and_dishes values (0,'"+name+"', '"+mealMenulistnumber+"')";
	       	    
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
	public boolean addMealType(String mealname, String Price, String Condiments, String Desert, String Meat, String Rice, String Salads) {
			boolean isSuccess = false;
       	
	       	try {
	       		//testing databse connecion
	       		con = DBConnect.getConnection();
	       		stmt = con.createStatement();
	       		
	       		//Sql querry in inserting the recieved details to the database
	       	    String sql = "insert into hotelmanage.mealmenu values (0,'"+Price+"', '"+mealname+"', '"+Condiments+"', '"+Desert+"', '"+Meat+"', '"+Rice+"', '"+Salads+"')";
	       	    
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
	public boolean Updatemeal(String mealId, String mealname, String price, String condimealname, String dertmealname,
			String mfmealname, String rnmealname, String smealname) {
			boolean isSuccess = false;
		
		try {
			
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		
    		//Sql querry in inserting the recieved details to the database
    	    String sql = "update hotelmanage.mealmenu set TotalPrice ='"+price+"', condimentsLimit = '"+condimealname+"' , desertsLimit='"+dertmealname+"',  meat_and_dishessLimit = '"+mfmealname+"' ,rice_and_noodlesLimit='"+rnmealname+"' , saladLimit ='"+smealname+"'  "  
    	      	    		+ "where MealID = '"+mealId+"' ";
    	    
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
	public boolean DeleteMeal(String mealId) {
		
		boolean isSuccess = false;
    	try {
    		//testing databse connecion
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		//Sql querry in deleting the recieved details in the database
    		
    		String sql = "delete from hotelmanage.mealmenu where MealID='"+mealId+"' ";
    		
    	
    	
    		int rs = stmt.executeUpdate(sql);
    		
    		if( rs > 0) {
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
