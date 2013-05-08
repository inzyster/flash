package  
{
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class StringBuffer 
	{
		
		public var buffer:Array;
		
		private var _isDirty:Boolean;
		
		public function StringBuffer() 
		{
			this.buffer = new Array();
			this._isDirty = true;
		}
		
		public function add(str:String):void
		{
			for (var i:int = 0; i < str.length; i++)
			{
				this.buffer.push(str.charCodeAt(i));
			}
			this._isDirty = true;
		}
		
		public function set(str:String, index:int):void
		{
			if (index < 0 || index >= this.buffer.length)
			{
				return;
			}
			this.buffer[index] = str.charCodeAt(0);
			this._isDirty = true;
		}
		
		public function toString():String
		{
			if (this._isDirty)
			{
				this._isDirty = false;
				return String.fromCharCode.apply(this, this.buffer);
			}
			return null;
		}
		
		public function clear():void
		{
			this.buffer = new Array();
			this._isDirty = true;
		}
		
	}

}