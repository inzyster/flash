package  
{
	import net.flashpunk.World;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class GameWorld extends World
	{
		
		private var _dataXML:XML;
		
		public function get dataXML():XML
		{
			return _dataXML;
		}
		
		public function GameWorld() 
		{
			this._dataXML = Assets.GetXML();
		}
		
		override public function begin():void
		{
			super.begin();
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}