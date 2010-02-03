package  com.symphinity.questconquest.model.isometric
{
	import mx.controls.Image;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	public class InteractiveGraphicsTile extends GraphicTile
	{
		
		public function InteractiveGraphicsTile(size:Number, image: Image, xoffset:Number, yoffset:Number):void 
		{
			super(size, image, xoffset, yoffset);
		}
		
		public function interact(): void {
			trace(" Hi" );
		}
		
		override public function toString():String
		{
			return "[InteractiveGraphicsTile (x:" + _position.x + ", y:" + _position.y + ", z:" + _position.z + ")]";
		}		
		
	}
	
}