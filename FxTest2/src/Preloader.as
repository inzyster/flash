package 
{
	import com.greensock.events.TweenEvent;
	import com.greensock.TweenMax;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Shader;
	import flash.display.Shape;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.filters.ShaderFilter;
	import flash.utils.getDefinitionByName;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Preloader extends MovieClip 
	{
		
		[Embed(source = "../pbj/warp.pbj", mimeType = "application/octet-stream")]
		private var _shaderData:Class;
		
		private var _progressRect:Shape;
		private var _progressContainer:Shape;		
		
		private var _timer:Timer = new Timer(500);
		
		private var _tm:TweenMax;
		
		public function Preloader() 
		{
			if (stage) {
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			this.opaqueBackground = 0x000000;
			var bg:Shape = new Shape();
			bg.graphics.lineStyle(0);
			bg.graphics.beginFill(0xcc);
			bg.graphics.drawRect(0, 0, 640, 480);
			bg.graphics.endFill();
			this.addChild(bg);
			
			var shader:Shader = new Shader(new _shaderData());
			shader.data["amount"].value[0] = 0.2;
			shader.data["inputSize"].value[0] = 640;
			shader.data["inputSize"].value[1] = 480;
			
			var filter:ShaderFilter = new ShaderFilter(shader);
			
			this.filters = [filter];
			
			addEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);						
			
			_progressContainer = new Shape();
			_progressContainer.graphics.lineStyle(1, 0x000000);
			_progressContainer.graphics.drawRect(19, 99, 252, 22);
			
			this.addChild(_progressContainer);
			
			_timer.addEventListener(TimerEvent.TIMER, startup);
		}
		
		private function ioError(e:IOErrorEvent):void 
		{
			trace(e.text);
		}
		
		private function progress(e:ProgressEvent):void 
		{
			var w:Number = e.bytesLoaded / e.bytesTotal;
			var createProgress:Boolean = !_progressRect;
			if (createProgress)
			{
				_progressRect = new Shape();
				_progressRect.graphics.lineStyle(0);
				_progressRect.graphics.beginFill(0xff0000);
				_progressRect.graphics.drawRect(20, 100, 250, 20);
				_progressRect.graphics.endFill();
			}
			if (createProgress)
			{
				this.addChild(_progressRect);
			}
			_progressRect.width = (w * 250);
		}
		
		private function checkFrame(e:Event):void 
		{
			if (currentFrame == totalFrames) 
			{
				stop();
				loadingFinished();
			}
		}
		
		private function loadingFinished():void 
		{
			removeEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			_timer.start();
		}
		
		private function startup(e:TimerEvent):void 
		{
			_timer.removeEventListener(TimerEvent.TIMER, startup);
			_timer = null;
			
			this.removeChild(_progressContainer);
			this.removeChild(_progressRect);
			
			var mainClass:Class = getDefinitionByName("Main") as Class;
			var main:DisplayObject = new mainClass() as DisplayObject;
			main.alpha = 0.0;
			addChild(main);
			
			_tm = TweenMax.to(main, 1, { alpha: 1.0 } );
			
			_tm.addEventListener(TweenEvent.COMPLETE, tweenComplete);
		}
		
		private function tweenComplete(e:TweenEvent):void 
		{
			this.filters = null;
			_tm.removeEventListener(TweenEvent.COMPLETE, tweenComplete);
			_tm = null;
		}
		
	}
	
}