package com.symphinity.questconquest.model.challange 
{
	import mx.collections.ArrayList;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	[RemoteClass]	
	public class SingleChoiceChallangeType extends MultipleChoiceChallangeType
	{
		
		public function SingleChoiceChallangeType() 
		{
			super();
			this.type = "SingleChoiceChallangeType";
		}
		
		
		override public function addOption(anOption: Option): void {
			options.addItem(anOption);
			if ( anOption.isCorrect) {
				ensureSingleCorrectOption(anOption);
			}
		}
		
		protected function ensureSingleCorrectOption(theOption: Option): void  {
			var optionInList: Option;
			for each ( optionInList in options) {
				if (optionInList.isCorrect && !(optionInList === theOption) ) {
					optionInList.isCorrect = false;
				}
			}
		}
		
	
	}
	
}