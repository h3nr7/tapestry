package uk.co.tapestry.controller {
	import uk.co.tapestry.model.LoaderProxy;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	import uk.co.tapestry.ApplicationFacade;
	
	/**
	 * @author henryyp
	 */
	public class LoadCommand extends SimpleCommand {
			
		// VARIABLES -------------------------------- //
		
		// FUNCTIONS -------------------------------- //	
		override public function execute(notification:INotification):void {
			
			//TODO: LoadCommand Loading Type
			
			var loaderProxy:LoaderProxy 		= facade.retrieveProxy(LoaderProxy.NAME) as LoaderProxy;
			if (loaderProxy == null) {
				loaderProxy = new LoaderProxy();
				facade.registerProxy(loaderProxy);
			}
			
			loaderProxy.load(notification.getBody().queue, notification.getBody().onCompleteNote, notification.getBody().onCompleteNoteBody);
			

		}
	}
}
