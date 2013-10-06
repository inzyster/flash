package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class Preloader extends MovieClip
	{
		
		private var _progressBar:Shape;
		private var _progressBarContainer:Shape;
		
		private var _progressBarRect:Rectangle;
		
		public function Preloader() 
		{
			if (this.stage)
			{
				this.stage.scaleMode = StageScaleMode.SHOW_ALL;
			}
						
			this.addEventListener(Event.ENTER_FRAME, this.checkFrame);
			this.loaderInfo.addEventListener(ProgressEvent.PROGRESS, this.progress);
			this.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.ioError);
			
			var progressBarWidth:Number = 200.0;
			var progressBarHeight:Number = 20.0;
			
			_progressBarRect = new Rectangle((this.stage.stageWidth - progressBarWidth) / 2.0, (this.stage.stageHeight - progressBarHeight) / 2.0, progressBarWidth, progressBarHeight);
			
			_progressBarContainer = new Shape();
			_progressBarContainer.graphics.lineStyle(1.0, 0x000000);
			_progressBarContainer.graphics.drawRect(_progressBarRect.x - 1.0, _progressBarRect.y - 1.0, _progressBarRect.width + 2.0, _progressBarRect.height + 2.0);
			
			this.addChild(_progressBarContainer);
		}
		
		private function ioError(e:IOErrorEvent):void
		{
			trace(e.text);
		}
		
		private function progress(e:ProgressEvent):void
		{
			var loaded:Number = e.bytesLoaded;
			var total:Number = e.bytesTotal;
			
			var createProgress:Boolean = !_progressBar;
			if (createProgress)
			{
				_progressBar = new Shape();
				_progressBar.graphics.beginFill(0xff0000);
				_progressBar.graphics.drawRect(_progressBarRect.x, _progressBarRect.y, _progressBarRect.width, _progressBarRect.height);
				_progressBar.graphics.endFill();
				this.addChild(_progressBar);
			}
			_progressBar.width = (loaded / total) * _progressBarRect.width;
		}
		
		private function checkFrame(e:Event):void
		{
			if (this.currentFrame == this.totalFrames)
			{
				this.stop();
				this._loadingFinished();
			}
		}
		
		private function _loadingFinished():void
		{
			this.removeEventListener(Event.ENTER_FRAME, this.checkFrame);
			this.loaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.progress);
			this.loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.ioError);
			
			var mainClass:Class = getDefinitionByName("Main") as Class;
			this.addChild(new mainClass() as DisplayObject);
		}
		
	}

}