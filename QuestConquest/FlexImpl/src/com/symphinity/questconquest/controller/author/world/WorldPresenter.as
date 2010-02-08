package com.symphinity.questconquest.controller.author.world 
{
	import mx.controls.Image;
	/**
	 * ...
	 * @author Samir Joshi
	 */
	public class WorldPresenter
	{
		public const TILE: String = "TILE";
		public const WORLD_OBJECT: String = "WORLD_OBJECT";
		public const CHALANGE: String = "CHALANGE";
		public const FACTOID: String = "FACTOID";		
		
		protected var currentGraphicTile: Image;
		
		protected var currentWorldObjectType: String;
		
		protected var editMode: Boolean;
		
		public function WorldPresenter() 
		{
			//Bad ( perhaps not so bad now that the line is in presented. 
			//It was deemed bad in controller because it is assumption about intial UI state) 
			currentWorldObjectType = TILE;

		}
		
		public function setCurrentGraphicTile(tile:Image): void
		{
			currentGraphicTile = tile;
		}
		
		public function getCurrentGrahicTile(): Image {
			return currentGraphicTile;
		}
		
		public function getcurrentWorldObjectType() : String
		{
			return currentWorldObjectType;
		}
		
		public function setcurrentWorldObjectType(objectType :String) : void
		{
			currentWorldObjectType = objectType;
			trace(" Updated object type: " + objectType);
			
		}
		
		public function setEditMode(mode: Boolean): void
		{
			editMode = mode;
		}
		
		public function getEditMode(): Boolean
		{
			return editMode;
		}
		
		
	}

}