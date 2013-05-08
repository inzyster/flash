package  
{
	import flash.external.ExternalInterface;
	import flash.system.Capabilities;
	import flash.system.Security;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Config 
	{

		[Embed(source = "../res/amstrad_cpc464.ttf", embedAsCFF = "false", fontFamily = "cpc")]
		private static var FONT_CPC:Class;
		
		private static var _Width:int;
		private static var _Height:int;
		private static var _RefreshRate:int;
		
		private static var _ContainerWidth:int;
		private static var _ContainerHeight:int;
		
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
		
		public static function get ContainerWidth():int 
		{
			return _ContainerWidth;
		}
		
		public static function get ContainerHeight():int 
		{
			return _ContainerHeight;
		}
		
		public static function get DefaultBackground():uint
		{
			return _DefaultBackground;
		}
		
		public static function setContainerSize(width:int, height:int):void
		{
			_ContainerWidth = width;
			_ContainerHeight = height;
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
				_Width = 800;
				_Height = 600;
			}
			
			if (ExternalInterface.available)
			{
				
			}
			else 
			{
				_ContainerWidth = _Width;
				_ContainerHeight = _Height;
			}
			_RefreshRate = 60;
			_DefaultBackground = 0x202020;
		}
		
	}

}