package  
{
	import flash.geom.Point;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import punk.fx.effects.ScanLinesFX;
	import punk.fx.FXMan;
	import punk.fx.graphics.FXImage;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class MainWorld extends World
	{
				
		public static const COLUMNS:int = 40;
		public static const ROWS:int = 30;
		
		private static var _columnWidth:int = 0;
		private static var _columnHeight:int = 0;
		
		{
			_columnWidth = Config.Width / COLUMNS;
			_columnHeight = Config.Height / ROWS;
		}
		
		private static var _fxImage:FXImage;
		
		public function getWorldPoint(point:Point, trackCamera:Boolean = false):Point
		{
			var column:Number = Math.floor(point.x / _columnWidth);
			var row:Number = Math.floor(point.y / _columnHeight);
			
			return new Point((column * _columnWidth) + (trackCamera ? this.camera.x : 0), (row * _columnHeight) + (trackCamera ? this.camera.y : 0));
		}
		
		public function MainWorld() 
		{
			
		}
		
		override public function begin():void
		{
			super.begin();
			_fxImage = new FXImage();
			_fxImage.name = "FXScreen";
			
			var scanlines:ScanLinesFX = new ScanLinesFX(true);
			scanlines.scanLinesGap = 4.0;
			scanlines.scanLinesThickness = 1.0;
			scanlines.noiseSeed = -1;
			scanlines.scanLinesOffset = 0.0;
			scanlines.noiseAmount = 0.0;
			
			var posterize:PosterizeFX = new PosterizeFX(16, 0xff005900);
			var crt:CRTFX = new CRTFX(0.2);
			
			FXMan.add(_fxImage, [crt, posterize, scanlines]);
			
			this.addGraphic(_fxImage, -3);
		}
		
		
		override public function end():void
		{
			super.end();
			FXMan.removeTargets(_fxImage);
			_fxImage = null;
		}
		
	}

}