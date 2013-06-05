package stages 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Level 
	{
		
		private var _blocks:Array;
		
		public static function FromString(levelString:String):Level
		{
			var cols:int = 0;
			var rows:int = 1;
			for (var i:int = 0; i < levelString.length; i++)
			{
				var s:String = levelString.substr(i, 1);
				if (s != "\n")
				{
					cols++;
				}
				else 
				{
					cols = 0;
					rows++;
				}
			}
			var result:Level = new Level(cols, rows);
			var col:int = 0;
			var row:int = 0;
			for (var n:int = 0; n < levelString.length; n++)
			{
				var str:String = levelString.substr(n, 1);
				var b:LevelBlock = null;
				if (str == "\n")
				{
					col = 0;
					row++;					
					continue;
				}
				else 
				{	
					b = new LevelBlock(col, row);
					if (str == "S")
					{
						b.type = LevelBlockType.START;
					}
					else if (str == "E")
					{
						b.type = LevelBlockType.END;
					}
					else 
					{
						b.wall = int(str);
					}
				}
				if (b != null)
				{
					result.setBlockAt(col, row, b);
				}
				col++;
			}
			return result;
		}
		
		public function Level(width:int, height:int) 
		{
			_blocks = new Array();
			for (var i:int = 0; i < height; i++)
			{
				_blocks.push(new Array());
			}
		}
		
		public function setBlockAt(x:int, y:int, block:LevelBlock):void
		{
			_blocks[y][x] = block;
		}
		
		public function getBlockAt(x:int, y:int):LevelBlock
		{
			return _blocks[y][x];
		}
		
		private function _filterType(type:int):Array
		{
			var result:Array = _blocks.map(function(element:*, colsIndex:int, theArray:Array):Array {
				var colsArray:Array = element as Array;
				return colsArray.filter(function(bl:*, index:int, array:Array):Boolean {
					var block:LevelBlock = bl as LevelBlock;
					return block.type == type;
				});
			});
			return result.filter(function(res:*, i:int, a:Array):Boolean {
				return ((res as Array).length > 0);
			});
		}
		
		public function startBlock():LevelBlock
		{
			var results:Array = this._filterType(LevelBlockType.START);
			if (results.length == 0)
			{
				return null;
			}
			return results[0][0];
		}
		
		public function endBlock():LevelBlock
		{
			var results:Array = this._filterType(LevelBlockType.END);
			if (results.length == 0)
			{
				return null;
			}
			return results[0][0];
		}
		
	}

}