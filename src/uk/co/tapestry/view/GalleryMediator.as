package uk.co.tapestry.view {
	import org.puremvc.as3.interfaces.IMediator;
	import uk.co.tapestry.view.SimpleMediator;

	/**
	 * @author henryyp
	 */
	public class GalleryMediator extends SimpleMediator implements IMediator {
		
		
		// VARIABLES -------------------------------- //
		public static const NAME:String 					= "galleryMediator";
		
		// CONSTRUCTOR ------------------------------ //		
		public function GalleryMediator() {
			super(NAME);
		}
	}
}
