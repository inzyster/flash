package data 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class DialogDismissedEvent extends Event 
	{
		
		public static const DIALOG_DISMISSED:String = "DIALOG_DISMISSED";
		
		public function DialogDismissedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new DialogDismissedEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("DialogDismissedEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}