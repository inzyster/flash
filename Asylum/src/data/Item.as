package data
{
	import data.ImageNode;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class Item extends ImageNode
	{		
		
		private var _label:String;
		private var _description:String;
		
		public function get label():String
		{
			return _label;
		}
		
		public function get description():String
		{
			return _description;
		}
		
		public function Item(xmlObject:XML)
		{
			this._assetType = AssetType.ITEM;
			super(xmlObject);
			
			this._label = xmlObject["label"].toString();
			this._description = xmlObject["description"].toString();
		}
		
	}

}