package ui 
{
	import flash.events.EventDispatcher;
	import flash.geom.Rectangle;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class DialogBox extends EventDispatcher
	{
		
		[Embed(source = "../../data/dialogbox.png")]
		private var _boxImage:Class;
		
		private const _insets:Rectangle = new Rectangle(10.0, 243.0, 620.0, 106.0);
		
		private var _text:Text;
		
		
		
		public function DialogBox() 
		{
			
		}
		
	}

}