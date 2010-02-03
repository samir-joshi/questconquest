package com.symphinity.questconquest.view.world 
{
	import com.symphinity.questconquest.service.repository.ImageRepostitory;
	import mx.containers.VBox;
	import mx.core.UIComponent;
	
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.URLRequest;
	
	import flash.display.BitmapData;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import com.adobe.serialization.json.JSON;
	
	import com.symphinity.questconquest.model.world.BitmapInfo;
	import com.symphinity.questconquest.model.world.Tile;
	
	import com.symphinity.questconquest.service.repository.RepositoryManager;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	public class ImageRepositoryTester extends VBox
	{
		private var imageRepository: ImageRepostitory;
		private var repositoryRoot:String = "assets/world/tile";
		
		public function ImageRepositoryTester() 
		{
			imageRepository = RepositoryManager.getImageRepository( "", repositoryRoot);
			trace("Constructor done");			
		}
		
		public function open(): void
		{
			imageRepository.load();
		}
		
		public function loadImages(): void
		{
			var imageArray: Array = imageRepository.getImages();
			
			for (var i:int = 0; i < imageArray.length; i++)
			{
				var bitmapWrapper: BitmapWrapper = new BitmapWrapper();
				bitmapWrapper.addChild(imageArray[i]);
				bitmapWrapper.height = 25;
				addChild(bitmapWrapper);
			}
			
		}
		
	}

}