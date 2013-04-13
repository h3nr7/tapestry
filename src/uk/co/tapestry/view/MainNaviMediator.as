package uk.co.tapestry.view {
	
	import uk.co.tapestry.model.State;
	import uk.co.tapestry.model.data.StateValues;
	import flash.display.Sprite;
	import uk.co.tapestry.view.SimpleMediator;

	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;

	import uk.co.tapestry.ApplicationFacade;
	import uk.co.tapestry.view.components.MainNavi;
	import uk.co.tapestry.events.MainNaviEvent;

	/**
	 * @author henryyp
	 */
	public class MainNaviMediator extends SimpleMediator implements IMediator {
		// VARIABLES -------------------------------- //
		public static const NAME:String 					= "MainNaviMediator";
		
		// CONSTRUCTOR ------------------------------ //		
		public function MainNaviMediator() {
			super(NAME);	
			
		}
		
		override public function onRegister():void {
			super.onRegister();
			viewComponent		= new MainNavi( (facade as ApplicationFacade).getContainerByName('naviMainContainer') as Sprite);
			Init();	
		}
		
		override public function listNotificationInterests():Array
		{
			return [ApplicationFacade.STATE_CHANGE_COMPLETE, ApplicationFacade.EXIT_CURRENT_STATE];
		}
		
		override public function handleNotification (notification:INotification):void {
			
			switch (notification.getName()) {
				
				case ApplicationFacade.STATE_CHANGE_COMPLETE:
					(component as MainNavi).Enable();
					break;
				case ApplicationFacade.EXIT_CURRENT_STATE:
					(component as MainNavi).Disable();
					break;
				
			}
		}
		

		// FUNCTIONS -------------------------------- //	
		
		public function Init():void {
			(component as MainNavi).addEventListener(MainNaviEvent.MAINNAV_CLICK, MainnavClickHandler);
		}
		
		private function MainnavClickHandler(mM:MainNaviEvent):void {
			
			/*var pathNames:Array;
			switch (mM.targetContent) {
				case StateValues.COMMUNICATIONS:
					pathNames = new Array(StateValues.COMMUNICATIONS);
					sendNotification(ApplicationFacade.STATE_CHANGE, new State( pathNames )); 
					break;
				case StateValues.LIVING:
					pathNames = new Array(StateValues.LIVING);
					break;
				case StateValues.TAPESTRY:
					break;
				case StateValues.NEWS:
					pathNames = new Array(StateValues.NEWS);
					break;
				case StateValues.NEWS:
					break;
				case StateValues.GALLERY:
					break;
				case StateValues.FILMS:
					break;
			}*/
			
			trace('MainNaviMediator: ' + mM.targetContent);
			if (mM.targetContent) {
				sendNotification(ApplicationFacade.STATE_CHANGE, new State( new Array(mM.targetContent) ));
			}
		}

	}
}
