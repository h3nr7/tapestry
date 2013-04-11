package uk.co.tapestry.view.components {
	
	import uk.co.tapestry.view.INavi;
	import uk.co.tapestry.view.IComponent;
	import uk.co.tapestry.view.components.AbstractComponent;

	import flash.display.Sprite;

	/**
	 * @author henryyp
	 */
	 
	public class AbstractNavi extends AbstractComponent implements IComponent, INavi {
		public function AbstractNavi(sS:Sprite) {
			super(sS);
		}
		
		public function Enable():void {
		
		}
		
		public function Disable():void {
			
		}
	}
}
