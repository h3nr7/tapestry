package uk.co.tapestry.view {
	import flash.events.IEventDispatcher;
	import flash.events.Event;
	import flash.display.Sprite;

	/**
	 * @author henryyp
	 */
	public interface INavi extends IEventDispatcher {
		
		
		function Enable():void;
		function Disable():void;
	}
}
