package com.symphinity.questconquest.controller.common.config 
{

	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import mx.core.Container;
	
	import mx.core.UIComponent;

	import com.symphinity.questconquest.model.challange.ChallangeType;
	import com.symphinity.questconquest.model.challange.SingleChoiceChallangeType;
	import com.symphinity.questconquest.model.challange.MultipleChoiceChallangeType;
	import com.symphinity.questconquest.model.challange.TrueOrFalseChallangeType;
	import com.symphinity.questconquest.model.challange.OneWordChallangeType;
	
	//import com.symphinity.questconquest.view.common.challange.TypeSpecificChallangeView;

	
	
	/**
	 * Configure Challange Type and associated views.
	 * @author Samir Joshi
	 */
	public class BaseChallangeTypeConfiguration
	{
		protected var configuration: ArrayCollection;
		
		
		public function BaseChallangeTypeConfiguration() 
		{
			configuration = new ArrayCollection();
			initialize();
		}
		
		
		protected function initialize():void {
			
		}
		
		public function getConfiguration(): ArrayCollection {
			return configuration;
		}
		
		public function getViewForChallangeType(challangeType: ChallangeType): Container {
			var item: Object;
			var classReference:Class = getDefinitionByName(getQualifiedClassName(challangeType)) as Class;
			trace(" View request for challange type : " + challangeType );			
			for each ( item in configuration) {
				var configClassReference:Class = getDefinitionByName(getQualifiedClassName(item['instance'])) as Class;
				if ( configClassReference === classReference ) {
					trace(" View being returned is : " + item['view'] );
					return item['view'] ;
				}
			}
			
			trace(" Null View is being returned. "  );			
			return null;
		}
		
		public function getChallangeTypeViewList():ArrayCollection {
			var viewList:ArrayCollection = new ArrayCollection();
			var item:Object;
			for each ( item in configuration) {
				viewList.addItem ( item['view']);
			}
			return viewList;
		}
	}
	
}