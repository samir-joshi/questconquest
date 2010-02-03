package com.symphinity.questconquest.model.world 
{

	/**
	 * ...
	 * @author Samir Joshi
	 */
	[RemoteClass]	
	public class Tile
	{
		public var bitmapInfo: BitmapInfo;
		public var walkable: Boolean;
		
		public function Tile() 
		{
			bitmapInfo = new BitmapInfo();
		}
		
	}

}