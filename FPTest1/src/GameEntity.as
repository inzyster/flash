package  
{
	import flash.display.InteractiveObject;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Anim;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class GameEntity extends Entity 
	{
		[Embed(source = "/../img/EntitySheet.png")]
		private const SHEET:Class;
		
		private var _timeInterval:Number;
		
		private var _animation:Anim;
		
		public function GameEntity() 
		{
			graphic = new Spritemap(SHEET, 40, 20, onAnimationEnd);
			Spritemap(graphic).add("Stopped", [0]);
			_animation = Spritemap(graphic).add("Blinking", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 24);
			
			Input.define("UP", Key.W, Key.UP);
			Input.define("DOWN", Key.S, Key.DOWN);
			Input.define("LEFT", Key.A, Key.LEFT);
			Input.define("RIGHT", Key.D, Key.RIGHT);
			
			type = "GameEntity";
			
			Spritemap(graphic).play("Blinking");
			
			setHitbox(40, 20);
		}
		
		private function onAnimationEnd():void
		{
			Spritemap(graphic).play("Stopped");
			
			_timeInterval = 0;
			var rate:Number = Math.round(Math.random() * 47 + 1);
			_animation.frameRate = rate;
		}
		
		override public function update():void
		{
			_timeInterval += FP.elapsed;
			
			if (_timeInterval >= 3)
			{
				Spritemap(graphic).play("Blinking");
			}
			
			if (Input.check("LEFT"))
			{
				x -= 50 * FP.elapsed;
			}
			else if (Input.check("RIGHT"))
			{
				x += 50 * FP.elapsed;
			}
			
			if (Input.check("UP"))
			{
				y -= 50 * FP.elapsed;
			}
			else if (Input.check("DOWN"))
			{
				y += 50 * FP.elapsed;
			}
		}
		
		override public function added():void
		{
			trace("The entity has been added to the world!");
			
			trace("Entities in the world: " + world.count);
		}
		
		override public function removed():void
		{
			trace("The entity has been removed from the world!");
		}
		
	}

}