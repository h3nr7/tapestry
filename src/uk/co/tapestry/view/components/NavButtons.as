package uk.co.tapestry.view.components {
	import uk.co.tapestry.view.components.Buttons;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	/**
	 * @author henryyp
	 */
	public class NavButtons extends Buttons {
		
		// VARIABLES -------------------------------- //
		public var mainFonts:FontClass_12f1c4691f61db80;	
		
		var label:TextField;
		
		// CONSTRUCTOR ------------------------------ //
		public function NavButtons(cC:Sprite, labelText:String) {
			super(cC);
			
			var label:TextField = (cC.getChildByName('title') as TextField);
			
			//text formatting
			label.embedFonts = true;
			label.wordWrap = true;
			label.autoSize = TextFieldAutoSize.CENTER;
			label.antiAliasType = AntiAliasType.ADVANCED;
			label.defaultTextFormat = new TextFormat('avenir', 14, 0x000000);
			label.text = labelText.toUpperCase();
			
			//positioning
			//label.x = (cC.width - label.width)/2;
			label.y = (cC.height - label.height)/2;
		}
		
		// FUNCTIONS -------------------------------- //
	}
}
