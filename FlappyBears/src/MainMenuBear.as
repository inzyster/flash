package  
{
	import org.flixel.*
	import data.Assets;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class MainMenuBear extends FlxSprite
	{
		
		private var _phase:Number;
		private var _originY:Number;
		
		public function MainMenuBear(x:Number, y:Number) 
		{
			super(x, y);
			this.loadGraphic(Assets.Bear1, true, false, 42, 28);
			this.addAnimation("flap", [0, 1, 2, 1], 6, true);
			_phase = 0.0;
			_originY = y;
		}
		
		override public function update():void
		{
			if (this.alive)
			{
				this.play("flap");
				_phase += FlxG.elapsed;
				this.y = _originY + 4.0 * Math.sin(2 * Math.PI * _phase);
			}
		}
		
	}

}