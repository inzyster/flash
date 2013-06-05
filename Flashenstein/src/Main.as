package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.System;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import stages.MainWorld;
	
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(Config.WIDTH, Config.HEIGHT, Config.FRAMERATE, false);			
		}
		
		override public function init():void 
		{
			FP.screen.scale = 2.0;
			FP.screen.smoothing = false;
			if (CONFIG::debug == true)
			{
				FP.console.enable();
			}
			FP.world = new MainWorld();
		}
		
		override public function update():void
		{
			super.update();
			
			if (Input.pressed(Key.ESCAPE))
			{
				System.exit(1);
			}
		}
		
	}
	
}