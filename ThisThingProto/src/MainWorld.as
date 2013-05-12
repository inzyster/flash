package  
{
	import flash.display.BitmapData;
	import flash.display.GradientType;
	import flash.display.Shader;
	import flash.display.Shape;
	import flash.events.TimerEvent;
	import flash.filters.ShaderFilter;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.Timer;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import punk.fx.effects.ColorTransformFX;
	import punk.fx.FXMan;
	import punk.fx.graphics.FXImage;

	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class MainWorld extends World
	{

		[Embed(source = "../img/fg-buildings.png")]
		private var FG_BUILDINGS:Class;
		
		[Embed(source = "../pbj/posterize.pbj", mimeType="application/octet-stream")]
		private var POSTERIZE_DATA:Class;
		
		private var _followOffset:Number = 10.0;
		
		public var paused:Boolean = true;
		
		private var _pauseTimer:Timer = new Timer(700);
		
		public var groundLevel:Number;
		
		private var _vin:Vin;
		
		private var _distance:Number;
		private var _distanceLabel:Text;
		
		private var _accelerationCounter:int = 200;
		
		public function MainWorld() 
		{
			
		}
		
		override public function begin():void
		{
			super.begin();
			
			var s:Shape = new Shape();
			var m:Matrix = new Matrix();
			m.createGradientBox(1, Config.Height, Math.PI / 2, 0, 0);
			
			s.graphics.beginGradientFill(GradientType.LINEAR, [0xff00002f, 0xff2f002f], [1, 1], [0, 255], m);
			s.graphics.drawRect(0, 0, 1, Config.Height);
			s.graphics.endFill();
			
			var backData:BitmapData = new BitmapData(s.width, s.height, true, 0x0);
			backData.draw(s);
			
			s = null;
			m = null;
			
			var sky:Backdrop = new Backdrop(backData, true, false);
			sky.x = 0;
			sky.y = 0;
			
			this.addGraphic(sky, 17);
			
			backData = null;
			
			var fg:Backdrop = new Backdrop(FG_BUILDINGS, true, false);
			fg.x = 0;
			fg.y = 0;
			
			this.addGraphic(fg, 13);
			
			var bgImage:FXImage = new FXImage(FG_BUILDINGS);
			var bgFX:PosterizeFX = new PosterizeFX(1, 0xffffffff);
			
			FXMan.add(bgImage, bgFX);
			bgFX.active = true;
			
			var bd:BitmapData = new BitmapData(bgImage.width, bgImage.height, true, 0x0);
			bgImage.render(bd, FP.zero, FP.zero);
			
			var bg:Backdrop = new Backdrop(bd, true, false);
			bg.x = 20;
			bg.y = 0;
			bg.scrollX = 0.5;
			
			this.groundLevel = bgImage.height;				
			
			this.addGraphic(bg, 15);
			
			FXMan.removeEffects(bgFX);
			FXMan.removeTargets();
			
			bgFX = null;
			bgImage = null;			
			
			_vin = new Vin();
			_vin.x = _followOffset;
			_vin.y = this.groundLevel - _vin.height;
			this.add(_vin);
			
			_distance = 0.0;			

			_distanceLabel = new Text("Distance: 0px", 0.0, 0.0, { 
				font: "default",
				size: 20,
				align: "right",
				resizable: false,
				width: Config.Width
				} );
				
			_distanceLabel.scrollX = 0.0;
				
			this.addGraphic(_distanceLabel);
			
			_pauseTimer.addEventListener(TimerEvent.TIMER, _onPauseTimerComplete);
			_pauseTimer.start();
			
			
		}
		
		override public function update():void
		{
			super.update();
			
			if (this.paused)
			{
				return;
			}

			if (_accelerationCounter > 0)
			{
				_vin.acceleration.x = Number(_accelerationCounter);
				_accelerationCounter--;
			}
			
			_distance = _vin.x - _followOffset;
			_distanceLabel.text = "Distance: " + Math.round(_distance) + "px";
			
			this.camera.x = _vin.x - _followOffset;
			
		}
		
		private function _onPauseTimerComplete(e:TimerEvent):void 
		{
			_pauseTimer.removeEventListener(TimerEvent.TIMER, _onPauseTimerComplete);
			_pauseTimer.stop();
			_pauseTimer = null;
			this.paused = false;
		}
		
	}

}