package uk.co.tapestry.view {
	import org.puremvc.as3.interfaces.IMediator;
	import uk.co.tapestry.view.SimpleMediator;

	/**
	 * @author henryyp
	 */
	public class NewsMediator extends SimpleMediator implements IMediator {
		
		
		// VARIABLES -------------------------------- //
		public static const NAME:String 					= "newsMediator";
		
		// CONSTRUCTOR ------------------------------ //		
		public function NewsMediator() {
			super(NAME);
		}
	}
}
