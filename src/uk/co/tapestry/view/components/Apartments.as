package uk.co.tapestry.view.components {
	
	import com.greensock.easing.RoughEase;
	import uk.co.tapestry.view.INavi;
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
	public class Apartments extends AbstractTapestry implements IComponent, INavi {
		
		// VARIABLES -------------------------------- //
		private var cloud:Sprite;
		private var garden:Sprite;
		private var canal:Sprite;
		
		private var cloudTxt:Sprite;
		private var gardenTxt:Sprite;
		private var canalTxt:Sprite;
		
		//private var bg:Sprite;
		private var _data:Array;

		
		// CONSTRUCTOR ------------------------------ //		
		public function Apartments(sS:Sprite, iData:Array) {
			
			super(sS);
			_data = iData;
			Init();
		}

		
		// FUNCTION ------------------------------ //		
		override public function Init():void {
			
			_container 		= new AssetApartments();
			super.Init();
			//bg	 			= _container.getChildByName('bg') as Sprite;
			//TODO: when animated in
			_mainContainer.addChild(_container);
			
			//get all variables
			canal 		= _container.getChildByName('canal') as Sprite;
			garden 		= _container.getChildByName('garden') as Sprite;
			cloud 		= _container.getChildByName('cloud') as Sprite;
			canalTxt 	= _container.getChildByName('textcanal') as Sprite;
			gardenTxt 	= _container.getChildByName('textgarden') as Sprite;
			cloudTxt	= _container.getChildByName('textcloud') as Sprite;
			
			
			//bg.alpha 				= 0.7;
			_container.alpha = 0;
			canalClickHandler();
			TweenMax.fromTo(_container, 0.5, {y: _container.y+30, alpha:0, ease: Elastic.easeInOut}, {y: _container.y, alpha:1, onComplete:onAnimationInComplete});
			Enable();
		}
		
		override public function Kill(isSlow:Boolean = false):void {
			trace('Apartments Component Killed');
			TweenMax.killAll(true, true, false);
			_mainContainer.removeChild(_container);
			_container = null;
			Disable();
			onAnimationOutComplete();
		}
		
		override public function Enable():void {
			super.Enable();
			canal.addEventListener(MouseEvent.CLICK, canalClickHandler);
			garden.addEventListener(MouseEvent.CLICK, gardenClickHandler);
			cloud.addEventListener(MouseEvent.CLICK, cloudClickHandler);
		}
		
		//navi functions
		
		private function ShowCanal():void {
			TweenMax.fromTo(canal, 0.5, {alpha:0}, {alpha:1, ease:RoughEase.create(2, 5)});
			TweenMax.fromTo(canalTxt, 0.5, {alpha:0, y:canalTxt.y+20, delay: 0.4}, {alpha:1, y:canalTxt.y});
		}
		
		private function HideCanal():void {
			TweenMax.fromTo(canal, 0.2, {alpha:1}, {alpha:0});
			canalTxt.alpha	= 0;
		}
		
		private function ShowGarden():void {
			TweenMax.fromTo(garden, 0.5, {alpha:0}, {alpha:1, ease:RoughEase.create(2, 5)});
			TweenMax.fromTo(gardenTxt, 0.5, {alpha:0, y:gardenTxt.y+20, delay: 0.4}, {alpha:1, y:gardenTxt.y});
		}
		
		private function HideGarden():void {
			TweenMax.fromTo(garden, 0.2, {alpha:1}, {alpha:0});
			gardenTxt.alpha		= 0;
		}
		
		private function ShowCloud():void {
			TweenMax.fromTo(cloud, 0.5, {alpha:0}, {alpha:1, ease:RoughEase.create(2, 5)});
			TweenMax.fromTo(cloudTxt, 0.5, {alpha:0, y:gardenTxt.y+20, delay: 0.4}, {alpha:1, y:gardenTxt.y});
		}
		
		private function HideCloud():void {
			TweenMax.fromTo(cloud, 0.2, {alpha:1}, {alpha:0, ease:RoughEase.create(1, 10)});
			cloudTxt.alpha		= 0;
		}
		
		// HANDLERS ------------------------------ //	
		
		private function canalClickHandler(eE:MouseEvent = null):void {
			TweenMax.killAll(true, true, false);
			ShowCanal();
			HideGarden();
			HideCloud();		
		}
		
		private function gardenClickHandler(eE:MouseEvent):void {
			TweenMax.killAll(true, true, false);
			HideCanal();
			ShowGarden();
			HideCloud();		
		}
		
		private function cloudClickHandler(eE:MouseEvent):void {
			TweenMax.killAll(true, true, false);
			HideCanal();
			HideGarden();
			ShowCloud();		
		}
		
	}
	
}
		
		