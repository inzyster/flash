package  
{
	import com.greensock.events.TweenEvent;
	import com.greensock.loading.core.DisplayObjectLoader;
	import com.greensock.TweenMax;
	import flash.accessibility.Accessibility;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.display.MovieClip;
	import flash.display.Shader;
	import flash.display.Shape;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;	
	import flash.external.ExternalInterface;
	import flash.filters.ShaderFilter;
	import flash.utils.ByteArray;
	import flash.utils.getDefinitionByName;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Preloader extends MovieClip
	{
		
		[Embed(source = "../res/flashpunk-badge-320x80.png")]
		private var LOGO:Class;
		
		private var _logo:Bitmap;
		
		private var _maxLogoWidth:Number;
		
		private var _timer:Timer = new Timer(500);
		private var _fade:TweenMax;
				
		private var _xOffset:Number;
		private var _yOffset:Number;
		
		[Embed(source = "../res/posterize.pbj", mimeType = "application/octet-stream")]
		private var POSTERIZE:Class;
		
		[Embed(source = "../res/warp.pbj", mimeType = "application/octet-stream")]
		private var WARP:Class;
		
		public function Preloader():void
		{
			if (ExternalInterface.available)
			{
				ExternalInterface.call("Flash.onFlashLoaded", true);
			}						
			
			var params:Object = this.root.loaderInfo.parameters;
			if (("containerWidth" in params) && ("containerHeight" in params))
			{
				Config.setContainerSize(params["containerWidth"], params["containerHeight"]);
			}

			_xOffset = (Config.ContainerWidth - Config.Width) / 2.0;
			_yOffset = (Config.ContainerHeight - Config.Height) / 2.0;
			
			if (this.stage) 
			{
				this.stage.scaleMode = StageScaleMode.NO_SCALE;
				this.stage.align = StageAlign.TOP_LEFT;
			}	
			
			this.opaqueBackground = Config.DefaultBackground;
			
			var posterizeShader:Shader = new Shader(new POSTERIZE());
			posterizeShader.data["limits"].value = [16];
			var posterizeFilter:ShaderFilter = new ShaderFilter(posterizeShader);
			
			var warpShader:Shader = new Shader(new WARP());
			warpShader.data["amount"].value = [0.2];
			warpShader.data["inputSize"].value = [Config.Width, Config.Height];
			var warpFilter:ShaderFilter = new ShaderFilter(warpShader);
			
			this.filters = [warpFilter, posterizeFilter];
			
			var background:Shape = new Shape();

			background.graphics.lineStyle(0);			
			background.graphics.beginFill(Config.DefaultBackground);
			background.graphics.drawRect(_xOffset, _yOffset, Config.Width, Config.Height);
			background.graphics.endFill();
			
			this.addChild(background);
			
			_logo = new LOGO() as Bitmap;
			
			_logo.x = ((Config.Width - _logo.width) / 2.0) + _xOffset;
			_logo.y = ((Config.Height - _logo.height) / 2.0) + _yOffset;
			_maxLogoWidth = _logo.width;
			
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

/*			this.removeChild(_logo);
							
			main.x = _xOffset;
			main.y = _yOffset;
			
			this.addChild(main);
*/			
			
			main.alpha = 0.0;
						
			main.x = _xOffset;
			main.y = _yOffset;
			
			this.addChild(main);
			
			var self:* = this;
			
			TweenManager.chain( {
					target: _logo,
					duration: 0.5,
					vars: {
						alpha: 0.0
					},
					onFinished: function():void {
						self.removeChild(_logo);
						_logo = null;
					}
				}, {
					target: main,
					duration: 0.5,
					vars: {
						alpha: 1.0
					}
				}
			);			
			
		}		
		
	}

}