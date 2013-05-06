package  
{
	import flash.system.Capabilities;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Config 
	{

		private static var _Width:int;
		private static var _Height:int;
		private static var _RefreshRate:int;
		
		private static var _DefaultBackground:uint;
		
		public static function get Width():int
		{
			return _Width;
		}
		
		public static function get Height():int
		{
			return _Height;
		}
		
		public static function get RefreshRate():int
		{
			return _RefreshRate;
		}
		
		public static function get DefaultBackground():uint
		{
			return _DefaultBackground;
		}
		
		// static initializer, apparently
		{
			if (CONFIG::desktop == true)
			{
				_Width = Capabilities.screenResolutionX;
				_Height = Capabilities.screenResolutionY;
			}
			else 
			{
				_Width = 640;
				_Height = 480;
			}
			_RefreshRate = 60;
			_DefaultBackground = 0x202020;
		}
		
	}

}