package  
{
	import com.greensock.events.TweenEvent;
	import com.greensock.loading.core.DisplayObjectLoader;
	import com.greensock.TweenMax;
	import flash.accessibility.Accessibility;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;	
	import flash.utils.getDefinitionByName;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Preloader extends MovieClip
	{
		
		[Embed(source = "../img/flashpunk-badge-320x80.png")]
		private var LOGO:Class;
		
		private var _logo:Bitmap;
		
		private var _timer:Timer = new Timer(500);
		private var _fade:TweenMax;
		
		public function Preloader():void
		{
			if (this.stage) 
			{
				this.stage.scaleMode = StageScaleMode.NO_SCALE;
				this.stage.align = StageAlign.TOP_LEFT;
			}	
			
			this.opaqueBackground = Config.DefaultBackground;
			
			var background:Shape = new Shape();

			background.graphics.lineStyle(0);			
			background.graphics.beginFill(Config.DefaultBackground);
			background.graphics.drawRect(0, 0, Config.Width, Config.Height);
			background.graphics.endFill();
			
			this.addChild(background);
			
			_logo = new LOGO() as Bitmap;
			
			_logo.x = (Config.Width - _logo.width) / 2.0;
			_logo.y = (Config.Height - _logo.height) / 2.0;			
			
			this.addChild(_logo);
			_logo.alpha = 0.0;
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.loaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			this.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			
			_timer.repeatCount = 1;
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerFinished);
		}
		
		private function onIOError(e:IOErrorEvent):void
		{
			trace(e.text);
		}
		
		private function onProgress(e:ProgressEvent):void 
		{
			_logo.alpha = ((this.loaderInfo.bytesLoaded as Number) / (this.loaderInfo.bytesTotal as Number));
		}
		
		private function onEnterFrame(e:Event):void 
		{
			if (this.currentFrame == this.totalFrames)
			{
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				loaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
				loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);				
				
				this.stop();
				_timer.start();
			}
		}
		
		private function onTimerFinished(e:TimerEvent):void
		{
			_timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerFinished);
			this.loadingFinished();
		}
		
		private function loadingFinished():void 
		{
			var mainClass:Class = getDefinitionByName("Main") as Class;
			var main:DisplayObject = new mainClass() as DisplayObject;			
			
			this.removeChild(_logo);
			_logo = null;
			
			main.alpha = 0.0;
			
			_fade = new TweenMax(main, 1, { alpha: 1.0 } );
			_fade.addEventListener(TweenEvent.COMPLETE, onTweenComplete);
			
			this.addChild(main);
		}
		
		private function onTweenComplete(e:TweenEvent):void 
		{
			_fade.removeEventListener(TweenEvent.COMPLETE, onTweenComplete);
			_fade = null;
		}
		
	}

}