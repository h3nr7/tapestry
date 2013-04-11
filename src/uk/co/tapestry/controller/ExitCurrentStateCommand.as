package uk.co.tapestry.controller {
	import uk.co.tapestry.view.MakerMediator;
	import uk.co.tapestry.view.FilmsMediator;
	import uk.co.tapestry.view.GalleryMediator;
	import uk.co.tapestry.view.LivingMediator;
	import uk.co.tapestry.view.TapestryMediator;
	import uk.co.tapestry.view.FinderMediator;
	import uk.co.tapestry.view.NewsMediator;
	import uk.co.tapestry.view.CommunicationsMediator;
	import com.greensock.loading.ImageLoader;
	import uk.co.tapestry.model.DataProxy;
	import uk.co.tapestry.ApplicationFacade;
	import uk.co.tapestry.model.data.StateValues;
	import com.greensock.loading.LoaderStatus;
	import com.greensock.loading.LoaderMax;
	import uk.co.tapestry.model.StateProxy;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * @author henryyp
	 */
	public class ExitCurrentStateCommand extends SimpleCommand {
		
		// VARIABLES -------------------------------- //
		
		
		// FUNCTIONS -------------------------------- //
		
		override public function execute(notification:INotification):void {
			
			var stateProxy:StateProxy 		= facade.retrieveProxy(StateProxy.NAME) as StateProxy;
			var currentStatePath:Array 		= stateProxy.currentState.statePath;
			
			//choose what to exit
			if (currentStatePath != null) {
				trace('ExitCurrentStateCommand: ' + currentStatePath[0]);
				switch(currentStatePath[0]) {
					case StateValues.COMMUNICATIONS:
						trace('Exit CURRENTSTATE (COMMUNICATIONS): ' + currentStatePath[0]);
						var Comms:CommunicationsMediator = facade.retrieveMediator(CommunicationsMediator.NAME) as CommunicationsMediator;
						Comms.Kill();
						break;
					case StateValues.LIVING:
						var livingM:LivingMediator = facade.retrieveMediator(LivingMediator.NAME) as LivingMediator;
						livingM.Kill();
						break;
					case StateValues.TAPESTRY:
						var tapestryM:TapestryMediator = facade.retrieveMediator(TapestryMediator.NAME) as TapestryMediator;
						tapestryM.Kill();
						break;
					case StateValues.FINDER:
						var finderM:FinderMediator = facade.retrieveMediator(FinderMediator.NAME) as FinderMediator;
						finderM.Kill();
						break;
					case StateValues.NEWS:
						trace('Exit CURRENTSTATE (NEWS): ' + currentStatePath[0]);
						var newsM:NewsMediator = facade.retrieveMediator(NewsMediator.NAME) as NewsMediator;
						newsM.Kill();
						break;
					case StateValues.GALLERY:
						var galleryM:GalleryMediator = facade.retrieveMediator(GalleryMediator.NAME) as GalleryMediator;
						galleryM.Kill();
						break;
					case StateValues.FILMS:
						var filmsM:FilmsMediator = facade.retrieveMediator(FilmsMediator.NAME) as FilmsMediator;
						filmsM.Kill();
						break;
					case StateValues.MAKER:
						var makerM:MakerMediator = facade.retrieveMediator(MakerMediator.NAME) as MakerMediator;
						makerM.Kill();
						break;
				}
			}
			
		}
	}
}
