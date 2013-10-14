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
		private var _roomIndices:Array;
		private var _currentRoomIndex:uint;
		
		private var _entranceTransition:SceneTransition;
		private var _exitTransition:SceneTransition;		
		
		private var _sceneState:int = SceneState.TRANSITIONING_IN;
		
		private var _sceneTime:Number = 0.0;
		
		public function get rooms():Dictionary
		{
			return _rooms;
		}
		
		public function get currentRoom():Room
		{
			return _rooms[_roomIndices[_currentRoomIndex]];
		}
		
		public function get entranceTransition():SceneTransition
		{
			return _entranceTransition;
		}
		
		public function get exitTransition():SceneTransition
		{
			return _exitTransition;
		}
		
		public function get sceneState():int
		{
			return _sceneState;
		}
		
		public function GameScene(xmlObject:XML)
		{
			super(xmlObject);
			this._rooms = new Dictionary();
			this._roomIndices = new Array();
			this._currentRoomIndex = 0;
			
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
				this._roomIndices.push(room.id);
			}			
			
		}
		
		override public function update(frameTime:Number):void
		{
			super.update(frameTime);
			this._sceneTime += frameTime;
			if (this._sceneState == SceneState.TRANSITIONING_IN)
			{
				if (this._entranceTransition != null)
				{
					if (this._sceneTime >= this._entranceTransition.duration)
					{
						if (this._entranceTransition.narration != null)
						{
							this._sceneState = SceneState.ENTRANCE_DIALOG;
						}
						else 
						{
							this._sceneState = SceneState.ACTIVE;
						}
					}
				}
				else
				{
					this._sceneState = SceneState.ACTIVE;
				}
			}
		}
		
		private function dialogDismissed(e:DialogDismissedEvent):void
		{
			if (this._sceneState == SceneState.ENTRANCE_DIALOG)
			{
				this._sceneState = SceneState.ACTIVE;
			}
		}
		
	}

}