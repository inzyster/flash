package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Spider extends Entity
	{
		
		public function Spider() 
		{
			var textMap:TextMap = new TextMap(1, 0xffffffff, true, "*");
			var spriteMap:Spritemap = new Spritemap(textMap.bitmapData, textMap.frameWidth, textMap.frameHeight);
			spriteMap.add("Default", [0]);
			spriteMap.add("Blink", [0, 1], 12);
			this.graphic = spriteMap;
			
			this.setHitbox(textMap.frameWidth, textMap.frameHeight);
		}
		
		public function blink(rate:Number = 1.0):void
		{
			Spritemap(this.graphic).play("Blink");
			Spritemap(this.graphic).rate = rate;
		}
		
		public function setDefaultAnimation():void
		{
			Spritemap(this.graphic).play("Default");
		}
		
	}

}