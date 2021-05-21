package com.interfaces;

import java.sql.Date;

public interface Expenses{
	
	public boolean addExpenses(java.util.Date date, String amount, String reason);
	
	public boolean UpdateExpenses(String addedDate, String amount, String reason, String expensesID);

}
