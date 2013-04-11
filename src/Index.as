package {
	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	import uk.co.tapestry.ApplicationFacade;
	/**
	 * @author henryyp - monkiki for Pipers
	 * @version 1.0
	 * @
	 */
	 
	[SWF(width='1920', height='1080', backgroundColor ='#000000', framerate='25')]
	public class Index extends Sprite {
		
		// VARS --------------------------------- //
		
		
		
		public function Index() {
			
			if (stage == null) {
				
			}
			else {
				Init();
			}
		}
		
		public function Init( e:Event = null ):void {
			
			removeEventListener(Event.ADDED_TO_STAGE, Init);
			
			stage.align 			= StageAlign.TOP_LEFT;
			stage.scaleMode 		= StageScaleMode.SHOW_ALL;
			stage.frameRate	 		= 25;
			stage.stageFocusRect	= false;
			stage.displayState 		= StageDisplayState.FULL_SCREEN_INTERACTIVE;
			
			var container:Sprite 	= new Sprite();
			container.name			= "Tapestry";
			
			addChild (container);
			
			ApplicationFacade.getInstance().StartUp( container );
		}
	}
}
