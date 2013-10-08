package  
{
	import data.GameAct;
	import data.ItemsCatalog;
	import flash.utils.Dictionary;
	import net.flashpunk.World;
	import data.Item;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class GameWorld extends World
	{
		
		private var _dataXML:XML;
		
		private var _itemsCatalog:ItemsCatalog;
		
		private var _acts:Dictionary;
		private var _actsOrder:Array;
		private var _currentActIndex:uint;
		
		public function get dataXML():XML
		{
			return _dataXML;
		}
		
		public function get acts():Dictionary
		{
			return _acts;
		}
		
		public function get currentAct():GameAct
		{
			return _acts[_actsOrder[_currentActIndex]];
		}
		
		public function GameWorld() 
		{
			this._dataXML = Assets.GetXML();			
			
			this._itemsCatalog = new ItemsCatalog(this._dataXML.items[0]);
			
			this._acts = new Dictionary();
			this._actsOrder = new Array();
			this._currentActIndex = 0;
			
			for each (var actXML:XML in this._dataXML.content.act)
			{
				var act:GameAct = new GameAct(actXML);
				this._acts[act.id] = act;
				this._actsOrder.push(act.id);
			}
			trace(this.currentAct);
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