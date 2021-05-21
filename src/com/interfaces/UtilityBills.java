package com.interfaces;

import java.sql.Date;

public interface UtilityBills {
	
	public boolean addutilitybill(String category, String amount, Date date);
	public boolean Updateutilitybill(String category, String amount ,String ID);

}
