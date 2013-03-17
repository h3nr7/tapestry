package uk.co.tapestry.controller {
	
	import com.greensock.loading.LoaderMax;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.interfaces.INotification;

	import uk.co.tapestry.ApplicationFacade;

	/**
	 * @author henryyp
	 */
	public class StartupCommand extends SimpleCommand {
		
		public function StartupCommand() {
			
		}
		
		override public function execute(notification:INotification):void {
			
			
			var finderXML:XML 			= LoaderMax.getContent((facade as ApplicationFacade).finderXMLURL());
			
		}
	}
}
