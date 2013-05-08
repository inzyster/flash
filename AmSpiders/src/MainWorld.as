package  
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class MainWorld extends World
	{
		
		private var _text:Text;
		
		private var _textBuffer:StringBuffer;
		
		private const COLUMNS:int = 40;
		private const ROWS:int = 30;
		
		public function MainWorld() 
		{
			this._text = new Text("", 0, 0, { 
				font: "cpc",
				size: 20,
				align: "left",
				wordWrap: false,
				resizable: true,
				color: 0xffffffff,
				width: Config.Width,
				height: Config.Height
			});
			
			this._textBuffer = new StringBuffer();
		}
		
		override public function begin():void 
		{
			super.begin();
			
			this.addGraphic(_text);			
			
			this._clearBuffer();
		}
		
		private function _clearBuffer():void 
		{
			this._textBuffer.clear();
			for (var i:int = 0; i < ROWS; i++)
			{
				for (var j:int = 0; j < COLUMNS; j++)
				{
					this._textBuffer.add(" "/*((j == 0 ? i : j) % 10).toString()*/);
				}
				this._textBuffer.add("\n");
			}
		}
		
		override public function update():void 
		{
			super.update();			
			
			var bufferText:String = this._textBuffer.toString();
			
			if (bufferText != null)
			{			
				this._text.text = bufferText;				
			}
		}
		
		private function _writeAt(column:int, row:int, text:String):void
		{
			var index:int = column + (row * COLUMNS);
			var idx:int = index;
			var c:int = 0;
			var r:int = 0;
			var buffIndex:int = idx;
			for (var i:int = 0; i < text.length; i++)
			{								
				var s:String = text.charAt(i);
				if (s == "\n")
				{
					idx = index + COLUMNS;
					continue;
				}
				
				r = Math.floor(idx / COLUMNS);
				c = idx % COLUMNS;
				
				if (!(r < 0 || c < 0 || r >= ROWS || c >= COLUMNS))
				{
					buffIndex = c + (r * (COLUMNS + 1));
					this._textBuffer.set(s, buffIndex);
				}
				
				idx++;
			}
		}
		
	}

}