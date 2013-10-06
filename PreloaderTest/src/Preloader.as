package 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Shader;
	import flash.display.Shape;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Preloader extends MovieClip 
	{
		
		private var _progressRect:Shape;
		private var _progressContainer:Shape;
		
		public function Preloader() 
		{
			if (stage) {
				stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
				stage.scaleMode = StageScaleMode.SHOW_ALL;
				stage.align = StageAlign.TOP_LEFT;
			}
			addEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			_progressContainer = new Shape();
			_progressContainer.graphics.lineStyle(1, 0x000000);
			_progressContainer.graphics.drawRect(19, 99, 252, 22);
			
			this.addChild(_progressContainer);
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
			
			this.removeChild(_progressContainer);
			this.removeChild(_progressRect);
			
			startup();
		}
		
		private function startup():void 
		{
			var mainClass:Class = getDefinitionByName("Main") as Class;
			addChild(new mainClass() as DisplayObject);
		}
		
	}
	
}