package uk.co.tapestry.controller {
	
	import uk.co.tapestry.model.StateProxy;
	import uk.co.tapestry.model.State;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.interfaces.INotification;

	import uk.co.tapestry.ApplicationFacade;

	/**
	 * @author henryyp
	 */
	 
	public class StateChangeCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			
			//get and set states
			var nextState:State 			= notification.getBody() as State;
			var stateProxy:StateProxy		= facade.retrieveProxy(StateProxy.NAME) as StateProxy;
			stateProxy.nextState 			= nextState;
			
			//choose actions
			if (stateProxy.currentState == null) {
				//TO DO when Start up
				trace("1: statesProxy.currentState == null", ApplicationFacade.CHECK_NEXT_STATE, nextState.statePath);
				sendNotification(ApplicationFacade.CHECK_NEXT_STATE);
			}
			else {
				var currentState:State 		 = stateProxy.currentState;
				var pathLength:uint = Math.min(nextState.statePath.length, currentState.statePath.length);
				for (var i:int = 0; i < pathLength; i++)
				{
					if (currentState.statePath[i] != nextState.statePath[i])
					{
						trace("2 currentState.statePath[i] != nextState.statePath[i]", ApplicationFacade.EXIT_CURRENT_STATE, currentState.statePath.slice(i));
						sendNotification(ApplicationFacade.EXIT_CURRENT_STATE, currentState.statePath.slice(i));
						
						return;
					}
					else if (currentState.statePath[i] == nextState.statePath[i])
					{
						trace("3 currentState.statePath[i] == nextState.statePath[i]", ApplicationFacade.EXIT_CURRENT_STATE, currentState.statePath.slice(i));
						//sendNotification(ApplicationFacade.EXIT_CURRENT_STATE, currentState.statePath.slice(i));
	
						return;
					}

				}
				
			}
			
		}
	}
}
