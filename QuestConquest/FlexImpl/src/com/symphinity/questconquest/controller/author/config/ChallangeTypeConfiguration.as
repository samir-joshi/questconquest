package com.symphinity.questconquest.controller.author.config 
{

	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import mx.core.UIComponent;

	import com.symphinity.questconquest.controller.common.config.BaseChallangeTypeConfiguration
	
	import com.symphinity.questconquest.model.challange.ChallangeType;
	import com.symphinity.questconquest.model.challange.SingleChoiceChallangeType;
	import com.symphinity.questconquest.model.challange.MultipleChoiceChallangeType;
	import com.symphinity.questconquest.model.challange.TrueOrFalseChallangeType;
	import com.symphinity.questconquest.model.challange.OneWordChallangeType;
	
	import com.symphinity.questconquest.view.common.challange.TypeSpecificChallangeView
	
	import com.symphinity.questconquest.view.author.challange.TrueOrFalseChallangeView;
	import com.symphinity.questconquest.view.author.challange.SingleChoiceAuthorChallangeView;
	import com.symphinity.questconquest.view.author.challange.MultipleChoiceChallangeView;
	import com.symphinity.questconquest.view.author.challange.OneWordChallangeView;
	
	
	/**
	 * Configure Challange Type and associated views.
	 * @author Samir Joshi
	 */
	public class ChallangeTypeConfiguration extends BaseChallangeTypeConfiguration
	{
		
		protected static var theInstance: ChallangeTypeConfiguration;
		
		public function ChallangeTypeConfiguration() 
		{
			super();
		}
		
		public static function getInstance(): ChallangeTypeConfiguration {
			if (theInstance == null) {
				theInstance = new ChallangeTypeConfiguration();
			}
			return theInstance;
		}
		
		override protected function initialize():void {
			configuration.addItem( { 'label': 'True / False', 'instance': new TrueOrFalseChallangeType() , 'view': new TrueOrFalseChallangeView() } );
			configuration.addItem( { 'label': 'Single Choice', 'instance': new SingleChoiceChallangeType(), 'view': new SingleChoiceAuthorChallangeView()  } );			
			configuration.addItem( { 'label': 'Multiple Choice', 'instance': new MultipleChoiceChallangeType(), 'view': new MultipleChoiceChallangeView()  } );						
			configuration.addItem( { 'label': 'One Word', 'instance': new OneWordChallangeType(), 'view': new OneWordChallangeView()  } );						
		}
		
		override public function getConfiguration(): ArrayCollection {
			return configuration;
		}
	}	
	
}