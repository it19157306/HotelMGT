package com.interfaces;

import java.sql.Date;

public interface Inventory {
	
	public boolean addInventoryItem(String Inventoryname, int quantity , Date date, String inventoryType, String supplierName, String supid);

	public boolean updateInventoryItem(String inventoryname, String quantity, String inventoryType,String SupplierName, String id);
	
	public  boolean InventCategory(String Inventoryname);




}
