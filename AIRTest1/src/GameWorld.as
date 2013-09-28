package  
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.ShaderPrecision;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.World;
	import extension.JoyQuery.Joystick;
	
	public class GameWorld extends World 
	{
	
		private var joy:Joystick;
		
		private var ls:Stamp;
		private var rs:Stamp;
		
		private var stickData:BitmapData;
		
		private var lp:Point;
		private var rp:Point;
		
		public function GameWorld() 
		{
			joy = new Joystick();
		}
		
		override public function begin():void 
		{
			super.begin();

			var s:Shape = new Shape();
			s.graphics.lineStyle(2.0, 0x0, 1, true);
			s.graphics.drawCircle(200.0, 200.0, 200.0);
			s.graphics.moveTo(0.0, 200.0);
			s.graphics.lineTo(400.0, 200.0);
			s.graphics.moveTo(200.0, 0.0);
			s.graphics.lineTo(200.0, 400.0);
			s.graphics.lineStyle(1.0);
			s.graphics.drawCircle(200.0, 200.0, 100.0);
			
			var circleData:BitmapData = new BitmapData(400, 400, true, 0x0);
			circleData.draw(s);
			
			var bgData:BitmapData = new BitmapData(1, 1, false, 0xff7f7f7f);			
			
			var bg:Backdrop = new Backdrop(bgData);
			this.addGraphic(bg);
						
			var leftStick:Stamp = new Stamp(circleData);
			leftStick.x = 40.0;
			leftStick.y = 80.0;
			
			this.addGraphic(leftStick);
			
			var rightStick:Stamp = new Stamp(circleData);
			rightStick.x = 520.0;
			rightStick.y = 80.0;
			
			this.addGraphic(rightStick);
			
			circleData = null;
			s = null;
			
			bgData = null;
			
			var stick:Shape = new Shape();
			stick.graphics.lineStyle(1.0, 0xff0000);
			stick.graphics.drawCircle(4.0, 4.0, 4.0);
			
			stickData = new BitmapData(8, 8, true, 0x0);
			stickData.draw(stick);
			
			ls = new Stamp(stickData);			
			ls.x = 40.0 + 200.0 - 4.0;
			ls.y = 80.0 + 200.0 - 4.0;
			
			rs = new Stamp(stickData);
			rs.x = 520.0 + 200.0 - 4.0;
			rs.y = 80.0 + 200.0 - 4.0;
			
			this.addGraphic(ls);
			this.addGraphic(rs);
			
			lp = new Point(0.0, 0.0);
			rp = new Point(0.0, 0.0);
			
			stick = null;
			//stickData = null;
		}
		
		private function getStickPoint(stick:int, valueX:Number, valueY:Number):Point
		{
			var result:Point = new Point(0.0, 80.0 + 200.0 - 4.0);
			if (stick == 0)
			{
				result.x = 40.0 + 200.0 - 4.0;
			}
			else if (stick == 1)
			{
				result.x = 520.0 + 200.0 - 4.0;
			}
			
			result.x += (valueX * 200.0);
			result.y -= (valueY * 200.0);
			
			return result;
		}
		
		override public function update():void
		{
			super.update();
			
			joy.JoyQuery();
			
			if (joy.getTotal() > 0)
			{
				var lx:Number = joy.getAxis(0, 0);
				var ly:Number = joy.getAxis(0, 1);
				
				if (lp.x != lx || lp.y != ly)
				{
					var pl:Point = getStickPoint(0, lx, ly);					
					var lss:Stamp = new Stamp(stickData, pl.x, pl.y);
					this.addGraphic(lss);
				}
				
				lp.x = lx;
				lp.y = ly;
				
				var rx:Number = joy.getAxis(0, 4);
				var ry:Number = -joy.getAxis(0, 3);
				
				if (rp.x != rx || rp.y != ry)
				{
					var pr:Point = getStickPoint(1, rx, ry);
					var rss:Stamp = new Stamp(stickData, pr.x, pr.y);
					this.addGraphic(rss);
				}
				
				rp.x = rx;
				rp.y = ry;
				
			}
		}
		
	}

}