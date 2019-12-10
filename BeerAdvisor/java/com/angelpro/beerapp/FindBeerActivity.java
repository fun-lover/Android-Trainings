package com.angelpro.beerapp;


import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Spinner;
//import android.support.v7.app.AppCompatActivity;


public class FindBeerActivity extends Activity{

	private Button button;
  // private BeerExpert beerExpert = new BeerExpert();
   @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
	setContentView(R.layout.activity_find_beer);
	button = (Button)findViewById(R.id.find_beer).setOnClickListener(this);
    }
    public void onClickFindBeer(View view){
	//Get a reference to the TextView
	TextView brands = (TextView) findViewById(R.id.brands);
	//Get a reference to the Spinner
	Spinner color = (Spinner) findViewById(R.id.color);
	//Get the selected item in the Spinner
	String beerType = String.valueOf(color.getSelectedItem());
	//Display the selected item
	brands.setText(beerType);
    }

}
