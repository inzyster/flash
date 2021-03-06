package 
{
	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import net.flashpunk.World;

		import flash.system.System;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import punk.fx.FXMan;
	
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Engine 
	{

		[Embed(source = "../img/mtn.jpg")]
		private var BG:Class;
		
		public function Main():void 
		{
			super(640, 480, 60, false);
			FP.console.enable();
			FP.screen.scale = 1
			FP.world = new World();
		}

		override public function init():void
		{
			super.init();
			this.stage.scaleMode = StageScaleMode.SHOW_ALL;
			this.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		}
		
	}

}