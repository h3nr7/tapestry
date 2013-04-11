package uk.co.tapestry.view.components {
	import flash.display.Sprite;
	import com.greensock.TweenMax;
	
	/**
	 * @author henryyp
	 */
	public class Buttons extends Sprite {
		
		// VARIABLES -------------------------------- //
		
		private var _upStateAlpha:Number;
		private var _downStateAlpha:Number;
		
		public var _container:Sprite;
		
		// CONSTRUCTOR ------------------------------ //
		public function Buttons(cC:Sprite) {
			super();	
			_container 	= cC;
			alpha = upStateAlpha;
		}
		
		// FUNCTIONS -------------------------------- //
		
		public function enable():void {
			TweenMax.to(this, .5, {alpha:downStateAlpha});
			mouseEnabled = true;
		}
		
		public function disable():void {
			TweenMax.to(this, .5, {alpha:upStateAlpha});
			mouseEnabled = false;
		}
		
		public function setSelected():void {
			disable();
		}
		
		public function kill():void {
			
			TweenMax.killTweensOf(this);
			
			while (numChildren > 0) {
				removeChildAt(0);
			}
		}
		
		// GETTERS/SETTERs --------------------------- //
		
		public function get upStateAlpha():Number {
			return _upStateAlpha || 0.6;	
		}
		
		public function set upStateAlpha(value:Number):void {
			_upStateAlpha = value;
		}
		
		public function get downStateAlpha():Number {
			return _downStateAlpha || 1;
		}
		
		public function set downStateAlpha(value:Number):void {
			_downStateAlpha = value;
		}
		
		public function get container():Sprite {
			return _container;
		}
		
	}
}
