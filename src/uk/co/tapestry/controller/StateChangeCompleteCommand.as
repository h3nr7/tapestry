package uk.co.tapestry.controller {
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.interfaces.INotification;
	import uk.co.tapestry.model.StateProxy;
	import uk.co.tapestry.model.data.StateValues;
	import uk.co.tapestry.ApplicationFacade;
	import uk.co.tapestry.view.*;

	/**
	 * @author henryyp
	 */
	public class StateChangeCompleteCommand extends SimpleCommand {
		
		
		
		override public function execute(notification:INotification):void {
			
			var stateProxy:StateProxy = facade.retrieveProxy(StateProxy.NAME) as StateProxy;
			
			//Used for Animation Out then killing it, not used most probably
			/*if (stateProxy.currentState != null) {
				
				var currentStatePath:Array = stateProxy.currentState.statePath;
				
				
				switch (currentStatePath[0]) {
					
					case StateValues.GALLERY:
						var galleryMediator:GalleryMediator 				= facade.retrieveMediator(GalleryMediator.NAME) as GalleryMediator;
						break;
					case StateValues.FILMS:
						var filmsMediator:FilmsMediator 					= facade.retrieveMediator(FilmsMediator.NAME) as FilmsMediator;
						break;
					case StateValues.COMMUNICATIONS:
						var communicationMediator:CommunicationsMediator 	= facade.retrieveMediator(CommunicationsMediator.NAME) as CommunicationsMediator;
						break;
					case StateValues.LIVING:
						var livingMediator:LivingMediator 					= facade.retrieveMediator(LivingMediator.NAME) as LivingMediator;
						break;
					case StateValues.TAPESTRY:
						var tapestryMediator:TapestryMediator 				= facade.retrieveMediator(TapestryMediator.NAME) as TapestryMediator;
						break;
					case StateValues.FINDER:
						var finderMediator:FinderMediator 					= facade.retrieveMediator(FinderMediator.NAME) as FinderMediator;
						break;
					case StateValues.NEWS:
						var newsMediator:NewsMediator 						= facade.retrieveMediator(NewsMediator.NAME) as NewsMediator;
						break;

				}
			}*/
			stateProxy.currentState = stateProxy.nextState;
			stateProxy.nextState 	= null;
			trace('State changed.  currentState: ' + stateProxy.currentState);
			//DEBUG
			(facade as ApplicationFacade).listMediators();
		}
	}
}
