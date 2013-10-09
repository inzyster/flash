package data 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class GameScene extends DataNode
	{
		
		private var _rooms:Dictionary;
		
		private var _entranceTransition:SceneTransition;
		private var _exitTransition:SceneTransition;
		
		public function get rooms():Dictionary
		{
			return _rooms;
		}
		
		public function get entranceTransition():SceneTransition
		{
			return _entranceTransition;
		}
		
		public function get exitTransition():SceneTransition
		{
			return _exitTransition;
		}
		
		public function GameScene(xmlObject:XML)
		{
			super(xmlObject);
			this._rooms = new Dictionary();
			
			var entranceXML:XML = xmlObject["entrance"][0];
			var exitXML:XML = xmlObject["exit"][0];
			
			if (entranceXML != null)
			{
				this._entranceTransition = new SceneTransition(entranceXML);
			}
			if (exitXML != null)
			{
				this._exitTransition = new SceneTransition(exitXML);
			}
			
			for each (var roomXML:XML in xmlObject.room)
			{
				var room:Room = new Room(roomXML);
				this._rooms[room.id] = room;
			}
		}
		
	}

}