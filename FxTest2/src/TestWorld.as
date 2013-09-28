package  
{
	import net.flashpunk.World;
	import com.bit101.components.*;
	import com.greensock.*;
	import flash.display.BlendMode;
	import flash.events.*;
	import flash.geom.Point;
	import flash.utils.*;
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import punk.fx.*;
	import punk.fx.effects.*;
	import punk.fx.graphics.*;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class TestWorld extends World
	{
		PixelateFX;
		BloomFX;
		GlitchFX;
		CRTFX;
		RGBDisplacementFX;
		
		FXText;
		FXImage;
		FXPreRotation;
		FXSpritemap;
		FXTiledImage;
		FXTiledSpritemap;
		
		[Embed(source = "../img/mtn.jpg")]
		public var BACKGROUND1:Class;
		
		[Embed(source = "../img/bg2.png")]
		public var BACKGROUND2:Class;
		
		private var _background1:Backdrop;
		private var _background2:Backdrop;
		
		private var _fxImage:FXImage;
		
		private var _bloomEnabled:Boolean = false;
		private var _glitchEnabled:Boolean = false;
		private var _pixelateEnabled:Boolean = false;
		private var _crtEnabled:Boolean = true;
		private var _rgbEnabled:Boolean = false;
		private var _mosaicEnabled:Boolean = false;
		
		private var _bloomFx:BloomFX;
		private var _glitchFx:GlitchFX;
		private var _pixelateFx:PixelateFX;
		private var _crtFx:CRTFX;
		private var _rgbFx:RGBDisplacementFX;
		private var _mosaicFx:MosaicFX;
		
		private var _willem:Willem;
		
		private var _dx:Number = 120;
		private var _dy:Number = 160;
		
		private var _startPos:Point;
		
		private var _text:FXText;
		private var _distance:Number = 0;
		
		public function TestWorld() 
		{
			
		}
		
		override public function begin():void
		{
			super.begin();
			
			_background1 = new Backdrop(BACKGROUND1, true, false);
			_background1.y = 0;
			_background1.x = 0;
			
			_background2 = new Backdrop(BACKGROUND2, true, false);
			_background2.x = 0;
			_background2.y = 0;
			_background2.alpha = 0.3;
			
			this.addGraphic(_background1, 11);
			this.addGraphic(_background2, 10);	
			
			_background2.scrollX = 10;
			
			_willem = new Willem(60, 480 - 121 + 20);
			this.add(_willem);
			_willem.layer = 5;
			
			_fxImage = new FXImage();
			_fxImage.name = "FXScreen";
			
			this.addGraphic(_fxImage, -3);
			
			_fxImage.onPreRender = function(img:FXImage):void
			{
				img.x = FP.camera.x;
				img.y = FP.camera.y;
				FP.screen.refresh();
			}
			
			_bloomFx = new BloomFX(32, 125, 1);
			FXMan.add(_fxImage, _bloomFx);
			_bloomFx.active = false;
			
			_glitchFx = new GlitchFX(32, 12, 0);
			FXMan.add(_fxImage, _glitchFx);
			_glitchFx.active = false;
			
			_pixelateFx = new PixelateFX(4);
			FXMan.add(_fxImage, _pixelateFx);
			_pixelateFx.active = false;
			
			_crtFx = new CRTFX(0.2);
			FXMan.add(_fxImage, _crtFx);
			_crtFx.active = true;
			
			_rgbFx = new RGBDisplacementFX([10, 0, -10, 0, 0, 0]);
			_rgbFx.showBlueChannel = true;
			_rgbFx.showGreenChannel = true;
			_rgbFx.showRedChannel = true;
			FXMan.add(_willem.graphic as IFXGraphic, _rgbFx);
			_rgbFx.active = false;
			
			_startPos = new Point(_willem.x, _willem.y);
			
			_text = new FXText("0", 0, 0, { 
				font: "default", 
				size: 17, 
				align: "right", 
				resizable: false,
				width: 100
			});
			_text.y = 20;
			_text.x = 640 - _text.width - 20;
			
			this.addGraphic(_text);
		}
		
		override public function update():void
		{
			super.update();
			
			if (Input.pressed(Key.DIGIT_1))
			{
				_bloomEnabled = !_bloomEnabled;
				FP.log("Bloom is " + _bloomEnabled);
				_bloomFx.active = _bloomEnabled;
			}
			
			if (Input.pressed(Key.DIGIT_2))
			{
				_glitchEnabled = !_glitchEnabled;
				FP.log("Glitch is " + _glitchEnabled);
				_glitchFx.active = _glitchEnabled;
			}
			
			if (Input.pressed(Key.DIGIT_3))
			{
				_pixelateEnabled = !_pixelateEnabled;
				FP.log("Pixelate is " + _pixelateEnabled);
				_pixelateFx.active = _pixelateEnabled;
			}						
			
			if (Input.pressed(Key.DIGIT_4))
			{
				_crtEnabled = !_crtEnabled;
				FP.log("CRT is " + _crtEnabled);
				_crtFx.active = _crtEnabled;
			}
			
			if (Input.pressed(Key.DIGIT_5))
			{
				_rgbEnabled = !_rgbEnabled;
				FP.log("RGB displacement is " + _rgbEnabled);
				_rgbFx.active = _rgbEnabled;
			}
			
			if (Input.pressed(Key.DIGIT_6))
			{
				_mosaicEnabled = !_mosaicEnabled;
				FP.log("Mosaic is " + _mosaicEnabled);
				_mosaicFx.active = _mosaicEnabled;
			}
			
			if (Input.check(Key.RIGHT))
			{
				_willem.moveBy(_dx * FP.elapsed, 0);
				_distance += _dx * FP.elapsed;
				_text.x += _dx * FP.elapsed;
			}
			
			FP.camera.x = _willem.x - _startPos.x;
			_text.text = "" + _distance;
		}
		
	}

}