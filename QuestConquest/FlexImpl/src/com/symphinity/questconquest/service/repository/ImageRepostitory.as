package com.symphinity.questconquest.service.repository 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Samir Joshi
	 */
	public interface ImageRepostitory
	{
		
		function  getImage(imageId: String): Bitmap;
		
		function putImae(imageId: String, bitmap: Bitmap): void;
		
		function getImages(): Array;
		

		// Perhaps the persistence responsibilities could be 
		// part of another interface
		function load(): void ;
		function save(): void;

	}

}