package uk.co.tapestry.view.components {
	
	import uk.co.tapestry.model.data.StateValues;
	import com.greensock.easing.Elastic;
	import uk.co.tapestry.events.StateChangeEvent;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.*;

	import com.greensock.TweenMax;
	import uk.co.tapestry.view.components.AbstractComponent;
	import uk.co.tapestry.view.IComponent;
	
	import uk.co.tapestry.view.components.MainNavButtons;
	import uk.co.tapestry.events.MainNaviEvent;
	

	/**
	 * @author henryyp
	 */
	public class Tapestry extends AbstractNavi implements IComponent {
		
		// VARIABLES -------------------------------- //
		
		private var bg:Sprite;
		private var _data:Array;
		//tapestry buttons
		private var _maker:Sprite;
		private var _apartments:Sprite;
		private var _location:Sprite;
		private var _specifications:Sprite;

		
		// CONSTRUCTOR ------------------------------ //		
		public function Tapestry(sS:Sprite, iData:Array) {
			
			super(sS);
			_data = iData;
			Init();
		}

		
		// FUNCTION ------------------------------ //		
		override public function Init():void {
			
			super.Init();
			_container 		= new AssetTapestryMain();
			bg	 			= _container.getChildByName('bg') as Sprite;
			_maker			= _container.getChildByName('maker') as Sprite;
			_apartments		= _container.getChildByName('apartment') as Sprite;
			_location		= _container.getChildByName('location') as Sprite;
			_specifications	= _container.getChildByName('specifications') as Sprite;
			//TODO: when animated in
			_mainContainer.addChild(_container);
			
			//bg.alpha 				= 0.7;
			_container.alpha = 0;
			TweenMax.fromTo(_container, 0.5, {x: _container.x+30, alpha:0, ease: Elastic.easeInOut}, {x: _container.x, alpha:1, onComplete:onAnimationInComplete});
			Enable();
		}
		
		override public function Kill(isSlow:Boolean = false):void {
			trace('Tapestry Component Killed');
			_mainContainer.removeChild(_container);
			_container = null;
			Disable();
			onAnimationOutComplete();
		}
		
		//enable and disable when in animation mode
		override public function Enable():void {
			_maker.addEventListener(MouseEvent.CLICK, makerClickHandler);
		}
		
		override public function Disable():void {
			
		}
		
		
		// HANDLERS ------------------------------ //	
		
		private function makerClickHandler(eE:MouseEvent):void {
			dispatchEvent(new MainNaviEvent(MainNaviEvent.MAINNAV_CLICK, StateValues.MAKER));
		}
		
		private function apartmentsClickHandler(eE:MouseEvent):void {
			
		}
			
		private function locationClickHandler(eE:MouseEvent):void {
					
		}
		
		private function specificationsClickHandler(eE:MouseEvent):void {
			
		}
		
	}
	
}
		
		