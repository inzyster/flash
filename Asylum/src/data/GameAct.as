package data 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class GameAct extends DataNode
	{
		
		private var _scenes:Dictionary;		
		private var _sceneOrder:Array;		
		private var _currentSceneIndex:uint;
		
		public function get scenes():Dictionary
		{
			return _scenes;
		}
				
		public function get currentScene():GameScene
		{
			return _scenes[_sceneOrder[_currentSceneIndex]];
		}
		
		public function GameAct(xmlObject:XML)
		{
			super(xmlObject);
			
			this._scenes = new Dictionary();			
			this._sceneOrder = new Array();
			this._currentSceneIndex = 0;
			
			for each (var sceneXML:XML in xmlObject.scene)
			{
				var scene:GameScene = new GameScene(sceneXML);
				this._scenes[scene.id] = scene;
				this._sceneOrder.push(scene.id);
			}
		}
		
	}

}