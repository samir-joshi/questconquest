package  com.symphinity.questconquest.model.isometric
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Bitmap;
	import mx.controls.Image;
	
	public class GraphicTileEx extends IsoObject
	{
		public var imageSrc: String;
		
		public function GraphicTileEx(size:Number, bitmapData: BitmapData, xoffset:Number, yoffset:Number):void
		{
			super(size);
			
			imageSrc = "";
			if (bitmapData  != null )
			{
				var image:Bitmap = new Bitmap(bitmapData.clone());

				image.x = -xoffset;
				image.y = -yoffset;
				addChild(image);
			}
			else {
				trace(" Graphic content not loaded for the image: " + imageSrc);
			}
		}
		
				
		
		override public function toString():String
		{
			return "[GraphicTile (x:" + _position.x + ", y:" + _position.y + ", z:" + _position.z + ")]";
		}			
	}
}