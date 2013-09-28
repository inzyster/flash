package 
{
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Main extends Engine
	{
		
		public function Main():void 
		{
			super(800, 600, 30);
		}
	
		override public function init():void
		{
			super.init();
			
			FP.world = new MainThings();
		}
		
		override public function update():void
		{
			super.update();
			
			if (Input.pressed(Key.ESCAPE))
			{
				NativeApplication.nativeApplication.exit(1);
			}
		}
		
	}
	
}