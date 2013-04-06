package uk.co.tapestry.view {

	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;

	/**
	 * @author henryyp
	 */
	public class SimpleMediator extends Mediator implements IMediator {


		// VARIABLES -------------------------------- //
		
		// CONSTRUCTOR ------------------------------ //		
		public function SimpleMediator(mediatorName:String=null, viewComponent:Object=null) {
			super(mediatorName, viewComponent);
		}
		
		public function kill():void {
			viewComponent = null;
			facade.removeMediator(mediatorName);
		}
		

		// FUNCTIONS -------------------------------- //	

		protected function get component():IComponent {
			
			return viewComponent as IComponent;
		}
	}
}
