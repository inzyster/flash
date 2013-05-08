package 
{
	
	import flash.system.System;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Data;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	[Frame(factoryClass = "Preloader")]
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(Config.Width, Config.Height, Config.RefreshRate, false);
			if (CONFIG::debug == true)
			{
				FP.console.enable();
			}
		}
		
		override public function init():void
		{
			FP.world = new MainWorld();
			FP.screen.color = Config.DefaultBackground;
			FP.screen.scale = 1;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.check(Key.ESCAPE))
			{
				System.exit(1);
			}
		}
	}
	
}