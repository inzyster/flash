package audio 
{
	import flash.utils.ByteArray;
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class SoundGenerator 
	{
		
		protected var _buffer:ByteArray;
		
		public function SoundGenerator() 
		{
			_buffer = new ByteArray();
		}
		
		public function getData(offset:uint = 0, zeroPadding:Boolean = true):Number
		{
			if (offset > _buffer.length)
			{
				return zeroPadding ? 0.0 : null;
			}
			else 
			{
				_buffer.position = offset;
				return _buffer.readFloat();
			}
			return null;
		}
		
	}

}