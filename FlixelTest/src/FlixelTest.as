package

{

	import org.flixel.*;

	[SWF(width="640", height="480", backgroundColor="#000000")]

	[Frame(factoryClass="Preloader")]



	public class FlixelTest extends FlxGame

	{

		public function FlixelTest()

		{

			super(320,240,MenuState,2, 60, 60);
			forceDebugger = true;
		}

	}

}

