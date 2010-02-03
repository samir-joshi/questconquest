package com.symphinity.questconquest.view.author.trail
{
	import com.symphinity.questconquest.model.isometric.DrawnIsoBox;
	import com.symphinity.questconquest.model.isometric.GraphicTile;
	import com.symphinity.questconquest.model.isometric.IsoWorld;
	import com.symphinity.questconquest.model.isometric.MapLoader;
	import mx.core.UIComponent;
	
	import flash.display.DisplayObject;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;	
	
	[SWF(backgroundColor=0x0)]
	public class MotionInMapTest extends Sprite
	{
		private var _world:IsoWorld;
		private var _floor:IsoWorld;
		private var mapLoader:MapLoader;
		private var speed:Number = 2;		
		
		private var box:DrawnIsoBox;
		
		
		[Embed(source="tile_01.png")]
		private var Tile01:Class;
		
		[Embed(source="tile_02.png")]
		private var Tile02:Class;

		[Embed(source="tile_03.png")]
		private var Tile03:Class;		

		[Embed(source="tile_04.png")]
		private var Tile04:Class;	
		
		public function MotionInMapTest()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			mapLoader = new MapLoader();
			mapLoader.addEventListener(Event.COMPLETE, onMapComplete);
			mapLoader.loadMap("bin/motion_map.txt");
		}
		
		private function onMapComplete(event:Event):void
		{
			_world = mapLoader.makeWorld(20);
			_world.x = stage.stageWidth / 2;
			_world.y = 100;
			addChild(_world);
			
			addMovableObject();
		}
		
		private function addMovableObject():void
		{
			box = new DrawnIsoBox(20, 0xfb8d00, 20);
			box.x = 200;
			box.z = 200;
			_world.addChildToWorld(box);
			
			//trace(" Movalble object tile at ", 100, 100, "added at z-index ", _world.getChildIndex(box)) ;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);	
		}
		
		private function onKeyDown(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.UP :
				box.vx = -speed;
				break;
				
				case Keyboard.DOWN :
				box.vx = speed;
				break;
				
				case Keyboard.LEFT :
				box.vz = speed;
				break;
				
				case Keyboard.RIGHT :
				box.vz = -speed;
				break;
				
				default :
				break;
				
			}
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onKeyUp(event:KeyboardEvent):void
		{
			box.vx = 0;
			box.vz = 0;
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			if (_world.canMove(box))
			{
				box.x += box.vx;
				box.y += box.vy;
				box.z += box.vz;
				_world.sort();
			}
		}		
		
	}
}