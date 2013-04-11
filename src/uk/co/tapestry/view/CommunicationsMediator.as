package uk.co.tapestry.view {
	
	import flash.events.MouseEvent;
	import uk.co.tapestry.events.StateChangeEvent;
	import uk.co.tapestry.view.components.AbstractComponent;
	import flash.events.Event;
	import uk.co.tapestry.model.DataProxy;
	import uk.co.tapestry.model.LoaderProxy;
	import uk.co.tapestry.view.components.Communications;
	import flash.display.Sprite;
	import uk.co.tapestry.view.SimpleMediator;

	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;

	import uk.co.tapestry.ApplicationFacade;
	import uk.co.tapestry.view.components.MainNavi;

	/**
	 * @author henryyp
	 */
	public class CommunicationsMediator extends SimpleMediator implements IMediator {
		// VARIABLES -------------------------------- //
		public static const NAME:String 					= "CommunicationsMediator";
		
		// CONSTRUCTOR ------------------------------ //		
		public function CommunicationsMediator() {
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
			viewComponent		= new Communications( ((facade as ApplicationFacade).getContainerByName('mainContainer') as Sprite), dD.getCommunicationsList());
			(component as Communications).addEventListener(StateChangeEvent.ANIMATION_IN_COMPLETE, onAnimationInComplete);
			(component as Communications).addEventListener(StateChangeEvent.ANIMATION_OUT_COMPLETE, onAnimationOutComplete);	
		}
		
		public function Kill():void {
			(component as Communications).Kill();
		}
		
		// HANDLERS --------------------------------- //	
		
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
