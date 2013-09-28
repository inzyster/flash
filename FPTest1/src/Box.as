package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Box extends Entity 
	{
		[Embed(source = "/../img/BoxImage.png")]
		private const IMAGE:Class;
		
		public function Box() 
		{
			graphic = new Image(IMAGE);
			
			setHitbox(60, 60);
		}
		
	}

}