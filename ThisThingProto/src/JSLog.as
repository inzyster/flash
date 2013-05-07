package  
{
	import flash.external.ExternalInterface;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class JSLog 
	{
		
		public static function Log(...data):void
		{			
			if (ExternalInterface.available)
			{
				var args:Array = [];
				args.push("Flash.log");
				for (var i:int = 0; i < data.length; i++)
				{
					args.push(data[i]);
				}
				ExternalInterface.call.apply(ExternalInterface, args);
			}
		}
		
	}

}