package 
{
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.FullScreenEvent;
	import flash.geom.Rectangle;
	import flash.system.System;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author aaa
	 */
	public class Main extends Engine 
	{
		
		private var _currentWidth:Number = 800;
		private var _currentHeight:Number = 600;
		
		private function _toggleFullScreen():void
		{
			this.stage.displayState = (this.stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE ?	StageDisplayState.NORMAL : StageDisplayState.FULL_SCREEN_INTERACTIVE);
		}
		
		public function Main():void 
		{
			this.stage.addEventListener(FullScreenEvent.FULL_SCREEN, fullScreenToggled);
			super(this._currentWidth, this._currentHeight, 60, false);			
		}
		
		private function fullScreenToggled(e:FullScreenEvent):void
		{
			if (e.fullScreen)
			{
				this._currentWidth = this.stage.fullScreenWidth;
				this._currentHeight = this.stage.fullScreenHeight;
			}
			else 
			{
				this._currentWidth = this.stage.width;
				this._currentHeight = this.stage.height;
			}
			FP.width = this._currentWidth;
			FP.height = this._currentHeight;
			FP.halfWidth = this._currentWidth / 2;
			FP.halfHeight = this._currentHeight / 2;
			FP.bounds = new Rectangle(0, 0, this._currentWidth, this._currentHeight);
			FP.console.enable();
		}
		
		override public function init():void
		{
			FP.console.enable();
			this._toggleFullScreen();
		}
		
		override public function update():void
		{
			super.update();
			
			if (Input.pressed(Key.ESCAPE))
			{
				NativeApplication.nativeApplication.exit(0);
			}
			else if (Input.pressed(Key.F))
			{
				this._toggleFullScreen();
			}
		}
		
	}
	
}