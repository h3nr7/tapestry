package uk.co.tapestry.view {
	
	import flash.display.Sprite;
	import uk.co.tapestry.view.SimpleMediator;

	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;

	import uk.co.tapestry.ApplicationFacade;
	import uk.co.tapestry.view.components.MainNavi;

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
