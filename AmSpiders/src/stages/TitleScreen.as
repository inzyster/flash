package stages 
{
	import com.greensock.plugins.SoundTransformPlugin;
	import com.greensock.TweenMax;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Stamp;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class TitleScreen extends MainWorld
	{
		
		public function TitleScreen() 
		{
			
		}
		
		override public function begin():void
		{
			super.begin();
			
			var t1:TextMap = new TextMap(1, 0xffffffff, false, "RAINING SPIDERS");
			var t2:TextMap = new TextMap(1, 0xffffffff, false, "avoid them");
			var t3:TextMap = new TextMap(1, 0xffffffff, false, "Press space to start avoiding them");
			
			var label1:Stamp = new Stamp(t1.bitmapData);
			var p1:Point = this.getWorldPoint(new Point(FP.halfWidth - label1.width / 2, FP.halfHeight - 40 - label1.height / 2));
			label1.x = p1.x;
			label1.y = p1.y;
			
			this.addGraphic(label1);
			
			var label2:Stamp = new Stamp(t2.bitmapData);
			var p2:Point = this.getWorldPoint(new Point(FP.halfWidth - label2.width / 2, FP.halfHeight - 20 - label2.height / 2));
			label2.x = p2.x;
			label2.y = p2.y;
			
			this.addGraphic(label2);
			
			var label3:Image = new Image(t3.bitmapData);
			var p3:Point = this.getWorldPoint(new Point(FP.halfWidth - label3.width / 2, 400));
			label3.x = p3.x;
			label3.y = p3.y;
			
			this.addGraphic(label3);
			label3.alpha = 1.0;
			TweenMax.to(label3, 1.0, { alpha: 0.0, yoyo: true, repeat: -1 } );
			
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}