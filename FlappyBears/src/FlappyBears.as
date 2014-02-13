package
{

	import org.flixel.*
	
	[SWF(width="768", height="768", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	public class FlappyBears extends FlxGame
	{
		
		public function FlappyBears()
		{
			super(384, 384, MenuState, 2, 60, 60, true);
			forceDebugger = true;
		}
		
	}

}

