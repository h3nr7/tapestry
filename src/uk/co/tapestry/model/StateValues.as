package uk.co.tapestry.model {
	
	import flash.utils.describeType;
	
	/**
	 * @author henryyp
	 */
	public class StateValues {
		
		public static const GALLERY:String 				= "Gallery";
		public static const SCREENSAVER:String			= "Screensaver";
		public static const COMMUNICATIONS:String 		= "Communications";
		public static const LIVING:String 				= "Living";
		public static const TAPESTRY:String				= "Tapestry";
		public static const FINDER: String 				= "Finder";
		public static const NEWS:String 				= "News";
		
		public static function get values():Array {
			
			var description:XML = describeType(StateValues);
			var values:Array 	= new Array();
			for (var i:int; i<description.constant.length(); i++) {
			
				var item:XML = description.constant[i];
				if (item.@type == "String") {
					values.push(StateValues[item.@name]);
				}
			}
			
			return values;
		}
		
		public static function hasalue(value:String):Boolean {
			
			for (var i:int=0; i<values.length; i++) {
				
				if (values[i] == value) {
					return true;	
				}
			}
			
			return false;
		}
	}
}
