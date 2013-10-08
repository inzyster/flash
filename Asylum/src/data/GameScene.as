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
		
		public function get rooms():Dictionary
		{
			return _rooms;
		}
		
		public function GameScene(xmlObject:XML)
		{
			super(xmlObject);
			this._rooms = new Dictionary();
			
			for each (var roomXML:XML in xmlObject.room)
			{
				var room:Room = new Room(roomXML);
				this._rooms[room.id] = room;
			}
		}
		
	}

}