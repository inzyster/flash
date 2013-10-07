package 
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	[SWF(width="640", height="360", backgroundColor="#FFFFFF")]
	[Frame(factoryClass="Preloader")]
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(640, 360, 60, false);
			FP.console.enable();
			FP.world = new GameWorld();
		}
		
		override public function init():void 
		{
			super.init();
			this.stage.scaleMode = StageScaleMode.SHOW_ALL;
		}
		
	}
	
}