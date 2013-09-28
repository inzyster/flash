package  
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import punk.fx.effects.FX;
	
	/**
	 * ...
	 * @author aaa
	 */
	public class MosaicFX extends FX 
	{
		
		private var _step:int = 4;
		
		public function MosaicFX(step:int = 4) 
		{
			super(); 
			
			_step = step;
		}
		
		override public function applyTo(bitmapData:BitmapData, clipRect:Rectangle = null):void
		{
			if (clipRect == null)
			{
				clipRect = bitmapData.rect;
			}
			
			
		}
		
	}

}