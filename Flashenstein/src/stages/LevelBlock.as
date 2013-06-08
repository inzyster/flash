package stages 
{
	/**
	 * ...
	 * @author ...
	 */
	
	public class LevelBlock 
	{
		
		public var wall:int;
		public var x:int;
		public var y:int;		
		public var type:int;
		
		public function LevelBlock(x:int = 0, y:int = 0, wall:int = 0, type:int = 0) 
		{
			this.x = x;
			this.y = y;
			this.wall = wall;
			if (type == 0)
			{
				this.type = LevelBlockType.DEFAULT;
			}
			else 
			{
				this.type = type;
			}
		}
		
		public function isStart():Boolean
		{
			return this.type == LevelBlockType.START;
		}
		
		public function isEnd():Boolean
		{
			return this.type == LevelBlockType.END;
		}
		
		public function toString():String
		{
			return "[" + this.x.toString() + ", " + this.y.toString() + "]: " + (this.isStart() ? "S" : (this.isEnd() ? "E" : this.wall.toString()));
		}
		
	}

}