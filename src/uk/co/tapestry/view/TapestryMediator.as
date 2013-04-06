package uk.co.tapestry.view {
	import org.puremvc.as3.interfaces.IMediator;
	import uk.co.tapestry.view.SimpleMediator;

	/**
	 * @author henryyp
	 */
	public class TapestryMediator extends SimpleMediator implements IMediator {
		
		
		// VARIABLES -------------------------------- //
		public static const NAME:String 					= "tapestryMediator";
		
		// CONSTRUCTOR ------------------------------ //		
		public function TapestryMediator() {
			super(NAME);
		}
	}
}
