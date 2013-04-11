package uk.co.tapestry.view.components {
	import uk.co.tapestry.view.IComponent;
	import flash.events.Event;
	import flash.display.Sprite;

	/**
	 * @author henryyp
	 */
	 
	public class AbstractSprite extends Sprite implements IComponent {
		
		public function AbstractSprite() {
		}
		
		// FUNCTIONS -------------------------------- //
		public function Init() : void {
		}

		public function Idle() : void {
		}

		public function Kill(isSlowly:Boolean = false) : void {
			removeEventListener(Event.ADDED_TO_STAGE,Init);
		}
	}
	

}
