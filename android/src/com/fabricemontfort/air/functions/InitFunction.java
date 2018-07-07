package com.fabricemontfort.air.functions;

import android.app.Activity;
import android.content.Context;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.fabricemontfort.air.ezToast;

public class InitFunction implements FREFunction {

	public static final String TAG = "InitFunction";
	
	public static Activity a;
	public static Context appContext;
	
	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		ezToast.extensionContext = context;
		
		a = context.getActivity();
		appContext = a.getApplicationContext();
		ezToast.appContext = appContext;
		
		return null;
	}

}
