package data 
{
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class SceneTransition extends DataNode 
	{
		
		private var _direction:String = SceneTransitionDirection.UNDEFINED;
		private var _type:String = SceneTransitionType.UNDEFINED;
		private var _duration:Number = 0.0;
		private var _narration:String;
		
		public function get direction():String
		{
			return _direction;
		}
		
		public function get type():String
		{
			return _type;
		}
		
		public function get duration():Number
		{
			return _duration;
		}
		
		public function get narration():String
		{
			return _narration;
		}
		
		public function set direction(value:String):void
		{
			if (Utils.hasConstantInClass(SceneTransitionDirection, value))
			{
				_direction = value;
			}
			else 
			{
				_direction = SceneTransitionDirection.UNDEFINED;
			}
		}
		
		public function set type(value:String):void
		{
			if (Utils.hasConstantInClass(SceneTransitionType, value))
			{
				_type = value;
			}
			else 
			{
				_type = SceneTransitionType.UNDEFINED;
			}
		}
		
		public function SceneTransition(xmlObject:XML)
		{
			super(xmlObject);
			var elementName:String = xmlObject.localName();						
			this.direction = elementName;
			
			var transitionElement:XML = xmlObject["transition"][0];
			
			if (transitionElement != null)
			{
				this.type = transitionElement["@type"].toString();
				this._duration = new Number(transitionElement["@duration"]);
			}
			
			this._narration = xmlObject["narration"][0];
		}
		
	}

}