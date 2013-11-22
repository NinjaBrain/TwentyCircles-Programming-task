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
			//start displayen av scores, 0 poäng
			scoredisplay.text = "you have " + score + " points!"
			
			//spawnar cirklarna
			spawncircles();
			//kollar om en knapp är nedtryckt, går då till restart funktionen
			stage.addEventListener(KeyboardEvent.KEY_DOWN, respawncircles);
			//en enterframe lyssnare kollar om poängen uppdateras
			scoredisplay.addEventListener(Event.ENTER_FRAME, scoreupdate);
			
		}
		
		private function scoreupdate(e:Event):void 
		{
			//displayar spelarens poäng, uppdateras varje frame
			scoredisplay.text = "you have " + score + " points!"
		}
		
		
		public function spawncircles():void 
		{
			for (var i:int = 0; i <= 19; i++) 
			{
				if (i == 10) 
				{
					//i ett av de 20 fallen spawnas den speciella cirkeln. Den får ett namn, "fake"
					var c2:MyCircle = new MyCircle;
					c2.name = "fake";
					circles.push(c2);
					addChild(c2);
					c2.addEventListener(MouseEvent.CLICK, mycircleupdate);
				}
				else 
				{
					//här spawnas cirklarna
					var c:MyCircle = new MyCircle;
					circles.push(c);
					addChild(c);
					c.addEventListener(MouseEvent.CLICK, mycircleupdate);
				}
				
			}
		}
		
		public function mycircleupdate(m:MouseEvent):void 
		{
			//om man klickar på en cirkel kommer man hit
			if (m.target.name == "fake")
			{
				//om cirkeln man klickat på heter "fake", då kallas "removeall" funktionen
				removeall();
			}
			else 
			{
				//i övriga fall där cirklarna är normala ökar poängen, och cirkeln tas bort
				score++;
				m.target.graphics.clear();
			}	
		}
		
		public function respawncircles(k:KeyboardEvent):void 
		{
			//om en knapp är nedtryckt restartar spelet. Det gör att man inte behöver klicka på spacebar, vilket man ändå kan göra
			//samtidigt som spelet restartas resettas scoren till 0 igen
			score = 0;
			for (var i:int = 0; i < circles.length; i++)
			{
				//först tas alla ciklar bort:
				circles[i].graphics.clear();
			}
			
			for (var i:int = 0; i <= 19; i++) 
			{
				//sedan placeras nya cirklar ut på slumpade kordinater
				if (i == 10) 
				{
					//en ny fake placeras ut
					var c2:MyCircle = new MyCircle;
					c2.name = "fake";
					circles.push(c2);
					addChild(c2);
					c2.addEventListener(MouseEvent.CLICK, mycircleupdate);
				}
				else 
				{
					//nya cirklar placeras ut
					var c:MyCircle = new MyCircle;
					circles.push(c);
					addChild(c);
					c.addEventListener(MouseEvent.CLICK, mycircleupdate);
				}
				
			}
		}
		
		public function removeall():void
		{
			//när den här funktionen anropas kollar for lopen igenom cirkel vektorn och tar bort alla cirklar
			for (var i:int = 0; i < circles.length; i++)
			{
				circles[i].graphics.clear();
			}
		}
		
	}
	
}