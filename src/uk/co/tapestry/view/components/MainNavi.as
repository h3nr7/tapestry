package uk.co.tapestry.view.components {
	
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
	public class MainNavi extends AbstractNavi implements IComponent {
		
		
		// VARIABLES -------------------------------- //
		public var closeX:Number 				= -250;
		public var openX:Number 				= 0;
		private var labels:Object;
		private var tT:Array;
		private var bg:Sprite;


		
		// CONSTRUCTOR ------------------------------ //		
		public function MainNavi(sS:Sprite) {
			
			labels		= {
								"communications": 	"Communications",
								"living": 			"Living At \n King's Cross",
								"tapestry": 		"Tapestry",
								"finder": 			"Apartment \n Finder",
								"news": 			"Latest News",
								"gallery": 			"Gallery",
								"films":			"Films"
							};
			
			super(sS);
			_container = new AssetMainNavi();
			
			_mainContainer.addChild(_container);
			trace('me is showing');
			Init();
		}

		
		// FUNCTION ------------------------------ //		
		override public function Init():void {
			
			super.Init();
			
			tT 		= new Array();
			//init main buttons
			for(var i:String in labels) {
				var tmp:MainNavButtons 	= new MainNavButtons((_container.getChildByName(i) as Sprite), labels[i]);
				tT[i] 					= tmp;
			}
			
			//init position
			_container.x 			= closeX;
			bg 						= _container.getChildByName('bg') as Sprite;
			Enable();
		}
		
		override public function Enable():void {
			//enable
			for(var i:String in labels) {
				tT[i].container.addEventListener(MouseEvent.CLICK, NavButtonClickHandler);
			}
			bg.addEventListener(MouseEvent.CLICK, NavClickHandler);
		}
		
		override public function Disable():void {
			//disable
			for(var i:String in labels) {
				tT[i].container.removeEventListener(MouseEvent.CLICK, NavButtonClickHandler);
			}
			bg.removeEventListener(MouseEvent.CLICK, NavClickHandler);
		}
		
		
		// HANDLERS ------------------------------ //		
		private function NavClickHandler(eE:MouseEvent):void {
			if (_container.x >= 0) {
				TweenMax.to(_container, 0.2, {x:closeX, onStart: Disable, onComplete: Enable});
			}
			else {
				TweenMax.to(_container, 0.2, {x:openX, onStart: Disable, onComplete: Enable});
			}
		}
		
		private function NavButtonClickHandler(eE:MouseEvent):void {
			trace('Main Navi Button Click: '+eE.currentTarget.name);
			dispatchEvent(new MainNaviEvent(MainNaviEvent.MAINNAV_CLICK, eE.currentTarget.name));
		}
	}
}
