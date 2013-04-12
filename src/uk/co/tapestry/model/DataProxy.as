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
		private var _communicationsXML:XML;
		private var _galleryXML:XML;
		private var _specificationsXML:XML;
		private var _newsXML:XML;
		
		// CONSTRUCTOR ------------------------------ //
		public function DataProxy(configX:XML, videoX:XML, finderX:XML, communicationsX:XML, galleryX:XML, specificationsX:XML, newsX:XML):void {
			super(NAME);
			
			_configXML 			= configX;
			_videoXML 			= videoX;
			_finderXML 			= finderX;
			_communicationsXML	= communicationsX;
			_galleryXML 		= galleryX;
			_specificationsXML 	= specificationsX;
			_newsXML			= newsX;
	
		}
		
		// FUNCTIONS -------------------------------- //
		public function getCommunicationsList():Array {
			var gallery:XMLList = _communicationsXML.communications.slideshow.img as XMLList;
			var output:Array 	= new Array();
			var numImg:uint		= gallery.length();
			var ig:XML;
			for (var i:uint = 0; i < numImg; i++)
			{
				ig 				= gallery[i];
				var tmp:Array 	= new Array();
				tmp['title'] 	= ig.toString();
				tmp['name']		= ig.@name;
				tmp['isvideo']	= ig.@isvideo;
				tmp['src']		= ig.@src;
				output.push(tmp);
			}
			return output;
		}
		
		public function getSpecificationsList():Array {
			var gallery:XMLList = _communicationsXML.specifications.slideshow.img as XMLList;
			var output:Array 	= new Array();
			var numImg:uint		= gallery.length();
			var ig:XML;
			for (var i:uint = 0; i < numImg; i++)
			{
				ig 				= gallery[i];
				var tmp:Array 	= new Array();
				tmp['title'] 	= ig.toString();
				tmp['name']		= ig.@name;
				tmp['isvideo']	= ig.@isvideo;
				tmp['type']		= ig.@type;
				tmp['src']		= ig.@src;
				output.push(tmp);
			}
			return output;
		}
		
		
		public function getGalleryList():Array {
			var gallery:XMLList = _galleryXML.gallery.slideshow.img as XMLList;
			var output:Array 	= new Array();
			var numImg:uint		= gallery.length();
			var ig:XML;
			for (var i:uint = 0; i < numImg; i++)
			{
				ig 				= gallery[i];
				var tmp:Array 	= new Array();
				tmp['title'] 	= ig.toString();
				tmp['name']		= ig.@name;
				tmp['isvideo']	= ig.@isvideo;
				tmp['src']		= ig.@src;
				output.push(tmp);
			}
			return output;
		}
		
		public function getNewsList():Array {
			var news:XMLList = _newsXML.news.item as XMLList;
			var output:Array = new Array();
			var num:uint		= news.length();
			var ig:XML;
			for (var i:uint = 0; i < num; i++)
			{
				ig 				= news[i];
				var tmp:Array 	= new Array();
				tmp['title'] 	= ig.title.toString();
				tmp['content']	= ig.content.toString();
				tmp['user']		= ig.user.toString();
				output.push(tmp);
			}
			return output;
		}
		
		
		// GETTERS/SETTERS -------------------------- //
		public function get configXML():XML {
			return _configXML;	
		}	
		
		
		
		// FUNCTIONS --------------------------------- //

	}
	
	
	
}
