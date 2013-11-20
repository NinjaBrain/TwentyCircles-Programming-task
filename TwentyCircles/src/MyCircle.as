package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import Main;
	/**
	 * ...
	 * @author Emil Söderberg
	 */
	public class MyCircle extends Sprite
	{
		
		public function MyCircle():void 
		{
			this.graphics.beginFill(0x0D00FF);
			this.graphics.drawCircle(0, 0, 30);
			this.graphics.endFill();
			this.x = Math.random() * 800;
			this.y = Math.random() * 600;
			
		}
	}
}