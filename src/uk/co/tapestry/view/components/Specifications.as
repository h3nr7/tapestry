package uk.co.tapestry.view.components {
	
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
	public class Specifications extends AbstractTapestry implements IComponent, INavi {
		
		// VARIABLES -------------------------------- //
		
		//private var bg:Sprite;
		private var _data:Array;
		private var _slideShow:Slideshow;

		
		// CONSTRUCTOR ------------------------------ //		
		public function Specifications(sS:Sprite, iData:Array) {
			
			super(sS);
			_data = iData;
			Init();
		}

		
		// FUNCTION ------------------------------ //		
		override public function Init():void {
			
			_container 		= new AssetSpecifications();
			super.Init();
			//bg	 			= _container.getChildByName('bg') as Sprite;
			
			_slideShow		= new Slideshow(_data);
			_slideShow.Init();
			
			//TODO: setup slideshow component

			
			_mainContainer.addChild(_container);
			_container.addChild(_slideShow);
			_container.alpha = 0;
			//TODO: when animated in
			TweenMax.fromTo(_container, 0.5, {y: _container.y+30, alpha:0, ease: Elastic.easeInOut}, {y: _container.y, alpha:1, onComplete:onAnimationInComplete});
			Enable();
		}
		
		override public function Kill(isSlow:Boolean = false):void {
			trace('Specifications Component Killed');
			_slideShow.Kill();
			_container.removeChild(_slideShow);
			_mainContainer.removeChild(_container);
			_container = null;
			Disable();
			onAnimationOutComplete();
		}
					
		
	}
	
}
		
		