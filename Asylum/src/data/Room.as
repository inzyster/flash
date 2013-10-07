package  
{
	import data.ImageNode;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class Room extends ImageNode
	{
		
		public function Room(id:String, imageName:String)
		{
			this._assetType = AssetType.ROOM;
			super(id, imageName);
		}
		
	}

}