package  
{
	import flash.display.BitmapData;
	import flash.display.InteractiveObject;
	import flash.display.ShaderParameter;
	import flash.filters.BlurFilter;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import net.flashpunk.graphics.Image;
	import punk.fx.effects.FX;
	import punk.fx.effects.PBBaseFX;
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class CRTFX extends PBBaseFX
	{
		
		[Embed(source = "../pbj/warp.pbj", mimeType = "application/octet-stream")]
		private var SHADER_DATA:Class;
				
		public var amount:Number;		
		
		public function CRTFX(amount:Number) 
		{
			super();
			
			this.amount = amount;
						
			this.shader = new Shader(new SHADER_DATA());
			this.filter = new ShaderFilter(this.shader);			
			
		}
		
		override public function applyTo(bitmapData:BitmapData, clipRect:Rectangle = null):void
		{
			if (!clipRect)
			{
				clipRect = bitmapData.rect;
			}
			
			this.shader.data["amount"].value = [this.amount];
			this.shader.data["inputSize"].value = [clipRect.width, clipRect.height];
			
			super.applyTo(bitmapData, clipRect);
		}
		
	}

}