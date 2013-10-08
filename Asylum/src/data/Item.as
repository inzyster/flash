package data
{
	import data.ImageNode;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class Item extends ImageNode
	{		
		
		public function Item(xmlObject:XML)
		{
			this._assetType = AssetType.ITEM;
			super(xmlObject);
		}
		
	}

}