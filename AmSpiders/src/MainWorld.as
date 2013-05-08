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
		
		public function MainWorld() 
		{
			this._text = new Text("", 0, 0, { 
				font: "cpc",
				size: 20,
				align: "left",
				wordWrap: false,
				resizable: false,
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
			for (var i:int = 0; i < 30; i++)
			{
				for (var j:int = 0; j < 40; j++)
				{
					this._textBuffer.add(" ");
				}
				this._textBuffer.add("\n");
			}
		}
		
		override public function update():void 
		{
			super.update();			
			
			this._text.text = this._textBuffer.toString();
		}
		
	}

}