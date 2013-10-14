package  
{
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class GameState 
	{
		
		public static const UNDEFINED:int = 0;

		public static const DEFAULT:int = 1 << 0;
		public static const MENU:int = 1 << 1;
		public static const DIALOG:int = 1 << 2;
		public static const INVENTORY:int = 1 << 3;
		
		public static function IsStateActive(state:int, checkedValue:int):Boolean
		{
			return (state & checkedValue) > 0;
		}
		
		public function GameState();
		
	}

}