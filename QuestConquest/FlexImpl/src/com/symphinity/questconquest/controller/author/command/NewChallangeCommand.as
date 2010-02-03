package com.symphinity.questconquest.controller.author.command
{
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;

	import com.symphinity.questconquest.model.FoundryModelLocator;
	import com.symphinity.questconquest.model.challange.Challange;
	import com.symphinity.questconquest.model.challange.ChallangeType;
	
	import com.symphinity.questconquest.view.author.challange.ChallangeFoundry;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	public class NewChallangeCommand implements ICommand
	{
		
		public function NewChallangeCommand() 
		{
			
		}
		
		public function execute( event : CairngormEvent ) : void
		{
			var challangeType: ChallangeType = ChallangeType(createInstance(event.data));
			
			var challange: Challange = new Challange();
			challange.text = "New Challange" ;
			
			challange.challangeType = challangeType;
			
			trace(" Created challange with challange type : " + challangeType);
			
			FoundryModelLocator.getInstance().foundryModel.adventure.addChallange(challange);
			FoundryModelLocator.getInstance().foundryModel.updateCurrentChallange(challange);
			
			// Controller.setCurrentChallange(challange);			
		}		
		
		
		protected function createInstance(anObject: Object): Object {
			var ClassReference:Class = getDefinitionByName(getQualifiedClassName(anObject)) as Class;
			var instance:Object = new ClassReference();		
			return instance;
		}
		
		
	}
	
}