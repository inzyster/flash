package 
{
	import flash.desktop.NativeApplication;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	
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
						
			FP.world = _gameWorld;
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