package uk.co.tapestry.view.components {
	
	import com.greensock.easing.Elastic;
	import uk.co.tapestry.view.INavi;
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
	public class Maker extends AbstractTapestry implements IComponent, INavi {
		
		// VARIABLES -------------------------------- //
		
		private var _data:Array;
		

		
		// CONSTRUCTOR ------------------------------ //		
		public function Maker(sS:Sprite, iData:Array) {
			
			super(sS);
			_data = iData;
			Init();
		}

		
		// FUNCTION ------------------------------ //		
		override public function Init():void {
			
			_container 		= new AssetMaker();
			super.Init();
			//TODO: when animated in
			_mainContainer.addChild(_container);
			
			//bg.alpha 				= 0.7;
			_container.alpha = 0;
			TweenMax.fromTo(_container, 0.5, {y: _container.y+30, alpha:0, ease: Elastic.easeInOut}, {y: _container.y, alpha:1, onComplete:onAnimationInComplete});
			Enable();
		}
		
		override public function Kill(isSlow:Boolean = false):void {
			trace('News Component Killed');
			_mainContainer.removeChild(_container);
			_container = null;
			Disable();
			onAnimationOutComplete();
		}
		
		override public function onAnimationInComplete(e:Event = null):void {
			super.onAnimationInComplete(e);
			
		}
					
		
	}
	
}
		
		