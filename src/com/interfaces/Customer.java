package com.interfaces;

public interface Customer {
	
	public boolean addCustomer(String firstname, String lastname, String address, String nIC,String country,String gender, String email, String contactnumber);

	public boolean UpdateCustomer(String firstname, String lastname, String address, String contactnumber, String nIC,String country, String gender,String email, String id);

}
