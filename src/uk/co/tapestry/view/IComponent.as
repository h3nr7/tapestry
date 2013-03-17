package uk.co.tapestry.view {
	import flash.events.IEventDispatcher;
	import flash.events.Event;
	import flash.display.Sprite;

	/**
	 * @author henryyp
	 */
	public interface IComponent extends IEventDispatcher {
		
		
		function Init():void;
		function Idle():void;
		function Kill(isSlowly:Boolean = false):void;
	}
}
