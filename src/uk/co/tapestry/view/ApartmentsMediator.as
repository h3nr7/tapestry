package uk.co.tapestry.view {
	import uk.co.tapestry.model.State;
	import uk.co.tapestry.events.MainNaviEvent;
	import uk.co.tapestry.view.components.Apartments;
	import uk.co.tapestry.events.StateChangeEvent;
	import flash.display.Sprite;
	import uk.co.tapestry.view.components.Living;
	import uk.co.tapestry.model.DataProxy;
	import org.puremvc.as3.interfaces.INotification;
	import uk.co.tapestry.ApplicationFacade;
	import org.puremvc.as3.interfaces.IMediator;
	import uk.co.tapestry.view.SimpleMediator;

	/**
	 * @author henryyp
	 */
	public class ApartmentsMediator extends SimpleMediator implements IMediator {
		
		
		// VARIABLES -------------------------------- //
		public static const NAME:String 					= "apartmentsMediator";
		
		// CONSTRUCTOR ------------------------------ //		
		public function ApartmentsMediator() {
			super(NAME);
		}
			
		override public function onRegister():void {
			super.onRegister();	
		}
		
		override public function listNotificationInterests():Array
		{
			return [ApplicationFacade.EXIT_CURRENT_STATE];
		}
		
		override public function handleNotification (notification:INotification):void {
			
			switch (notification.getName()) {
				
				case ApplicationFacade.EXIT_CURRENT_STATE:
					break;
				
			}
		}
		
		// FUNCTIONS -------------------------------- //	
		
		public function Init():void {
			var dD:DataProxy 	= facade.retrieveProxy(DataProxy.NAME) as DataProxy;	
			viewComponent		= new Apartments( ((facade as ApplicationFacade).getContainerByName('mainContainer') as Sprite), dD.getNewsList());
			(component as Apartments).addEventListener(MainNaviEvent.MAINNAV_CLICK, MainnavClickHandler);
			(component as Apartments).addEventListener(StateChangeEvent.ANIMATION_IN_COMPLETE, onAnimationInComplete);
			(component as Apartments).addEventListener(StateChangeEvent.ANIMATION_OUT_COMPLETE, onAnimationOutComplete);	
			trace('News Mediator Init');
		}
		
		public function Kill():void {
			(component as Apartments).Kill();
			(component as Apartments).removeEventListener(MainNaviEvent.MAINNAV_CLICK, MainnavClickHandler);
		}
		
		// HANDLERS --------------------------------- //	
		
		private function MainnavClickHandler(mM:MainNaviEvent):void {
			
			trace('TapestryMediator: ' + mM.targetContent);
			//TODO: Tapestry Sub Navi
			if (mM.targetContent) {
				sendNotification(ApplicationFacade.STATE_CHANGE, new State( new Array(mM.targetContent) ));
			}
		}
		
		private function onAnimationInComplete(e:StateChangeEvent):void {
			component.removeEventListener(StateChangeEvent.ANIMATION_IN_COMPLETE, onAnimationInComplete);
			sendNotification(ApplicationFacade.STATE_CHANGE_COMPLETE);
		}
		
		private function onAnimationOutComplete(e:StateChangeEvent):void {
			component.removeEventListener(StateChangeEvent.ANIMATION_OUT_COMPLETE, onAnimationOutComplete);
			sendNotification(ApplicationFacade.CHECK_NEXT_STATE);
		}
		
		
	}
}
