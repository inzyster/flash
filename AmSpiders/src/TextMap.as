package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class TextMap 
	{
		
		public var bitmapData:BitmapData = null;
		
		public var frameWidth:Number = 0.0;
		public var frameHeight:Number = 0.0;
		public var frameCount:int = 0;
		
		public function TextMap(rowsPerFrame:int = 1, color:uint = 0xffffffff, addEmptyFrame:Boolean = true, ...frames):void 
		{
			if (frames.length == 0)
			{
				return;
			}
			
			var frameData:Array = frames.filter(function(f:*, index:int, array:Array):Boolean {
				return (f is String);
			});			
			
			if (frameData.length == 0)
			{
				return;
			}
			
			var text:Text = new Text("", 0, 0, { 
				font: "cpc",
				size: Config.FontSize,
				align: "left",
				color: color,
				resizable: true
			});
			var textBuffer:StringBuffer = new StringBuffer();
			this.frameCount = frameData.length / rowsPerFrame;
			
			var columnsPerFrame:int = Math.max.apply(this, frameData.map(function(f:String, index:int, array:Array):int {
				return f.length;
			}));			
			
			var self:* = this;
			
			frameData.forEach(function(f:String, index:int, array:Array):void {
				if (f.length < columnsPerFrame)
				{
					f = f.concat(self._generateSpaces(columnsPerFrame - f.length));
				}
				textBuffer.add(f);
				
				if ((index + 1) % self.frameCount == 0)
				{
					if (addEmptyFrame)
					{
						textBuffer.add(self._generateSpaces(columnsPerFrame));
					}
					if ((index + 1) < self.frameCount)
					{
						textBuffer.add("\n");
					}
				}
			});
			
			text.text = textBuffer.toString();			
			
			this.frameCount += (addEmptyFrame ? 1 : 0);
			
			this.bitmapData = new BitmapData(text.textWidth, text.textHeight, true, 0x0);
			text.render(this.bitmapData, new Point(0, 0), new Point(0, 0));
			
			text = null;
			textBuffer = null;
			
			this.frameHeight = this.bitmapData.height;
			this.frameWidth = this.bitmapData.width / this.frameCount;
			
		}
				
		private function _generateSpaces(count:int = 0):String 
		{
			var result:String = "";
			for (var i:int = 0; i < count; i++)
			{
				result = result.concat(" ");
			}
			return result;			
		}
		
	}

}