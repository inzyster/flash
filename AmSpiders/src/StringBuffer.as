package  
{
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class StringBuffer 
	{
		
		public var buffer:Array;
		
		public function StringBuffer() 
		{
			this.buffer = new Array();
		}
		
		public function add(str:String):void
		{
			for (var i:int = 0; i < str.length; i++)
			{
				this.buffer.push(str.charCodeAt(i));
			}
		}
		
		public function toString():String
		{
			return String.fromCharCode.apply(this, this.buffer);
		}
		
		public function clear():void
		{
			this.buffer = new Array();
		}
		
	}

}