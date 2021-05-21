package com.interfaces;

public interface supplier {

	
	public  boolean insertsupplier(String SupplierName, String address, String contactNumber, String category);

	public boolean updatesupplier(String supplierName, String address, String contactNumber, String category, String id);
	
	 public  boolean insertsuppliercategory( String category);
	 
	 public  boolean DeleteSupplier(String id);
    
	
}
