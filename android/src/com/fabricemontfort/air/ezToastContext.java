package com.fabricemontfort.air;

import java.util.HashMap;
import java.util.Map;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.fabricemontfort.air.functions.InitFunction;
import com.fabricemontfort.air.functions.IsSupportedFunction;
import com.fabricemontfort.air.functions.ShowFunction;

public class ezToastContext extends FREContext {

	public static final String TAG = "ezToastContext";
	
	@Override
	public void dispose() {
		Log.d(TAG, "Context disposed.");
	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> map = new HashMap<String, FREFunction>();
		
		map.put("init", new InitFunction());
		map.put("isSupported", new IsSupportedFunction());
		map.put("show", new ShowFunction());
		
		return map;
	}

}
