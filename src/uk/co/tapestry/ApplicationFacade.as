package uk.co.tapestry {
	
	
	import com.greensock.events.LoaderEvent;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.interfaces.IFacade;
	import flash.filesystem.File;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import flash.display.Sprite;
	import org.puremvc.as3.interfaces.IMediator;
	import uk.co.tapestry.controller.*;

	/**
	 * @author henryyp
	 */
	public class ApplicationFacade extends Facade implements IFacade {
		
		//VARS
		public static const STARTUP:String 					= "ApplicationFacade.STARTUP";
		
		
		private var _container:Sprite;
		private var _mediatorList:Array;
		
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
		}
		
		
		// FUNCTIONS -------------------------------- //
		public function StartUp( cC:Sprite ):void {
			
			_container = cC;
			var initAssets:LoaderMax = new LoaderMax({onComplete:onInitAssetsLoadComplete});
			initAssets.append(new XMLLoader(finderXMLURL()));
			
			initAssets.load();
			
			
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
			
		
		
		
		// HANDLERS --------------------------------- //
		
		private function onInitAssetsLoadComplete(e:LoaderEvent):void {
			
			trace('Init Assets Load Complete!');
			sendNotification(STARTUP);
		}
		
		// getters / setters ------------------------ //
		public function finderXMLURL():String {
			
			var pPath:String 	= "xml/apartmentfinder.xml";
			var file:File 		= File.applicationDirectory.resolvePath(pPath);
			return file.url;
		}
		
	}
}
