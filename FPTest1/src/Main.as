package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	[Frame(factoryClass="Preloader")]
	public class Main extends Engine
	{
		private var _gameWorld:GameWorld;
		
		public function Main():void 
		{			
			super(Config.ScreenWidth, Config.ScreenHeight, Config.RefreshRate, Config.FixedRefreshRate);
			
			_gameWorld = new GameWorld();
		}
		
		override public function init():void
		{
			FP.console.enable();
			
			FP.log("The game has started!");
			
			FP.world = _gameWorld;
		}
		
	}

}