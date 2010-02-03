package com.symphinity.questconquest.service.repository 
{
	import com.symphinity.questconquest.service.repository.impl.DefaultImageRepository;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Samir Joshi
	 */
	public class RepositoryManager
	{
		public static const DEFAULT_TILE_IMAGE_REPOSITORY: String = "DEFAULT_TILE_IMAGE_REPOSITORY";
		public static const DEFAULT_OBJECT_IMAGE_REPOSITORY: String = "DEFAULT_OBJECT_IMAGE_REPOSITORY";
		
		
		protected static var defaultRepositoryManager: DefaultImageRepository;
		
		protected static var imageRepositories: Object = {DEFAULT_TILE_IMAGE_REPOSITORY:null, DEFAULT_OBJECT_IMAGE_REPOSITORY:null  };
		
		public function RepositoryManager() 
		{
		}
		
		
		public static function load(): void
		{
			imageRepositories[DEFAULT_TILE_IMAGE_REPOSITORY] = new DefaultImageRepository();
			imageRepositories[DEFAULT_TILE_IMAGE_REPOSITORY].root = "app:/assets/world/tile"
			imageRepositories[DEFAULT_TILE_IMAGE_REPOSITORY].load();
			imageRepositories[DEFAULT_OBJECT_IMAGE_REPOSITORY] = new DefaultImageRepository();			
			imageRepositories[DEFAULT_OBJECT_IMAGE_REPOSITORY].root = "app:/assets/world/object";
			imageRepositories[DEFAULT_OBJECT_IMAGE_REPOSITORY].load();
		}
		
		public static function getImageRepository(repositoryId: String, root: String = ""): ImageRepostitory
		{
			if (repositoryId == "")
			{
				return getDefaultImageRepository(root);
			}else 
			{
				return null;
			}
		}
		
		public static function getDefaultImageRepository(root: String = ""): ImageRepostitory
		{
			if ( defaultRepositoryManager == null)
			{
				 defaultRepositoryManager = new DefaultImageRepository();
				 defaultRepositoryManager.root = root;
			}
			return defaultRepositoryManager; 
		}
		
		public static function getImage(repositoryId: String, imageId: String): Bitmap
		{
			var bitmap: Bitmap;
			var repository: ImageRepostitory = imageRepositories[repositoryId];
			if (repository != null)
			{
				bitmap = repository.getImage(imageId);
			}
			return bitmap;
		}
		
	}

}