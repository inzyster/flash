package  
{
	import flash.utils.describeType;
		
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class Assets 
	{
		
		[Embed(source="../data/data.xml", mimeType="application/octet-stream")]
		private static var AllData:Class;
		
		[Embed(source="../data/item.png")]
		private static var Item1:Class;
		
		[Embed(source="../data/room-1.png")]
		private static var Room1:Class;
		
		[Embed(source="../data/room-2.png")]
		private static var Room2:Class;
		
		[Embed(source="../data/room-3.png")]
		private static var Room3:Class;

		public static function GetAsset(id:String, type:String):Class
		{
			var variableName:String = type + id;
			var newClass:Class = Assets[variableName] as Class;
			return newClass;
		}
		
	}

}