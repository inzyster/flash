package  
{
	/**
	 * ...
	 * @author ...
	 */
	public class Utils 
	{
		
		public static function ColorFromRGBA(r:Number = 1.0, g:Number = 1.0, b:Number = 1.0, a:Number = 1.0):uint
		{
			var R:uint = uint(Utils.Clamp(r * 255.0));
			var G:uint = uint(Utils.Clamp(g * 255.0));
			var B:uint = uint(Utils.Clamp(b * 255.0));
			var A:uint = uint(Utils.Clamp(a * 255.0));
			
			return ((A << 24) + (R << 16) + (G << 8) + (B << 0));
		}
		
		public static function Clamp(n:Number, upper:Number = 255.0, lower:Number = 0.0):Number
		{
			if (n > upper)
			{
				return upper;
			}
			else if (n < lower)
			{
				return lower;
			}
			return n;
		}
		
	}

}