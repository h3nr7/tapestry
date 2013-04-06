package uk.co.tapestry.model {
	import com.greensock.loading.SWFLoader;
	import com.greensock.loading.core.LoaderItem;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import org.puremvc.as3.patterns.proxy.Proxy;

	/**
	 * @author henryyp
	 */
	public class LoaderProxy extends Proxy {
		
		// VARIABLES -------------------------------- //
		public static const NAME:String						= "loaderProxy";
		public static const LOAD_START:String				= "LoaderProxy.LOAD_START";
		public static const LOAD_PROGRESS:String			= "LoaderProxy.LOAD_PROGRESS";		
		public static const LOAD_COMPLETE:String	 		= "LoaderProxy.LOAD_COMPLETE";
		public static const LOAD_ERROR:String				= "LoaderProxy.LOAD_ERROR";
		private var _loader:LoaderMax;
		
		private var _onCompleteNote:String;
		private var _onCompleteNoteBody:Object;
		
		// CONSTRUCTOR ------------------------------ //
		public function LoaderProxy() {
			super(NAME);
			
			_loader 		= new LoaderMax({name:"mainLoader", onOpen: onOpen, onError: onError, onProgress: onProgress, onComplete: onComplete});
			
		}
		
		// FUNCTIONS -------------------------------- //
		
		public function load(queue:LoaderMax, onCompleteNote:String, onCompleteNoteBody:Object):void {
			
			_onCompleteNote 		= onCompleteNote;
			_onCompleteNoteBody	 	= onCompleteNoteBody;
			
			_loader.append(queue);
			_loader.load();
			
			queue.prioritize(true);
		}
		
		public function kill():void {
			
			_loader.dispose(true);
			_loader  			= null;
			_onCompleteNote 	= null;
			_onCompleteNoteBody	= null;
			
			facade.removeProxy(NAME);	
		}
		
		
		// HANLDERS --------------------------------- //
		private function onOpen(e:LoaderEvent):void {
			sendNotification(LOAD_START);
		}
		
		private function onError(e:LoaderEvent):void {
			trace(e);
		}
		
		private function onProgress(e:LoaderEvent):void {
			sendNotification(LOAD_PROGRESS, {loaded:_loader.bytesLoaded, total:_loader.bytesTotal, progress:_loader.progress});
		}
		
		private function onComplete(e:LoaderEvent):void {
			
			sendNotification(_onCompleteNote, _onCompleteNoteBody);
		}
	}
}
