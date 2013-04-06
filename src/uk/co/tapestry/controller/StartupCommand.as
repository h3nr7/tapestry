package uk.co.tapestry.controller {
	
	import uk.co.tapestry.model.data.StateValues;
	import uk.co.tapestry.model.State;
	import com.greensock.loading.LoaderMax;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.interfaces.INotification;

	import uk.co.tapestry.view.MainNaviMediator;
	import uk.co.tapestry.ApplicationFacade;
	import uk.co.tapestry.model.StateProxy;

	/**
	 * @author henryyp
	 */
	public class StartupCommand extends SimpleCommand {
		
		//VARS
		var mainNav:MainNaviMediator;
		
		public function StartupCommand() {
			
		}
		
		override public function execute(notification:INotification):void {
			
			
			var finderXML:XML 			= LoaderMax.getContent((facade as ApplicationFacade).finderXMLURL());
			
			
			mainNav = new MainNaviMediator();
			facade.registerMediator(mainNav);
			
			var stateProxy:StateProxy = new StateProxy();
			facade.registerProxy(stateProxy);
			
			//begin with one of the state
			var pathNames:Array = new Array(StateValues.COMMUNICATIONS);
			sendNotification(ApplicationFacade.STATE_CHANGE, new State(pathNames));
			
			//TODO:
		
			
		}
	}
}
