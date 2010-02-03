package com.symphinity.questconquest.model.challange 
{
	import mx.collections.ArrayCollection;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	[RemoteClass]	
	public class MultipleChoiceChallangeType extends ChallangeType
	{
		[Bindable]
		public var options: ArrayCollection;
		
		public function MultipleChoiceChallangeType() 
		{
			super();
			this.type = "MultipleChoiceChallangeType";
			options = new ArrayCollection();
			_data = options;
		}
		
		
		public function addOption(anOption: Option): void {
			options.addItem(anOption);
		}
		
		public function getOptions(): ArrayCollection {
			return options;
		}
		
		public function setOptions(options: ArrayCollection): void {
			this.options = options ;
		}		
		
		public function traceOptions() : void {
			for (var i: int = 0; i < options.length; i++ ) {
				trace ( " Value of option at " + i  + " is : " + Option(options.getItemAt(i)).isCorrect );
			}
		}			
		
		
	}
	
}