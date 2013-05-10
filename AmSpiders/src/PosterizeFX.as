package  
{
	import flash.display.BitmapData;
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	import flash.geom.Rectangle;
	import punk.fx.effects.PBBaseFX;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class PosterizeFX extends PBBaseFX
	{
		
		[Embed(source = "../res/posterize.pbj", mimeType = "application/octet-stream")]
		private var SHADER_DATA:Class;
		
		public var levels:int = 4;
		public var color:uint = 0xffffffff;
		
		public function PosterizeFX(levels:int = 4, color:int = 0xffffffff) 
		{
			super();
			
			this.levels = levels;
			this.color = color;
			
			this.shader = new Shader(new SHADER_DATA());
			this.filter = new ShaderFilter(this.shader);
		}
		
		override public function applyTo(bitmapData:BitmapData, clipRect:Rectangle = null):void
		{
			if (!clipRect)
			{
				clipRect = bitmapData.rect;
			}
			
			this.shader.data["limits"].value = [levels];
			this.shader.data["outColor"].value = this._getColorsArray(this.color);
			
			super.applyTo(bitmapData, clipRect);
		}
		
		private function _getColorsArray(color:int = 0xffffffff):Array
		{
			var r:Number = Number((color & 0x00ff0000) >> 16);
			var g:Number = Number((color & 0x0000ff00) >> 8);
			var b:Number = Number((color & 0x000000ff) >> 0);
			var a:Number = Number((color & 0xff000000) >> 24);
			
			return [r, g, b, a];
		}
		
	}

}