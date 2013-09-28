package stages 
{
	import flash.display.InteractiveObject;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SampleDataEvent;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class Level extends MainWorld
	{
		
		private var _playSound:Boolean = true;
		
		private var _position:int = 0;
		
		private var _sound:Sound;
		
		private var _tone:Number = 0.0;
		
		private var _toneTimer:Timer;
		
		public function Level() 
		{
			
		}
		
		override public function begin():void
		{
			super.begin();
			
			_toneTimer = new Timer(1000);
			_toneTimer.addEventListener(TimerEvent.TIMER, _onToneTimer);
			_toneTimer.start();
			
			_sound = new Sound();
			_sound.addEventListener(SampleDataEvent.SAMPLE_DATA, _onSampleData);
			_sound.addEventListener(Event.COMPLETE, _onSoundComplete);
			_sound.addEventListener(IOErrorEvent.IO_ERROR, _onSoundComplete);
			_sound.play();
		}
		
		private function _onSampleData(e:SampleDataEvent):void
		{
			if (!_playSound)
			{
				return;
			}
			
			var buffer:ByteArray = e.data as ByteArray;
			
			var frequency:Number = 440.0 * Math.pow(2.0, _tone / 12.0);
			
			for (var i:int = 0; i < 4096; i++)
			{
				var phase:Number = (Number(_position) / 44100.0) * Math.PI * 2.0;
				_position++;
				if (_position % 44100 == 0)
				{
					_position = 0;
				}
				var sampleL:Number = Math.sin(phase * frequency);
				var sampleR:Number = Math.sin(phase * frequency);
				buffer.writeFloat(sampleL * 0.5);
				buffer.writeFloat(sampleR * 0.5);
			}
			
		}
		
		private function _onSoundComplete(e:Event):void
		{
			trace(e);
		}
		
		private function _onToneTimer(e:TimerEvent):void
		{
			_tone += 1.0;
		}
		
		override public function update():void
		{
			super.update();
			
			if (Input.pressed(Key.SPACE))
			{
				_playSound = !_playSound;
				if (_playSound)
				{
					_sound.play();
				}
			}
		}
		
	}

}