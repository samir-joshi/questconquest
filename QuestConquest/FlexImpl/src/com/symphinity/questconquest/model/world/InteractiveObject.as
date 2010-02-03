package com.symphinity.questconquest.model.world 
{
	/**
	 * ...
	 * @author Samir Joshi
	 */
	[RemoteClass]
	public class InteractiveObject
	{
		public var xIndex: int;
		public var zIndex: int;
		public var bitmapInfo: BitmapInfo;
		
		public function InteractiveObject() 
		{
			bitmapInfo = new BitmapInfo();
		}
		
	}

}