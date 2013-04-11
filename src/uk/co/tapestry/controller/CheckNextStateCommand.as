package uk.co.tapestry.controller {
	import com.greensock.loading.ImageLoader;
	import uk.co.tapestry.model.DataProxy;
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
			var dataProxy:DataProxy 		= facade.retrieveProxy(DataProxy.NAME) as DataProxy;
			var nextStatePath:Array 		= stateProxy.nextState.statePath;
			
			var queue:LoaderMax				= new LoaderMax();
			//choose what to load
			trace("CheckNextStateCommand: " + nextStatePath[0]);
			switch(nextStatePath[0]) {
				
				case StateValues.COMMUNICATIONS:
					trace('CHECKNEXTSTATE: Add Communication Assets To Queue');
					var cA:Array 		= dataProxy.getCommunicationsList();
					for (var i:uint=0; i<cA.length; i++) {
						addToQueue(ImageLoader, cA[i]['src'], {name:cA[i]['name']});
					}
					break;
				case StateValues.LIVING:
					//TODO: Living Assets
					trace('CHECKNEXTSTATE: Add Living Assets To Queue');
					var cA:Array 		= dataProxy.getCommunicationsList();
					for (var i:uint=0; i<cA.length; i++) {
						addToQueue(ImageLoader, cA[i]['src'], {name:cA[i]['name']});
					}
					break;
				case StateValues.TAPESTRY:
					//TODO: Tapestry Assets
					trace('CHECKNEXTSTATE: Add Tapestry Assets To Queue');
					var cA:Array 		= dataProxy.getCommunicationsList();
					for (var i:uint=0; i<cA.length; i++) {
						addToQueue(ImageLoader, cA[i]['src'], {name:cA[i]['name']});
					}
					break;
				case StateValues.FINDER:
					//TODO: Finder Assets
					trace('CHECKNEXTSTATE: Add Finder Assets To Queue');
					var cA:Array 		= dataProxy.getCommunicationsList();
					for (var i:uint=0; i<cA.length; i++) {
						addToQueue(ImageLoader, cA[i]['src'], {name:cA[i]['name']});
					}
					break;
				case StateValues.NEWS:
					//TODO: NEWS SECTION TEMPORARY
					trace('CHECKNEXTSTATE: News with no Queue');
					break;
				case StateValues.GALLERY:
					//TODO: Living Assets
					trace('CHECKNEXTSTATE: Add Living Assets To Queue');
					var cA:Array 		= dataProxy.getCommunicationsList();
					for (var i:uint=0; i<cA.length; i++) {
						addToQueue(ImageLoader, cA[i]['src'], {name:cA[i]['name']});
					}
					break;
				case StateValues.FILMS:
					//TODO: Living Assets
					trace('CHECKNEXTSTATE: Add Films Assets To Queue');
					var cA:Array 		= dataProxy.getCommunicationsList();
					for (var i:uint=0; i<cA.length; i++) {
						addToQueue(ImageLoader, cA[i]['src'], {name:cA[i]['name']});
					}
					break;
				
				//Secondary navi System
				//TODO: Secondary asset load
				case StateValues.MAKER:
					trace('CHECKNEXTSTATE: Maker TODO');
					break;
				case StateValues.APARTMENTS:
					trace('CHECKNEXTSTATE: Apartments TODO');
					break;
				case StateValues.LOCATION:
					trace('CHECKNEXTSTATE: Location TODO');
					break;
				case StateValues.SPECIFICATION:
					trace('CHECKNEXTSTATE: Specifications TODO');
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
				if (stateProxy.currentState == null) {
					if (nextStatePath[0] != null) {
						sendNotification(ApplicationFacade.ENTER_NEXT_STATE);
					}
				}
				else {
					sendNotification(ApplicationFacade.ENTER_NEXT_STATE);
				}
			}
		}
	}
}
