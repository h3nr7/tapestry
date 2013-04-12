package uk.co.tapestry.view.components {
	import flash.display.Shape;
	import flash.text.TextFormat;
	import flash.text.AntiAliasType;
	import flash.text.TextFieldAutoSize;
	import flash.events.MouseEvent;
	import com.greensock.TweenMax;
	import flash.text.TextField;
	import flash.display.Sprite;
	import uk.co.tapestry.view.components.AbstractSprite;

	/**
	 * @author henryyp
	 */
	public class NewsItem extends AbstractSprite {
		
		
		// VARIABLES ------------------------------ //	
		
		private var _data:Array;
		private var _container:Sprite;
		private var _subContainer:Sprite;
		private var title:TextField;
		private var content:TextField;
		private var user:TextField;
		private var items:Array;
		private var subItems:Array;
		private var leftarrow:Sprite;
		private var rightarrow:Sprite;
		private var submask:Sprite;
		
		private var currentI:uint 			= 0;
		
		private var numSubItems:uint 		= 6;
		private var subItemHeight:Number	= 140;
		
		private var subConPosX:Number		= 800;
		private var subConPosY:Number		= 0;
		
		private var controls:AssetNewsItemControl;
		FontClass_12f1c4691f61db80;
		FontClass_12f3c37a90fa7600;
		FontClass_12f3c36503540358;
		
		
		// CONSTRUCTOR ---------------------------- //	
		public function NewsItem(data:Array) {
			super();
			_data		= data;
			Init();
			
		}
		
		// FUNCTION ------------------------------ //	
		override public function Init():void {
			
			_container 		= new Sprite();
			items			= new Array();
			subItems		= new Array();
			controls		= new AssetNewsItemControl();
			
			//set controls
			leftarrow		= controls.getChildByName('leftarrow') as Sprite;
			rightarrow		= controls.getChildByName('rightarrow') as Sprite;
			controls.x		= 426;
			controls.y		= 455;
			
			//main containers
			for (var i:uint=0; i<_data.length; i++) {
				var tmp:AssetNewsItem	= new AssetNewsItem();
				title  				= tmp.getChildByName('title') as TextField;
				content 			= tmp.getChildByName('content') as TextField;
				user  				= tmp.getChildByName('user') as TextField;
				
				
				setFont(title,'gotham',40, 0x60C8DA);
				title.text			= _data[i]['title'];
				setFont(content,'gotham',30, 0xFFFFFF);
				content.text		= _data[i]['content'];
				setFont(user,'gotham',21, 0x60C8DA);
				user.text			= _data[i]['user'];
				//setting the text 
				
				_container.addChild(tmp);
				tmp.x				= 427;
				tmp.y				= 370;
				tmp.visible			= false;
				items.push(tmp);
			}
			
			if (items.length>0) {
				items[0].visible 		= true;
			}
			
			//sub textfield
			_subContainer 		= new Sprite();
			submask				= new Sprite();
			var recT:Shape		= new Shape();
			recT.graphics.beginFill(0xffffff);
			recT.graphics.drawRect(0, 0, 270, 850);
			recT.graphics.endFill();
			submask.addChild(recT);
			_subContainer.mask 	= submask;
			_subContainer.x = 1630;
			_subContainer.y = 140;
			submask.x 		= 1607;
			submask.y 		= 125;
			
			for (var i:uint=0; i<_data.length; i++) {
				var tmsp:TextField	= new TextField();
				tmsp.width			= 230;
				tmsp.text = _data[i]['title'] + ':' + _data[i]['content'] + '\n' + _data[i]['user'];
				
				setFont(tmsp, 'gotham', 18, 0x60C8DA, new Array(0, _data[i]['title'].length-1));
				setFont(tmsp, 'gotham', 18, 0xffffff, new Array(_data[i]['title'].length, _data[i]['content'].length-1));
				setFont(tmsp, 'gotham', 18, 0xffffff, new Array(_data[i]['content'].length+1, _data[i]['user'].length));
				
				_subContainer.addChild(tmsp);
				tmsp.visible			= false;
				tmsp.y				= subItemHeight*i;
				subItems.push(tmsp);
			}
			
			/*if (subItems.length>=numSubItems) {
				for (var i:uint=0; i<numSubItems; i++) {	
						subItems[i].visible 		= true;
				}			
			}
			else if (subItems.length>0 && subItems.length<numSubItems) {
				for (var i:uint=0; i<subItems.length; i++) {
					subItems[i].visible 		= true;
				}
			}*/
			
			for (var i:uint=0; i<subItems.length; i++) {	
					subItems[i].visible 		= true;
			}	
			
			
			
			this.addChild(controls);
			this.addChild(_container);
			this.addChild(_subContainer);
			
			//add handlers
			leftarrow.addEventListener(MouseEvent.CLICK, leftarrowClickHandler);
			rightarrow.addEventListener(MouseEvent.CLICK, rightarrowClickHandler);
			
		}
		
		override public function Kill(isSlow:Boolean = false):void {
			
			//add handlers
			leftarrow.removeEventListener(MouseEvent.CLICK, leftarrowClickHandler);
			rightarrow.removeEventListener(MouseEvent.CLICK, rightarrowClickHandler);
			
			for (var i:uint=0; i<_data.length; i++) {
				_container.removeChild(items[i]);
				_container.removeChild(subItems[i]);
			}
			//remove everything
			this.removeChild(controls);
			this.removeChild(_container);
			this.removeChild(_subContainer);
		}
		
		//function to move through the news
		private function next():void {
			var nextI:uint				= currentI+1;
			if (nextI<_data.length) {
				items[currentI].visible 	= false;
				items[nextI].alpha			= 0;
				items[nextI].visible		= true;
				TweenMax.fromTo(items[nextI], 0.35, {alpha:0, x: items[nextI].x-50}, {alpha:1, x: items[nextI].x});
				
				currentI					= nextI;
				
				var sY:Number = subItems[nextI].y;
				TweenMax.to(_subContainer, 0.25, {y:-sY});
			}
		}
		
		private function prev():void {
			var prevI:uint				= currentI-1;
			if (currentI>0) {
				items[currentI].visible 	= false;
				items[prevI].alpha			= 0;
				items[prevI].visible		= true;
				TweenMax.fromTo(items[prevI], 0.35, {alpha:0, x: items[prevI].x+50}, {alpha:1, x: items[prevI].x});
				currentI					= prevI;
				
				var sY:Number = subItems[prevI].y;
				TweenMax.to(_subContainer, 0.25, {y:-sY});
			}
		}
		
		private function setFont(tT:TextField, fontname:String, fontsize:Number, fontcolor:uint, range:Array = null):void {
			tT.embedFonts = true;
			tT.wordWrap = true;
			tT.autoSize = TextFieldAutoSize.LEFT;
			tT.antiAliasType = AntiAliasType.NORMAL;
			if (range == null) {
				tT.defaultTextFormat = new TextFormat(fontname, fontsize, fontcolor);
			}
			else {
				var tF:TextFormat = new TextFormat(fontname, fontsize, fontcolor);
				tT.setTextFormat(tF, range[0], range[1]);
			}
		}
		
		
		// HANDLERS ------------------------------ //	
		private function leftarrowClickHandler(eE:MouseEvent):void{
			prev();
		}
		
		private function rightarrowClickHandler(eE:MouseEvent):void {
			next();
		}
	}
}
