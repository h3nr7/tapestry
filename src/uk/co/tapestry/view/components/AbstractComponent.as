package uk.co.tapestry.view.components {
	import uk.co.tapestry.events.StateChangeEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import uk.co.tapestry.view.IComponent;

	/**
	 * @author henryyp
	 */
	public class AbstractComponent extends Sprite implements IComponent {

		// VARIABLES -------------------------------- //		
		public var _mainContainer:Sprite;
		public var _container:Sprite;


		
		// CONSTRUCTOR ------------------------------ //		
		public function AbstractComponent(sS:Sprite = null) {
			addEventListener(Event.ADDED_TO_STAGE, Init);
			
			_mainContainer = sS;
		}


		// FUNCTIONS -------------------------------- //
		
		public function Init() : void {
		}

		public function Idle() : void {
		}

		public function Kill(isSlowly : Boolean = false) : void {
			removeEventListener(Event.ADDED_TO_STAGE,Init);
		}
		
		public function onAnimationInComplete(e:Event = null):void
		{
			dispatchEvent(new StateChangeEvent(StateChangeEvent.ANIMATION_IN_COMPLETE));
			trace('message StateChangeEvent: '+StateChangeEvent.ANIMATION_IN_COMPLETE);
		}
		
		public function onAnimationOutComplete(e:Event = null):void
		{
			dispatchEvent(new StateChangeEvent(StateChangeEvent.ANIMATION_OUT_COMPLETE));
		}
		
	}
}
