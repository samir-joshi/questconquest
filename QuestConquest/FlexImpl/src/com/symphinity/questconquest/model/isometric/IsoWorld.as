package com.symphinity.questconquest.model.isometric
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import com.adobe.serialization.json.JSON;
	import com.symphinity.questconquest.model.world.World;
	import com.symphinity.questconquest.model.world.Tile;

	public class IsoWorld extends Sprite
	{
		private var _floor:Sprite;
		private var _objects:Array;
		private var _world:Sprite;
		
		private var worldInfo: World;
		
		private var _worldLength: int;
		private var _worldDepth: int;
		private var _tileLength: int;
		private var _tileHeight: int;
		private var _tileDepth: int;
		
		public function IsoWorld()
		{	
			_floor = new Sprite();
			addChild(_floor);
			
			_world = new Sprite();
			addChild(_world);
			
			_objects = new Array();
			
			worldInfo = new World();
		}
		
		public function initialize( worldLength: int, worldDepth: int, tileLength: int, tileHeight: int, tileDepth: int ): void
		{
			_worldLength = worldLength;
			_worldDepth = worldDepth;
			
			_tileLength = tileLength;
			_tileHeight = tileHeight
			_tileDepth = tileDepth;

		}

		
		public function get worldLength(): int
		{
			return worldInfo.worldLength;
		}
		
		public function get worldDepth(): int
		{
			return worldInfo.worldDepth;
		}

		public function get tileLength(): int
		{
			return worldInfo.tileLength;
		}

		public function get tileHeight(): int
		{
			return worldInfo.tileHeight;
		}

		public function get tileDepth(): int
		{
			return worldInfo.tileDepth;
		}
		
		public function addChildToWorld(child:IsoObject):void
		{
			child.walkable = false;
			_world.addChild(child);
			_objects.push(child);
			sort();
		}
		
		public function addChildToFloor(xIndex: int, zIndex: int, child: IsoObject):void
		{
			_floor.addChild(child);
		}
		
		public function getFloorChildAt(index: int): DisplayObject {
			return _floor.getChildAt(index);
		}
		
		public function removeFloorChildAt(index: int): DisplayObject {
			return _floor.removeChildAt(index);
		}
		
		public function addChildToFloorAt(child: DisplayObject, index: int): DisplayObject {
			if ( child is GraphicTile)
			{
				var xIndex: int = index / worldDepth;
				var zIndex: int  = index % worldDepth;
			}
			return _floor.addChildAt(child, index);
		}
		
		public function sort():void
		{
			_objects.sortOn("depth", Array.NUMERIC);
			for(var i:int = 0; i < _objects.length; i++)
			{
				_world.setChildIndex(_objects[i], i);
			}
		}
		
		public function canMove(obj:IsoObject):Boolean
		{
			var rect:Rectangle = obj.rect;
			rect.offset(obj.vx, obj.vz);
			for(var i:int = 0; i < _objects.length; i++)
			{
				var objB:IsoObject = IsoObject(_objects[i]);
				if(obj != objB &&  rect.intersects(objB.rect))
				{

					if (_objects[i] is InteractiveGraphicsTile ) {
						trace(_objects[i], " is InteractiveGraphicsTile");
						InteractiveGraphicsTile(_objects[i]).interact();
					}else {
						trace( _objects[i], " is NOT InteractiveGraphicsTile");
					}
					if (!obj.walkable) {
						return false;						
					}
				}
			}
			return true;
		}
		
		public function save(name: String): Boolean
		{
			worldInfo.name = name;
			trace(JSON.encode(worldInfo));
			
			return false;
		}
		

		public function renderDrwanTiles(): void
		{
			for(var i:int = 0; i < _worldLength; i++)
			{
				for (var j:int = 0; j <  _worldDepth; j++)
				{
					var tile:DrawnIsoTile = new DrawnIsoTile(20, 0xcccccc);
					tile.position = new Point3D(i * _tileLength, 0, j * _tileDepth);
					addChildToFloor(i, j, tile);
				}
			}			
		}
			
	}
	
}