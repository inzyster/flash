package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	
	public class GameWorld extends World 
	{
		[Embed(source = "/../img/ButtonSheet.png")]
		private const BUTTONSHEET:Class;
		
		[Embed(source = "/../img/EntityImage2.png")]
		private const IMAGE:Class;
		
		private var _gameEntity:GameEntity;
		private var _box:Box;
		private var _button:Button;
		
		public function GameWorld() 
		{
			_gameEntity = new GameEntity();
			_box = new Box();
			_button = new Button(onButtonClick, null);
			
			_button.setSpritemap(BUTTONSHEET, 50, 40);
			
			var tf:TextFormat = new TextFormat("default", 16, 0xAAAAAA, false, false, false);
			tf.align = "center";
			
			var text:TextField = new TextField();
			text.x = 100;
			text.y = 50;
			text.text = "LOLOLOL";
			text.embedFonts = true;
			text.setTextFormat(tf);
			text.width = text.textWidth + 5;
			text.height = text.textHeight;
			text.selectable = false;
			
			FP.engine.addChild(text);
			
			add(_gameEntity);
			add(_box);
			add(_button);
			
			_box.x = 200;
			_box.y = 150;
			
			_button.x = 400;
			_button.y = 200;
			
			addGraphic(new Image(IMAGE), 0, 50, 50);
		}
		
		private function onButtonClick():void
		{
			FP.screen.color = Math.random() * 0xFFFFFF;
			
			trace("The button has been clicked!");
		}
		
		override public function update():void
		{
			super.update();
			
			var entityArray:Array = [];
			
			getType("GameEntity", entityArray);
			
			for each (var entity:Entity in entityArray)
			{
				entity.x = entity.x > 550 ? 550 : entity.x;
				entity.y = entity.y > 400 ? 400 : entity.y;
			}
			
			if (_gameEntity.collideWith(_box, _gameEntity.x, _gameEntity.y))
			{
				_gameEntity.x = _gameEntity.y = 0;
			}
		}
		
	}

}