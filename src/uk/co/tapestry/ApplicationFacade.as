package uk.co.tapestry {
	
	import flash.display.Bitmap;
	import com.greensock.events.LoaderEvent;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.interfaces.IFacade;
	import flash.filesystem.File;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import flash.display.Sprite;
	import org.puremvc.as3.interfaces.IMediator;
	import uk.co.tapestry.controller.*;
	
	import net.hires.debug.Stats;

	/**
	 * @author henryyp
	 */
	public class ApplicationFacade extends Facade implements IFacade {
		
		// VARIABLES -------------------------------- //
		[Embed(source="../assets/AssetDefault.bg.jpg")]
		private var DefaultBG : Class;
		//States
		public static const STARTUP:String 					= "ApplicationFacade.STARTUP";
		public static const STATE_CHANGE:String 			= "ApplicationFacade.STATE_CHANGE";
		public static const CHECK_NEXT_STATE:String 		= "ApplicationFacade.CHECK_NEXT_STATE";
		public static const LOAD:String	 					= "ApplicationFacade.LOAD";
		
		//Containers
		private var _container:Sprite;
		private var _mainContainer:Sprite;
		private var _naviMainContainer:Sprite;
		private var _navi2Container:Sprite;
		private var _navi3Container:Sprite;
		private var _mediatorList:Array 					= new Array();
		
		// CONSTRUCTOR ------------------------------ //
		public static function getInstance():ApplicationFacade {
			if ( instance == null ) instance = new ApplicationFacade();
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void {
			super.initializeController();
			//init all controllers
			// REGESTER Controllers HERE -------------- //
			registerCommand(STARTUP, StartupCommand);
			registerCommand(STATE_CHANGE, StateChangeCommand);
			registerCommand(CHECK_NEXT_STATE, CheckNextStateCommand);

		}
		
		
		// FUNCTIONS -------------------------------- //
		public function StartUp( cC:Sprite ):void {
			
			_container = cC;
			AssignContainers();
			var initAssets:LoaderMax = new LoaderMax({onComplete:onInitAssetsLoadComplete});
			initAssets.append(new XMLLoader(configXMLURL()));
			initAssets.append(new XMLLoader(videoXMLURL()));
			initAssets.append(new XMLLoader(finderXMLURL()));
			initAssets.append(new XMLLoader(slideshowXMLURL()));
			initAssets.append(new XMLLoader(galleryXMLURL()));
			
			initAssets.load();
			
			
		}
		
		private function AssignContainers() :void {
			
			//create background
			var dbg:Bitmap = new DefaultBG();
			dbg.x = 0;
			dbg.y = 0;
            _container.addChild(dbg);
			
			//create Main
			_mainContainer 					= new Sprite();
			_mainContainer.name 			= "mainContainer";
			_container.addChild(_mainContainer);
			
			//create main Navi
			_navi3Container 				= new Sprite();
			_navi3Container.name 			= "navi3Container";
			_container.addChild(_navi3Container);
			

			//create main Navi
			_navi2Container 				= new Sprite();
			_navi2Container.name 			= "navi2Container";
			_container.addChild(_navi2Container);
			
			//create main Navi
			_naviMainContainer 				= new Sprite();
			_naviMainContainer.name 		= "naviMainContainer";
			_container.addChild(_naviMainContainer);			
			
			//STATS
			_container.addChild( new Stats());			
		}
		
		override public function registerMediator(mediator:IMediator):void {
			_mediatorList.push(mediator.getMediatorName());
			super.registerMediator(mediator);
		}
		
		override public function removeMediator(mediatorName:String):IMediator {
			
			var spliceIndex:int = -1;
			for (var i:uint=0; i<_mediatorList.length; i++){
				if (_mediatorList[i] == mediatorName) {
					spliceIndex = i;
				}
			}
			_mediatorList.splice(spliceIndex, 1);
			return super.removeMediator(mediatorName);
		}
		
		public function listMediators():void {
			
			trace ( '// ----------------------------------------- //');
			trace ( 'registered mediators:');
			for (var i:uint=0; i< _mediatorList.length; i++) {
				trace (_mediatorList[i]);
			}
			trace ( '// ----------------------------------------- //');
		}
		
		public function getContainerByName(sS:String):Sprite {
			
			var sP:Sprite = _container.getChildByName(sS) as Sprite;
			return sP;
		}
			
		
		
		// GETTERS/SETTERs -------------------------- //
		
		
		// HANDLERS --------------------------------- //
		
		private function onInitAssetsLoadComplete(e:LoaderEvent):void {
			
			trace('Init Assets Load Complete!');
			sendNotification(STARTUP);
		}
		
		// getters / setters ------------------------ //
		public function configXMLURL():String {
			
			var pPath:String 	= "xml/config.xml";
			var file:File 		= File.applicationDirectory.resolvePath(pPath);
			return file.url;
		}
		
		public function videoXMLURL():String {
			
			var pPath:String 	= "xml/video.xml";
			var file:File 		= File.applicationDirectory.resolvePath(pPath);
			return file.url;
		}
		public function finderXMLURL():String {
			
			var pPath:String 	= "xml/apartmentfinder.xml";
			var file:File 		= File.applicationDirectory.resolvePath(pPath);
			return file.url;
		}
		
		public function slideshowXMLURL():String {
			
			var pPath:String 	= "xml/slideshow.xml";
			var file:File 		= File.applicationDirectory.resolvePath(pPath);
			return file.url;
		}
		
		public function galleryXMLURL():String {
			
			var pPath:String 	= "xml/gallery.xml";
			var file:File 		= File.applicationDirectory.resolvePath(pPath);
			return file.url;
		}
		
	}
}
