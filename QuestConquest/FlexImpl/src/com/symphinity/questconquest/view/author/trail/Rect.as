package com.symphinity.questconquest.view.author.trail 
{
	import com.symphinity.questconquest.model.isometric.Point3D;
	import flash.geom.Point;
	import mx.core.FlexShape;
	
	import com.symphinity.questconquest.model.isometric.IsoUtils;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	public class Rect extends FlexShape
	{
		
		protected var startPoint: Point;
		protected var endPoint: Point;
		
		public function Rect() 
		{
			startPoint = new Point();
			endPoint = new Point();
		}
		
		public function getStartPoint(): Point 
		{
			return startPoint;
		}

		public function getEndPoint(): Point 
		{
			return endPoint;
		}	
		
		public function setStartPoint(point: Point): void
		{
			startPoint.x = point.x;
			startPoint.y = point.y;
		}
		
		public function setEndPoint(point: Point): void
		{
			endPoint.x = point.x;
			endPoint.y = point.y;
		}		

		
		public function render():void 
		{
			
			var startPoint3D: Point3D = new Point3D();
			startPoint3D = IsoUtils.screenToIso(startPoint);
			
			var endPoint3D: Point3D = new Point3D();
			endPoint3D = IsoUtils.screenToIso(endPoint);

			var cornerPoint3D: Point3D = new Point3D();
			cornerPoint3D.x = startPoint3D.x + (endPoint3D.x - startPoint3D.x);
			cornerPoint3D.y = startPoint3D.y ;
			cornerPoint3D.z = startPoint3D.z ;
			var cornerPoint: Point = IsoUtils.isoToScreen(cornerPoint3D);
			
			var oppositeCornerPoint3D: Point3D = new Point3D();
			oppositeCornerPoint3D.x = endPoint3D.x - (endPoint3D.x - startPoint3D.x) ;
			oppositeCornerPoint3D.y = endPoint3D.y;
			oppositeCornerPoint3D.z = endPoint3D.z ;
			var oppositeCornerPoint: Point = IsoUtils.isoToScreen(oppositeCornerPoint3D);
			
			graphics.clear();
            graphics.lineStyle(3, 0xAAAAAA );
			graphics.moveTo(startPoint.x, startPoint.y);
			graphics.lineTo( cornerPoint.x, cornerPoint.y );
			graphics.lineTo(endPoint.x , endPoint.y);
			graphics.lineTo(oppositeCornerPoint.x, oppositeCornerPoint.y);		
			graphics.lineTo(startPoint.x, startPoint.y);
			
			
		}
		
	}

}