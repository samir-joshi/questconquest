package com.symphinity.questconquest.model.player
{
	import Error;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	public class PlayerModelLocator 
	{
		private static var theInstance: PlayerModelLocator;
		
		[Bindable]
		public var playerModel: PlayerModel;
		
		public function PlayerModelLocator() 
		{
			if (theInstance != null) {
				throw Error(" Foundry Model Locator is already created.");
			}
			
			playerModel = new PlayerModel();
		}
		
		public static function getInstance(): PlayerModelLocator {
			if (theInstance == null) {
				theInstance = new PlayerModelLocator();
			}
			return theInstance;
		}
		
	}
	
}