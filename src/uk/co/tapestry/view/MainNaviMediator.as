package uk.co.tapestry.view {
	import uk.co.tapestry.view.SimpleMediator;

	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;

	import uk.co.tapestry.ApplicationFacade;

	/**
	 * @author henryyp
	 */
	public class MainNaviMediator extends SimpleMediator implements IMediator {
		// VARIABLES -------------------------------- //
		public static const NAME:String 					= "";
		
		// CONSTRUCTOR ------------------------------ //		
		public function MainNaviMediator() {
			super(NAME);	
			
		}
		
		override public function onRegister():void {
			super.onRegister();
		}
		
		override public function handleNotification (notification:INotification):void {
			
			switch (notification.getName()) {
				
				case ApplicationFacade.STARTUP:
						trace('Main Navi Initialising');
					break;
				
			}
		}
		

		// FUNCTIONS -------------------------------- //	
		
		public function Init():void {
		
		}

	}
}
