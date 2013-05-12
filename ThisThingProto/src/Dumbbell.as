package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import punk.fx.FXMan;
	import punk.fx.graphics.FXSpritemap;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Dumbbell extends Entity
	{
		
		[Embed(source = "../img/dumbbell.png")]
		private var DUMBBELL_DATA:Class;
		
		private var _phase:Number;
		
		private var _animated:Boolean;
		
		private var _startingY:Number;
		
		public function Dumbbell(startingPhase:Number = 0.0) 
		{
			this.graphic = new FXSpritemap(DUMBBELL_DATA, 32, 32);
			FXSpritemap(this.graphic).add("Idle", [0]);
			FXSpritemap(this.graphic).play("Idle");
			
			this.type = "Dumbbell";
			
			_phase = startingPhase;
			_animated = false;
			
			this.setHitbox(32, 32);
		}
		
		override public function added():void
		{
			_startingY = this.y;
			_animated = true;
		}
		
		override public function removed():void
		{
			
		}
		
		override public function update():void
		{
			super.update();
			
			if (_animated)
			{
				this.y = _startingY + (Math.sin(_phase * Math.PI * 2 * 0.5) * this.halfHeight);			
				_phase += FP.elapsed;
			}
			
			if (this.collidePoint(this.x, this.y, this.world.camera.x - this.width, this.y))
			{
				this.world.remove(this);
			}
		}
		
	}

}