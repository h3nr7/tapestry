package uk.co.tapestry.view.components {
	import flash.text.TextFormat;
	import flash.text.AntiAliasType;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextField;
	import flash.display.Graphics;
	import flash.display.PixelSnapping;
	import flash.geom.Matrix;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import com.greensock.TweenMax;
	import flash.events.MouseEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;

	import flash.display.Sprite;

	/**
	 * @author henryyp
	 */
	public class Slideshow extends AbstractSprite {
		
		// VARIABLES --------------------------------- //
		private var _slideShow:AssetSlideshow;
		private var _data:Array;
		private var iL:Array;
		private var iT:Array;
		private var _totalIndex:Number;
		private var _currentIndex:Number;
		private var imgMaskerInner:Sprite;
		private var titleContainer:Sprite;
		private var titleText:TextField;
		private var leftBut:Sprite;
		private var rightBut:Sprite;
		private var thumbnail:Sprite;
		
		// CONSTRUCTOR --------------------------------- //
		public function Slideshow(data:Array) {
			
			super();
			_data		= data;

		}
		
		// FUNCTIONS --------------------------------- //
		//Init
		override public function Init():void{
			_slideShow					= new AssetSlideshow();
			//controls
			leftBut						= _slideShow.getChildByName('leftarrow') as Sprite;
			rightBut					= _slideShow.getChildByName('rightarrow') as Sprite;
			leftBut.addEventListener(MouseEvent.CLICK, leftClickHandler);
			rightBut.addEventListener(MouseEvent.CLICK, rightClickHandler);
			//title
			titleContainer				= _slideShow.getChildByName('title') as Sprite;
			titleText					= titleContainer.getChildByName('text') as TextField;
			//set text
			titleText.embedFonts = true;
			titleText.wordWrap = false;
			titleText.autoSize = TextFieldAutoSize.CENTER;
			titleText.antiAliasType = AntiAliasType.NORMAL;
			titleText.defaultTextFormat = new TextFormat('avenir', 21, 0xffffff);
			//image and mask
			var imgMasker:Sprite		= _slideShow.getChildByName('imagemasker') as Sprite;
			imgMaskerInner				= imgMasker.getChildByName('holder') as Sprite;
			var imgMaskerMask:Sprite	= imgMasker.getChildByName('mask') as Sprite;
			imgMaskerMask.visible		= false;
			imgMaskerInner.mask			= imgMaskerMask;
			this.addChild(_slideShow);
			//set position
			this.x = 423;
			this.y = 44;
			
			//setup the image slideshow
			thumbnail					= _slideShow.getChildByName('thumbnail') as Sprite;
			_currentIndex 				= 0;
			_totalIndex					= _data.length;
			iL 							= new Array();
			iT							= new Array();
			for (var i:uint=0; i<_data.length; i++) {
				var tmp:ImageLoader = LoaderMax.getLoader(_data[_data.length-i-1]['name']) as ImageLoader;
				//set to center
				tmp.content.x		= -(tmp.content.width-imgMaskerMask.width)/2;
				tmp.content.y		= -(tmp.content.height-imgMaskerMask.height)/2;
				imgMaskerInner.addChild(tmp.content);
				
				//thumb
				var scale:Number = 0.072;
				var tS:Sprite 		= new Sprite();
				var tT:Sprite		= new Sprite();
				var g:Graphics 		= tT.graphics;
				g.beginFill( 0xffffff, 0.7 );
				g.drawRect( 0, 0, 5, 75);
				g.drawRect( 5, 0, 100, 5);
				g.drawRect( 100, 5, 5, 70);
				g.drawRect( 5, 70, 95, 5);
				g.endFill( );
				//set the scale
				var matrix:Matrix = new Matrix();
				matrix.scale(scale, scale);
				//redraw smaller scale
				var smallBMD:BitmapData = new BitmapData((imgMasker.width*scale), (imgMasker.height*scale), true, 0x000000);
				smallBMD.draw(imgMasker, matrix, null, null, null, true);
				var bmp:Bitmap = new Bitmap(smallBMD, PixelSnapping.NEVER, true);
				bmp.x						= 0;
				bmp.y						= 0;
				tS.y 						= 5;
				tS.x 						= 15+120*(_data.length-i-1);
				tT.name						= 'frame';
				tS.name						= 'thumb'+ (_data.length-i-1);
				tS.addChild(bmp);
				tS.addChild(tT);
				thumbnail.addChild(tS);
				
				tT.visible					= false;
				iT[_data.length-i-1]			= tS;
				//add event listener
				tS.addEventListener(MouseEvent.CLICK, thumbClickHandler);
				
				//set the slideshow
				iL[_data.length-i-1] = tmp;
				iL[_data.length-i-1].content.visible = false;
				
			}
			
			//set default 0 to visible and everything else not
			leftBut.visible 				= false;
			iL[0].content.visible 			= true;
			getThumbFrame(0).visible		= true;
			updateText(_data[_currentIndex]['title']);
		}
		
		//kill
		override public function Kill(isSlow:Boolean = false):void {
			
			leftBut.removeEventListener(MouseEvent.CLICK, leftClickHandler);
			rightBut.removeEventListener(MouseEvent.CLICK, rightClickHandler);
			for (var i:uint=0; i<_data.length; i++) {	
				iL[_data.length-i-1].content.alpha		= 1;
				iL[_data.length-i-1].content.visible 	= true;
				getThumbFrame(_data.length-i-1).alpha	= 1;
				getThumbFrame(_data.length-i-1).visible = true;
				iT[_data.length-i-1].removeChild(iT[_data.length-i-1].getChildByName('frame'));
				iT[_data.length-i-1].removeEventListener(MouseEvent.CLICK, thumbClickHandler);
				thumbnail.removeChild(iT[_data.length-i-1]);
				iT[_data.length-i-1] = null;
			}
			this.removeChild(_slideShow);
			iT 			= null;
			_slideShow 	= null;
		}
		
		//get frame within  thumb
		private function getThumbFrame(nN:Number):Sprite {
			
			var sS:Sprite = iT[nN].getChildByName('frame') as Sprite;
			return sS;
		}
		
		//update text
		private function updateText(tT:String):void {
			titleText.text		= tT.toUpperCase();
		}
		
		
		// HANLDERS --------------------------------- //
		
		private function thumbClickHandler(mM:MouseEvent):void {
			var sN:Number 	= Number(mM.currentTarget.name.replace('thumb', ""));
			
			if (_currentIndex!=sN) {
				getThumbFrame(sN).visible 				= true;
				getThumbFrame(_currentIndex).visible 	= false;
				iL[sN].content.visible					= true;
				TweenMax.fromTo(iL[_currentIndex].content, 1, {alpha:1},{alpha:0});
				TweenMax.fromTo(iL[sN].content, 1, {alpha:0}, {alpha:1, onComplete: endFunc() });
				//check if sN is at the end of the beginning
				if (sN==0) {
					leftBut.visible=false;
					rightBut.visible=true;
				}
				else if (sN==(_totalIndex-1)) {
					rightBut.visible=false;
					leftBut.visible=true;
				}
				else {
					leftBut.visible=true;
					rightBut.visible=true;
				}
			}
				
			//setting the current index
			function endFunc():void {	
				_currentIndex = sN;
				updateText(_data[_currentIndex]['title']);
			}
		}
		
		private function leftClickHandler(mM:MouseEvent):void {
			if (_currentIndex>0) {
				trace(_currentIndex);
				mM.currentTarget.visible = true;
				rightBut.visible 		 = true;
				var prev:Number			 = _currentIndex;
				_currentIndex--;
				TweenMax.fromTo(iL[prev].content, 1, {alpha:1},{alpha:0});
				TweenMax.fromTo(iL[_currentIndex].content, 1, {alpha:0}, {alpha:1});
				//setting the thumbs
				getThumbFrame(prev).visible 			= false;
				getThumbFrame(_currentIndex).visible 	= true;
				updateText(_data[_currentIndex]['title']);
				if (_currentIndex==0) {
					leftBut.visible=false;
					rightBut.visible=true;
				}
				else {
					leftBut.visible=true;
					rightBut.visible=true;
				}
			}
			else {
				_currentIndex = 0;
				trace(_currentIndex);
				mM.currentTarget.visible 				= false;
				iL[_currentIndex].content.visible 		= true;
				getThumbFrame(_currentIndex).visible 	= true;
			}
		}
		
		private function rightClickHandler(mM:MouseEvent):void {
			if (_currentIndex<_totalIndex-1) {
				trace(_currentIndex);
				mM.currentTarget.visible = true;
				leftBut.visible 		 = true;
				var prev:Number			 = _currentIndex;
				_currentIndex++;
				iL[_currentIndex].content.visible = true;
				TweenMax.fromTo(iL[prev].content, 1, {alpha:1},{alpha:0});
				TweenMax.fromTo(iL[_currentIndex].content, 1, {alpha:0}, {alpha:1});
				//setting the thumbs
				getThumbFrame(prev).visible 			= false;
				getThumbFrame(_currentIndex).visible 	= true;
				updateText(_data[_currentIndex]['title']);
				if (_currentIndex==(_totalIndex-1)) {
					leftBut.visible=true;
					rightBut.visible=false;
				}
				else {
					leftBut.visible=true;
					rightBut.visible=true;
				}
							
			}
			else {
				_currentIndex = _totalIndex-1;
				trace(_currentIndex);
				mM.currentTarget.visible = false;
				iL[_currentIndex].content.visible = true;
				getThumbFrame(_currentIndex).visible = true;
				
			}
		}
	}
}
