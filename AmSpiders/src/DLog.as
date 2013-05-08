package  
{
	import flash.external.ExternalInterface;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class DLog 
	{
		
		public static function Log(...data):void
		{			
			var args:Array = [];
			for (var i:int = 0; i < data.length; i++)
			{
				args.push(data[i]);
			}
			if (ExternalInterface.available)
			{
				args.splice(0, 0, "Flash.log");
				ExternalInterface.call.apply(ExternalInterface, args);
			}
			else 
			{
				trace.apply(DLog, args);
			}
		}
		
	}

}