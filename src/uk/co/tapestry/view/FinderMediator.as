package uk.co.tapestry.view {
	import uk.co.tapestry.view.SimpleMediator;

	import org.puremvc.as3.interfaces.IMediator;

	/**
	 * @author henryyp
	 */
	public class FinderMediator extends SimpleMediator implements IMediator {
		
		// VARIABLES -------------------------------- //
		public static const NAME:String 					= "finderMediator";
		
		// CONSTRUCTOR ------------------------------ //	
		public function FinderMediator() {
			super(NAME);
		}
	}
}
