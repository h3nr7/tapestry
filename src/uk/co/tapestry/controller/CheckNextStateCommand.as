package uk.co.tapestry.controller {
	import uk.co.tapestry.ApplicationFacade;
	import uk.co.tapestry.model.data.StateValues;
	import com.greensock.loading.LoaderStatus;
	import com.greensock.loading.LoaderMax;
	import uk.co.tapestry.model.StateProxy;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * @author henryyp
	 */
	public class CheckNextStateCommand extends SimpleCommand {
		
		// VARIABLES -------------------------------- //
		
		
		// FUNCTIONS -------------------------------- //
		
		override public function execute(notification:INotification):void {
			
			var stateProxy:StateProxy 		= facade.retrieveProxy(StateProxy.NAME) as StateProxy;
			var nextStatePath:Array 		= stateProxy.nextState.statePath;
			
			var queue:LoaderMax				= new LoaderMax();
			
			//choose what to load
			switch(nextStatePath[0]) {
				
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
				case StateValues.GALLERY:
					break;
				case StateValues.FILMS:
					break;
			}
			
			//function to add to LoaderMax queue
			function addToQueue(loader:Class, url:String, vars:Object = null):void {
				
				if (!(LoaderMax.getLoader(url)!=null && LoaderMax.getLoader(url).status == LoaderStatus.COMPLETED)) {
					queue.append(new loader(url, vars));
				}
			}
			
			if (queue.numChildren > 0) {
				//TODO: CheckNextStateCommand loading mechanism and Loading Type
				
				sendNotification(ApplicationFacade.LOAD, {queue:queue, onCompleteNote:ApplicationFacade.CHECK_NEXT_STATE});
			}
			else {
				//TODO: CheckNextStateCommand other circumstances
			}
		}
	}
}
