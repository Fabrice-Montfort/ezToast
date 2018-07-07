package com.fabricemontfort.air.functions;

import android.app.Activity;
import android.content.Context;
import android.widget.Toast;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;

public class ShowFunction implements FREFunction {

	public static final String TAG = "ShowFunction";
	
	public static Activity a;
	public static Context appContext;
	
	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		a = context.getActivity();
		appContext = a.getApplicationContext();

		try {
			String stringText = args[0].getAsString();
			/**
			 * Create a Toast 
			 */
			Toast.makeText(a, stringText, Toast.LENGTH_SHORT).show();
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FRETypeMismatchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FREInvalidObjectException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FREWrongThreadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
