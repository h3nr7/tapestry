package uk.co.tapestry.view {
	import uk.co.tapestry.model.State;
	import uk.co.tapestry.events.MainNaviEvent;
	import uk.co.tapestry.view.components.MainNavButtons;
	import uk.co.tapestry.view.components.Maker;
	import uk.co.tapestry.events.StateChangeEvent;
	import flash.display.Sprite;
	import uk.co.tapestry.view.components.Films;
	import uk.co.tapestry.model.DataProxy;
	import org.puremvc.as3.interfaces.INotification;
	import uk.co.tapestry.ApplicationFacade;
	import org.puremvc.as3.interfaces.IMediator;
	import uk.co.tapestry.view.SimpleMediator;

	/**
	 * @author henryyp
	 */
	public class MakerMediator extends SimpleMediator implements IMediator {
		
		
		// VARIABLES -------------------------------- //
		public static const NAME:String 					= "makerMediator";
		
		// CONSTRUCTOR ------------------------------ //		
		public function MakerMediator() {
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
			viewComponent		= new Maker( ((facade as ApplicationFacade).getContainerByName('mainContainer') as Sprite), dD.getNewsList());
			(component as Maker).addEventListener(MainNaviEvent.MAINNAV_CLICK, MainnavClickHandler);
			(component as Maker).addEventListener(StateChangeEvent.ANIMATION_IN_COMPLETE, onAnimationInComplete);
			(component as Maker).addEventListener(StateChangeEvent.ANIMATION_OUT_COMPLETE, onAnimationOutComplete);	
			trace('Maker Mediator Init');
		}
		
		public function Kill():void {
			(component as Maker).Kill();
			(component as Maker).removeEventListener(MainNaviEvent.MAINNAV_CLICK, MainnavClickHandler);
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
