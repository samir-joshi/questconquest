﻿package com.symphinity.questconquest.controller 
{
	import com.symphinity.questconquest.model.adventure.Adventure;
	import com.symphinity.questconquest.model.challange.Challange;
	import flash.display.Bitmap;
	import mx.collections.ArrayCollection;
	import mx.controls.Image;
	
	/**
	 * The controller that takes care of creation/authoring i.e. foundry
	 * @author Samir Joshi
	 */
	public class FoundryController 
	{
		
		protected var adventure: Adventure;
		
		protected var currentChallange: Challange;
		
		protected var challangeSet:ArrayCollection;
		
		public function FoundryController() 
		{
		}
		
		internal function setAdventure(anAdventure:Adventure):void {
			adventure = anAdventure;
			challangeSet = adventure.getChallangeSet();
			if (challangeSet.length >0) {
				currentChallange = Challange(challangeSet.getItemAt(0));
			}else {
				currentChallange = new Challange();
				challangeSet.addItem(currentChallange);
			}
		}
		
		
	}
	
}