package uk.co.tapestry.model {
	import org.puremvc.as3.patterns.proxy.Proxy;
	import uk.co.tapestry.model.State;
	import uk.co.tapestry.model.data.StateValues;

	/**
	 * @author henryyp
	 */
	public class StateProxy extends Proxy {
		
		// VARS ------------------------------------- //
		public static const NAME:String				= "stateProxy";
		
		private var _nextState:State;
		private var _currentState:State;
		
		// CONSTRUCTOR ------------------------------ //
		public function StateProxy() {
			
			super(NAME);
		}
		
		public function get currentState():State{
			
			return _currentState;
		}
		
		public function set currentState(value:State):void {
			_currentState = value;
		}
		
		public function get nextState():State {
			return _nextState;	
		}
		
		public function set nextState(value:State):void {
			_nextState = value;
		}
		
		public function validatePath(statePath:Array):Boolean {
			if (statePath.length == 0) {
				return true;
			}
			if (StateValues.hasValue(statePath[0])) {
				return true;
			}
			trace("WARNING: next state is invalid");
			return false;
		}
		
		
		
		
		
		// CONSTRUCTOR ------------------------------ //
	}
}
