package  
{
	import flash.geom.Point;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class MainWorld extends World
	{
				
		private static const COLUMNS:int = 40;
		private static const ROWS:int = 30;
		
		private static var _columnWidth:int = 0;
		private static var _columnHeight:int = 0;
		
		{
			_columnWidth = Config.Width / COLUMNS;
			_columnHeight = Config.Height / ROWS;
		}
		
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

		}
		
		override public function update():void 
		{
			super.update();						
		}
				
	}

}