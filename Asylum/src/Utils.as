package  
{
	import flash.utils.describeType;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class Utils 
	{
		
		public static function hasConstantInClass(classObj:Class, value:*):Boolean
		{
			return describeType(classObj).constant.(classObj[@name.toString()] == value).length() != 0;
		}
		
	}

}