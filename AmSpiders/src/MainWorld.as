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
		
		public static function GetWorldPoint(point:Point):Point
		{
			var column:Number = Math.floor(point.x / _columnWidth);
			var row:Number = Math.floor(point.y / _columnHeight);
			
			return new Point(column * _columnWidth, row * _columnHeight);
		}
		
		public function MainWorld() 
		{

		}
		
		override public function begin():void 
		{
			super.begin();

/*			var t:TextMap = new TextMap(3, 0xffffffff,
			"  ",	"     B",	" C",
			" A",	"  BBbB",	"   c",
			"  a",	" BBB  ",	" CC");
			
			var s:Spritemap = new Spritemap(t.bitmapData, t.frameWidth, t.frameHeight);
			s.add("stopped", [0]);
			s.add("default", [0, 1, 2], 20, true);
			
			var p:Point = GetWorldPoint(new Point(21, 134));
			s.x = p.x;
			s.y = p.y;
			
			this.addGraphic(s);
			s.play("default");*/
		}
		
		override public function update():void 
		{
			super.update();						
		}
				
	}

}