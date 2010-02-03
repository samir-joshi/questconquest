package com.symphinity.questconquest.view.author.trail
{
	
	import com.symphinity.questconquest.controller.FoundryController;
	import com.symphinity.questconquest.model.isometric.GraphicTile;
	import com.symphinity.questconquest.model.isometric.GraphicTileEx;
	import com.symphinity.questconquest.model.world.BitmapInfo;
	import com.symphinity.questconquest.model.world.InteractiveObject;
	import com.symphinity.questconquest.model.world.Tile;
	import com.symphinity.questconquest.model.world.World;
	import com.symphinity.questconquest.service.repository.impl.DefaultImageRepository;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import mx.controls.Image;
	
	import flash.display.DisplayObject;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;	
	
	import mx.core.UIComponent;
	
	import com.adobe.serialization.json.JSON;
	
	import com.symphinity.questconquest.controller.QuestConquestController;
	
	import com.symphinity.questconquest.model.FoundryModelLocator;
	import com.symphinity.questconquest.model.isometric.DrawnIsoBox;
	import com.symphinity.questconquest.model.isometric.DrawnIsoTile;
	import com.symphinity.questconquest.model.isometric.IsoWorld;
	import com.symphinity.questconquest.model.isometric.Point3D;
	import com.symphinity.questconquest.model.isometric.IsoUtils;
	import com.symphinity.questconquest.service.repository.ImageRepostitory;
	import com.symphinity.questconquest.service.repository.RepositoryManager;

	[SWF(backgroundColor=0xffffff)]
	public class WorldCreator extends UIComponent
	{
		protected var worldDisplay:IsoWorld;
		
		protected var world: World;
		
		protected var regionOutlineRect: Rect = new Rect();
		
		protected var dragModeOn: Boolean = false;
		
		
		protected var box:DrawnIsoBox;
		protected var speed:Number = 4;		
		
		public function WorldCreator()
		{
			
			world = FoundryModelLocator.getInstance().foundryModel.world;
			
			worldDisplay = new IsoWorld();
			worldDisplay.initialize( world.worldLength, world.worldDepth, world.tileLength, world.tileHeight, world.tileDepth);
			
			addChild(worldDisplay);

			worldDisplay.renderDrwanTiles();
			
			updateWorldDisplay();

			addEventListener(MouseEvent.CLICK, onWorldClick);
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			
		}
		
		
		public function setupInteractivity():void 
		{
			// Interactive Box
			box = new DrawnIsoBox(20, 0xff0000, 20);
			box.x = 200;
			box.z = 200;
			worldDisplay.addChildToWorld(box);
			
			var newBox:DrawnIsoBox = new DrawnIsoBox(20, 0xcccccc, 20);
			newBox.x = 300;
			newBox.z = 300;
			worldDisplay.addChildToWorld(newBox);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);			
		}		
		
		public function setPosition(width:int,  height:int):void 
		{
			worldDisplay.x = width / 2 + 40
			worldDisplay.y = 20
		}
		
		override protected function measure():void
		{
			super.measure();

			if( worldDisplay != null)
			{
				this.measuredWidth = worldDisplay.width + 50;
				this.measuredHeight = worldDisplay.height + 50;
			}
		}	
		
		protected function onWorldClick(event:MouseEvent):void
		{
			var pos:Point3D = IsoUtils.screenToIso(new Point(worldDisplay.mouseX, worldDisplay.mouseY));
			
			var xTileIndex:int = getXTileIndex(pos);
			var zTileIndex:int = getZTileIndex(pos);
			
			pos = roundPointToTileCorner(pos);
			
			var foundryController: FoundryController = QuestConquestController.getInstance().getFoundryController();
			var tileImage: Image = QuestConquestController.getInstance().getFoundryController().getCurrentGrahicTile();
			if (tileImage != null) {

				var tile:GraphicTile;

				var tileInfo: Tile;
				tileInfo = new Tile();
				tileInfo.bitmapInfo  =  new BitmapInfo();
				
				if (foundryController.getcurrentWorldObjectType() == foundryController.TILE )
				{
					tile = new GraphicTile(worldDisplay.tileLength, tileImage, 20, 10);				
					tile.position = pos;

					worldDisplay.removeFloorChildAt( xTileIndex * worldDisplay.worldDepth + zTileIndex);
					worldDisplay.addChildToFloorAt( tile , xTileIndex * worldDisplay.worldDepth + zTileIndex);
					
					tileInfo.walkable = true;
					tileInfo.bitmapInfo.imageId = tileImage.source.toString();
					tileInfo.bitmapInfo.repositoryId = RepositoryManager.DEFAULT_TILE_IMAGE_REPOSITORY;

					addTileToWorld(xTileIndex, zTileIndex, tileInfo);
				
				}else if (foundryController.getcurrentWorldObjectType() == foundryController.WORLD_OBJECT )
				{
					tile = new GraphicTile(worldDisplay.tileLength, tileImage, 20, 30);				
					tile.position = pos;					
					worldDisplay.addChildToWorld(tile);
					
					var interactiveObject: InteractiveObject = new InteractiveObject();
					interactiveObject.xIndex = xTileIndex;
					interactiveObject.zIndex = zTileIndex;
					interactiveObject.bitmapInfo  =  new BitmapInfo();
					interactiveObject.bitmapInfo.imageId = tileImage.source.toString();					
					interactiveObject.bitmapInfo.repositoryId = RepositoryManager.DEFAULT_OBJECT_IMAGE_REPOSITORY;
					world.interactiveObjects.addItem(interactiveObject);
					
					trace(" Interactive object " + JSON.encode(interactiveObject));
				}
			}
		}
		
		protected function getXTileIndex(point: Point3D): int
		{
			var xTileIndex: int = Math.round(point.x / worldDisplay.tileLength) ;
			return xTileIndex;
		}

		protected function getZTileIndex(point: Point3D): int
		{
			var zTileIndex: int = Math.round(point.z / worldDisplay.tileDepth) ;
			return zTileIndex;
		}
		
		
		protected function roundPointToTileCorner(point: Point3D): Point3D
		{
			var corenerPoint: Point3D = new Point3D();
			corenerPoint.x = Math.round(point.x / worldDisplay.tileLength) * worldDisplay.tileLength;
			corenerPoint.y = 0;
			corenerPoint.z = Math.round(point.z / worldDisplay.tileDepth) *  worldDisplay.tileDepth;
			return corenerPoint;
		}
		
		
		
		protected function onMouseDown(event:MouseEvent):void
		{
			regionOutlineRect.setStartPoint( new Point(worldDisplay.mouseX, worldDisplay.mouseY));
			regionOutlineRect.setEndPoint( new Point(worldDisplay.mouseX, worldDisplay.mouseY));
			regionOutlineRect.render();
			worldDisplay.addChild(regionOutlineRect);
			addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);			
			dragModeOn = true;
		}

		protected function onMouseMove(event:MouseEvent):void
		{
			if (dragModeOn) 
			{
				trace(" Mouse Drag.");
				regionOutlineRect.setEndPoint( new Point(worldDisplay.mouseX, worldDisplay.mouseY));
				regionOutlineRect.render();
			}
			
		}

		protected function onMouseUp(event:MouseEvent):void
		{
			if (dragModeOn)
			{
				dragModeOn = false;
				addMultipleTilesToWorld();
				worldDisplay.removeChild(regionOutlineRect);
				this.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			}
		}
		
		protected function addTileToWorld(xIndex:int, zIndex: int, tileInfo: Tile ): void
		{
			world.tiles[xIndex][zIndex]  = tileInfo;
			
			trace(" Tile create via addTileToWorld() : " + JSON.encode(tileInfo) );
			trace(" Tile poistion  : " + xIndex + " , "  + zIndex );
			
		}
		
		protected function addMultipleTilesToWorld():void 
		{
			var startPoint3D: Point3D = new Point3D();
			startPoint3D = IsoUtils.screenToIso(regionOutlineRect.getStartPoint());
			
			var endPoint3D: Point3D = new Point3D();
			endPoint3D = IsoUtils.screenToIso(regionOutlineRect.getEndPoint());

			var cornerPoint3D: Point3D = new Point3D();
			cornerPoint3D.x = startPoint3D.x + (endPoint3D.x - startPoint3D.x);
			cornerPoint3D.y = startPoint3D.y ;
			cornerPoint3D.z = startPoint3D.z ;
			var cornerPoint: Point = IsoUtils.isoToScreen(cornerPoint3D);
			
			var oppositeCornerPoint3D: Point3D = new Point3D();
			oppositeCornerPoint3D.x = endPoint3D.x - (endPoint3D.x - startPoint3D.x) ;
			oppositeCornerPoint3D.y = endPoint3D.y;
			oppositeCornerPoint3D.z = endPoint3D.z ;
			var oppositeCornerPoint: Point = IsoUtils.isoToScreen(oppositeCornerPoint3D);

			var currentTile: Image =  QuestConquestController.getInstance().getFoundryController().getCurrentGrahicTile();
			var tileBitmap: Bitmap = currentTile.content as Bitmap;
			
			for(var i:int = 0; i < worldDisplay.worldLength; i++)
			{
				for(var j:int = 0; j < worldDisplay.worldDepth; j++)
				{
					var displayObject: DisplayObject = worldDisplay.getFloorChildAt(i * worldDisplay.worldDepth + j);
					
					if ( (i * worldDisplay.tileLength > oppositeCornerPoint3D.x && i * worldDisplay.tileLength < cornerPoint3D.x
						&&  j * worldDisplay.tileDepth > startPoint3D.z && j * worldDisplay.tileDepth < endPoint3D.z )
						|| 
						( i * worldDisplay.tileLength < oppositeCornerPoint3D.x && i * worldDisplay.tileLength > cornerPoint3D.x
						&&  j * worldDisplay.tileDepth < startPoint3D.z && j * worldDisplay.tileDepth> endPoint3D.z )
						||
						( i * worldDisplay.tileLength <  startPoint3D.x && i * worldDisplay.tileLength > endPoint3D.x
						&&  j * worldDisplay.tileDepth < oppositeCornerPoint3D.z && j * worldDisplay.tileDepth > cornerPoint3D.z )
						||
						( i * worldDisplay.tileLength>  startPoint3D.x && i * worldDisplay.tileLength < endPoint3D.x
						&&  j * worldDisplay.tileDepth > oppositeCornerPoint3D.z && j * worldDisplay.tileDepth < cornerPoint3D.z )
					)
					{
						var tileInfo: Tile = new Tile();
						tileInfo.walkable = true;
						tileInfo.bitmapInfo = new BitmapInfo();
						tileInfo.bitmapInfo.imageId = tileBitmap.loaderInfo.url.toString();
						tileInfo.bitmapInfo.repositoryId = RepositoryManager.DEFAULT_TILE_IMAGE_REPOSITORY;
						
						addTileToWorld(i, j, tileInfo );
						
						var tilePosition:Point3D = new Point3D();
						tilePosition.x = i * worldDisplay.tileLength;
						tilePosition.y = 0;
						tilePosition.z = j * worldDisplay.tileDepth;	
						
						var tile:GraphicTile = new GraphicTile(worldDisplay.tileLength, currentTile, 20, 10);
						
						tile.position = tilePosition;

						worldDisplay.removeFloorChildAt( i * worldDisplay.worldDepth + j);
						worldDisplay.addChildToFloorAt( tile , i * worldDisplay.worldDepth + j);

						//DrawnIsoTile (displayObject) .color = 0xff0000;
					}
				}
			}			
			
			
		}		
		
		
		protected function updateWorldDisplay():void
		{
			for(var i:int = 0; i < worldDisplay.worldLength; i++)
			{
				for(var j:int = 0; j < worldDisplay.worldDepth; j++)
				{
						var tileInfo: Tile = world.tiles[i][j];
						trace("JSON encoding of tile at " + i + " , " + j + " " + JSON.encode(tileInfo));
						
						
						if (tileInfo == null)
						{
							continue;
						}
						
						var bitmap: Bitmap = RepositoryManager.getImage( RepositoryManager.DEFAULT_TILE_IMAGE_REPOSITORY, tileInfo.bitmapInfo.imageId);
						
						trace("Bitmap object: " +  bitmap);
						
						if (bitmap != null && bitmap.bitmapData != null)
						{
							
							var tile:GraphicTileEx = new GraphicTileEx(worldDisplay.tileLength, bitmap.bitmapData , 20, 10);
							tile.walkable = tileInfo.walkable;
							
							var tilePosition:Point3D = new Point3D();
							tilePosition.x = i * worldDisplay.tileLength;
							tilePosition.y = 0;
							tilePosition.z = j * worldDisplay.tileDepth;	
						
							tile.position = tilePosition;

							if (worldDisplay.getFloorChildAt(i * worldDisplay.worldDepth + j) != null)
							{
								worldDisplay.removeFloorChildAt( i * worldDisplay.worldDepth + j);
							}
							worldDisplay.addChildToFloorAt( tile , i * worldDisplay.worldDepth + j);
						}
						//DrawnIsoTile (displayObject) .color = 0xff0000;
					}
					
				}
				for ( i = 0; i < world.interactiveObjects.length ; i++)
				{
					var interactiveObject: InteractiveObject = InteractiveObject( world.interactiveObjects.getItemAt(i));
					bitmap = RepositoryManager.getImage( RepositoryManager.DEFAULT_OBJECT_IMAGE_REPOSITORY, interactiveObject.bitmapInfo.imageId);
					if (bitmap != null)
					{
						tile = new GraphicTileEx(worldDisplay.tileLength, bitmap.bitmapData , 20, 30);
						tilePosition = new Point3D();
						tilePosition.x = interactiveObject.xIndex * worldDisplay.tileLength;
						tilePosition.y = 0;
						tilePosition.z = interactiveObject.zIndex * worldDisplay.tileDepth;	
						tile.position = tilePosition;
						worldDisplay.addChild(tile);

					}
					
				}
			
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
			if(worldDisplay.canMove(box))
			{
				box.x += box.vx;
				box.y += box.vy;
				box.z += box.vz;
			}
			worldDisplay.sort();
		}
		
	}
}