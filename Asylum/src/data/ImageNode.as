package data 
{
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class ImageNode extends DataNode 
	{
		
		public var imageName:String;
		
		protected var _assetType:String = AssetType.UNDEFINED;
		
		private var _bitmap:BitmapData;
		
		public function ImageNode(xmlObject:XML)
		{			
			super(xmlObject);			
			this.imageName = xmlObject["@image"];
			if (this._assetType != AssetType.UNDEFINED)
			{
				this._setBitmap();
			}
		}
		
		public function get bitmap():BitmapData
		{
			return this._bitmap;
		}
		
		private function _setBitmap():void
		{
			var sourceObjClass:Class = Assets.GetAsset(this.id, this._assetType);
			this._bitmap = FP.getBitmap(sourceObjClass);
		}
		
	}

}