package com.symphinity.questconquest.model.isometric 
{
	import flash.display.DisplayObject;
	
	import mx.core.UIComponent;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	public class ExtendedUICompoent  extends UIComponent
	{
		
		public function ExtendedUICompoent() 
		{
			super();
		}
		
		override protected function measure():void
		{
			super.measure();

			for(var i:int = 0; i < this.numChildren; i++)
			{
				var child:DisplayObject = this.getChildAt(i);
				this.measuredWidth = Math.max(this.measuredWidth, child.x + child.width);
				this.measuredHeight = Math.max(this.measuredHeight, child.y + child.height);
			}
		}
		
	}
	
}