package com.interfaces;

public interface MealItems {

	public boolean addcondiments(String name, String mealMenulistnumber);
	public boolean addDeserts(String name,String mealMenulistnumber);
	public boolean addRiceandNoodles(String name ,String mealMenulistnumber);
	public boolean addsalads(String name ,String mealMenulistnumber);
	public boolean addmeatandfish(String name ,String mealMenulistnumber);
	
	public boolean addmenulistnumber(String name , double Price);
	public boolean addNewcondiments(String mealName, String mealMenulistnumber);
	public boolean addNewDeserts(String mealName, String mealID);
	public boolean addNewRice(String mealName, String mealID);
	public boolean addNewSalads(String mealName, String mealID);
	public boolean addNewMeat(String mealName, String mealID);
	public boolean addNewVegetable(String mealName, String mealID);
	public boolean addMealType(String mealname, String price, String condiments, String desert, String meat,
			String rice, String salads);
	public boolean Updatemeal(String mealId, String mealname, String price, String condimealname, String dertmealname,
			String mfmealname, String rnmealname, String smealname);
	public boolean DeleteMeal(String mealId);
}
