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
		private var _targetContent:String;
		
		
		public function MainNaviEvent(type : String, targetContent:String, data:Object = null, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
			_data 				= data;
			_targetContent		= targetContent;
		}
		
		public function get data():Object {
			
			return _data;
		}
		
		public function get targetContent():String {
			return _targetContent;	
		}
	}
}

