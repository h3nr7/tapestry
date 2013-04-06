package uk.co.tapestry.events {
	

	import flash.events.Event;

	/**
	 * @author henryyp
	 */
	public class MainNaviEvent extends Event {
		
		
		public static const 		MAINNAV_DOWN:String		= "MAINNAV_BUTTON_DOWN";
		public static const 		MAINNAV_UP:String		= "MAINNAV_BUTTON_UP";
		public static const 		MAINNAV_CLICK:String 	= "MAINNAV_BUTTON_CLICK";
				
		
		private var _data:Object;
		
		
		public function MainNaviEvent(type : String, data:Object, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
			_data 		= data;
		}
		
		public function get data():Object {
			
			return _data;
		}
	}
}

