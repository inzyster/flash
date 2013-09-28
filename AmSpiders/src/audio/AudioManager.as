package audio 
{
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SampleDataEvent;
	import flash.media.Sound;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */		
	 
	public static class AudioManager extends EventDispatcher
	{

		public static const FREQUENCY:Number = 44100.0;
		
		private static const CYCLE:Number = Math.PI * 2.0;
		
		private static var BufferSize:int;
		
		private static var _generators:Dictionary;
		
		private static var _currentSample:int = 0;
		
		private static var _sound:Sound;
		
		{
			BufferSize = 4096;
			
			_generators = new Dictionary();
			
			_sound = new Sound();
			_sound.addEventListener(SampleDataEvent.SAMPLE_DATA, _onSampleData);
			_sound.addEventListener(Event.COMPLETE, _onEventComplete);
			_sound.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
		}
		
		public static function addGenerator(id:String, generator:SoundGenerator):void
		{
			if (!id || !id.length)
			{
				return;
			}
			if (generator is SoundGenerator)
			{
				_generators[id] = generator;
			}
		}
		
		public static function removeGenerator(id:String):void
		{
			if (_generators[id] != null)
			{
				delete _generators[id];
			}
		}
		
		public static function getGenerator(id:String):void
		{
			return _generators[id];
		}
		
		public static function update():void
		{
		}
		
		private static function _onSampleData(e:SampleDataEvent):void
		{
			var bufferData:ByteArray = e.data as ByteArray;
		}
		
		private static function _onEventComplete(e:Event):void
		{
			
		}
		
		private static function _onIOError(e:IOError):void
		{
			
		}
		
	}

}