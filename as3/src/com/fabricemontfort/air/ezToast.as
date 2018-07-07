package com.fabricemontfort.air
{
	import flash.events.EventDispatcher;
	import flash.external.ExtensionContext;
	import flash.system.Capabilities;
	
	/**
	 * <p>ezToast AIR Native Extension for iOS and Android</p>
	 * <p>Create and Use ANE with Adobe AIR</p>
	 * <p>Give extra powers to your amazing projects</p>
	 */
	public class ezToast extends EventDispatcher
	{
		
		/**
		 * @private
		 */
		private static var __instance:ezToast;

		/**
		 * @private
		 */
		
		private var __extContext:ExtensionContext;
		/**
		 * @private
		 */
		private static const EXT_ID:String = "com.fabricemontfort.air.ezToast";
		
		/**
		 * This extension is based on a Singleton. 
		 * <p>To use it, please call <code>ezToast.instance();</code></p>
		 * 
		 * @example The following code shows you how to use this extension:
		 * <listing version="3.0">
		 * import com.fabricemontfort.air.ezToast;
		 * 
		 * var toast:ezToast = ezToast.instance();
		 * 
		 * if (toast.isSupported())
		 * {
		 * 	   toast.show( "HELLO WORLD" );
		 * }</listing>
		 */
		public function ezToast(enforcer:SingletonEnforcer)
		{
			super();
			
			this.__extContext = ExtensionContext.createExtensionContext(EXT_ID, null);
			
			if (!this.__extContext)
			{
				throw new Error("[ezToast] : This extension is not supported on this system.");
			}
		}
		
		/**
		 * This method instanciate and return the current (and unique) instance of the <code>ezToast</code> class.
		 * 
		 * @return
		 */
		public static function get instance():ezToast
		{
			if (!__instance)
			{
				__instance = new ezToast(new SingletonEnforcer());
				__instance.init();
				
			}
			return __instance;
		}
		
		/**
		 * @private
		 */
		private function init():void
		{
			if (Capabilities.manufacturer.indexOf("iOS") > -1 ||Capabilities.manufacturer.indexOf("Android") > -1) {
				__extContext.call("init");
			}
		}
		
		/**
		 * This method is used to know if the NATIVE TOASTS are available on the mobile device.
		 * 
		 * @return <code>true</code> if the toasts engine is available, <code>false</code> if not
		 */
		public function isSupported():Boolean
		{
			if (Capabilities.manufacturer.indexOf("iOS") > -1 ||Capabilities.manufacturer.indexOf("Android") > -1) {
				return __extContext.call("isSupported") as Boolean;
			} else {
				return true;
			}
		}
		
		/**
		 * This method is used to show a message with a toast on top of AIR stage
		 * 
		 * @param message Must be a valid String
		 * 
		 * @return This method returns no result
		 */
		public function show(message:String):void
		{
			if (isSupported())
			{
				if (Capabilities.manufacturer.indexOf("iOS") > -1 ||Capabilities.manufacturer.indexOf("Android") > -1) {
					__extContext.call("show", message);
				} else {
					trace ("[ezToast] : " + message);
				}
			}
		}
	}
}

class SingletonEnforcer {
	
}