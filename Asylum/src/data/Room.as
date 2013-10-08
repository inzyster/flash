package data
{
	import data.ImageNode;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class Room extends ImageNode
	{
		
		private var _items:Dictionary;
		
		public function Room(xmlObject:XML)
		{
			this._assetType = AssetType.ROOM;
			super(xmlObject);
			
			this._items = new Dictionary();
			
			for each (var itemXML:XML in xmlObject.item)
			{
				var itemID:String = itemXML["@id"];
				var itemX:Number = new Number(itemXML["@x"]);
				var itemY:Number = new Number(itemXML["@y"]);
				
				this._items[itemID] = new Point(itemX, itemY);
			}			
		}
		
	}

}