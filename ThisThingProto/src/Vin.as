package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Vin extends Entity
	{
		
		[Embed(source = "../img/vin_map.png")]
		private var SPRITE_MAP:Class;
		
		private var _velocity:Point;
		
		public var acceleration:Point;
		
		private var _jumping:Boolean;
		
		public function Vin() 
		{
			_velocity = new Point(0.0, 0.0);
			
			acceleration = new Point(0.0, 0.0);
			
			this.graphic = new Spritemap(SPRITE_MAP, 95, 88);
			Spritemap(this.graphic).add("Idle", [0]);
			Spritemap(this.graphic).add("Moving", [0, 1], 25);
			
			this.type = "Vin";
			
			this.setHitbox(95, 88);
			
			Spritemap(this.graphic).play("Idle");
		}
		
		public function isOnGround():Boolean
		{
			this.clampToGround();
			var currentWorld:MainWorld = this.world as MainWorld;
			var groundLevel:Number = currentWorld.groundLevel;
			return (this.y == (groundLevel - this.height));
		}
				
		public function clampToGround():void
		{
			var currentWorld:MainWorld = this.world as MainWorld;
			var groundLevel:Number = currentWorld.groundLevel;
			if (this.y > (groundLevel - this.height))
			{
				this.y = (groundLevel - this.height);
			}
		}
		
		override public function update():void
		{
			super.update();
			
			_velocity.x += this.acceleration.x * FP.elapsed;
			_velocity.y += this.acceleration.y * FP.elapsed;
			
			if (this.acceleration.y > 0.0 && !this.isOnGround())
			{
				this.acceleration.y = -500.0;
			}
			
			if (Point.distance(new Point(0.0, 0.0), _velocity) > 0.0)
			{
				if (Spritemap(this.graphic).currentAnim != "Moving")
				{
					Spritemap(this.graphic).play("Moving");
				}
				this.x += _velocity.x * FP.elapsed;
				this.y -= _velocity.y * FP.elapsed;
				if (this.isOnGround())
				{
					_velocity.y = 0.0;
					this.acceleration.y = 0.0;
					_jumping = false;
				}
			}
			else 
			{
				if (Spritemap(this.graphic).currentAnim != "Idle")
				{
					Spritemap(this.graphic).play("Idle");
				}
			}
			
			if (Input.pressed(Key.SPACE))
			{
				if (this.isOnGround() && !_jumping)
				{
					_jumping = true;
					this.acceleration.y = 10000.0;
				}
			}
		}
		
	}

}