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
			var textMap:TextMap = new TextMap(1, 0xffffffff, "*");
			var spriteMap:Spritemap = new Spritemap(textMap.bitmapData, textMap.frameWidth, textMap.frameHeight);
			spriteMap.add("Default", [0]);
			this.graphic = spriteMap;
			
			this.setHitbox(textMap.frameWidth, textMap.frameHeight);
		}
		
	}

}