package com.interfaces;

import java.sql.Date;

public interface Event {

	public boolean addevent(String eventType, String eventName, String guestCount, String hallNumber, String hallCost, Date sqdob, String customerID, String mealtype);
	
	public boolean updateEvent(String eventType, String eventName, String guestCount,String hallNumber, String hallCost,Date sqdob, String customerID,String mealtype);

	public boolean addeventpayment(String totalcost, String adavancepay, String balance, String eventID, String status);

	public boolean updateEventPaymnet(String eventID, String status);

}
