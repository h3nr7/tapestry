package uk.co.tapestry.model.data {
	/**
	 * @author henryyp
	 */
	public class StateValues {
		
		public static function get values():Array {
			
			var values:Array = new Array();
			
			return values;
		}
		
		
		public static function hasValue(value:String):Boolean {
			
			for (var i:int; i<values.length; i++) {
				
				if (values[i] == value) {
					return true;
				}
			}
			
			return false;
		}
	}
}
