package data 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class ItemsCatalog 
	{
		
		private var _items:Dictionary;
		
		public function ItemsCatalog(xmlObject:XML) 
		{
			this._items = new Dictionary();
			for each (var itemXML:XML in xmlObject.item)
			{
				var item:Item = new Item(itemXML);
				this._items[item.id] = item;
			}
		}
		
		public function GetItemWithID(id:String):Item
		{
			return this._items[id] as Item;
		}
		
	}

}