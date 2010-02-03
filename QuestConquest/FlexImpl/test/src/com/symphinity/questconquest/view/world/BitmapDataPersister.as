package com.symphinity.questconquest.view.world 
{
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
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	public class BitmapDataPersister extends UIComponent
	{
		private var imageLoader: Loader;
		private var tileInfo: Tile;
		private var fnm:String = "saved.bitmapdata";
		
		public function BitmapDataPersister() 
		{
			
		}
		
		public function loadImage(): void
		{
			imageLoader = new Loader();
			imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded);			
			imageLoader.load( new URLRequest(tileInfo.bitmapInfo.imageId));
			addChild(imageLoader);
			trace("Constructor done");
		}
		
		public function imageLoaded(event: Event):void
		{
			//bitmapData =  event.target.content.bitmapData;
			trace("Image loaded");
			//trace(bitmapData);
		}
		
		public function setTileInfo(): void
		{
			tileInfo = new Tile();
			var bitmapInfo: BitmapInfo = new BitmapInfo();
			bitmapInfo.imageId = "./bin/tile_stone.png";
			bitmapInfo.repositoryId = "";
			tileInfo.bitmapInfo = bitmapInfo;
			tileInfo.walkable = false;
			
			trace(tileInfo);
		}
		
		public function checkKeys(event: KeyboardEvent):void
		{

			if ( event.charCode == 's'.charCodeAt(0) ) 
			{
				trace("Save clicked!");
				save();
			}
			else if ( event.charCode == 'o'.charCodeAt(0)) {
				trace("Open clicked!");
				open();
			}
		}
		
		public function save(): void 
		{

			var file:File = File.desktopDirectory.resolvePath( fnm );
			var stream:FileStream = new FileStream();
			stream.open( file, FileMode.WRITE );
			stream.writeObject( tileInfo );
			stream.close();
			
			trace(" Tile saved to stream,rendered as JSON :" +  JSON.encode(tileInfo));
		}
		
		public function open(): void 
		{
			var file:File = File.desktopDirectory.resolvePath( fnm );
			var stream:FileStream = new FileStream();
			stream.open( file, FileMode.READ );
			tileInfo  = stream.readObject() ;
			stream.close();
			trace(" Tile read from stream,rendered as JSON :" +  JSON.encode(tileInfo));
		}
		
		
	}

}