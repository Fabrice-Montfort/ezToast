package com.fabricemontfort.air;

import android.content.Context;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class ezToast implements FREExtension {

	public static final String TAG = "ezToast";

	public static FREContext extensionContext;
	public static Context appContext;

	@Override
	public FREContext createContext(String arg0) {
		return new ezToastContext();
	}

	@Override
	public void dispose() {
		Log.d(TAG, "Extension disposed.");
		
		appContext = null;
		extensionContext = null;
	}

	@Override
	public void initialize() {
		Log.d(TAG, "Extension initialized.");
	}

}
