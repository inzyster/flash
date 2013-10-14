package data 
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class DataNode extends EventDispatcher
	{
		
		public var id:String;
		
		public var properties:Dictionary;
		
		public function DataNode(xmlObject:XML)
		{
			this.id = xmlObject["@id"].toString();
			this.properties = new Dictionary();
			for each (var property:XML in xmlObject["properties"]["property"])
			{
				var key:String = property["key"].toString();
				var value:String = property["value"].toString();
				this.properties[key] = value;
			}
		}
		
		public function update(frameTime:Number):void
		{
			
		}
		
	}

}