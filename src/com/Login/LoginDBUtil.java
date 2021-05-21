package com.Login;

import com.DBConnection.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;


public class LoginDBUtil {
	

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	
	//Check the Customer Login Credentials
	public boolean checkReceptionist(String id, String password)
	{
		
		
		String sql2 = "SELECT *  FROM hotelmanage.employee WHERE Username ='"+id+"' AND Password = '"+password+"'  And Designation = 'Receptionist' ";
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			Class.forName("com.mysql.jdbc.Driver");
			
			rs = stmt.executeQuery(sql2);
			
			
			if(rs.next())
			{
				return true;
			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	//Check Admin Login Credentials
		public boolean checkManager(String id, String password)
		{
			
			String sql1 = "SELECT *  FROM hotelmanage.employee WHERE Username ='"+id+"' AND Password = '"+password+"' and Designation = 'Manager' ";
			try {
				con = DBConnect.getConnection();
				stmt = con.createStatement();
				Class.forName("com.mysql.jdbc.Driver");
				
				rs = stmt.executeQuery(sql1);
				if(rs.next())
				{
					return true;
				}
				
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return false;
		}
		
		public boolean checkOwner(String id, String password)
		{
			
			String sql3 = "SELECT * FROM hotelmanage.employee WHERE Username = '"+id+"' AND Password = '"+password+"'  and Designation = 'Owner' ";
			try {
				con = DBConnect.getConnection();
				stmt = con.createStatement();
				Class.forName("com.mysql.jdbc.Driver");
				
				rs = stmt.executeQuery(sql3);
				if(rs.next())
				{
					return true;
				}
				
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return false;
		}
		
		
		public boolean checkCustomer(String id, String password)
		{
			
			String sql1 = "SELECT * FROM hotelmanage.customer WHERE Email = '"+id+"' AND NIC = '"+password+"'";
			try {
				con = DBConnect.getConnection();
				stmt = con.createStatement();
				Class.forName("com.mysql.jdbc.Driver");
				
				rs = stmt.executeQuery(sql1);
				if(rs.next())
				{
					return true;
				}
				
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return false;
		}
		
		
		
		
		
		
		
}
