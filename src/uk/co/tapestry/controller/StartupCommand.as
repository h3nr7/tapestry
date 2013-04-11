package uk.co.tapestry.controller {
	
	import uk.co.tapestry.model.DataProxy;
	import uk.co.tapestry.view.CommunicationsMediator;
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

			//XML data proxy
			var configXML:XML 			= LoaderMax.getContent((facade as ApplicationFacade).configXMLURL());
			var videoXML:XML 			= LoaderMax.getContent((facade as ApplicationFacade).videoXMLURL());
			var finderXML:XML 			= LoaderMax.getContent((facade as ApplicationFacade).finderXMLURL());
			var communicationsXML:XML 	= LoaderMax.getContent((facade as ApplicationFacade).communicationsXMLURL());
			var galleryXML:XML 			= LoaderMax.getContent((facade as ApplicationFacade).galleryXMLURL());
			trace(galleryXML);
			var dataProxy:DataProxy 		= new DataProxy(configXML, videoXML, finderXML, communicationsXML, galleryXML);
			facade.registerProxy(dataProxy);
			
			//main navi mediator
			mainNav = new MainNaviMediator();
			facade.registerMediator(mainNav);
			
			//state proxy
			var stateProxy:StateProxy = new StateProxy();
			facade.registerProxy(stateProxy);
			
			//begin with one of the state
			var pathNames:Array = new Array(StateValues.COMMUNICATIONS);
			sendNotification(ApplicationFacade.STATE_CHANGE, new State(pathNames));
			
		
			
		}
	}
}
