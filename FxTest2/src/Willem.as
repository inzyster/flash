package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import punk.fx.graphics.FXImage;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Willem extends Entity
	{
		
		[Embed(source = "../img/Willem2.jpg")]
		private var WILLEM:Class;
		
		private var _image:FXImage;

		private var _dx:Number = 120;
		
		public function Willem(x:Number, y:Number) 
		{
			super(x, y);
			
			_image = new FXImage(WILLEM);
			this.graphic = _image;
			this.width = _image.width;
			this.height = _image.height;
			_image.scale = 1;
			_image.centerOO();
		}
		
		override public function update():void
		{
			
		}
		
	}

}