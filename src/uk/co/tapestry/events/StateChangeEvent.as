package uk.co.tapestry.events {
	import flash.events.Event;

	/**
	 * @author henryyp
	 */
	public class StateChangeEvent extends Event {
		
		public static const ANIMATION_IN_COMPLETE:String 		= "ANIMATION_IN_COMPLETE";
		public static const ANIMATION_OUT_COMPLETE:String		= "ANIMATION_OUT_COMPLETE";
		
		public function StateChangeEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}
