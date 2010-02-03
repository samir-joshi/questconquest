package com.symphinity.questconquest.model.world
{
	import mx.collections.ArrayList;
	/**
	 * ...
	 * @author Samir Joshi
	 */
	[RemoteClass]
	public class World
	{
		public var name: String;
		public var worldLength: int;
		public var worldDepth: int;
		
		public var repositoryId: String;
		
		public var tileLength: int;
		public var tileDepth: int;
		public var tileHeight: int;
		
		public var tiles: Array;
		
		public var interactiveObjects: ArrayList;
		
		//public var worldlyObjects: Array;
		
		public function World() 
		{
			worldLength = 25;
			worldDepth = 25;
		
			tileLength = 20;
			tileDepth = 20;
			tileHeight = 20;
			
			initialize();
		}

		public function initialize(): void
		{
			interactiveObjects = new ArrayList();
			tiles = new Array();
			if ( worldLength > 0 && worldDepth > 0)
			{
				for ( var i:int = 0; i < worldDepth; i++)
				{
					tiles[ i ] = new Array();
				}
			}
		}
		
		
	}

}