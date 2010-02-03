package com.symphinity.questconquest.controller 
{
	import com.adobe.cairngorm.control.FrontController;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.symphinity.questconquest.controller.author.event.QEvent;
	import com.symphinity.questconquest.controller.author.command.NewChallangeCommand;	
	
	import com.symphinity.questconquest.model.adventure.Adventure;
	
	/**
	 * This is the main application controller.
	 * @author Samir Joshi
	 */
	public class QuestConquestController extends FrontController
	{
		
		private static var theInstance: QuestConquestController;
		
		protected var currentAdventure: Adventure;
		protected var foundryController: FoundryController;
		
		public function QuestConquestController() 
		{
			foundryController = new FoundryController();
			createNewAdventure("New Adventure");
			
			initialiseCommands();			
		}
		
		public static function getInstance(): QuestConquestController {
			if (theInstance == null) {
				theInstance = new QuestConquestController();
			}
			return theInstance;
		}
		
		public function getFoundryController() : FoundryController{
			return foundryController;
		}
		
		public function createNewAdventure(title: String): Adventure {
			var anAdventure: Adventure = new Adventure();
			anAdventure.title = title;
			return anAdventure;
		}
		
		public function setCurrentAdventure(anAdventure: Adventure): void {
			currentAdventure = anAdventure;
			foundryController.setAdventure(currentAdventure);
			
		}
		
		public function getCurrentAdventure(): Adventure {
			return currentAdventure;
		}
		
		public function initialiseCommands() : void
		{
			addCommand( QEvent.EVENT_NEW_CHALLANGE, NewChallangeCommand );	  
		}			
		
	}
	
}