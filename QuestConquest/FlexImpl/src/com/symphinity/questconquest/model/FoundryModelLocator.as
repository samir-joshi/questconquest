package com.symphinity.questconquest.model 
{
	import Error;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	public class FoundryModelLocator 
	{
		private static var theInstance: FoundryModelLocator;
		
		[Bindable]
		public var foundryModel: FoundryModel;
		
		public function FoundryModelLocator() 
		{
			if (theInstance != null) {
				throw Error(" Foundry Model Locator is already created.");
			}
			
			foundryModel = new FoundryModel();
			
		}
		
		public static function getInstance(): FoundryModelLocator {
			if (theInstance == null) {
				theInstance = new FoundryModelLocator();
			}
			return theInstance;
		}
		
	}
	
}