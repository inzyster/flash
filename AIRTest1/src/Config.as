package  
{
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Config 
	{
		
		public static var ScreenWidth:int;
		public static var ScreenHeight:int;
		public static var RefreshRate:Number;
		public static var FixedRefreshRate:Boolean;
		
		{
			init();
		}
		
		private static function init():void
		{
			var os:String = Capabilities.os;
			if (0)/*(os.search(/ios|iphone|ipad|ipod|android/i) >= 0)*/
			{
				ScreenWidth = Capabilities.screenResolutionX;
				ScreenHeight = Capabilities.screenResolutionY;
			}
			else 
			{
				ScreenWidth = 960;
				ScreenHeight = 640;
			}
			RefreshRate = 60;
			FixedRefreshRate = false;
		}
		
	}

}