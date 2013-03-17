package uk.co.tapestry.view.components {
	import flash.display.Sprite;
	import flash.events.Event;
	import uk.co.tapestry.view.IComponent;

	/**
	 * @author henryyp
	 */
	public class AbstractComponent extends Sprite implements IComponent {
		
		public static const ANIMATION_IN_COMPLETE:String 		= "ANIMATION_IN_COMPLETE";
		public static const ANIMATION_OUT_COMPLETE:String		= "ANIMATION_OUT_COMPLETE";

		
		public function AbstractComponent() {
			addEventListener(Event.ADDED_TO_STAGE, Init);
		}

		public function Init() : void {
		}

		public function Idle() : void {
		}

		public function Kill(isSlowly : Boolean = false) : void {
			removeEventListener(Event.ADDED_TO_STAGE,Init);
			stage.addEventListener(Event.RESIZE, onResize);
		}
		
		protected function onResize(e:Event=null):void {
			
		}
	}
}
