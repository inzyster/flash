package  
{
	import org.flixel.FlxState;
	import org.flixel.plugin.photonstorm.FlxSpecialFX;
	
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	import org.flixel.FlxButton;
	
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
	
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class MenuState extends FlxState 
	{

		private var _titleLabel:FlxText;
		
		private var _starfield:StarfieldFX;
		private var _stars:FlxSprite;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			
			_titleLabel = new FlxText( (FlxG.width - 200) / 2, FlxG.height / 3, 200, "Aliens: Pig" );
			_titleLabel.size = 14.0;
			_titleLabel.alignment = "center";			
		
			if ( FlxG.getPlugin( FlxSpecialFX ) == null )
			{
				FlxG.addPlugin( new FlxSpecialFX() );
			}
			
			_starfield = FlxSpecialFX.starfield();
			
			_stars = _starfield.create( 0, 0, FlxG.width, FlxG.height, 200, StarfieldFX.STARFIELD_TYPE_2D );
			_starfield.setStarSpeed( 1.0, 0.0 );
			
			this.add( _stars ); 
		
			this.add( _titleLabel );		
			
		}
		
	}

}