package 
{
	
	import flash.events.TimerEvent;
	import flash.system.System;
	import flash.utils.getDefinitionByName;
	import flash.utils.Timer;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Data;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import stages.TitleScreen;
	
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	[Frame(factoryClass = "Preloader")]
	public class Main extends Engine 
	{
		
		private var _initialTimer:Timer;
		
		public function Main():void 
		{
			super(Config.Width, Config.Height, Config.RefreshRate, false);
		}
		
		override public function init():void
		{
			FP.screen.color = Config.DefaultBackground;
			FP.screen.scale = 1;

			if (CONFIG::debug == true)
			{
				FP.console.enable();
			}		
			_initialTimer = new Timer(500);
			_initialTimer.addEventListener(TimerEvent.TIMER, this._onTimerEvent);
			_initialTimer.start();
		}	
		
		override public function update():void 
		{
			super.update();
			
			if (Input.check(Key.ESCAPE))
			{
				if (CONFIG::desktop == true)
				{
					var na:Class = getDefinitionByName("flash.desktop.NativeApplication") as Class;
					var a:* = na["nativeApplication"];
					a.exit(1);
				}
				else 
				{
					System.exit(1);
				}
			}
		}
		
		private function _onTimerEvent(e:TimerEvent):void 
		{
			_initialTimer.removeEventListener(TimerEvent.TIMER, this._onTimerEvent);
			_initialTimer.stop();
			_initialTimer = null;
			FP.world = new TitleScreen();			
		}
	}
	
}