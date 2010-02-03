package com.symphinity.questconquest.utils
{
	import flash.filesystem.File;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	public class FileUtils
	{
		
		public function FileUtils() 
		{
			
		}
		
		/**
		 * 
		 * @param	sourceFolderName
		 * @return Array of File objects 
		 */
		public static function getFiles( sourceFolderName: String): Array {
			var files: Array = [ ];
			
			var sourceFolder: File = File.applicationDirectory.resolvePath(sourceFolderName);
			
			if (sourceFolder.exists) {
				
				return sourceFolder.getDirectoryListing();
			}
			
			trace(" The folder not found: " + sourceFolderName);
			
			return files;
		}
		
		
		/**
		 * 
		 * @param	sourceFolderName
		 * @return Array of strings, each of which represents url (not native path) of file from source folder
		 */
		public static function getFileNames( sourceFolderName: String): Array {
			var fileNames: Array = [];
			
			var fileArray: Array =  getFiles(sourceFolderName);
			fileNames.length = fileArray.length;
			for (var i:int = 0; i < fileArray.length; i++) {
				fileNames[i] = fileArray[i] .url;
				//trace(" Native Path " + fileNames[i] );
				//trace(" Url " + fileArray[i].url );
			}			
			
			return fileNames;
		}
		
		
	}

}