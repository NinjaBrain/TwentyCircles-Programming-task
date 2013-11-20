package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.accessibility.AccessibilityProperties;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.engine.Kerning;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.display.Bitmap;
	
	/**
	 * ...
	 * @author Emil Söderberg
	 */
	public class Main extends Sprite 
	{
		public var scoredisplay:TextField = new TextField;
		public var score:int = 0;
		
		public static var circles:Vector.<MyCircle> = new Vector.<MyCircle>;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			addChild(scoredisplay);
			scoredisplay.x = 700;
			scoredisplay.y = 10;
			scoredisplay.text = "you have " + score + " points!"
			
			
			spawncircles();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, respawncircles);
			scoredisplay.addEventListener(Event.ENTER_FRAME, scoreupdate);
			
		}
		
		private function scoreupdate(e:Event):void 
		{
			scoredisplay.text = "you have " + score + " points!"
		}
		
		
		public function spawncircles():void 
		{
			for (var i:int = 0; i <= 19; i++) 
			{
				if (i == 10) 
				{
					var c2:MyCircle = new MyCircle;
					c2.name = "fake";
					circles.push(c2);
					addChild(c2);
					c2.addEventListener(MouseEvent.CLICK, mycircleupdate);
				}
				else 
				{
					var c:MyCircle = new MyCircle;
					circles.push(c);
					addChild(c);
					c.addEventListener(MouseEvent.CLICK, mycircleupdate);
				}
				
			}
		}
		
		public function mycircleupdate(m:MouseEvent):void 
		{
			if (m.target.name == "fake")
			{
				removeall();
			}
			else 
			{
				score++;
				m.target.graphics.clear();
			}	
		}
		
		public function respawncircles(k:KeyboardEvent):void 
		{
			score = 0;
			for (var i:int = 0; i < circles.length; i++)
			{
				circles[i].graphics.clear();
			}
			
			for (var i:int = 0; i <= 19; i++) 
			{
				if (i == 10) 
				{
					var c2:MyCircle = new MyCircle;
					c2.name = "fake";
					circles.push(c2);
					addChild(c2);
					c2.addEventListener(MouseEvent.CLICK, mycircleupdate);
				}
				else 
				{
					var c:MyCircle = new MyCircle;
					circles.push(c);
					addChild(c);
					c.addEventListener(MouseEvent.CLICK, mycircleupdate);
				}
				
			}
		}
		
		public function removeall():void
		{
			for (var i:int = 0; i < circles.length; i++)
			{
				circles[i].graphics.clear();
			}
		}
		
	}
	
}