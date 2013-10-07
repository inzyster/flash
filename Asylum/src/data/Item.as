package  
{
	import data.ImageNode;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class Item extends ImageNode
	{		
		
		public function Item(id:String, imageName:String)
		{
			this._assetType = AssetType.ITEM;
			super(id, imageName);
		}
		
	}

}