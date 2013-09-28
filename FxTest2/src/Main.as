package 
{
	
	import flash.geom.Matrix;
	import flash.system.System;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Data;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import punk.fx.FXMan;
	
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	[Frame(factoryClass = "Preloader")]
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(640, 480, 60, false);
			FP.console.enable();
			FP.screen.scale = 1;
			FP.world = new TestWorld();
			FP.log("Press 1 - 5 to toggle things; move with arrow keys");
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