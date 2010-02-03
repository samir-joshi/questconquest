package com.symphinity.questconquest.model.challange 
{
	import mx.collections.ArrayList;
	
	/**
	 * ...
	 * @author Samir Joshi
	 */
	[Bindable]
	[RemoteClass]	
	public class OneWordChallangeType extends ChallangeType
	{
		public var singleWordAnswer: String;
		
		public function OneWordChallangeType() 
		{
			super();
			this.type = "OneWordChallangeType";
			singleWordAnswer = "";
			_data = singleWordAnswer;
		}
		
	}
	
}