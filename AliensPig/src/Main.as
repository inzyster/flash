package 
{
	import org.flixel.FlxGame;

	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	
	[SWF( width = "640", height = "360", backgroundColor = "#ffffff" )]
	[Frame( factoryClass = "Preloader" )]
	 
	public class Main extends FlxGame
	{
		
		public function Main():void 
		{
			super(640, 360, MenuState, 1, 60, 60);
			this.forceDebugger = true;
		}
		
	}
	
}