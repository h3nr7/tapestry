package uk.co.tapestry.view.components {
	
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
	public class Apartments extends AbstractComponent implements IComponent {
		
		// VARIABLES -------------------------------- //
		
		private var bg:Sprite;
		private var _data:Array;

		
		// CONSTRUCTOR ------------------------------ //		
		public function Apartments(sS:Sprite, iData:Array) {
			
			super(sS);
			_data = iData;
			Init();
		}

		
		// FUNCTION ------------------------------ //		
		override public function Init():void {
			
			super.Init();
			_container 		= new AssetApartments();
			bg	 			= _container.getChildByName('bg') as Sprite;
			//TODO: when animated in
			_mainContainer.addChild(_container);
			
			//bg.alpha 				= 0.7;
			_container.alpha = 0;
			TweenMax.fromTo(_container, 0.5, {y: _container.y+30, alpha:0, ease: Elastic.easeInOut}, {y: _container.y, alpha:1, onComplete:onAnimationInComplete});
		}
		
		override public function Kill(isSlow:Boolean = false):void {
			trace('Apartments Component Killed');
			_mainContainer.removeChild(_container);
			_container = null;
			onAnimationOutComplete();
		}
					
		
	}
	
}
		
		