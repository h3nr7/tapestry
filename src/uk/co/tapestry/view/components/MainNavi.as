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
		
		private var labels:Object 				= {
														"communications": 	"Communications",
														"living": 			"Living At \n King's Cross",
														"tapestry": 		"Tapestry",
														"finder": 			"Apartment \n Finder",
														"latest": 			"Latest News",
														"gallery": 			"Gallery",
														"films":			"Films"
													};
		


		
		// CONSTRUCTOR ------------------------------ //		
		public function MainNavi(sS:Sprite) {
			
			super(sS);
			_container = new AssetMainNavi();
			
			_mainContainer.addChild(_container);
			trace('me is showing');
			Init();
		}

		
		// FUNCTION ------------------------------ //		
		override public function Init():void {
			
			super.Init();
			
			//init main buttons
			for(var i:String in labels) {

				var tT:MainNavButtons = new MainNavButtons((_container.getChildByName(i) as Sprite), labels[i]);
				
				tT.addEventListener(MouseEvent.CLICK, NavButtonClickHandler);
				
			}
			
			//init position
			_container.x = closeX;
			(_container.getChildByName('bg') as Sprite).addEventListener(MouseEvent.CLICK, NavClickHandler);
			
		}
		
		
		// HANDLERS ------------------------------ //		
		private function NavClickHandler(eE:MouseEvent):void {
			if (_container.x >= 0) {
				TweenMax.to(_container, 0.2, {x:closeX, onComplete: Enable});
			}
			else {
				TweenMax.to(_container, 0.2, {x:openX, onComplete: Disable});
			}
		}
		
		private function NavButtonClickHandler(eE:MouseEvent):void {
			trace('meme');
			dispatchEvent(new MainNaviEvent(MainNaviEvent.MAINNAV_CLICK, {}));
		}
	}
}
