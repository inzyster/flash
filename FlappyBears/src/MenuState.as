package
{

	import org.flixel.*;
	import data.Assets;
	
	public class MenuState extends FlxState
	{
		
		private var _sky:FlxBackdrop;
		private var _ground:FlxBackdrop;
		
		private var _logo:FlxSprite;
		private var _label:FlxText;
		
		private var _startLabel:FlxText;
		
		private var _bear:MainMenuBear;
		
		override public function create():void
		{
			FlxG.mouse.hide();
			
			_sky = new FlxBackdrop(Assets.Sky, 1.0, 0.0, true, false);
			_sky.x = 0.0;
			_sky.y = 0.0;
			this.add(_sky);
			
			_ground = new FlxBackdrop(Assets.Ground, 1.0, 0.0, true, false);
			_ground.x = 0.0;
			_ground.y = 256.0;
			this.add(_ground);
			
			_logo = new FlxSprite((FlxG.width - 128.0) / 2.0, 32.0, Assets.Logo);
			this.add(_logo);
			
			_label = new FlxText(_logo.x + _logo.width - 40.0, _logo.y + _logo.height - 24.0, 20.0, "(s)");
			this.add(_label);			
			
			_startLabel = new FlxText(0.0, (2.0 / 3.0) * FlxG.height, FlxG.width, "Press space to play");
			_startLabel.alignment = "center";
			this.add(_startLabel);
			
			_bear = new MainMenuBear((FlxG.width - 32) / 2.0, (FlxG.height - 28) / 2.0);
			this.add(_bear);
			_bear.alive = true;
		}
		
		override public function update():void
		{
			super.update();	
			var delta:Number = FlxG.elapsed;
			_sky.x -= delta * 15.0;
			_ground.x -= delta * 15.0;
		}
		
		
		
	}
}

