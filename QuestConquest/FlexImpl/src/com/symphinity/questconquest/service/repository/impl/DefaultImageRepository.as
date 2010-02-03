package com.symphinity.questconquest.service.repository.impl
{

	import flash.events.Event;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.net.URLRequest;
	
	import mx.collections.ArrayList;
	
	import com.symphinity.questconquest.utils.FileUtils;
	import com.symphinity.questconquest.service.repository.ImageRepostitory;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	public class DefaultImageRepository implements ImageRepostitory
	{
		
		protected var _root: String;
		
		protected var bitmapCache: Object;
		
		public function DefaultImageRepository() 
		{
			bitmapCache = new Object();
		}
		
		public function get root(): String 
		{
			return _root;
		}
		
		public function set root(rootStr: String): void
		{
			_root = rootStr;
		}
		
		
		public function  getImage(imageId: String): Bitmap
		{
			return bitmapCache[imageId];
		}
		
		public function getImages(): Array
		{
			var imageArray: Array = new Array();
			
			var property: * ;
			var i: int = 0;
			for each ( property in bitmapCache)
			{
				imageArray[i++] = property;
			}
			
			trace("Array being returned from getImages() is: " + imageArray);
			
			return imageArray;
		}
		
		public function putImae(imageId: String, bitmap: Bitmap): void
		{
			bitmapCache[imageId] = bitmap;
			
			trace( " Image Id : " + imageId + ", Bitmap source " + bitmap.loaderInfo.url.toString() );
		}
		
		public function load(): void 
		{
			var files: Array = FileUtils.getFileNames(root);
			for (var i: int = 0; i < files.length; i++)
			{
				if ('.' == files[i].charAt(0) )
				{
					continue;
				}
				loadImage(files[i]);
			}
		}
		
		public function save(): void
		{
			throw new Error(" Operation save() is not supported by DefaultImageRepository" );
		}
		
		
		public function loadImage(imageId: String): void
		{
			var imageLoader: Loader = new Loader();
			imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded);			
			imageLoader.load( new URLRequest(imageId));
			
			trace("Image loader created for imageId : " + imageId);
		}		
		
		
		public function imageLoaded(event: Event):void
		{
			trace("Loading complete for " + event.target.url);
			putImae(event.target.url, event.target.content);
		}		
		
	}

}