package uk.co.tapestry.model {
	/**
	 * @author henryyp
	 */
	public class State {
		
		private var _statePath:Array;
		
		public function State(statePath:Array) {
			
			_statePath 		= statePath;
		}
		
		public function get statePath():Array {
			
			return _statePath;
		}
		
		public function toString():String {
			
			return "State = path:" + _statePath;
		}
	}
}
