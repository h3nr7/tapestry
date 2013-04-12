package uk.co.tapestry.view.components {
	
	import uk.co.tapestry.model.data.StateValues;
	import uk.co.tapestry.events.MainNaviEvent;
	import flash.events.MouseEvent;
	import uk.co.tapestry.view.INavi;
	import uk.co.tapestry.view.IComponent;
	import uk.co.tapestry.view.components.AbstractNavi;

	import flash.display.Sprite;

	/**
	 * @author henryyp
	 */
	 
	public class AbstractTapestry extends AbstractNavi implements IComponent, INavi {
		
		//tapestry buttons
		protected var _maker:Sprite;
		protected var _apartments:Sprite;
		protected var _location:Sprite;
		protected var _specifications:Sprite;
		
		public function AbstractTapestry(sS:Sprite) {
			super(sS);
			
		}
		
		//override 
		override public function Init():void {
			_maker			= _container.getChildByName('maker') as Sprite;
			_apartments		= _container.getChildByName('apartments') as Sprite;
			_location		= _container.getChildByName('location') as Sprite;
			_specifications	= _container.getChildByName('specifications') as Sprite;
		}
		
		//enable and disable when in animation mode
		override public function Enable():void {
			_maker.addEventListener(MouseEvent.CLICK, makerClickHandler);
			_apartments.addEventListener(MouseEvent.CLICK, apartmentsClickHandler);
			_location.addEventListener(MouseEvent.CLICK, locationClickHandler);
			_specifications.addEventListener(MouseEvent.CLICK, specificationsClickHandler);
		}
		
		override public function Disable():void {
			
		}
		
		// HANDLERS ------------------------------ //	
		
		protected function makerClickHandler(eE:MouseEvent):void {
			trace('mememe clicked!');
			dispatchEvent(new MainNaviEvent(MainNaviEvent.MAINNAV_CLICK, StateValues.MAKER));
		}
		
		protected function apartmentsClickHandler(eE:MouseEvent):void {
			dispatchEvent(new MainNaviEvent(MainNaviEvent.MAINNAV_CLICK, StateValues.APARTMENTS));
		}
			
		protected function locationClickHandler(eE:MouseEvent):void {
			dispatchEvent(new MainNaviEvent(MainNaviEvent.MAINNAV_CLICK, StateValues.LOCATION));
		}
		
		protected function specificationsClickHandler(eE:MouseEvent):void {
			dispatchEvent(new MainNaviEvent(MainNaviEvent.MAINNAV_CLICK, StateValues.SPECIFICATION));
		}
	}
}
