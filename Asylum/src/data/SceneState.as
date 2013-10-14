package data 
{
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class SceneState 
	{
		public static const UNDEFINED:int = 0;
		
		public static const TRANSITIONING_IN:int = 1 << 0;
		public static const ENTRANCE_DIALOG:int = 1 << 1;
		public static const ACTIVE:int = 1 << 2;
		public static const TRANSITIONING_OUT:int = 1 << 2;
		
		public function SceneState();
		
	}

}