package uk.co.tapestry.controller {
	import uk.co.tapestry.view.components.Location;
	import uk.co.tapestry.view.SpecificationsMediator;
	import uk.co.tapestry.view.LocationMediator;
	import uk.co.tapestry.view.ApartmentsMediator;
	import uk.co.tapestry.view.MakerMediator;
	import uk.co.tapestry.view.FilmsMediator;
	import uk.co.tapestry.view.GalleryMediator;
	import uk.co.tapestry.view.FinderMediator;
	import uk.co.tapestry.view.TapestryMediator;
	import uk.co.tapestry.view.LivingMediator;
	import uk.co.tapestry.view.NewsMediator;
	import uk.co.tapestry.ApplicationFacade;
	import uk.co.tapestry.model.data.StateValues;
	import uk.co.tapestry.model.StateProxy;
	import org.puremvc.as3.interfaces.INotification;
	import uk.co.tapestry.view.CommunicationsMediator;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * @author henryyp
	 */
	public class EnterNextStateCommand extends SimpleCommand {
		public function EnterNextStateCommand() {
		}
		
		
		override public function execute(notification:INotification):void
		{		
			var stateProxy:StateProxy = facade.retrieveProxy(StateProxy.NAME) as StateProxy;
			var nextStatePath:Array = stateProxy.nextState.statePath;	
			
			var communicationMediator:CommunicationsMediator;
			var newsMediator:NewsMediator;
			var livingMediator:LivingMediator;
			var tapestryMediator:TapestryMediator;
			var finderMediator:FinderMediator;
			var galleryMediator:GalleryMediator;
			var filmsMediator:FilmsMediator;
			//Secondary Navi
			var makerMediator:MakerMediator;
			var apartmentsMediator:ApartmentsMediator;
			var locationMediator:LocationMediator;
			var specificationsMediator:SpecificationsMediator;
			
			trace('EnterNextStateCommand (CurrentState): ' + stateProxy.currentState);
			if (stateProxy.currentState == null) {	
				//default when startup
				//TODO: react to main menu
				trace('ENTERNEXTSTATE with null currentState: ' + nextStatePath[0]);
				switch (nextStatePath[0]) {	
					case StateValues.COMMUNICATIONS:
					case StateValues.LIVING:
					case StateValues.TAPESTRY:
					case StateValues.FINDER:
					case StateValues.NEWS:
					case StateValues.GALLERY:
					case StateValues.FILMS:
					case StateValues.MAKER:
					case StateValues.APARTMENTS:
					case StateValues.LOCATION:
					case StateValues.SPECIFICATION:
						trace('ENTERNEXTSTATE (if) (COMMUNICATIONS): ' + nextStatePath[0]);
						//Communications
						communicationMediator = new CommunicationsMediator();
						facade.registerMediator(communicationMediator);
						//Living
						livingMediator = new LivingMediator();
						facade.registerMediator(livingMediator);
						//Tapestry
						tapestryMediator = new TapestryMediator();
						facade.registerMediator(tapestryMediator);
						//Finder
						finderMediator = new FinderMediator();
						facade.registerMediator(finderMediator);
						//News
						trace('ENTERNEXTSTATE (if) (NEWS): ' + nextStatePath[0]);
						newsMediator = new NewsMediator();
						facade.registerMediator(newsMediator);
						//Gallery
						galleryMediator = new GalleryMediator();
						facade.registerMediator(galleryMediator);
						//Films - default
						filmsMediator = new FilmsMediator();
						facade.registerMediator(filmsMediator);
						filmsMediator.Init();
						//Secondary navi
						//Maker
						makerMediator = new MakerMediator();
						facade.registerMediator(makerMediator);
						//Apartments
						apartmentsMediator = new ApartmentsMediator();
						facade.registerMediator(apartmentsMediator);
						//Location
						locationMediator = new LocationMediator();
						facade.registerMediator(locationMediator);
						//Specifications
						specificationsMediator = new SpecificationsMediator();
						facade.registerMediator(specificationsMediator);
						break;
				}
			}	
			else {
				//TODO: react to main menu
				trace('ENTERNEXTSTATE with currentState as : ' + stateProxy.currentState + ' and nextState as '+ nextStatePath[0]);
				switch (nextStatePath[0]) {	
					case StateValues.COMMUNICATIONS:
						trace('ENTERNEXTSTATE (COMMUNICATIONS): ' + nextStatePath[0]);
						communicationMediator = facade.retrieveMediator(CommunicationsMediator.NAME) as CommunicationsMediator;
						communicationMediator.Init();
						break;
					case StateValues.LIVING:
						livingMediator = facade.retrieveMediator(LivingMediator.NAME) as LivingMediator;
						livingMediator.Init();
						break;
					case StateValues.TAPESTRY:
						tapestryMediator = facade.retrieveMediator(TapestryMediator.NAME) as TapestryMediator;
						tapestryMediator.Init();
						break;
					case StateValues.FINDER:
						finderMediator = facade.retrieveMediator(FinderMediator.NAME) as FinderMediator;
						finderMediator.Init();
						break;
					case StateValues.NEWS:
						trace('ENTERNEXTSTATE (NEWS): ' + nextStatePath[0]);
						newsMediator = facade.retrieveMediator(NewsMediator.NAME) as NewsMediator;
						newsMediator.Init();
						break;
					case StateValues.GALLERY:
						galleryMediator = facade.retrieveMediator(GalleryMediator.NAME) as GalleryMediator;
						galleryMediator.Init();
						break;
					case StateValues.FILMS:
						filmsMediator = facade.retrieveMediator(FilmsMediator.NAME) as FilmsMediator;
						filmsMediator.Init();
						break;
					//Secondary Navi
					case StateValues.MAKER:
						makerMediator = facade.retrieveMediator(MakerMediator.NAME) as MakerMediator;
						makerMediator.Init();
						break;
					case StateValues.APARTMENTS:
						apartmentsMediator = facade.retrieveMediator(ApartmentsMediator.NAME) as ApartmentsMediator;
						apartmentsMediator.Init();
						break;
					case StateValues.LOCATION:
						locationMediator = facade.retrieveMediator(LocationMediator.NAME) as LocationMediator;
						locationMediator.Init();
						break;
					case StateValues.SPECIFICATION:
						specificationsMediator = facade.retrieveMediator(SpecificationsMediator.NAME) as SpecificationsMediator;
						specificationsMediator.Init();
						break;
				}
			}
		}
	}
}
