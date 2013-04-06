package uk.co.tapestry.model.data {
	
	import flash.utils.describeType;
	
	/**
	 * @author henryyp
	 */
	public class StateValues {
		
		//MAIN NAVI
		public static const GALLERY:String 				= "Gallery";
		public static const FILMS:String				= "Films";
		public static const COMMUNICATIONS:String 		= "Communications";
		public static const LIVING:String 				= "Living";
		public static const TAPESTRY:String				= "Tapestry";
		public static const FINDER: String 				= "Finder";
		public static const NEWS:String 				= "News";
		
		//2ND LEVEL SUB NAVI
		//Tapestry
		//public static const TAPESTRY_MAKER:String 		= "Tapestry_maker";
		//public static const APPARTMENTS:String 			= "The_Appartment";
		//public static const GARDEN:String 				= "The_Garden_and_Amenities";
		//public static const SPECIFICATION:String 		= "Specification";
		
		
		//3RD LEVEL SUB NAVI
		//Tapestry Maker SUB NAVI
		//public static const ARCHITECTS:String 			= "Architects";
		//public static const INTERIOR_ARCHITECTS:String 	= "Interior_Architects";
		//public static const LANDSCAPE_ARCHITECTS:String = "Landscape_Architects";
		//public static const TAPESTRY_TEAM:String 		= "The_Tapestry_Team";
		
		
		
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
		
		public static function hasValue(value:String):Boolean {
			
			for (var i:int=0; i<values.length; i++) {
				
				if (values[i] == value) {
					return true;	
				}
			}
			
			return false;
		}
	}
}
