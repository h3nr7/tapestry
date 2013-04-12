package uk.co.tapestry.view.components {
	import flash.events.Event;
	import uk.co.tapestry.view.components.AbstractComponent;

	import flash.display.Sprite;

	/**
	 * @author henryyp
	 */
	 
	 
	public class ScalableMap extends AbstractSprite {
		
		// VARIABLES -------------------------------- //
		private var _mainContainer:Sprite;
		private var scalablemap:Sprite;
		private var overlay:Sprite;
		private var map:Sprite;
		private var control:Sprite;
		private var plus:Sprite;
		private var minus:Sprite;
		private var mapmask:Sprite;
		private var numHotspot:uint			= 1;
		private var hotspotinvi:Array;
		private var hotspotbox:Array;
		
		public function ScalableMap() {

		}
		
		// FUNCTIONS -------------------------------- //
		
		override public function Init() : void {
			_mainContainer		= new AssetScalableMap();
			//mask
			mapmask 				= _mainContainer.getChildByName('mapmask') as Sprite;
			//overlay hotspot infobox
			overlay				= _mainContainer.getChildByName('overlay') as Sprite;
			//getting all the hotspots boxes
			hotspotbox 	= new Array();
			for (var i:uint=0; i<numHotspot; i++) {
				//TODO: Create hotspots
				//var tmp:Sprite		= scalablemap.getChildByName('hotspotbox'+i) as Sprite;
				//hotspotbox[i] = tmp;
			}
			
			//map
			scalablemap 		= _mainContainer.getChildByName('scalablemap') as Sprite;
			map					= scalablemap.getChildByName('map') as Sprite;
			//controls
			control 			= _mainContainer.getChildByName('control') as Sprite;
			plus 				= control.getChildByName('plus') as Sprite;
			minus				= control.getChildByName('minus') as Sprite;
			
			//hotspots 
			hotspotinvi			= new Array();
			//getting all the hotspots
			for (var i:uint=0; i<numHotspot; i++) {
				var tmp:Sprite		= scalablemap.getChildByName('hotspot'+i+'invi') as Sprite;
				
				hotspotinvi[i] = tmp;
			}
			
			this.addChild(_mainContainer);
			//set position
			this.x = 423;
			this.y = 44;
			//TODO: ScalableMap add all listener
		}

		override public function Kill(isSlowly : Boolean = false) : void {
			
		}
	}
}
