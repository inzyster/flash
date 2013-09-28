package stages 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class MainWorld extends World
	{
	
		private const TEXTURE_SIZE:int = 64;
		
		private const ROOM_SIZE:int = 64;
		
		private const FOV:Number = Math.PI / 2.0;
		
		[Embed(source = "../../res/textures.png")]
		private var TEXTURES:Class;
		
		[Embed(source = "../../res/background.png")]
		private var BACKGROUND:Class;
		
		private var _turningSpeed:Number;
		
		private var _textures:Vector.<BitmapData>;
		
		private var _x:Number;
		private var _y:Number;
		private var _direction:Number;
		
		private var _wallData:BitmapData;
		private var _wallImage:Image;
		
		private var _level:Level;
		
		private var _needsUpdate:Boolean;
		
		public function MainWorld() 
		{
			
		}
		
		override public function begin():void
		{
			super.begin();	
			
			_turningSpeed = (Math.PI / 180.0) * 2.0;
			
			_textures = new Vector.<BitmapData>();
			
			var img:Image = new Image(BACKGROUND);
			
			var allTextures:Image = new Image(TEXTURES);
			var numTextures:int = allTextures.width / TEXTURE_SIZE;
			
			var texBitmap:BitmapData = new BitmapData(allTextures.width, allTextures.height, false, 0xff000000);
			allTextures.render(texBitmap, FP.zero, FP.zero);
			
			for (var i:int = 0; i < numTextures; i++)
			{
				var tmp:BitmapData = new BitmapData(TEXTURE_SIZE, TEXTURE_SIZE, false, 0xff000000);
				var rect:Rectangle = new Rectangle(0, 0, TEXTURE_SIZE, TEXTURE_SIZE);
				var tmpM:Matrix = new Matrix();
				tmpM.translate( -i * TEXTURE_SIZE, 0);
				tmp.draw(texBitmap, tmpM, null, null, rect, false);
				_textures.push(tmp);
			}
			
			var idata:BitmapData = new BitmapData(img.width, img.height);
			img.render(idata, FP.zero, FP.zero);
			
			var m:Matrix = new Matrix();
			m.scale(Number(Config.WIDTH) / img.width, Number(Config.HEIGHT) / img.height);
			var bmp:BitmapData = new BitmapData(Config.WIDTH, Config.HEIGHT);
			bmp.draw(idata, m, null, null, null, false);
			
			var bg:Backdrop = new Backdrop(bmp, false, false);
			this.addGraphic(bg);			
			
			var levelStringBuilder:StringBuffer = new StringBuffer();
			levelStringBuilder.add("2222222222\n");
			levelStringBuilder.add("20201000S2\n");
			levelStringBuilder.add("2010000002\n");
			levelStringBuilder.add("2000000002\n");
			levelStringBuilder.add("2222233322");
			
			_level = Level.FromString(levelStringBuilder.toString());
						
			var startRoom:LevelBlock = _level.startBlock();

			_x = (startRoom.x * ROOM_SIZE) + (ROOM_SIZE / 2);
			_y = (startRoom.y * ROOM_SIZE) + (ROOM_SIZE / 2);
			
			_direction = 0.0;
			
			_wallData = new BitmapData(Config.WIDTH, Config.HEIGHT, true, 0x0);
			
			_wallImage = new Image(_wallData);
			this.addGraphic(_wallImage);
			
			_needsUpdate = true;
		}
		
		override public function update():void
		{
			super.update();			
			
			if (Input.check(Key.LEFT))
			{
				_direction -= _turningSpeed;
				_needsUpdate = true;
			}
			else if (Input.check(Key.RIGHT))
			{
				_direction += _turningSpeed;
				_needsUpdate = true;
			}			
			
			if (_direction < 0.0)
			{
				_direction += 2.0 * Math.PI;
			}
			else if (_direction > 2.0 * Math.PI)
			{
				_direction -= 2.0 * Math.PI;
			}
			
			var rayStep:Number = FOV / Config.WIDTH;
			
			var distStep:Number = 1.0;
			
			if (_needsUpdate)
			{
				_wallData.fillRect(_wallData.rect, 0x0);
				
				for (var x:int = 0; x < Config.WIDTH; x++)
				{
					var wall:int = 0;
					var rayAngle:Number = ( -FOV / 2.0) + (rayStep * Number(x)) + _direction;
					var wallHit:Boolean = false;
					var distance:Number = 0.0;
					var currentX:Number = _x + distance * Math.cos(rayAngle);
					var currentY:Number = _y + distance * Math.sin(rayAngle);
					var side:Boolean = false;
					var dist:Number = 128.0;
					var tileX:int = -1;
					var tileY:int = -1;
					distStep = Math.sqrt((ROOM_SIZE * Math.cos(rayAngle) * ROOM_SIZE * Math.cos(rayAngle)) + (ROOM_SIZE * Math.sin(rayAngle) * ROOM_SIZE * Math.sin(rayAngle)));
					while (!wallHit)
					{
						currentX = _x + distance * Math.sin(rayAngle);
						currentY = _y - distance * Math.cos(rayAngle);
						
						tileX = Math.floor(currentX / ROOM_SIZE);
						tileY = Math.floor(currentY / ROOM_SIZE);
						
						var checkedRoom:LevelBlock = _level.getBlockAt(tileX, tileY);
						if (checkedRoom.wall > 0)
						{
							wallHit = true;		
							wall = checkedRoom.wall;
							var traceP:Point = new Point(currentX, currentY);
							var currentP:Point = new Point(_x, _y);
							var p:Point = traceP.subtract(currentP);
							p.y = -p.y;
							var tg:Number = p.y / p.x;
							var alpha:Number = Math.atan(tg);
							side = ((Math.abs(alpha) <= Math.PI / 4.0) || (Math.abs(alpha) >= 3.0 * Math.PI / 4.0));
							break;
						}
						
						distance += distStep;
					}
					var texture:BitmapData = _textures[wall];
					var currentPos:Point = new Point(_x, _y);
					var tracedPos:Point = new Point(currentX, currentY);
					var edgePos:Point = null;
					if (!side)
					{
						edgePos = new Point((tileX * ROOM_SIZE) + (ROOM_SIZE / 2), (tileY * ROOM_SIZE) + ROOM_SIZE);
					}
					else 
					{
						edgePos = new Point(tileX * ROOM_SIZE, (tileY * ROOM_SIZE) + (ROOM_SIZE / 2));						
					}
					dist = Point.distance(currentPos, edgePos);
					var height:Number = Math.floor(Config.HEIGHT / Math.abs(dist / 16.0));
					var matrix:Matrix = new Matrix();
					matrix.scale(1.0, height / TEXTURE_SIZE);
					var bd:BitmapData = new BitmapData(TEXTURE_SIZE, height, false);
					bd.draw(texture, matrix, null, BlendMode.NORMAL, new Rectangle(0, 0, 1, height), false);
					_wallData.copyPixels(bd, new Rectangle(0, 0, 1, height), new Point(x, (Config.HEIGHT - height) / 2), null, null, false);
				}
				
				_wallImage.updateBuffer();
				
			}
			_needsUpdate = false;
		}
		
	}

}