package com.angelpro.beerapp;

import java.util.List;
import java.util.ArrayList;

public class BeerExpert{
    
    List<String> getBrands(String color){
	List<String> brands = new ArrayList<String>();
	
	if (color.equals("light")){
	   brands.add("light beer 1");
	   brands.add("light beer 2");
	   brands.add("light beer 3");
	}else{
    	   brands.add("non light beer 1");
	   brands.add("non light beer 2");
	}
	
	return brands;
    }

}
