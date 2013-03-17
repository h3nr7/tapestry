package uk.co.tapestry.controller {
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.interfaces.INotification;
	import uk.co.tapestry.model.StateProxy;
	import uk.co.tapestry.model.StateValues;
	import uk.co.tapestry.ApplicationFacade;

	/**
	 * @author henryyp
	 */
	public class StateChangeCompleteCommand extends SimpleCommand {
		
		
		
		override public function execute(notification:INotification):void {
			
			var stateProxy:StateProxy = facade.retrieveMediator(StateProxy.NAME) as StateProxy;
			
			if (stateProxy.currentState != null) {
				
				var currentStatePath:Array = stateProxy.currentState.statePath;
				
				switch (currentStatePath[0]) {
					
					case StateValues.GALLERY:
						break;
					case StateValues.SCREENSAVER:
						break;
					case StateValues.COMMUNICATIONS:
						break;
					case StateValues.LIVING:
						break;
					case StateValues.TAPESTRY:
						break;
					case StateValues.FINDER:
						break;
					case StateValues.NEWS:
						break;

				}
			}
			stateProxy.currentState = stateProxy.nextState;
			stateProxy.nextState 	= null;
			trace('State changed.  currentState: ' + stateProxy.currentState);
			//DEBUG
			(facade as ApplicationFacade).listMediators();
		}
	}
}
