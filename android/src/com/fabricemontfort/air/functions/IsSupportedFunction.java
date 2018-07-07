package com.fabricemontfort.air.functions;

import android.app.Activity;
import android.content.Context;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

public class IsSupportedFunction implements FREFunction {

	public static final String TAG = "IsSupportedFunction";
	
	public static Activity a;
	public static Context appContext;
	
	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		a = context.getActivity();
		appContext = a.getApplicationContext();
		
		FREObject returnValue = null;
		
		try {
			Boolean toReturn = true;
			
			returnValue = FREObject.newObject(toReturn);
		} catch (FREWrongThreadException e1) {
			e1.printStackTrace();
		}
		
		return returnValue;
	}

}
