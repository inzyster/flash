package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class Preloader extends MovieClip
	{
		
		public function Preloader() 
		{
			if (this.stage)
			{
				this.stage.scaleMode = StageScaleMode.SHOW_ALL;
			}
			
			this.addEventListener(Event.ENTER_FRAME, this.checkFrame);
			this.loaderInfo.addEventListener(ProgressEvent.PROGRESS, this.progress);
			this.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.ioError);
		}
		
		private function ioError(e:IOErrorEvent):void
		{
			trace(e.text);
		}
		
		private function progress(e:ProgressEvent):void
		{
			var loaded:Number = e.bytesLoaded;
			var total:Number = e.bytesTotal;
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