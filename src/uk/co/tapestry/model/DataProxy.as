package uk.co.tapestry.model {
	import org.puremvc.as3.patterns.proxy.Proxy;
	import uk.co.tapestry.ApplicationFacade;
	/**
	 * @author henryyp
	 */
	 
	public class DataProxy extends Proxy {
		
		// VARIABLES -------------------------------- //
		public static const NAME:String			= "dataProxy";
		
		private var _configXML:XML;
		private var _finderXML:XML;
		private var _videoXML:XML;
		private var _slideshowXML:XML;
		private var _galleryXML:XML;
		
		// CONSTRUCTOR ------------------------------ //
		public function DataProxy(configX:XML, videoX:XML, finderX:XML, slideshowX:XML, galleryX:XML):void {
			super(NAME);
			
			_configXML 			= configX;
			_videoXML 			= videoX;
			_finderXML 			= finderX;
			_slideshowXML		= slideshowX;
			_galleryXML 		= galleryX;
	
		}
		
		// FUNCTIONS -------------------------------- //
		
		
		
		// GETTERS/SETTERS -------------------------- //
		public function get configXML():XML {
			return _configXML;	
		}		
		
		
		// FUNCTIONS --------------------------------- //

	}
	
	
	
}
