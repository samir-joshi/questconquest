package  com.symphinity.questconquest.model.isometric
{
	import flash.display.DisplayObject;
	import flash.display.Bitmap;
	import mx.controls.Image;
	
	public class GraphicTile extends IsoObject
	{
		public var imageSrc: String;
		
		public function GraphicTile(size:Number, graphicImage: Image, xoffset:Number, yoffset:Number):void
		{
			super(size);
			
			imageSrc = graphicImage.source.toString();
			
			if (graphicImage.content  != null )
			{
				var image:Bitmap = new Bitmap((graphicImage.content as Bitmap).bitmapData.clone());

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